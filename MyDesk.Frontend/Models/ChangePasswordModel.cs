namespace MyDesk.Frontend.Models
{
    public class ChangePasswordModel
    {
        public string CurrentPassword { get; set; }
        public string NewPassword { get; set; } 
        public string NewPasswordConfirmation { get; set; }
    }
}
