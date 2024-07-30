namespace Entities.Models
{
    public class Team
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public DateTime Created_At { get; set; } = DateTime.UtcNow;
        public DateTime Updated_At { get; set; } = DateTime.UtcNow;
        public bool Deleted { get; set; }
        public IEnumerable<User> Users { get; set; } 
    }
}