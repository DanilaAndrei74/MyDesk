using DataAccess;
using Entities.DTO.Input;
using Entities.DTO.Output;
using Entities.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Shared.Services;

namespace MyDesk.Controllers
{
    [Route("api/metrics")]
    [ApiController]

    public class MetricsController : ControllerBase
    {
        private readonly DataContext _context;

        public MetricsController(DataContext context, OutputService printOutput)
        {
            _context = context;
        }

        [HttpPost]
        public ActionResult<MetricsOutput> GetMetrics(MetricsInput input)
        {
            IEnumerable<User> users = _context.Users.Where(x => x.Deleted == false);
			var output = new MetricsOutput();
			output.userCount = users.Count();
			IEnumerable<Reservation> reservations = _context.Reservations.Where(x => x.Date > input.firstDate && x.Date < input.secondDate && x.Deleted == false);
			output.reservationCount = reservations.Count();
			return Ok(output);
        }
    }
}
