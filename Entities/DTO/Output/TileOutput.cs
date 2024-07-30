using Entities.Models;

namespace Entities.DTO.Output
{
    public class TileOutput
    {
        public Guid Id { get; set; }
        public Guid Zone_Id { get; set; }
        public TileType Type { get; set; }
        public int X_Position { get; set; }
        public int Y_Position { get; set; }
        public DateTime Updated_At { get; set; }
    }
}
