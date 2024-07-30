namespace Entities.Models
{
    public class User
    {
        public Guid Id { get; set; }
        public Guid? Team_Id { get; set; }
        public Guid? Photo_Id { get; set; }
        public string Email { get; set; } = string.Empty;
        public string First_Name { get; set; } = string.Empty;
        public string Last_Name { get; set; } = string.Empty;
        public bool Is_Admin { get; set; }
        public bool Deleted { get; set; }
        public DateTime Created_At { get; set; }
        public DateTime Updated_At { get; set; }

        public Team? Team { get; set; } 
        public Photo? Photo { get; set; } 
        public Credential Credential { get; set; } 
        public IEnumerable<Reservation> Reservations { get; set; } 
    }
}