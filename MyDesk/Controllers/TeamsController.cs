using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [Route("api/teams")]
    [ApiController]
	//[Authorize]
	public class TeamsController: ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        public TeamsController(DataContext context, OutputService printOutput)
        {
            _context = context;
            _out = printOutput;

        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<TeamOutput>> Get()
        {
            IEnumerable<Team> teams = _context.Teams.Where(building => building.Deleted == false);
            return Ok(_out.Teams(teams));
        }

        [HttpGet("{teamId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<TeamOutput>> Get(Guid teamId)
        {
            IEnumerable<Team> teams = _context.Teams.Where(team => team.Deleted == false && team.Id == teamId);
            return Ok(_out.Teams(teams));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<TeamOutput> Post(TeamInput input)
        {
            var check = _context.Teams.FirstOrDefault(team => team.Deleted == false && team.Name == input.Name);
            if (check != null) return BadRequest("Team already exists");


            var team = new Team()
            {
                Name = input.Name,
            };

            _context.Add(team);
            _context.SaveChanges();

            return Created(string.Empty,_out.Team(team));
        }

        [HttpPut("{teamId}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<TeamOutput> Put([FromBody] TeamInput input, Guid teamId)
        {
            var team = _context.Teams.FirstOrDefault(team => team.Id == teamId);
            if (team == null) return NotFound();

            team.Name = input.Name;
            team.Updated_At = DateTime.UtcNow;

            _context.SaveChanges();

            return Ok(_out.Team(team));
        }

        [HttpDelete("{teamId}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult Delete(Guid teamId)
        {
            var team = _context.Teams.FirstOrDefault(team => team.Id == teamId);
            if (team == null) return NotFound();

            team.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }
    }
}
