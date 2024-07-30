namespace Entities.DTO.Output
{
    public class ZoneOutput
    {
        public Guid Id { get; set; }
        public Guid FloorId { get; set; }
        public string Name { get; set; }
        public int Size_X { get; set; }
        public int Size_Y { get; set; }
        public DateTime Updated_At { get; set; }

    }
}
