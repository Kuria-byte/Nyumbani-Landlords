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
    public partial class AddEmployee : System.Web.UI.Page
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
                    int landlordId = Convert.ToInt32(Session["LandLordID"]);
                    LoadBuildings(landlordId);

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

        private void LoadBuildings(int _LandLordID)
        {
            DataTable dtBuilding = new DataTable();

            dtBuilding = ClassLibrary_PropertyManager.Controller.cBuilding.GetBuildingByLandLordID(_LandLordID);

            ddlBuilding.Items.Clear();
            if (dtBuilding.Rows.Count > 0)
            {
                ddlBuilding.Enabled = true;
                foreach (DataRow row in dtBuilding.Rows)
                {
                    ddlBuilding.Items.Add(new ListItem() { Text = row["BuildingName"].ToString() + "-" + row["BuildingCity"].ToString(), Value = row["BuildingID"].ToString() });
                }
            }
            else
            {
                ddlBuilding.Enabled = false;
            }

            ddlBuilding.Items.Insert(0, new ListItem("Select Building", "0"));
            dtBuilding = null;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mEmployee employee = new ClassLibrary_PropertyManager.Model.mEmployee();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {


                    int success = 0;
                    employee.EmployeeName = txtName.Value.Trim();
                    employee.EmployeeType = ddlOccupation.SelectedItem.ToString();
                    employee.EmployeeEmail = txtEmail.Value.Trim();
                    employee.EmployeePassword = txtPassword.Value.Trim();
                    employee.LandLordID = landlordId;
                    employee.BuildingID = Convert.ToInt32(ddlBuilding.SelectedValue);
                    employee.EmployeePhone = txtPhone.Value.Trim();
                    employee.EmployeeStatus = txtStatus.Checked;
                   


                    if (UploadImage.HasFile)
                    {
                        fileName = employee.EmployeeName.ToString() + "-" + employee.EmployeeType + "-" + UploadImage.FileName.Trim();


                        if (File.Exists(Server.MapPath("/EmployeeImages/") + fileName))
                        {

                            File.Delete(Server.MapPath("/EmployeeImages/") + fileName);
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/EmployeeImages/") + fileName);

                        imgDisplayPicture.ImageUrl = "/EmployeeImages/" + fileName;



                    }

                    employee.EmployeePicture = fileName;



                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cEmployee.AddNewEmployee(employee);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        employee.EmployeeID = Convert.ToInt32(Request.QueryString["id"]);
                        //success = ClassLibrary_PropertyManager.Controller.cTenant.UpdateTenant(tenant);
                        divMsgSuccess.Visible = true;
                    }

                    txtName.Value = "";
                    ddlOccupation.SelectedIndex = 0;
                    ddlBuilding.SelectedIndex = 0;
                    txtEmail.Value = "";
                    txtPassword.Value = "";
                    txtPhone.Value = "";
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
                    employee = null;

                }
            }

        }
    }
}