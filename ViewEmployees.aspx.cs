using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nyumbani_Landlords
{
    public partial class ViewEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LandLordInfo"] == null)
            {
                Response.Redirect("login.aspx", false);
                return;
            }


            DataTable dtEmployee = new DataTable();
            try
            {

                if (Session["LandLordInfo"] != null)
                {
                    int landlordId = Convert.ToInt32(Session["LandLordID"]);

                    dtEmployee = ClassLibrary_PropertyManager.Controller.cEmployee.GetEmployeeByLandLordID(landlordId);


                    {
                        GridView1.DataSource = dtEmployee;
                        GridView1.DataBind();

                        Session["dtTenants"] = dtEmployee;
                    }

                }
            }
            catch (Exception ioExp)
            {

                using (StreamWriter sw = new StreamWriter(Global.ErrorFilePath, true))
                { // If file exists, text will be appended ; otherwise a new file will be created
                    sw.Write(string.Format("Message: {0}<br />{1}StackTrace :{2}{1}Date :{3}{1}-----------------------------------------------------------------------------{1}",
                      ioExp.Message, Environment.NewLine, ioExp.StackTrace, DateTime.Now.ToString()));
                }
                divMsgError.Visible = true;
            }
            finally
            {
                dtEmployee.Dispose();

            }

        }

        public string ShowStatus(string _status)
        {
            string sreturnStatusMsg = "";

            if (_status == "True")
            {
                sreturnStatusMsg = "<span class='badge badge-success' >Available</span>";
            }
            else if (_status == "False")
            {
                sreturnStatusMsg = "<span class='badge badge-primary'>Not Available</span>"; ;
            }


            return sreturnStatusMsg;
        }
    }
}