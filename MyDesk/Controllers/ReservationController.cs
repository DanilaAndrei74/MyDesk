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
    [Route("api/[controller]")]
    [ApiController]
	//[Authorize]
	public class ReservationController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly OutputService _out;
        private readonly object _lockObject = new object();
        public ReservationController(DataContext context, OutputService printOutput)
        {
            _context = context;
            _out = printOutput;

        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<ReservationOutput>> Get()
        {
            IEnumerable<Reservation> reservations = _context.Reservations.Where(reservation => reservation.Deleted == false);
            return Ok(_out.Reservations(reservations));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<ReservationOutput> Post(ReservationInput input)
        {
            var user = _context.Users.FirstOrDefault(user => user.Id == input.User_Id);
            if (user == null) return BadRequest("User cannot be null");
            var existingReservation = _context.Reservations.FirstOrDefault
                (reservation => reservation.Deleted == false && 
                reservation.User_Id == input.User_Id &&
                reservation.Date == input.Date);

            var desk = _context.Tiles.FirstOrDefault(spot => spot.Id == input.Desk_Id && spot.Type == TileType.Desk);
            if (desk == null) return BadRequest("Can only reserve a Type.Desk");

            if (existingReservation != null)
            {
                existingReservation.Updated_At = DateTime.Now;
                existingReservation.Desk_Id = input.Desk_Id;
                _context.SaveChanges();
                return Created(string.Empty,_out.Reservation(existingReservation));
            }


            var existingDeletedReservation = _context.Reservations
                .FirstOrDefault(reservation => 
                reservation.Deleted == true &&
                reservation.User_Id == input.User_Id &&
                reservation.Desk_Id == input.Desk_Id &&
                reservation.Date == input.Date);


            var reservation = new Reservation();
            if (existingDeletedReservation != null)
            {
                existingDeletedReservation.Deleted = false;
                reservation = existingDeletedReservation;
            }
            else
            {
                reservation.User_Id = input.User_Id;
                reservation.Tile = desk;
                reservation.Desk_Id = input.Desk_Id;
                reservation.Date = input.Date;
              
                _context.Add(reservation);
            }

            _context.SaveChanges();

            return Created(string.Empty, _out.Reservation(reservation));
        }

        [HttpPut("{reservationId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<ReservationOutput> Put([FromBody] ReservationInput input, Guid reservationId)
        {
            var reservation = _context.Reservations.FirstOrDefault(reservation => reservation.Id == reservationId && reservation.Deleted == false);
            if (reservation == null) return NotFound("Reservation not found");
            
            //VEZI CA AICI TREBUIE SA VERIFICI DACA NOUA DATA NU E LA FEL CU O ALTA REZERVARE DIN ACEEASI DATA
            var user = _context.Users.FirstOrDefault(user => user.Id == input.User_Id && user.Deleted == false);
            if (user == null) return NotFound("User not found");
           
            var desk = _context.Tiles.FirstOrDefault(desk => desk.Id == input.Desk_Id && desk.Deleted == false);
            if (desk == null) return NotFound("Desk not found");

            if(!Helper.BeNotInPast(input.Date)) return BadRequest("Cannot modifiy a request that is in the past");

            reservation.Updated_At = DateTime.UtcNow;
            reservation.Date = input.Date;
            reservation.User = user;
            reservation.User_Id = input.User_Id;
            reservation.Desk_Id = input.Desk_Id;


            _context.SaveChanges();

            return Ok(_out.Reservation(reservation));
        }

        [HttpDelete("{reservationId}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public ActionResult Delete(Guid reservationId)
        {
            var reservation = _context.Reservations.FirstOrDefault(reservation => reservation.Id == reservationId);
            if (reservation == null) return NotFound();

            reservation.Deleted = true;

            _context.SaveChanges();

            return NoContent();
        }

        [HttpPost("scheduleTeam")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<ScheduleTeamOutput> ScheduleTeam(ScheduleTeamInput input)
        {
            
            var team = _context.Teams.Include(team => team.Users).FirstOrDefault(team => team.Id == input.TeamId);
            if (team == null) return NotFound();

            var building = _context.Buildings.FirstOrDefault(building => building.Id == input.BuildingId);
            if (building == null) return NotFound();

            var teamMembersCount = team.Users.Count();
            
            var availableZone = new Zone();
            //We lock this to be thread safe
            lock (_lockObject)
            {
                //Cast the IQueriables to Lists because we filter them later and it will keep the SQL connection active
                List<Zone> zones = new List<Zone>(_context.Zones.Include(zone => zone.Floor)
                    .Where(zone => zone.Floor.Building_Id == input.BuildingId && zone.Deleted == false));

                List<Tile> allDesks = new List<Tile>(_context.Tiles
                    .Where(tile => tile.Type == TileType.Desk));
                
                List<Reservation> allReservations = new List<Reservation>(_context.Reservations
                    .Include(reservation => reservation.Tile)
                    .Where(reservation => reservation.Date == input.Date));

                
                foreach (var zone in zones)
                {
                    var desks = allDesks.Where(desk => desk.Zone_Id == zone.Id);
                    var reservations = allReservations.Where(reservation => reservation.Tile.Zone_Id == zone.Id && reservation.Deleted == false);
                    var availableDesksCount = desks.Count() - reservations.Count();
                    if (availableDesksCount >= teamMembersCount)
                    {
                        availableZone = zone;
                        break;
                    }
                }
            }

            if (availableZone == new Zone()) return Ok(new ScheduleTeamOutput(){Date = input.Date, ZoneId = Guid.Empty});

            var teamMembers = team.Users;
            
            foreach (var user in teamMembers)
            {
                var existingReservation =
                    _context.Reservations.FirstOrDefault(x => x.User_Id == user.Id && x.Date == input.Date);
                if(existingReservation == null) continue;
                _context.Remove(existingReservation);
                _context.SaveChanges();
            }
            
            
            
            List<Tile> tiles = new List<Tile>(_context.Tiles.Include(x => x.Reservations)
                .Where(tile => tile.Zone_Id == availableZone.Id && tile.Type == TileType.Desk));

            
            tiles.RemoveAll(x => x.Reservations.Any(x => x.Date == input.Date && x.Deleted== false));
            foreach (var user in teamMembers)
            {
                var tile = tiles.First();
                tiles.Remove(tile);
                var newReservation = new Reservation()
                {
                    Date = input.Date,
                    User_Id = user.Id,
                    Tile = tile,
                    Desk_Id = tile.Id,
                    User = user,
                };

                _context.Add(newReservation);
            }

            _context.SaveChanges();

            return Ok(new ScheduleTeamOutput(){Date = input.Date, ZoneId = availableZone.Id});
        }
    }
}
