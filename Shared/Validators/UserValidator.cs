using FluentValidation;
using Entities.DTO.Input;

namespace Services.Validators
{
    public class UserValidator : AbstractValidator<UserInput>
    {
        public UserValidator()
        {

            RuleFor(x => x.Email)
            .NotEmpty().WithMessage("Email is required.")
            .NotNull().WithMessage("Email is required.")
            .EmailAddress().WithMessage("Invalid email address format.");

            RuleFor(x => x.First_Name)
                .NotEmpty().WithMessage("First name is required.")
                .NotNull().WithMessage("First name is required.")
                .MaximumLength(20).WithMessage("First name must be at most 20 characters long.");

            RuleFor(x => x.Last_Name)
                .NotEmpty().WithMessage("Last name is required.")
                .NotNull().WithMessage("Last name is required.")
                .MaximumLength(20).WithMessage("Last name must be at most 20 characters long.");
        }
    }
}
