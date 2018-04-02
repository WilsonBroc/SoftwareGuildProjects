using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ModelValidationSample.Models.Annotations
{
    public class NoGarfieldOnMondaysAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            Appointment appt = value as Appointment;
            if (appt == null || string.IsNullOrWhiteSpace(appt.ClientName))
            {
                return true;
            }
            else
            {
                return !(appt.ClientName == "Garfield" 
                    && appt.Date.DayOfWeek == DayOfWeek.Monday);
            }
        }
    }
}