using System.Web.Mvc;
using Aphro.Models;

namespace Aphro.Controllers
{
    public class GuestController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(guests guest)
        {
            if (ModelState.IsValid)
            {
                using (DataModelContainer dc = new DataModelContainer())
                {
                    dc.guests.Add(guest);
                    dc.SaveChanges();
                    ModelState.Clear();
                }
                return RedirectToAction("Index");
            }
            return View(guest);
        }
    }
}