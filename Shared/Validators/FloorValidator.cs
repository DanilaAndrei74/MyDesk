using FluentValidation;
using Entities.DTO.Input;

namespace Services.Validators
{
    public class FloorValidator : AbstractValidator<FloorInput>
    {
        public FloorValidator()
        {
            
            RuleFor(x => x.Building_Id).NotEmpty().WithMessage("Guid is required")
                                      .NotNull().WithMessage("Guid is required")
                                      .Must(Helper.BeAValidGuid).WithMessage("Invalid GUID format."); ;
            RuleFor(x => x.Name).NotEmpty()
                                .NotNull()
                                .MaximumLength(256);
        }
    }
}
