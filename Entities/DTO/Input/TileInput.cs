using Entities.Models;

namespace Entities.DTO.Input
{
    public class TileInput
    {
        public Guid Zone_Id { get; set; }
        public TileType Type { get; set; }
        public int X_Position { get; set; }
        public int Y_Position { get; set; }
    }
}
