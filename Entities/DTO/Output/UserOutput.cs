namespace Entities.DTO.Output
{
    public class UserOutput
    {
        
        public Guid User_Id { get; set; }
        public string Email { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public string Team { get; set; }
        public DateTime Updated_At { get; set; }
    }
}
