using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nyumbani_Landlords
{
    public partial class Nyumbani : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LandLordInfo"] != null)
            {

                ClassLibrary_PropertyManager.Model.mLandLords landlord = new ClassLibrary_PropertyManager.Model.mLandLords();
                landlord = (ClassLibrary_PropertyManager.Model.mLandLords)Session["LandLordInfo"];

                spUserName.InnerHtml = landlord.LandLordName;
                divUserName.InnerHtml = landlord.LandLordName;
                spUserEmail.InnerHtml = landlord.LandLordEmail;
            }

        }
    }
}