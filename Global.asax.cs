using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Nyumbani_Landlords
{
    public class Global : HttpApplication
    {
        public static string connString;
        public static string ErrorFilePath = "";
        public static string gFromEmail;
        public static string gFromEmailPassword;
        public static string gWebDomain;

        //public static clKMFoodOrderingSystem.Models.mRestaurant gRestaurant = new clKMFoodOrderingSystem.Models.mRestaurant();
        //public static clKMFoodOrderingSystem.Models.mBusinessUser gBusinessUser = new clKMFoodOrderingSystem.Models.mBusinessUser();
        //public static clKMFoodOrderingSystem.Models.mBusinessUser gBusinessInfo = null;




        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ErrorFilePath = Server.MapPath("~/ErrorLog.txt");

            ClassLibrary_PropertyManager.Global.connString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            ClassLibrary_PropertyManager.Global.gFromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString().Trim();
            ClassLibrary_PropertyManager.Global.gFromEmailPassword = ConfigurationManager.AppSettings["FromEmailPassword"].ToString().Trim();
            ClassLibrary_PropertyManager.Global.gWebDomain = ConfigurationManager.AppSettings["WebDomain"].ToString().Trim();
            ClassLibrary_PropertyManager.Global.gEDKey = "b14ca5898a4e4133bbce2ea2315a2020";

        }
    }
}