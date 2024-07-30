using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MyDesk.Application.Models
{
    public class LoginModel
    {
        public string Email { get; set; }

        public string Password { get; set; }
    }
}
