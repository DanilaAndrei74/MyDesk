namespace Entities.Models
{
    public class Reservation
    {
        public Guid Id { get; set; }
        public Guid User_Id { get; set; }
        public Guid Desk_Id { get; set; }
        public DateTime Date { get; set; }
        public bool Deleted { get; set; }
        public DateTime Created_At { get; set; }
        public DateTime Updated_At { get; set; }

        public User User { get; set; } 
        public Tile Tile { get; set; } 
    }
}