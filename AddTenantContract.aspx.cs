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
    public partial class AddTenantContract : System.Web.UI.Page
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
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {
                    LoadTenants(landlordId);
                    LoadUnits(landlordId);

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
        private void LoadUnits(int _LandLordID)
        {
            DataTable dtUnits = new DataTable();

            dtUnits = ClassLibrary_PropertyManager.Controller.cUnit.GetUnitByLandLordID(_LandLordID);

            ddlUnit.Items.Clear();
            if (dtUnits.Rows.Count > 0)
            {
                ddlUnit.Enabled = true;
                foreach (DataRow row in dtUnits.Rows)
                {
                    ddlUnit.Items.Add(new ListItem() { Text = row["BuildingName"].ToString() + "-" + row["UnitType"].ToString() + "-" + row["UnitNumber"].ToString() + "-" + row["UnitAddress"].ToString(), Value = row["UnitID"].ToString() });
                }
            }
            else
            {
                ddlTenant.Enabled = false;
            }

            ddlUnit.Items.Insert(0, new ListItem("Select Unit", "0"));
            dtUnits = null;

        }

        private void LoadDataOnUpdate()
        {

            string id = Request.QueryString["id"].Trim();

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            DataTable dtUnit = (DataTable)Session["dtUnits"];
            foreach (DataRow dr in dtUnit.Rows)
            {
                if (dr["UnitID"].ToString() == id)
                {

                    //ddlBuildings.SelectedValue = dr["BuildingID"].ToString();
                    //ddlUnitTypes.SelectedValue = dr["UnitType"].ToString();
                    //txtPrice.Value = dr["UnitPrice"].ToString();
                    //txtUnitNumber.Value = dr["UnitNumber"].ToString();
                    //txtFloorLevel.Value = dr["FloorLevel"].ToString();
                    //txtUnitSize.Value = dr["UnitSize"].ToString();
                    //txtUnitAddress.Value = dr["UnitAddress"].ToString();
                    //txtCity.Value = dr["UnitCity"].ToString();
                    //txtDescription.Value = dr["Description"].ToString();
                    //txtBedrooms.Value = dr["Bedrooms"].ToString();
                    //txtBathrooms.Value = dr["Bathrooms"].ToString();
                    //txtKitchen.Value = dr["Kitchen"].ToString();

                    //fileName = dr["UnitPictures"].ToString();

                    ////DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + dr["MenuPicture"].ToString();
                    ////RequiredFieldValidator8.Enabled = false;

                    //txtGarage.Checked = Convert.ToBoolean(dr["Garage"].ToString());
                    //txtFurnsihing.Checked = Convert.ToBoolean(dr["Furnishing"].ToString());
                    //txtAvailable.Checked = Convert.ToBoolean(dr["Available"].ToString());

                    break;
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                ClassLibrary_PropertyManager.Model.mTenantContract contract = new ClassLibrary_PropertyManager.Model.mTenantContract();
                int landlordId = Convert.ToInt32(Session["LandLordID"]);

                try
                {


                    int success = 0;
                    contract.TenantID = Convert.ToInt32(ddlTenant.SelectedValue);
                    contract.UnitID = Convert.ToInt32(ddlUnit.SelectedValue);
                    contract.LandLordID = landlordId;
                    contract.TenantDeposit = Convert.ToDouble(txtDeposit.Value.Trim());
                    contract.TenantMonthlyRent = Convert.ToDouble(txtRent.Value.Trim());

                    contract.ContractStartDate = Convert.ToDateTime(txtStart.Value);
                    contract.ContractEndDate = Convert.ToDateTime(txtEnd.Value);
                    contract.ContractStatusID = txtStatus.Checked;




                    if (UploadImage.HasFile)
                    {
                        fileName = contract.TenantID.ToString() + "-" + contract.UnitID + "-" + UploadImage.FileName.Trim();

                        if (File.Exists(Server.MapPath("/ContractImages" + fileName)))
                        {

                            File.Delete(Server.MapPath("/ContractImages" + fileName));
                            Console.WriteLine("File deleted.");
                        }
                        UploadImage.SaveAs(Server.MapPath("/ContractImages" + fileName));
                        //DispalyMenuPicture.ImageUrl = Global.gShowMenuPicturesFiles + fileName;



                    }

                    contract.AgreementDocoument = fileName;

               


                    if (btnSubmit.Text != "Update")
                    {
                        success = ClassLibrary_PropertyManager.Controller.cTenantContract.AddNewContract(contract);
                        divMsgSuccess.Visible = true;

                    }
                    else
                    {
                        //unit.UnitID = Convert.ToInt32(Request.QueryString["id"]);
                        //success = ClassLibrary_PropertyManager.Controller.cUnit.UpdateUnit(unit);
                        //divMsgSuccess.Visible = true;
                    }

                    //ddlBuildings.SelectedIndex = 0;
                    //ddlUnitTypes.SelectedIndex = 0;
                    //txtPrice.Value = "";
                    //txtUnitNumber.Value = "";
                    //txtUnitAddress.Value = "";
                    //txtFloorLevel.Value = "";
                    //txtUnitSize.Value = "";
                    //txtCity.Value = "";
                    //txtDescription.Value = "";
                    //txtDescription.Value = "";
                    //txtBedrooms.Value = "";
                    //txtBathrooms.Value = "";
                    //txtKitchen.Value = "";
                    //txtGarage.Checked = false;
                    //txtFurnsihing.Checked = false;
                    //txtAvailable.Checked = false;



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
                    contract = null;

                }
            }

        }
    }
}