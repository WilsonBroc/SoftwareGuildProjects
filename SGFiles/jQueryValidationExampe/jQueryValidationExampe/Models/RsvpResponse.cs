using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace jQueryValidationExampe.Models
{
    public class RsvpResponse
    {
        //[Required(ErrorMessage = "Enter your name")]
        public string Name { get; set; }

        //[Required(ErrorMessage = "Enter your email")]
        //[RegularExpression(@"^\S+@\S+\.\S$")]
        public string Email { get; set; }

        //[Required(ErrorMessage = "Enter your phone")]
        public string Phone { get; set; }

        //[Required(ErrorMessage = "Enter your favorite game")]
        public string FavoriteGame { get; set; }

        //[Required(ErrorMessage = "Will you attend?")]
        public bool? WillAttend { get; set; }

    }
}