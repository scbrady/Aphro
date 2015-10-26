using System.Configuration;
using System.Web.Mvc;
using Oracle.DataAccess.Client;

namespace Aphro.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            
            OracleConnection myConnection = new OracleConnection();
            myConnection.ConnectionString = ConfigurationManager.ConnectionStrings["OracleConnectionString"].ConnectionString;
            myConnection.Open();
            myConnection.Close();
            return View();
        }
    }
}