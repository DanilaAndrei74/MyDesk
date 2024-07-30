namespace Entities.Models
{
    public class Floor
    {
        public Guid Id { get; set; }
        public Guid Building_Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public bool Deleted { get; set; }
        public DateTime Created_At { get; set; } 
        public DateTime Updated_At { get; set; } 

        public IEnumerable<Zone> Zones { get; set; } 
        public Building Building { get; set; } 
    }
}