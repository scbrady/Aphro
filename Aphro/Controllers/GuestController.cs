using System.Web.Mvc;

namespace Aphro.Controllers
{
    public class GuestController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}