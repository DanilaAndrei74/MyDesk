namespace Entities.DTO.Input
{
    public class UserInput
    {
        public Guid? Team_Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
    }
}
