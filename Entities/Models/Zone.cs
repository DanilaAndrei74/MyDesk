namespace Entities.Models
{
    public class Zone
    {
        public Guid Id { get; set; }
        public Guid Floor_Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public int Size_X { get; set; }
        public int Size_Y { get; set; }
        public bool Deleted { get; set; }
        public DateTime Created_At { get; set; }
        public DateTime Updated_At { get; set; }

        public IEnumerable<Tile> Tiles { get; set; } 
        public Floor Floor { get; set; }
    }
}