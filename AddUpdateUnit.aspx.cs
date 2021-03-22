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
    public partial class AddUpdateUnit : System.Web.UI.Page
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



        private void LoadBuildings(int _LandLordID)
        {
            DataTable dtBuilding = new DataTable();

            dtBuilding = ClassLibrary_PropertyManager.Controller.cBuilding.GetBuildingByLandLordID(_LandLordID);

            ddlBuildings.Items.Clear();
            if (dtBuilding.Rows.Count > 0)
            {
                ddlBuildings.Enabled = true;
                foreach (DataRow row in dtBuilding.Rows)
                {
                    ddlBuildings.Items.Add(new ListItem() { Text = row["BuildingName"].ToString() + "-" + row["BuildingCity"].ToString(), Value = row["BuildingID"].ToString() });
                }
            }
            else
            {
                ddlBuildings.Enabled = false;
            }

            ddlBuildings.Items.Insert(0, new ListItem("Select Building", "0"));
            dtBuilding = null;

        }

        private void LoadDataOnUpdate()
        {

            string id = Request.QueryString["id"].Trim();

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            imgDisplayPicture.Visible = true;

            DataTable dtUnit = (DataTable)Session["dtUnits"];
            foreach (DataRow dr in dtUnit.Rows)
            {
                if (dr["UnitID"].ToString() == id)
                {

                    ddlBuildings.SelectedValue = dr["BuildingID"].ToString();
                    ddlUnitTypes.SelectedValue = dr["UnitType"].ToString();
                    txtPrice.Value = dr["UnitPrice"].ToString();
                    txtUnitNumber.Value = dr["UnitNumber"].ToString();
                    txtFloorLevel.Value = dr["FloorLevel"].ToString();
                    txtUnitSize.Value = dr["UnitSize"].ToString();
                    txtUnitAddress.Value = dr["UnitAddress"].ToString();
                    txtCity.Value = dr["UnitCity"].ToString();
                    txtDescription.Value = dr["Description"].ToString();
                    txtBedrooms.Value = dr["Bedrooms"].ToString();
                    txtBathrooms.Value = dr["Bathrooms"].ToString();
                    txtKitchen.Value = dr["Kitchen"].ToString();

                    fileName = dr["UnitPictures"].ToString();

                    imgDisplayPicture.ImageUrl = "/UnitImages/" + dr["UnitPictures"].ToString();

                    txtGarage.Checked = Convert.ToBoolean(dr["Garage"].ToString());
                    txtFurnsihing.Checked = Convert.ToBoolean(dr["Furnishing"].ToString());
                    txtAvailable.Checked = Convert.ToBoolean(dr["Available"].ToString());

                    break;
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mUnit unit = new ClassLibrary_PropertyManager.Model.mUnit();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);
              
                try
                {


                    int success = 0;
                    unit.BuildingID = Convert.ToInt32(ddlBuildings.SelectedValue);
                    unit.UnitType = ddlUnitTypes.SelectedItem.ToString();
                    unit.LandLordID = landlordId;
                    unit.UnitPrice = Convert.ToDouble(txtPrice.Value.Trim());
                    unit.UnitNumber = txtUnitNumber.Value.Trim();
                    unit.FloorLevel = Convert.ToInt32(txtFloorLevel.Value.Trim());
                    unit.UnitSize = txtUnitSize.Value.Trim();
                    unit.UnitAddress = txtUnitAddress.Value.Trim();
                    unit.UnitCity = txtCity.Value.Trim();
                    unit.Description = txtDescription.Value;
                    unit.Bedrooms = Convert.ToInt32(txtBedrooms.Value);
                    unit.Kitchen = Convert.ToInt32(txtKitchen.Value);
                    unit.Bathrooms = Convert.ToInt32(txtBathrooms.Value);
                    unit.Available = txtAvailable.Checked;
                    unit.Garage = txtGarage.Checked;
                    unit.Furnishing = txtFurnsihing.Checked;




                    if (UploadImage.HasFile)
                    {
                        fileName = unit.UnitNumber.ToString() + "-" + unit.UnitType + "-" + UploadImage.FileName.Trim();

                        if (File.Exists(Server.MapPath("/UnitImages/" + fileName)))
                        {

                            File.Delete(Server.MapPath("/UnitImages/" + fileName));
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/UnitImages/" + fileName));
            



                    }

                    unit.UnitPictures = fileName;

                    Session["dtunits"] = unit;


                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cUnit.AddUnit(unit);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        unit.UnitID = Convert.ToInt32(Request.QueryString["id"]);
                        success = ClassLibrary_PropertyManager.Controller.cUnit.UpdateUnit(unit);
                        divMsgSuccess.Visible = true;
                    }

                    ddlBuildings.SelectedIndex = 0;
                    ddlUnitTypes.SelectedIndex = 0;
                    txtPrice.Value = "";
                    txtUnitNumber.Value = "";
                    txtUnitAddress.Value = "";
                    txtFloorLevel.Value = "";
                    txtUnitSize.Value = "";
                    txtCity.Value = "";
                    txtDescription.Value = "";
                    txtDescription.Value = "";
                    txtBedrooms.Value = "";
                    txtBathrooms.Value = "";
                    txtKitchen.Value = "";
                    txtGarage.Checked = false;
                    txtFurnsihing.Checked = false;
                    txtAvailable.Checked = false;
                     
            

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
                    unit = null;

                }
            }

        }
    }
}