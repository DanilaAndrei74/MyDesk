namespace Entities.DTO.Output
{
    public class FloorOutput
    {
        public Guid Id { get; set; }
        public Guid Building_Id { get; set; }
        public string Name { get; set; }
        public DateTime Updated_At { get; set; }
    }
}
