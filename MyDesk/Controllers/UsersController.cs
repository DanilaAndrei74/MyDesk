using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Services.Validators;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
	//[Authorize]
	public class UsersController : ControllerBase
    {

        private readonly DataContext _context;
        private readonly OutputService _out;
        private readonly CryptographyService _crypto;
        private readonly object _lockObject = new object();
        public UsersController(DataContext context, OutputService printOutput, CryptographyService passwordService)
        {
            _context = context;
            _out = printOutput;
            _crypto = passwordService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<UserOutput>> Get()
        {
            IEnumerable<User> users = _context.Users.Include(r => r.Team).Where(user => user.Deleted == false);
            return Ok(_out.Users(users));
        }

        [HttpGet("{userId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<UserOutput> GetUserById(Guid userId)
        {
            var user = _context.Users.Include(r => r.Team).FirstOrDefault(user => user.Deleted == false && user.Id == userId);
            if (user == null) return NotFound();
            return Ok(_out.User(user));
        }

        [HttpPost]
        public ActionResult<UserOutput> Post(UserInput input)
        {
            var check = _context.Users.FirstOrDefault(user => user.Deleted == false && user.Email == input.Email);
            if (check != null) return BadRequest("User already exists");

            var team = _context.Teams.FirstOrDefault(team => team.Id == input.Team_Id);
            if (team is null) return NotFound("Team not found");

            var Salt = _crypto.CreateSalt();
            var Password = _crypto.HashPassword(input.Password, Salt);

            var userId = Guid.NewGuid();

            var credentials = new Credential()
            {
                Is_Active = true,
                Password = Password,
                Salt = Salt,
                Number_Of_Tries = 0,
                User_Id = userId
            };

            var user = new User()
            {
                Id = userId,
                Email = input.Email,
                First_Name = input.First_Name,
                Last_Name = input.Last_Name,
                Team_Id = input.Team_Id,
                Team = team,
                Credential = credentials,
            };



            lock (_lockObject)
            {
                _context.AddAsync(user);
                _context.SaveChangesAsync();

                _context.AddAsync(credentials);
                _context.SaveChangesAsync();
            }
            return Created(string.Empty,_out.User(user));
        }

        [HttpPut("{userId}")]
        public ActionResult<UserOutput> Put([FromBody] UserInput input, Guid userId)
        {
            var user = _context.Users.FirstOrDefault(user => user.Id == userId);
            if (user == null) return NotFound();
            var credentials = _context.Credentials.FirstOrDefault(cred => cred.User_Id == userId);
            if (credentials == null) return NotFound();

            var team = _context.Teams.FirstOrDefault(team => team.Id == input.Team_Id);
            if(team!= null)
            {
                user.Team = team;
                user.Team_Id = input.Team_Id;
            }

            user.Email = input.Email;
            credentials.Password = _crypto.HashPassword(input.Password, credentials.Salt) ?? credentials.Password;
            user.First_Name = input.First_Name;
            user.Last_Name = input.Last_Name;

            _context.SaveChanges();

            return Ok(_out.User(user));
        }

        [HttpDelete("{userId}")]
        public ActionResult Delete(Guid userId)
        {
            var user = _context.Users.FirstOrDefault(user => user.Id == userId);
            if (user == null) return NotFound();

            user.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }

        [HttpPut("/password/{userId}")]
        public ActionResult<bool> UpdatePassword(Guid userId, string oldPassword,string newPassword)
        {
            var validator = new PasswordValidator();
            var result = validator.Validate(newPassword);
            if (!result.IsValid) return BadRequest(result.Errors);

            var user = _context.Users.Include(user => user.Credential).FirstOrDefault(user => user.Id == userId);
            if (user == null) return NotFound("User not found");

            if (!(_crypto.HashPassword(oldPassword, user.Credential.Salt) == user.Credential.Password))
                return Ok(false);
            
            var newPasswordHash = _crypto.HashPassword(newPassword, user.Credential.Salt);
            user.Credential.Password = newPasswordHash;
            _context.SaveChanges();
            
            return Ok(true);
        }
    }
}