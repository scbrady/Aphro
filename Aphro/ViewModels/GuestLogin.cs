using System.ComponentModel.DataAnnotations;

namespace Aphro.ViewModels
{
    public class GuestLogin
    {
        [Required(ErrorMessage = "Please provide your email", AllowEmptyStrings = false)]
        public string email { get; set; }

        [Required(ErrorMessage = "Please provide Password", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        public string password { get; set; }
    }
}