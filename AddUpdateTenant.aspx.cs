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
    public partial class AddUpdateTenant : System.Web.UI.Page
    {
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


                try
                {
                    
                    if (Request.QueryString["id"] != null)
                    {

                        LoadDataOnUpdate();
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

        private void LoadDataOnUpdate()
        {

            string id = Request.QueryString["id"].Trim();

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            imgDisplayPicture.Visible = true;
            DataTable dtUnit = (DataTable)Session["dtTenants"];
            foreach (DataRow dr in dtUnit.Rows)
            {
                if (dr["TenantID"].ToString() == id)
                {

                    txtTenantName.Value = dr["TenantName"].ToString();
                    ddlOccupation.SelectedValue = dr["TenantOccupation"].ToString();
                    txtNationalID.Value = dr["TenantNationalID"].ToString();
                    txtTenantEmail.Value = dr["TenantEmail"].ToString();
                    txtPhone.Value = dr["TenantPhone"].ToString();
                    txtAddress.Value = dr["TenantHomeAddress"].ToString();
                    txtCompany.Value = dr["TenantCompany"].ToString();
                 
                    fileName = dr["TenantPicture"].ToString();

                    //DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + dr["MenuPicture"].ToString();
                    imgDisplayPicture.ImageUrl = "/TenantImages/" + dr["TenantPicture"].ToString();

                    //RequiredFieldValidator8.Enabled = false;

                    txtStatus.Checked = Convert.ToBoolean(dr["Status"].ToString());
                 

                    break;
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mTenant tenant = new ClassLibrary_PropertyManager.Model.mTenant();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {


                    int success = 0;
                    tenant.TenantName = txtTenantName.Value.Trim();
                    tenant.TenantOccupation = ddlOccupation.SelectedItem.ToString();
                    tenant.LandLordID = landlordId;
                    tenant.TenantNationalID = txtNationalID.Value.Trim();
                    tenant.TenantEmail = txtTenantEmail.Value.Trim();
                    tenant.TenantPhone = txtPhone.Value.Trim();
                    tenant.TenantHomeAddress = txtAddress.Value.Trim();
                    tenant.TenantCompany = txtCompany.Value.Trim();
                    tenant.Status = txtStatus.Checked;
                    tenant.TenantPassword = "";


                    if (UploadImage.HasFile)
                    {
                        fileName = tenant.TenantName.ToString() + "-" + tenant.TenantNationalID + "-" + UploadImage.FileName.Trim();


                        if (File.Exists(Server.MapPath("/TenantImages/") + fileName)) 
                        {

                            File.Delete(Server.MapPath("/TenantImages/") + fileName);
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/TenantImages/") + fileName);

                        imgDisplayPicture.ImageUrl = "/TenantImages/" + fileName;



                    }

                    tenant.TenantPicture = fileName;



                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cTenant.AddNewTenant(tenant);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        tenant.TenantID = Convert.ToInt32(Request.QueryString["id"]);
                        success = ClassLibrary_PropertyManager.Controller.cTenant.UpdateTenant(tenant);
                        divMsgSuccess.Visible = true;
                    }

                    txtTenantName.Value = "";
                    ddlOccupation.SelectedIndex = 0;
                    txtNationalID.Value = "";
                    txtTenantEmail.Value = "";
                    txtPhone.Value = "";
                    txtAddress.Value = "";
                    txtCompany.Value = "";
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
                    tenant = null;

                }
            }

        }
    }
}