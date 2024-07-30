using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [Route("api/floors")]
    [ApiController]
	//[Authorize]
	public class FloorsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        public FloorsController(DataContext context, OutputService printOutput)
        {
            _context = context;
            _out = printOutput;

        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<FloorOutput>> Get()
        {
            IEnumerable<Floor> floors = _context.Floors.Where(floor => floor.Deleted == false);
            return Ok(_out.Floors(floors));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<FloorOutput> Post(FloorInput input)
        {
            var check = _context.Floors.FirstOrDefault(floor => floor.Deleted == false && floor.Name == input.Name);
            if (check != null) return BadRequest();

            var building = _context.Buildings.FirstOrDefault(building => building.Id == input.Building_Id);
            if (building == null) return BadRequest();

            var floor = new Floor()
            {
                Name = input.Name,
                Building_Id = input.Building_Id,
                Building = building,
            };

            _context.Add(floor);
            _context.SaveChanges();

            return Created(string.Empty,_out.Floor(floor));
        }

        [HttpPut("{floorId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<FloorOutput> Put([FromBody] FloorInput input, Guid floorId)
        {
            var floor = _context.Floors.FirstOrDefault(floor => floor.Id == floorId);
            if (floor == null) return NotFound();
           
            var building = _context.Buildings.FirstOrDefault(building => building.Id == input.Building_Id);
            if (building == null) return BadRequest();

            floor.Building_Id = (Guid)input.Building_Id;
            floor.Building = building;
            floor.Name = input.Name;
            floor.Updated_At = DateTime.UtcNow;

            _context.SaveChanges();

            return Ok(_out.Floor(floor));
        }

        [HttpDelete("{floorId}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult Delete(Guid floorId)
        {
            var floor = _context.Floors.FirstOrDefault(floor => floor.Id == floorId);
            if (floor == null) return NotFound();

            floor.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }

        [HttpGet("{buildingId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<FloorOutput>> GetFloorsByBuildingId(Guid buildingId)
        {
            IEnumerable<Floor> floors = _context.Floors.Where(floor => floor.Deleted == false && floor.Building_Id == buildingId);
            return Ok(_out.Floors(floors));
        }
    }
}
