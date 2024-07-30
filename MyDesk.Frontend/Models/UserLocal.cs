namespace MyDesk.Frontend.Models
{
    public class UserLocal
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsAdmin { get; set; }
        public string lastZoneUri { get; set; } = string.Empty;
        public string JWT { get; set; } 

    }
}
