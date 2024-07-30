using Entities.DTO.Input;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Validators
{
    public class ReservationValidator : AbstractValidator<ReservationInput>
    {
        public ReservationValidator()
        {

            RuleFor(x => x.User_Id).NotEmpty().WithMessage("Guid is required")
                                      .NotNull().WithMessage("Guid is required")
                                      .Must(Helper.BeAValidGuid).WithMessage("Invalid GUID format.");
            RuleFor(x => x.Desk_Id).NotEmpty().WithMessage("Guid is required")
                                      .NotNull().WithMessage("Guid is required")
                                      .Must(Helper.BeAValidGuid).WithMessage("Invalid GUID format."); ;
            RuleFor(x => x.Date)
                 .NotNull().WithMessage("DateTime is required.")
                 .NotEmpty().WithMessage("DateTime cannot be empty.")
                 .Must(Helper.BeNotInPast).WithMessage("DateTime must be in the future or current time.");
        }
    }
}
