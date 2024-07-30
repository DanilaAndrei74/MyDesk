using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Services;
using Shared.Services;

namespace MyDesk.API.Controllers
{
    [Route("api/tiles")]
    [ApiController]
	//[Authorize]
	public class TileController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        private readonly object _lockObject = new object();
        public TileController(DataContext context, OutputService printOutput)
        {
            _context = context;
            _out = printOutput;

        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<TileOutput>> Get()
        {
            IEnumerable<Tile> tiles = _context.Tiles.Where(tile => tile.Deleted == false);
            return Ok(_out.Tiles(tiles));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]

        public ActionResult<TileOutput> Post([FromBody] TileInput input)
        {
            var checkIfExists = _context.Tiles.FirstOrDefault
                (tile => tile.Deleted == false
                && tile.X_Position == input.X_Position 
                && tile.Y_Position == input.Y_Position
                && tile.Zone_Id == input.Zone_Id );

            if (checkIfExists != null) return BadRequest("The tile already exists");

            var zone = _context.Zones.FirstOrDefault(zone => zone.Id == input.Zone_Id);
            if (zone == null) return BadRequest("The zone doesnt exist");

            var tile = new Tile()
            {
                Zone_Id = input.Zone_Id,
                Zone = zone,
                X_Position= input.X_Position,
                Y_Position = input.Y_Position,
                Type = input.Type,
            };

            if (!Helper.FitsInZone(zone, tile)) return BadRequest("Positions outside array");

            _context.Add(tile);
            _context.SaveChanges();

            return Created(string.Empty,_out.Tile(tile));
        }

        [HttpPut("{tileId}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<TileOutput> Put([FromBody] TileInput input, Guid tileId)
        {
            var tile = _context.Tiles.FirstOrDefault(tile => tile.Id == tileId);
            if (tile == null) return NotFound();

            var zone = _context.Zones.FirstOrDefault(zone => zone.Id == input.Zone_Id && zone.Deleted == false);
            if (zone == null) return BadRequest("Zone doesn't exist");

            if (tile.Zone_Id != input.Zone_Id) return BadRequest("Cannot modify zone of a tile");

            
            tile.X_Position = input.X_Position;
            tile.Y_Position = input.Y_Position;
            tile.Type = input.Type;
            tile.Updated_At = DateTime.UtcNow;
           

            _context.SaveChanges();

            return Ok(_out.Tile(tile));
        }

        [HttpDelete("{tileId}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public ActionResult Delete(Guid tileId)
        {
            var tile = _context.Tiles.FirstOrDefault(parkingSpot => parkingSpot.Id == tileId);
            if (tile == null) return NotFound();

            tile.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }

        [HttpGet("{zoneId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<TileOutput>> GetTileByZoneId(Guid zoneId)
        {
            IEnumerable<Tile> tiles = _context.Tiles.Where(tile => tile.Zone_Id == zoneId);
            return Ok(_out.Tiles(tiles));
        }

        [HttpGet]
        [Route("{zoneId}+{date}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<TileExtendedOutput>> GetDesksWithReservationFromZone(Guid zoneId,DateTime date)
        {
            IEnumerable<Tile> tiles = _context.Tiles.Where(tile => tile.Deleted == false && tile.Zone_Id == zoneId);
            var reservations = new List<Reservation>();
            lock (_lockObject)
            {
                reservations = _context.Reservations.Include(r => r.User).Include(r => r.User.Team)
                    .Where(reservation => 
                    reservation.Deleted == false && 
                    reservation.Date.Date == date.Date && 
                    reservation.Tile.Zone_Id == zoneId).ToList();
            }

            var desksWithReservation = new List<TileExtendedOutput>();
            foreach (var tile in tiles)
            {
                var reservation = reservations.FirstOrDefault(reservation => reservation.Desk_Id == tile.Id);

                var reservationAddon = new ReservationAddon();
                if (reservation != null) 
                {
                    reservationAddon.Reservation_Id = reservation.Id;
                    reservationAddon.User_Id = reservation.User_Id;
                    reservationAddon.Date = reservation.Date;
                    reservationAddon.User_LastName = reservation.User.Last_Name;
                    reservationAddon.User_FirstName = reservation.User.First_Name;
                    reservationAddon.User_Team = reservation.User.Team.Name;
                }

                var tileOutput = new TileOutput()
                {
                    Id = tile.Id,
                    Zone_Id = tile.Zone_Id,
                    Type = tile.Type,
                    Updated_At = tile.Updated_At,
                    X_Position = tile.X_Position,
                    Y_Position = tile.Y_Position,
                };

                var deskWithReservation = new TileExtendedOutput();

                deskWithReservation.Tile = tileOutput;
                if(reservation != null) { deskWithReservation.Reservation = reservationAddon;}
                else { deskWithReservation.Reservation = new ReservationAddon()
                    { Date = date }; }
                desksWithReservation.Add(deskWithReservation);     
            }

            return Ok(desksWithReservation);
        }
    }
}
