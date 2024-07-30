using FluentValidation;
using MyDesk.Frontend.Models;

namespace MyDesk.Frontend.Validators
{
    public class ChangePasswordValidator : AbstractValidator<ChangePasswordModel>
    {
        public ChangePasswordValidator()
        {
            RuleFor(x => x.CurrentPassword)
                .NotEmpty().WithMessage("Current password is required.")
                .MinimumLength(6).WithMessage("Current password must be at least 6 characters long.")
                .MaximumLength(60).WithMessage("Current password must be at most 60 characters long.")
                .Matches(@"^(?=.*[!@#$%^&*()_+{}[\]:;<>,.?/~`]).{6,}$")
                .WithMessage("Current password must contain at least one special character.")
                .Matches(@"^(?=.*[a-z]).{6,}$")
                .WithMessage("Current password must contain at least one lowercase letter.")
                .Matches(@"^(?=.*[A-Z]).{6,}$")
                .WithMessage("Current password must contain at least one uppercase letter.")
                .Matches(@"^(?=.*\d).{6,}$")
                .WithMessage("Current password must contain at least one digit.");
            RuleFor(x => x.NewPassword).NotEmpty().WithMessage("New password is required.")
                .MinimumLength(6).WithMessage("New password must be at least 6 characters long.")
                .MaximumLength(60).WithMessage("New password must be at most 60 characters long.")
                .Matches(@"^(?=.*[!@#$%^&*()_+{}[\]:;<>,.?/~`]).{6,}$")
                .WithMessage("New password must contain at least one special character.")
                .Matches(@"^(?=.*[a-z]).{6,}$")
                .WithMessage("New password must contain at least one lowercase letter.")
                .Matches(@"^(?=.*[A-Z]).{6,}$")
                .WithMessage("New password must contain at least one uppercase letter.")
                .Matches(@"^(?=.*\d).{6,}$")
                .WithMessage("New password must contain at least one digit.");
            RuleFor(x => x.NewPasswordConfirmation)
                .NotEmpty().WithMessage("New password confirmation is required.")
                .MinimumLength(6).WithMessage("New password confirmation must be at least 6 characters long.")
                .MaximumLength(60).WithMessage("New password confirmation must be at most 60 characters long.")
                .Matches(@"^(?=.*[!@#$%^&*()_+{}[\]:;<>,.?/~`]).{6,}$")
                .WithMessage("New password confirmation must contain at least one special character.")
                .Matches(@"^(?=.*[a-z]).{6,}$")
                .WithMessage("New password confirmation must contain at least one lowercase letter.")
                .Matches(@"^(?=.*[A-Z]).{6,}$")
                .WithMessage("New password confirmation must contain at least one uppercase letter.")
                .Matches(@"^(?=.*\d).{6,}$")
                .WithMessage("New password confirmation must contain at least one digit.");
        }
    }
}
