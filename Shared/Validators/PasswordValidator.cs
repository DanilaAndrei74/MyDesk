using Entities.DTO.Input;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Validators
{
    public class PasswordValidator : AbstractValidator<string>
    {
        public PasswordValidator()
        {
            RuleFor(x => x)
                .NotEmpty().WithMessage("Password is required.")
                .NotNull().WithMessage("Password is required.")
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
