using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
	//[Authorize]
	public class ZoneController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        public ZoneController(DataContext context, OutputService printOutput)
        {
            _context = context;
            _out = printOutput;

        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<ZoneOutput>> Get()
        {
            IEnumerable<Zone> zones = _context.Zones.Where(zone => zone.Deleted == false);
            return Ok(_out.Zones(zones));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<ZoneOutput> Post(ZoneInput input)
        {
            var check = _context.Zones.FirstOrDefault(zone => zone.Deleted == false && zone.Name == input.Name);
            if (check != null) return BadRequest();

            var floor = _context.Floors.FirstOrDefault(floor => floor.Id == input.Floor_Id);
            if (floor == null) return BadRequest();

            var zone = new Zone()
            {
                Name = input.Name,
                Floor_Id = input.Floor_Id,
                Size_X = input.Size_X,
                Size_Y = input.Size_Y,
                Floor = floor
            };

            _context.Add(zone);
            _context.SaveChanges();

            return Created(string.Empty,_out.Zone(zone));
        }

        [HttpPost("blank")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<ZoneOutput> PostBlankZoneWithTiles(ZoneInput input)
        {
            var check = _context.Zones.FirstOrDefault(zone => zone.Deleted == false && zone.Name == input.Name);
            if (check != null) return BadRequest();

            var floor = _context.Floors.FirstOrDefault(floor => floor.Id == input.Floor_Id);
            if (floor == null) return BadRequest();

            var zone = new Zone()
            {
                Name = input.Name,
                Floor_Id = input.Floor_Id,
                Size_X = input.Size_X,
                Size_Y = input.Size_Y,
                Floor = floor
            };

         

            _context.Add(zone);

            for (int i = 0; i < input.Size_X; i++)
                for (int j = 0; j < input.Size_Y; j++)
                {
                    _context.Add(new Tile
                    {
                        Zone_Id = zone.Id,
                        Zone = zone,
                        X_Position = i,
                        Y_Position = j,
                        Type = TileType.Floor,
                    });
                }

            _context.SaveChanges();

            return Ok(_out.Zone(zone));
        }

        [HttpPut("{zoneId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<ZoneOutput> Put([FromBody] ZoneInput input, Guid zoneId)
        {
            var zone = _context.Zones.FirstOrDefault(zone => zone.Id == zoneId);
            if (zone == null) return NotFound();
     
            var floor = _context.Floors.FirstOrDefault(floor => floor.Id == input.Floor_Id);
            if (floor == null) return BadRequest();

            zone.Floor_Id = (Guid)input.Floor_Id;
            zone.Floor = floor;
            zone.Name = input.Name;
            zone.Size_X = input.Size_X;
            zone.Size_Y = input.Size_Y;
            zone.Updated_At = DateTime.UtcNow;

            _context.SaveChanges();

            return Ok(_out.Zone(zone));
        }

        [HttpDelete("{zoneId}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult Delete(Guid zoneId)
        {
            var zone = _context.Zones.FirstOrDefault(zone => zone.Id == zoneId);
            if (zone == null) return NotFound();

            zone.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }

        [HttpGet("{floorId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<ZoneOutput>> GetZoneByFloorId(Guid floorId)
        {
            IEnumerable<Zone> zones = _context.Zones.Where(zone => zone.Deleted == false && zone.Floor_Id == floorId);
            return Ok(_out.Zones(zones));
        }
    }
}
