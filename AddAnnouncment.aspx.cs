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
    public partial class AddAnnouncment : System.Web.UI.Page
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
                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("guz-KE");
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("guz-KE");

                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {
                    LoadBuildings(landlordId);
           

                   

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
                ClassLibrary_PropertyManager.Model.mAnnouncment announcment = new ClassLibrary_PropertyManager.Model.mAnnouncment();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {


                    int success = 0;
                    announcment.Announcment = txtAnnouncment.Text.Trim();
                    announcment.BuildingID = Convert.ToInt32(ddlBuilding.SelectedValue);
                    announcment.LandLordId = landlordId;
                    announcment.AnnouncmentStatus = true;


                    if (UploadImage.HasFile)
                    {
                        fileName = announcment.AnnouncmentID.ToString() + "-" + announcment.LandLordId + "-" + UploadImage.FileName.Trim();

                        if (File.Exists(Server.MapPath("/AnnouncmentImages/" + fileName)))
                        {

                            File.Delete(Server.MapPath("/AnnouncmentImages/" + fileName));
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/AnnouncmentImages/" + fileName));




                    }

                    announcment.AnnouncmentPicture = fileName;

                    Session["dtAnnouncments"] = announcment;


                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cAnnouncment.AddNewAnnouncment(announcment);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        //unit.UnitID = Convert.ToInt32(Request.QueryString["id"]);
                        //success = ClassLibrary_PropertyManager.Controller.cUnit.UpdateUnit(unit);
                        //divMsgSuccess.Visible = true;
                    }

                    ddlBuilding.SelectedIndex = 0;
             
                    txtAnnouncment.Text = "";
              


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
                    announcment = null;

                }
            }



        }
    }
}