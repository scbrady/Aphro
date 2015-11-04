using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aphro.Models
{
    public class Guest
    {
        [Required(ErrorMessage = "Please provide first name", AllowEmptyStrings = false)]
        public string first_name { get; set; }

        [Required(ErrorMessage = "Please provide last name", AllowEmptyStrings = false)]
        public string last_name { get; set; }

        [RegularExpression(@"^([0-9a-zA-Z]([\+\-_\.][0-9a-zA-Z]+)*)+@(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]*\.)+[a-zA-Z0-9]{2,3})$",
         ErrorMessage = "Please provide valid email id")]
        public string email { get; set; }

        [Required(ErrorMessage = "Please provide Password", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        [StringLength(50, MinimumLength = 8, ErrorMessage = "Password must be 8 char long.")]
        public string password { get; set; }

        [Compare("password", ErrorMessage = "Confirm password dose not match.")]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        public string confirm_password { get; set; }
    }
}