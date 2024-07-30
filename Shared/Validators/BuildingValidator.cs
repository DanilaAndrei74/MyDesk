using FluentValidation;
using Entities.DTO.Input;

namespace Services.Validators
{
    public class BuildingValidator : AbstractValidator<BuildingInput>
    {
        public BuildingValidator()
        {
            RuleFor(x => x.Name).NotEmpty()
                                .NotNull()
                                .MaximumLength(256);
            RuleFor(x => x.Address).NotEmpty()
                                .NotNull()
                                .MaximumLength(256); ;
        }
    }
}
