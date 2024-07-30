using FluentValidation;
using MyDesk.Application.Models;

namespace MyDesk.Frontend.Validators
{
	public class LoginValidator : AbstractValidator<LoginModel>
	{
		public LoginValidator()
		{
			RuleFor(x => x.Email).NotEmpty().EmailAddress();
			RuleFor(x => x.Password)
				.NotEmpty().WithMessage("Password is required.")
				.MinimumLength(6).WithMessage("Password must be at least 6 characters long.")
				.MaximumLength(60).WithMessage("Password must be at most 60 characters long.")
				.Matches(@"^(?=.*[!@#$%^&*()_+{}[\]:;<>,.?/~`]).{6,}$")
				.WithMessage("Password must contain at least one special character.")
				.Matches(@"^(?=.*[a-z]).{6,}$")
				.WithMessage("Password must contain at least one lowercase letter.")
				.Matches(@"^(?=.*[A-Z]).{6,}$")
				.WithMessage("Password must contain at least one uppercase letter.")
				.Matches(@"^(?=.*\d).{6,}$")
				.WithMessage("Password must contain at least one digit.");
		}
	}
}
