using System;
using System.Configuration;
using System.Web.Mvc;
using Oracle.ManagedDataAccess.Client;

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

        public ActionResult Seating()
        {
            return View();
        }

        public string DrillDown(string section)
        {
            return "[{\"type\": \"map\",\"data\": [{\"name\": \"D\",\"path\": \"M612,-344,682,-541C632,-560,578,-571,521,-573L523,-363C554,-362,584,-355,612,-344z\"}]}]";
        }
    }
}