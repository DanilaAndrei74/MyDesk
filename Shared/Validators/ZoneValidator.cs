using FluentValidation;
using Entities.DTO.Input;

namespace Services.Validators
{
    public class ZoneValidator : AbstractValidator<ZoneInput>
    {
        public ZoneValidator()
        {

            RuleFor(x => x.Floor_Id).NotEmpty().WithMessage("Guid is required")
                                      .NotNull().WithMessage("Guid is required")
                                      .Must(Helper.BeAValidGuid).WithMessage("Invalid GUID format."); ;
            RuleFor(x => x.Name).NotEmpty()
                                .NotNull()
                                .MaximumLength(256);
            RuleFor(x => x.Size_X)
                .NotEmpty().WithMessage("Size_X required")
                .NotNull().WithMessage("Size_X required")
                .GreaterThanOrEqualTo(5).WithMessage("Must be at least 5")
                .LessThanOrEqualTo(50).WithMessage("Must be at least 50");

            RuleFor(x => x.Size_Y)
                .NotEmpty().WithMessage("Size_Y required")
                .NotNull().WithMessage("Size_Y required")
                .GreaterThanOrEqualTo(5).WithMessage("Must be at least 5")
                .LessThanOrEqualTo(50).WithMessage("Must be at least 50");
        }
    }
}
