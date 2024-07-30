using Entities.Models;

namespace Entities.DTO.Output
{
    public class TileExtendedOutput
    {
        public TileOutput Tile { get; set; }

        public ReservationAddon? Reservation { get; set; }
    }

    public class ReservationAddon
    {
        public Guid Reservation_Id { get; set; }
        public Guid User_Id { get; set; }
        public DateTime Date { get; set; }
        public string User_FirstName { get; set; }
        public string User_LastName { get; set; }
        public string User_Team { get; set; }

    }

}
