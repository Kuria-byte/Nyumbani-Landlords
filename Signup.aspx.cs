using Nyumbani_Landlords.EmailTemplates;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nyumbani_Landlords
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      
          
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
    
                ClassLibrary_PropertyManager.Model.mLandLords landLord = new ClassLibrary_PropertyManager.Model.mLandLords();

                try
                {


                    int success = 0;

                    landLord.LandLordName = txtName.Text.Trim();
                    landLord.LandLordEmail = txtEmail.Text.Trim();
                    landLord.LandLordPassword = ClassLibrary_PropertyManager.UtilityClasses.ucEDOperations.EncryptString(ClassLibrary_PropertyManager.Global.gEDKey, txtPassword.Text.Trim());
                    landLord.LandLordPicture = "";
                    landLord.IsEmailVerified = false;
                    landLord.IsActive = false;



                    success = ClassLibrary_PropertyManager.Controller.cLandLords.AddNewLandLord(landLord);

                    if (success > 0)
                    {
                        string sVerificationURL = "https://" + ClassLibrary_PropertyManager.Global.gWebDomain + "/Login.aspx?lid=" + ClassLibrary_PropertyManager.UtilityClasses.ucEDOperations.EncryptString(ClassLibrary_PropertyManager.Global.gEDKey, Convert.ToString(success));

                        string strEmailMessage = clEmailTemplates.SendEmailOnSignup(txtName.Text.Trim(), txtEmail.Text.Trim(), sVerificationURL);

                        ClassLibrary_PropertyManager.UtilityClasses.ucEmailManagement.SendEmailOnSignup(txtEmail.Text.Trim(), strEmailMessage);

                        SuccessMsg.Visible = false;
                        InfoMsg.Visible = true;
                        email.InnerHtml = txtEmail.Text.Trim();
                        //EmailAlreadyExists.Visible = false;
                        ErrorMsg.Visible = false;


                    }

                    else if (success == -1)
                    {
                        SuccessMsg.Visible = false;
                        InfoMsg.Visible = false;
                        //EmailAlreadyExists.Visible = true;
                        ErrorMsg.Visible = false;

                    }
                    else
                    {

                    }

                }

                catch (Exception ex)
                {
                    using (StreamWriter sw = new StreamWriter(Global.ErrorFilePath, true))
                    { // If file exists, text will be appended ; otherwise a new file will be created
                        sw.Write(string.Format("Message: {0}<br />{1}StackTrace :{2}{1}Date :{3}{1}-----------------------------------------------------------------------------{1}", ex.Message, Environment.NewLine, ex.StackTrace, DateTime.Now.ToString()));
                    }
                    SuccessMsg.Visible = false;
                    //EmailAlreadyExists.Visible = false;
                    ErrorMsg.Visible = true;
                }
                finally

                {
                    landLord = null;

                }
            }

        }

    }
    }
