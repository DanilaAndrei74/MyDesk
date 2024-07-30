using FluentValidation;
using Entities.DTO.Input;

namespace Services.Validators
{
    public class TeamsValidator : AbstractValidator<TeamInput>
    {
        public TeamsValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required")
                                .NotNull().WithMessage("Name is required")
                                .MinimumLength(1)
                                .MaximumLength(256);
        }
    }
}
