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
    public partial class GenerateInvoice : System.Web.UI.Page
    {
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


            //if (Page.IsValid)
            //{
            //    ClassLibrary_PropertyManager.Model.mTenantContract contract = new ClassLibrary_PropertyManager.Model.mTenantContract();
            //    int landlordId = Convert.ToInt32(Session["LandLordID"]);

            //    try
            //    {


            //        int success = 0;
            //        contract.TenantID = Convert.ToInt32(ddlTenant.SelectedValue);
            //        contract.UnitID = Convert.ToInt32(ddlUnit.SelectedValue);
            //        contract.LandLordID = landlordId;
            //        contract.TenantDeposit = Convert.ToDouble(txtDeposit.Value.Trim());
            //        contract.TenantMonthlyRent = Convert.ToDouble(txtRent.Value.Trim());

            //        contract.ContractStartDate = Convert.ToDateTime(txtStart.Value);
            //        contract.ContractEndDate = Convert.ToDateTime(txtEnd.Value);
            //        contract.ContractStatusID = txtStatus.Checked;




            //        if (UploadImage.HasFile)
            //        {
            //            fileName = contract.TenantID.ToString() + "-" + contract.UnitID + "-" + UploadImage.FileName.Trim();

            //            if (File.Exists(Server.MapPath("/ContractImages" + fileName)))
            //            {

            //                File.Delete(Server.MapPath("/ContractImages" + fileName));
            //                Console.WriteLine("File deleted.");
            //            }
            //            UploadImage.SaveAs(Server.MapPath("/ContractImages" + fileName));
            //            //DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + fileName;



            //        }

            //        contract.AgreementDocoument = fileName;




            //        if (btnSubmit.Text != "Update")
            //        {
            //            success = ClassLibrary_PropertyManager.Controller.cTenantContract.AddNewContract(contract);
            //            divMsgSuccess.Visible = true;

            //        }
            //        else
            //        {
            //            contract.TenantContractID = Convert.ToInt32(Request.QueryString["id"]);

            //            success = ClassLibrary_PropertyManager.Controller.cTenantContract.UpdateTenantContract(contract);
            //            divMsgSuccess.Visible = true;
            //        }


            //        ddlTenant.SelectedIndex = 0;
            //        ddlUnit.SelectedIndex = 0;
            //        txtDeposit.Value = "";
            //        txtRent.Value = "";
            //        txtStart.Value = "";
            //        txtEnd.Value = "";
            //        txtStatus.Checked = false;

            //    }

            //    catch (Exception ioExp)
            //    {

            //        using (StreamWriter sw = new StreamWriter(Global.ErrorFilePath, true))
            //        { // If file exists, text will be appended ; otherwise a new file will be created
            //            sw.Write(string.Format("Message: {0}<br />{1}StackTrace :{2}{1}Date :{3}{1}-----------------------------------------------------------------------------{1}",
            //              ioExp.Message, Environment.NewLine, ioExp.StackTrace, DateTime.Now.ToString()));
            //        }
            //        divMsgError.Visible = true;
            //    }
            //    finally
            //    {
            //        contract = null;

            //    }
            //}

        }

    
        protected void ddlTenant_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtTenant = new DataTable();

            dtTenant = ClassLibrary_PropertyManager.Controller.cTenantContract.GetTenantContractByTenantID(Convert.ToInt32(ddlTenant.SelectedValue));

          if (ddlBillType.SelectedIndex == 1)
            {
                txtAmount.Value = dtTenant.Rows[0]["TenantMonthlyRent"].ToString();
            }
            else
            {
                txtAmount.Value = "0" ;
            }

        
        }
    }
}