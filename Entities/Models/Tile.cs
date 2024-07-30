
namespace Entities.Models
{
    public class Tile
    {
        public Guid Id { get; set; }
        public Guid Zone_Id { get; set; }
        public TileType Type { get; set; }
        public int X_Position { get; set; }
        public int Y_Position { get; set; }
        public bool Deleted { get; set; }
        public DateTime Created_At { get; set; }
        public DateTime Updated_At { get; set; }

        public IEnumerable<Reservation> Reservations { get; set; }
        public Zone Zone { get; set; } 
    }

    public enum TileType
    {
        Desk,
        DeskUnavailable,
        Wall,
        Door,
        Window,
        Floor,
        Blank
    }
}