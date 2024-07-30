using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [Route("api/buildings")]
    [ApiController]
	//[Authorize]
	public class BuildingsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        public BuildingsController(DataContext context, OutputService printOutput)
        {
            _context = context;
            _out = printOutput;

        }

        [HttpGet]
        [ActionName("GetAllBuildings")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<List<BuildingOutput>>> Get()
        {
            IEnumerable<Building> buildings = await _context.Buildings.Where(building => building.Deleted == false).ToListAsync();
            return Ok(_out.Buildings(buildings));
        }

        [HttpGet("{buildingId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<BuildingOutput>> Get(Guid buildingId)
        {
            IEnumerable<Building> buildings = _context.Buildings.Where(building => building.Deleted == false && building.Id == buildingId);
            return Ok(_out.Buildings(buildings));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<BuildingOutput> Post(BuildingInput input)
        {
            var check = _context.Buildings.FirstOrDefault(building => building.Deleted == false && building.Name == input.Name);
            if (check != null) return BadRequest();


            var building = new Building()
            {
                Address = input.Address,
                Name = input.Name,
            };

            _context.Add(building);
            _context.SaveChanges();

            return Created(string.Empty,_out.Building(building));
        }

        [HttpPut("{buildingId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<BuildingOutput> Put([FromBody] BuildingInput input, Guid buildingId)
        {
            var building = _context.Buildings.FirstOrDefault(building => building.Id == buildingId);
            if (building == null) return NotFound();

            building.Name = input.Name;
            building.Address = input.Address;
            building.Updated_At = DateTime.UtcNow;

            _context.SaveChanges();

            return Ok(_out.Building(building));
        }

        [HttpDelete("{buildingId}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult Delete(Guid buildingId)
        {
            var building = _context.Buildings.FirstOrDefault(building => building.Id == buildingId);
            if (building == null) return NotFound();

            building.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }
    }
}
