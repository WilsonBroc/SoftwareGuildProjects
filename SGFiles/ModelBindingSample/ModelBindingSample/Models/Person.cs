using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ModelBindingSample.Models
{
    public class Person
    {
        [Display(Name = "Person ID")]
        public int? PersonId { get; set; }

        [Display(Name="First Name")]
        public string FirstName { get; set; }

        [Display(Name="Surname")]
        public string LastName { get; set; }

        public Address Address { get; set; }
    }
}