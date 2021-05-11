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
    public partial class ViewTenantContracts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LandLordInfo"] == null)
            {
                Response.Redirect("login.aspx", false);
                return;
            }


            DataTable dtTenantContracts = new DataTable();
            try
            {
                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("guz-KE");
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("guz-KE");

                if (Session["LandLordInfo"] != null)
                {
                    int landlordId = Convert.ToInt32(Session["LandLordID"]);

                    dtTenantContracts = ClassLibrary_PropertyManager.Controller.cTenantContract.GetTenantContractByLandLordID(landlordId);


                    {
                        GridView1.DataSource = dtTenantContracts;
                        GridView1.DataBind();

                        Session["dtTenantContracts"] = dtTenantContracts;
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
                dtTenantContracts.Dispose();

            }



        }

        public string ShowContractRemainingTime(string _startdate, string _endDate)
        {
            string sreturnStatusMsg = "";
            double days = (Convert.ToDateTime(_startdate) - Convert.ToDateTime(_endDate)).TotalDays;

            
            if (days > 180)
            {
                sreturnStatusMsg = "<span class='badge badge-success'>"+days+" days </span>";
            }
            else if (days < 90)
            {
                sreturnStatusMsg = "<span class='badge badge-danger'>" + days + " days</span>"; 
            }
            else
            {
                sreturnStatusMsg = "<span class='badge badge-primary'>" + days + " days</span>";
            }


            return sreturnStatusMsg;
        }

        public string ShowContractValidity(string _status)
        {

            string sreturnStatusMsg = "";

            if (_status == "True")
            {
                sreturnStatusMsg = "<span class='badge badge-primary' >Valid</span>";
            }
            else if (_status == "False")
            {
                sreturnStatusMsg = "<span class='badge badge-danger'>Expired</span>"; ;
            }


            return sreturnStatusMsg;
        }
        public string ShowContractDocument(string _status)
        {

            string sreturnStatusMsg = "";

            if (_status != "")
            {
                sreturnStatusMsg = "<span class='badge badge-secondary' >Download <em class='icon ni ni-file-download'></em> </span>";
            }
            else 
            {
                sreturnStatusMsg = "<span class='badge badge-danger'>No Documents</span>"; ;
            }


            return sreturnStatusMsg;
        }
    }
}