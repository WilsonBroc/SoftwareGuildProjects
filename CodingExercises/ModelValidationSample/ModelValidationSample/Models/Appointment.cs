using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Microsoft.Ajax.Utilities;
using ModelValidationSample.Models.Annotations;

namespace ModelValidationSample.Models
{
    //[NoGarfieldOnMondays(ErrorMessage = "No Garfield on Mondays!")]
    public class Appointment : IValidatableObject
    {
        [Display(Name="Name")]
        //[Required]
        public string ClientName { get; set; }

        [DataType(DataType.Date)]
        //[Required(ErrorMessage = "Please enter a date")]
        //[FutureDate(ErrorMessage = "Enter a future date")]
        public DateTime Date { get; set; }

        [Display(Name="Accept Terms of Service")]
        //[Range(typeof(bool), "true", "true", ErrorMessage = "You must accept the terms")]
        //[MustBeTrue(ErrorMessage = "You must accept the terms of service.")]
        public bool TermsAccepted { get; set; }


        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            List<ValidationResult> errors = new List<ValidationResult>();

            if (ClientName.IsNullOrWhiteSpace())
            {
                errors.Add(new ValidationResult("Please enter your name", 
                    new [] {"ClientName"}));
            }
            if (DateTime.Now > Date)
            {
                errors.Add(new ValidationResult("Please enter a date in the future",
                    new [] {"Date"}));
            }
            if (errors.Count == 0 && ClientName == "Garfield" && Date.DayOfWeek == DayOfWeek.Monday)
            {
                errors.Add(new ValidationResult("Garfield..."));
            }
            if (!TermsAccepted)
            {
                errors.Add(new ValidationResult("You must accept", new []{"TermsAccepted"}));
            }

            return errors;
        }
    }
}