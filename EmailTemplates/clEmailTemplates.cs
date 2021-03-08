using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Nyumbani_Landlords.EmailTemplates
{
    public class clEmailTemplates
    {
        public static string SendEmailOnSignup(string sUserName, string sEmail, string sVerificationURL)
        {


            string emailFormat = "<p>Hi " + sUserName + ", </p>" +
               "<p> Thank you for creating a KMFoodScan Account.Please verify your email address '" + sEmail + "' to complete the registration process.</p>" +
              "<p> Verify now:" + sVerificationURL + " </p>" +
            "<p> If you did not create this account, please ignore this request.You are welcome to reply to this email with any questions or feedback you might have.</p>" +
              "<p> Best regards,</p>" +
              "<p> KMFoodScan Team </p>" +
              "<p> -------------------<br/>" +
              "KMFood Scan <br/>" +
              "<br/> www.kmfoodscan.com </p>";


            return emailFormat;




        }


        public static string SendEmailOnForgotPassword(string sEmail, string sVerificationURL)
        {


            string emailFormat = "<p>Hi,</p>" +
               "<p> Thank you for using  KMFoodScan " + sEmail + "</p>" +
              "<p> Please click the link " + sVerificationURL + " 'to change your password </p>" +
            "<p> If you did not create this account, please ignore this request.You are welcome to reply to this email with any questions or feedback you might have.</p>" +
              "<p> Best regards,</p>" +
              "<p> KMFoodScan Team </p>" +
              "<p> -------------------<br/>" +
              "KMFoodScan <br/>" +
              "<br/> http:www.kmfoodscan.com </p>";


            return emailFormat;




        }

    }
}