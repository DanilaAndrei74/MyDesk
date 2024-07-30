namespace Entities.Models
{
    public class Credential
    {
        public Guid Id { get; set; }
        public Guid User_Id { get; set; }
        public Byte[] Password { get; set; } 
        public string Salt { get; set; } = string.Empty;
        public int Number_Of_Tries { get; set; }
        public bool Is_Active { get; set; }
        public string TOTP { get; set; } = string.Empty;
        public DateTime Updated_At { get; set; }

        public User User { get; set; }
    }
}