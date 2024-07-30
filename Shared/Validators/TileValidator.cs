using Entities.DTO.Input;
using Entities.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Validators
{
    public class TileValidator : AbstractValidator<TileInput>
    {
        public TileValidator()
        {

            RuleFor(x => x.Zone_Id).NotEmpty().WithMessage("Guid is required")
                                      .NotNull().WithMessage("Guid is required")
                                      .Must(Helper.BeAValidGuid).WithMessage("Invalid GUID format."); ;
            RuleFor(x => x.Type).NotEmpty().WithMessage("Type is required")
                                .NotNull().WithMessage("Type is required")
                                .IsInEnum().WithMessage("Invalid type value");
            RuleFor(x => x.X_Position)
                .NotEmpty().WithMessage("X_Position required")
                .NotNull().WithMessage("X_Position required")
                .GreaterThanOrEqualTo(0).WithMessage("Must be a positive number");

            RuleFor(x => x.Y_Position)
                .NotEmpty().WithMessage("Y_Position required")
                .NotNull().WithMessage("Y_Position required")
                .GreaterThanOrEqualTo(0).WithMessage("Must be a positive number");
        }
    }
}
