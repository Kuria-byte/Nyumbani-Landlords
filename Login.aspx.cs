using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nyumbani_Landlords
{
    public partial class Login : System.Web.UI.Page
    {
        string strLID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Session.RemoveAll();
                try
                {
                    if (Request.QueryString["lid"] != null)
                    {

                        strLID = ClassLibrary_PropertyManager.UtilityClasses.ucEDOperations.DecryptString(ClassLibrary_PropertyManager.Global.gEDKey, Convert.ToString(Request.QueryString["lid"].Replace(" ", "+")));
                        int iSuccess = ClassLibrary_PropertyManager.Controller.cLandLords.UpdateLandlordrFromEmail(Convert.ToInt32(strLID));

                        if (iSuccess > 0)
                        {
                            SuccessMsg.Visible = true;
                            InfoMsg.Visible = false;
                            WarningMsg.Visible = false;
                            ErrorMsg.Visible = false;
                        }
                        else
                        {
                            SuccessMsg.Visible = false;
                            InfoMsg.Visible = false;
                            WarningMsg2.Visible = true;
                            ErrorMsg.Visible = false;
                        }


                    }
                }
                catch (Exception ex)
                {
                    using (StreamWriter sw = new StreamWriter(Global.ErrorFilePath, true))
                    { // If file exists, text will be appended ; otherwise a new file will be created
                        sw.Write(string.Format("Message: {0}<br />{1}StackTrace :{2}{1}Date :{3}{1}-----------------------------------------------------------------------------{1}", ex.Message, Environment.NewLine, ex.StackTrace, DateTime.Now.ToString()));
                    }
                    SuccessMsg.Visible = false;
                    InfoMsg.Visible = false;
                    WarningMsg.Visible = false;
                    ErrorMsg.Visible = true;
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
               
                try
                {
                    ClassLibrary_PropertyManager.Model.mLandLords collectmLandLords = new ClassLibrary_PropertyManager.Model.mLandLords();

                    string strPassword = ClassLibrary_PropertyManager.UtilityClasses.ucEDOperations.EncryptString(ClassLibrary_PropertyManager.Global.gEDKey, txtPassword.Text.Trim());
                    collectmLandLords = ClassLibrary_PropertyManager.Controller.cLandLords.VerifyLandLordInformation(txtEmail.Text.Trim(), strPassword);


                    if (collectmLandLords != null)
                    {
                        if (collectmLandLords.IsActive == false)
                        {
                            WarningMsg.Visible = true;
                        }
                        else
                        {
                            if (collectmLandLords.IsEmailVerified == false)
                            {
                                Response.Redirect("signup.aspx?lid=" + ClassLibrary_PropertyManager.Global.gLandLordInfo.LandLordIDEncrypted.ToString(), false);
                            }
                            else
                            {
                                Session["LandLordID"] = collectmLandLords.LandLordID;
                                Session["LandLordInfo"] = collectmLandLords;
                                Response.Redirect("Dashboard.aspx", false);
                            }
                        }
                    }
                    else
                    {
                        WarningMsg2.Visible = true;
                    }

                }
                catch (Exception ex)
                {
                    using (StreamWriter sw = new StreamWriter(Global.ErrorFilePath, true))
                    { // If file exists, text will be appended ; otherwise a new file will be created
                        sw.Write(string.Format("Message: {0}<br />{1}StackTrace :{2}{1}Date :{3}{1}-----------------------------------------------------------------------------{1}", ex.Message, Environment.NewLine, ex.StackTrace, DateTime.Now.ToString()));
                    }
                }
                finally
                {
                }
            }
        }
    }
}