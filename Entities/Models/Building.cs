namespace Entities.Models
{
    public class Building
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public bool Deleted { get; set; }
        public DateTime Created_At { get; set; } = new DateTime();
        public DateTime Updated_At { get; set; } = new DateTime();

        public IEnumerable<Floor> Floors { get; set; } 
    }
}