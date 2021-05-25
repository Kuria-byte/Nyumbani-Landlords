using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nyumbani_Landlords
{
    public partial class AddBilling : System.Web.UI.Page
    {
        private CultureInfo infoCurr;

        private static string fileName = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LandLordInfo"] == null)
            {
                Response.Redirect("login.aspx", false);
                return;
            }

            if (!Page.IsPostBack)
            {
                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("guz-KE");
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("guz-KE");

                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {
                    LoadTenants(landlordId);
                 

                    if (Request.QueryString["id"] != null)
                    {

                        //LoadDataOnUpdate();
                    }

                }
                catch (Exception ioExp)
                {

                    using (StreamWriter sw = new StreamWriter(Global.ErrorFilePath, true))
                    { // If file exists, text will be appended ; otherwise a new file will be created
                        sw.Write(string.Format("Message: {0}<br />{1}StackTrace :{2}{1}Date :{3}{1}-----------------------------------------------------------------------------{1}",
                          ioExp.Message, Environment.NewLine, ioExp.StackTrace, DateTime.Now.ToString()));
                    }
                }
                finally
                {

                }
            }
        }

        private void LoadTenants(int _LandLordID)
        {
            DataTable dtTenant = new DataTable();

            dtTenant = ClassLibrary_PropertyManager.Controller.cTenant.GetTenantByLandLordID(_LandLordID);

            ddlTenant.Items.Clear();
            if (dtTenant.Rows.Count > 0)
            {
                ddlTenant.Enabled = true;
                foreach (DataRow row in dtTenant.Rows)
                {
                    ddlTenant.Items.Add(new ListItem() { Text = row["TenantName"].ToString() + "-" + row["TenantNationalID"].ToString() + "-" + row["TenantOccupation"].ToString() + "-" + row["TenantCompany"].ToString(), Value = row["TenantID"].ToString() });
                }
            }
            else
            {
                ddlTenant.Enabled = false;
            }

            ddlTenant.Items.Insert(0, new ListItem("Select Tenant", "0"));
            dtTenant = null;

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mBill Bill = new ClassLibrary_PropertyManager.Model.mBill();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {


                    int success = 0;
                    Bill.TenantID = Convert.ToInt32(ddlTenant.SelectedValue);
                    Bill.LandLordID  = landlordId;
                    Bill.BillType = ddlBillType.SelectedValue;
                    Bill.BillAmount = Convert.ToDouble(txtAmountDue.Value.Trim());
                    Bill.BillDueDate = Convert.ToDateTime(txtDueDate.Value);
                    Bill.BillNotes = txtNotes.Text.Trim();
                    Bill.BillStatus = 0; // 0 - not paid , 1 - Paid

                    if (ddlRecurrency.SelectedIndex == 0)
                    {
                        Bill.BillRecurrency = 30;
                    }else if (ddlRecurrency.SelectedIndex == 1)
                    {
                        Bill.BillRecurrency = 90;
                    }
                    else if (ddlRecurrency.SelectedIndex == 2)
                    {
                        Bill.BillRecurrency = 180;
                    }
                    else if (ddlRecurrency.SelectedIndex == 3)
                    {
                        Bill.BillRecurrency = 360;
                    }
                    else
                    {
                        Bill.BillRecurrency = 0;
                    }




                        if (UploadImage.HasFile)
                    {
                        fileName = Bill.TenantID.ToString() + "-" + Bill.BillType + "-" + UploadImage.FileName.Trim();

                        if (File.Exists(Server.MapPath("/BillImages" + fileName)))
                        {

                            File.Delete(Server.MapPath("/BillImages" + fileName));
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/BillImages" + fileName));
                        //DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + fileName;



                    }

                    Bill.BillAttatchment = fileName;




                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cBill.AddNewBill(Bill);
                        //ClassLibrary_PropertyManager.Controller.cUnit.UpdateUnitAvailability(Convert.ToInt32(ddlUnit.SelectedValue), false);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        Bill.BillID = Convert.ToInt32(Request.QueryString["id"]);

                        //success = ClassLibrary_PropertyManager.Controller.cTenantContract.UpdateTenantContract(contract);
                        divMsgSuccess.Visible = true;
                    }


                    ddlTenant.SelectedIndex = 0;
                    ddlBillType.SelectedIndex = 0;
                    ddlRecurrency.SelectedIndex = 0;
                    txtAmountDue.Value = "";
                    txtDueDate.Value = "";
                    txtNotes.Text = "";
                

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
                    Bill = null;

                }
            }

        }
    }
}