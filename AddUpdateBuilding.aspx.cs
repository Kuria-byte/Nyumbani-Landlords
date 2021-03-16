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
    public partial class AddUpdateBuilding : System.Web.UI.Page
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mBuilding building = new ClassLibrary_PropertyManager.Model.mBuilding();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);
               
                try
                {


                    int success = 0;

                    building.BuildingType = txtbuildingtype.Items[txtbuildingtype.SelectedIndex].Text;
                    building.LandLordID = landlordId;
                    building.BuildingName = txtname.Value.Trim();
                    building.BuildingCity = txtcity.Value.Trim();
                    building.BuildingAddress = txtaddress.Value.Trim();
                    building.TotalUnits = Convert.ToInt32(txttotals.Value);
                    building.Contractor = txtcontractor.Value.Trim();
                    building.CompletionDate = Convert.ToDateTime(txtdate.Value).Date;
                    building.Parking =  txtparking.Checked;
                    building.Security = txtsecurity.Checked;
                    building.KidFriendly = txtkid.Checked;
                    building.IsActive = true;
        


                    if (UploadImage.HasFile)
                    {
                        fileName = building.BuildingID.ToString() + "-" + building.BuildingName + "-" + UploadImage.FileName.Trim();

                        if (File.Exists(Server.MapPath("/BuildingImages" + fileName)))
                        {
                            
                            File.Delete(Server.MapPath("/BuildingImages" + fileName));
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/BuildingImages" + fileName));
                        //DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + fileName;



                    }

                    building.BuildingImage  = fileName;

                    //Session["dtBuildings"] = building;


                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cBuilding.AddBuilding(building);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        building.BuildingID = Convert.ToInt32(Request.QueryString["id"]);
                        success = ClassLibrary_PropertyManager.Controller.cBuilding.UpdateBuildig(building);
                        divMsgSuccess.Visible = true;
                    }


                    txtbuildingtype.SelectedIndex = 0;
                    txtname.Value = "";
                    txtcity.Value = "";
                    txtaddress.Value = "";
                    txttotals.Value = "";
                    txtdate.Value = "";
                    txtcontractor.Value = "";
                    txtparking.Checked = false;
                    txtsecurity.Checked = false;
                    txtkid.Checked = false;
                  
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
                    building = null;

                }
            }

        }

        private void LoadDataOnUpdate()
        {

            string id = Request.QueryString["id"].Trim();

            btnSubmit.Text = "Update";
            DataTable dtRestaurant = (DataTable)Session["dtBuildings"];
            foreach (DataRow dr in dtRestaurant.Rows)
            {
                if (dr["BuildingID"].ToString() == id)
                {

                
                    txtname.Value = dr["BuildingName"].ToString();
                    txtbuildingtype.Value = dr["BuildingType"].ToString();
                   txtcity.Value  = dr["BuildingCity"].ToString();
                    txtaddress.Value = dr["BuildingAddress"].ToString();
                    txttotals.Value = dr["TotalUnits"].ToString();
                    txtcontractor.Value = dr["Contractor"].ToString();
                    txtdate.Value = dr["CompletionDate"].ToString();

                    fileName = dr["BuildingImage"].ToString();

                    //DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + dr["MenuPicture"].ToString();
                    //RequiredFieldValidator8.Enabled = false;

                    txtparking.Checked = Convert.ToBoolean(dr["Parking"].ToString());
                    txtsecurity.Checked = Convert.ToBoolean(dr["Security"].ToString());
                    txtkid.Checked = Convert.ToBoolean(dr["KidFriendly"].ToString());
                    break;
                }
            }

        }

    }
}