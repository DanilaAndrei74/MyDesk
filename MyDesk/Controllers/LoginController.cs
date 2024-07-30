using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [Route("api/login")]
    [ApiController]
	public class LoginController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        private CryptographyService _crypto;
		private JwtService _jwt;
		public LoginController(DataContext context, OutputService printOutput, CryptographyService authentication, JwtService jwtService)
        {
            _context = context;
            _out = printOutput;
            _crypto = authentication;
            _jwt = jwtService;
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<LoginOutput> Login(LoginInput input) 
        {
            var user = _context.Users.Include( u => u.Credential).FirstOrDefault(u => u.Email == input.Email && u.Credential.Is_Active == true && u.Deleted == false);
            if (user == null) return NotFound("User not found");

            var output = new LoginOutput()
            {
                Success = false,
                Email = input.Email,
                IsAdmin = user.Is_Admin,
                UserId = user.Id,
                FirstName = user.First_Name,
                LastName = user.Last_Name,
                JWT = _jwt.GenerateJSONWebToken(user)
            };

            Byte[] hashedPassword = _crypto.HashPassword(input.Password, user.Credential.Salt);
            if (_crypto.ValidatePassword(hashedPassword, user.Credential.Password)) output.Success = true;

            return Ok(output);
        }


    }
}
