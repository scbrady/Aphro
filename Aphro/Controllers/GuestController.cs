using System.Linq;
using System.Web.Mvc;
using Aphro.Models;
using Aphro.ViewModels;
using DevOne.Security.Cryptography.BCrypt;

namespace Aphro.Controllers
{
    public class GuestController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(GuestLogin guest)
        {
            var invalidCreds = false;

            if (ModelState.IsValid)
            {
                using (DataModelContainer dc = new DataModelContainer())
                {
                    var guestToLogin = dc.guests.FirstOrDefault(c => c.email.Equals(guest.email));
                    if (guestToLogin != null)
                    {
                        if (!BCryptHelper.CheckPassword(guest.password, guestToLogin.password))
                            invalidCreds = true;
                    }
                    else
                        invalidCreds = true;

                }
                if (invalidCreds)
                {
                    ModelState.AddModelError("Error", "Invalid Username/Password Combination");
                    return View(guest);
                }
                else
                {
                    ModelState.Clear();
                    return RedirectToAction("Index");
                }
            }
            return View(guest);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(Guest guest)
        {
            if (ModelState.IsValid)
            {
                var salt = BCryptHelper.GenerateSalt();
                var password = BCryptHelper.HashPassword(guest.password, salt);

                var newGuest = new guests
                {
                    first_name = guest.first_name,
                    last_name = guest.last_name,
                    email = guest.email,
                    password = password
                };
                using (DataModelContainer dc = new DataModelContainer())
                {
                    dc.guests.Add(newGuest);
                    dc.SaveChanges();
                    ModelState.Clear();
                }
                return RedirectToAction("Index");
            }
            return View(guest);
        }
    }
}