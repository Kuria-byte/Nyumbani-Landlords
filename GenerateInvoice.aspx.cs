using Nyumbani_Landlords.EmailTemplates;
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
    public partial class GenerateInvoice : System.Web.UI.Page
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

            lstTenant.Items.Clear();
            if (dtTenant.Rows.Count > 0)
            {
                //lstTenant.Enabled = true;
                foreach (DataRow row in dtTenant.Rows)
                {
                    lstTenant.Items.Add(new ListItem() { Text = row["TenantName"].ToString() + "-" + row["TenantNationalID"].ToString() + "-" + row["TenantOccupation"].ToString() + "-" + row["TenantCompany"].ToString(), Value = row["TenantID"].ToString() });
                }
            }
            else
            {
                lstTenant.Enabled = false;
            }

            lstTenant.Items.Insert(0, new ListItem("Select Tenant", "0"));
            dtTenant = null;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mInvoice invoice = new ClassLibrary_PropertyManager.Model.mInvoice();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {


                    int success = 0;
                    invoice.TenantID = Convert.ToInt32(lstTenant.SelectedValue);
                    invoice.LandLordID = landlordId;
                    
                    invoice.InvoiceType = ddlBillType.SelectedValue.Trim();
                    invoice.InvoiceAmount = Convert.ToDouble(txtAmount.Value.Trim());
                    invoice.AmountPaid = 0;
                    invoice.InvoiceNotes = txtNotes.Text.Trim();
                    invoice.InvoiceDueDate = Convert.ToDateTime(txtDueDate.Value);
                    invoice.InvoiceReminder = txtStatus.Checked;
                    invoice.InvoiceStatus = 0;




                    if (UploadImage.HasFile)
                    {
                        fileName = invoice.InvoiceID.ToString() + "-" + invoice.InvoiceType + "-" + UploadImage.FileName.Trim();

                        if (File.Exists(Server.MapPath("/InvoiceImages/") + fileName))
                       
                        {

                            File.Delete(Server.MapPath("/InvoiceImages/") + fileName);
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/InvoiceImages/") + fileName);

                





                    }

                    invoice.InvoiceAttatchments = fileName;




                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cInvoice.AddNewInvoice(invoice);
                      
                      

                        if (success > 0 & txtStatus.Checked == true)
                        {
                            string[] strTenant = lstTenant.SelectedItem.Text.Split('-');
                            string TenantName = strTenant[0];

                         

                            string strEmailMessage = clEmailTemplates.SendTenantInvoice(TenantName, ddlBillType.SelectedValue.Trim(), txtAmount.Value, UploadImage.PostedFile.FileName, txtDueDate.Value, txtNotes.Text  );

                            DataTable dtTenant = ClassLibrary_PropertyManager.Controller.cTenant.GetTenantByTenantID(Convert.ToInt32( lstTenant.SelectedValue));
 
                            ClassLibrary_PropertyManager.UtilityClasses.ucEmailManagement.SendTenantInvoice(dtTenant.Rows[0]["TenantEmail"].ToString(), strEmailMessage);



                            divMsgSuccess.Visible = true;
                            //email.InnerHtml = txtEmail.Text.Trim();
                           


                        }


                    }
                    else
                    {
                        invoice.InvoiceID = Convert.ToInt32(Request.QueryString["id"]);

                        //success = ClassLibrary_PropertyManager.Controller.cTenantContract.UpdateTenantContract(contract);
                        //divMsgSuccess.Visible = true;
                    }


                    lstTenant.SelectedIndex = 0;
                    ddlBillType.SelectedIndex = 0;
                    txtAmount.Value = "";
                    txtDueDate.Value = "";
                    txtNotes.Text = "";
               
                    txtStatus.Checked = false;

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
                    invoice = null;

                }
            }

        }

    
        protected void ddlTenant_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtTenant = new DataTable();

            if ((lstTenant.SelectedValue) != "")
            {
                dtTenant = ClassLibrary_PropertyManager.Controller.cTenantContract.GetTenantContractByTenantID(Convert.ToInt32(lstTenant.SelectedValue));
            }
            else
            {
                Response.Redirect("GenerateInvoice.aspx");
            }
            if (dtTenant.Rows.Count > 0)
            {
                if (ddlBillType.SelectedIndex == 1)
                {
                    txtAmount.Value = dtTenant.Rows[0]["TenantMonthlyRent"].ToString();
                }
                //else
                //{
                //    txtAmount.Value = "0";
                //}
            }

         

        
        }

        protected void ddlBillType_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtTenant = new DataTable();
            if ((lstTenant.SelectedValue) != "")
            {
                dtTenant = ClassLibrary_PropertyManager.Controller.cTenantContract.GetTenantContractByTenantID(Convert.ToInt32(lstTenant.SelectedValue));
            }else
            {
                Response.Redirect("GenerateInvoice.aspx");
            }

            

            if (dtTenant.Rows.Count > 0)
            {                                                                                             
                if (ddlBillType.SelectedIndex == 1)
                {
                    txtAmount.Value = dtTenant.Rows[0]["TenantMonthlyRent"].ToString();
                }
                else
                {
                    txtAmount.Value = "0";
                }
            }
        }
    }
}