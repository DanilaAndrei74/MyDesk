using Entities.DTO.Input;
using FluentValidation;
using FluentValidation.Results;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Validators
{
    public class LoginInputValidator : AbstractValidator<LoginInput>
    {
        private readonly PasswordValidator _passwordValidator;

        public LoginInputValidator()
        {
            _passwordValidator = new PasswordValidator();

            RuleFor(input => input.Email)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Invalid email address format.");

            RuleFor(input => input.Password)
                .NotEmpty().WithMessage("Password is required.");

            // Delegate password validation to PasswordValidator
            RuleFor(input => input.Password)
                .Must(ValidatePassword).WithMessage("Invalid password.");
        }

        private bool ValidatePassword(string password)
        {
            var validationResult = _passwordValidator.Validate(password);
            return validationResult.IsValid;
        }

        public ValidationResult Validate(LoginInput input)
        {
            return base.Validate(input);
        }
    }
}
