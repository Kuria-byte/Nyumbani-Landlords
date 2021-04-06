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


        public static string SendTenantInvoice(string sTenantName, string sBillType, string sAmount, string sUpload, string sDueDate, string sNotes )
        {


            string emailFormat = "<p>Hi " + sTenantName + " ,</p>" +
               "<p> Thank you for using Nyumbani Property Management System </p>" +
              "<p> Here's your latest " + sBillType + " bill </p>" +
               "<p> Your Total Bill for this month is" + sAmount + " Kes, due on " + sDueDate + "  </p>" +
               "<p> Custom note" + sNotes + " </p>" +
               "<p> Kindly clear your bill to avoid interruptions </p>" +

              "<p> If you have already cleared this bill, please ignore this request.You are welcome to reply to this email with any questions or feedback you might have.</p>" +
              
              "<p> Best regards,</p>" +
              "<p> Nyumbani Team </p>" +
              "<p> -------------------<br/>" +
              "Nyumbani <br/>" +
              "<br/> http:www.nyumbani.com </p>";


            return emailFormat;




        }
    }
}



 //" < td class= 'py-5' >"
 
 //                                                           " < table class= "email-header" >"
  
 //                                                                 < tbody >
  
 //                                                                     < tr >
  
 //                                                                         < td class= "text-center pb-4" >
   
 //                                                                              < a href = "#" >< img class= "email-logo" src = "./images/logo-dark2x.png" alt = "logo" ></ a >
           
 //                                                                                      < p class= "email-title" > Conceptual Base Modern Dashboard Theme</p>
 //                                                                       </td>
 //                                                                   </tr>
 //                                                               </tbody>
 //                                                           </table>
 //                                                           <table class= "email-body" >
 //                                                               < tbody >
 //                                                                   < tr >
 //                                                                       < td class= "p-3 p-sm-5" >
 
 //                                                                            < p >< strong > Hi Ishtiyak,</ strong ></ p >
      
 //                                                                                 < p > We are pleased to have you as a member of Dashlite Family.</p>
 //                                                                           <p>Your account is now verified and you can purchase tokens for the ICO. Also you can submit your documents for the KYC from my Account page.</p>
 //                                                                           <p>Hope you'll enjoy the experience, we're here if you have any questions, drop us a line at <a href="mailto:info@yourwebsite.com">info@yourwebsite.com</a> anytime. </p>
 //                                                                       </td>
 //                                                                   </tr>
 //                                                               </tbody>
 //                                                           </table>
 //                                                           <table class= "email-footer" >
 //                                                               < tbody >
 //                                                                   < tr >
 //                                                                       < td class= "text-center pt-4" >
 
 //                                                                            < p class= "email-copyright-text" > Copyright © 2020 DashLite.All rights reserved. <br> Template Made By <a href="https://themeforest.net/user/softnio/portfolio">Softnio</a>.</p>
 //                                                                           <ul class= "email-social" >
 //                                                                               < li >< a href = "#" >< img src = "./images/socials/facebook.png" alt = "" ></ a ></ li >
         
 //                                                                                        < li >< a href = "#" >< img src = "./images/socials/twitter.png" alt = "" ></ a ></ li >
                  
 //                                                                                                 < li >< a href = "#" >< img src = "./images/socials/youtube.png" alt = "" ></ a ></ li >
                           
 //                                                                                                          < li >< a href = "#" >< img src = "./images/socials/medium.png" alt = "" ></ a ></ li >
                                    
 //                                                                                                               </ ul >
                                    
 //                                                                                                               < p class= "fs-12px pt-4" > This email was sent to you as a registered member of <a href="https://softnio.com">softnio.com</a>. To update your emails preferences <a href="#">click here</a>.</p>
 //                                                                       </td>
 //                                                                   </tr>
 //                                                               </tbody>
 //                                                           </table>
 //                                                       </td>