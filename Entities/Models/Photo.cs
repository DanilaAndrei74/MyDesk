using System.Reflection.Metadata;

namespace Entities.Models
{
    public class Photo
    {
        public Guid User_Id { get; set; }
        public string PhotoUrl { get; set; } = string.Empty;
        public DateTime Updated_At { get; set; }

        public User User { get; set; } = new User();
    }
}