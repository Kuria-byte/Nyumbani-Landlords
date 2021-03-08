<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Nyumbani_Landlords.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <meta charset="utf-8" />
    <meta name="author" content="Softnio" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="A powerful and conceptual app to manage your property." />
    <!-- Fav Icon  -->
    <link rel="shortcut icon" href="./images/favicon.png" />
    <!-- Page Title  -->
    <title>Login | Nyumbani</title>
    <!-- StyleSheets  -->
    <link rel="stylesheet" href="./assets/css/dashlite.css?ver=2.2.0" />
    <link id="skindefault" rel="stylesheet" href="./assets/css/theme.css?ver=2.2.0" />

</head>

<body>
  
     <div class="nk-app-root">
        <!-- main @s -->
        <div class="nk-main ">
            <!-- wrap @s -->
            <div class="nk-wrap nk-wrap-nosidebar">
                <!-- content @s -->
                <div class="nk-content ">
                    <div class="nk-split nk-split-page nk-split-md">
                        <div class="nk-split-content nk-block-area nk-block-area-column nk-auth-container bg-white w-lg-45">
                            <div class="absolute-top-right d-lg-none p-3 p-sm-5">
                                <a href="#" class="toggle btn btn-white btn-icon btn-light" data-target="athPromo"><em class="icon ni ni-info"></em></a>
                            </div>
                            <div class="nk-block nk-block-middle nk-auth-body">
                                <div class="brand-logo pb-5">
                                    <a href="html/index.html" class="logo-link">
                                        <img class="logo-light logo-img logo-img-lg" src="./images/logo.png" srcset="./images/logo2x.png 2x" alt="logo"/>
                                        <img class="logo-dark logo-img logo-img-lg" src="./images/logo-dark.png" srcset="./images/logo-dark2x.png 2x" alt="logo-dark"/>
                                    </a>
                                </div>
                                <div class="nk-block-head">
                                    <div class="nk-block-head-content">
                                        <h5 class="nk-block-title">Login</h5>
                                        <div class="nk-block-des">
                                            <p> Landlord Account</p>
                                        </div>
                                    </div>
                                </div>
                                <%--  Alerts--%>
                                <div class="example-alert" id="SuccessMsg" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Email Verified</strong>> You can now login 
                                    </div>
                                </div>
                                <div class="example-alert" id="InfoMsg" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Email sent to</strong> <span class="alert-link" id="email" runat="server" ></span> Please verify your email to complete the registration process.
                     
                                    </div>
                                </div>
                                <div class="example-alert" id="ErrorMsg" visible="false" runat="server">
                                    <div class="alert alert-fill alert-danger alert-icon">
                                        <em class="icon ni ni-cross-circle"></em><strong>Update failed</strong>! There is some technical issues.
                                    </div>
                                </div>
                                   <div class="example-alert" id="WarningMsg" visible="false" runat="server">
                                    <div class="alert alert-fill alert-danger alert-icon">
                                        <em class="icon ni ni-cross-circle"></em><strong>Login failed</strong>! There is account does not exist
                                    </div>
                                </div>
                                       <div class="example-alert" id="WarningMsg2" visible="false" runat="server">
                                    <div class="alert alert-fill alert-danger alert-icon">
                                        <em class="icon ni ni-cross-circle"></em><strong>Oops!</strong>You have provided wrong email or password.
                                    </div>
                                </div>


                                <!-- .nk-block-head -->
                                <form id="form1" action="#" method="post" runat="server">
                                   

                                    <div class="form-group">
                                        <label class="form-label" for="email">Email </label>
                                        <asp:TextBox ID="txtEmail" class="form-control form-control-lg" placeholder="Email" ValidationGroup="signup" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Enter Email"
                                        ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ValidationGroup="signup">    </asp:RequiredFieldValidator>

                                    <div class="form-group">
                                        <label class="form-label" for="password">Passcode</label>
                                        <div class="form-control-wrap">
                                            <a tabindex="-1" href="#" class="form-icon form-icon-right passcode-switch" data-target="txtPassword">
                                                <em class="passcode-icon icon-show icon ni ni-eye"></em>
                                                <em class="passcode-icon icon-hide icon ni ni-eye-off"></em>
                                            </a>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control form-control-lg" placeholder="Password" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="Please enter password"
                                        ControlToValidate="txtPassword" ValidationGroup="signup" SetFocusOnError="true" ForeColor="red"></asp:RequiredFieldValidator>


                                    <div class="form-group">
                                        <div class="custom-control custom-control-xs custom-checkbox">
                                            <input id="agreeTerms" type="checkbox" class="custom-control-input" />
                                            <label class="custom-control-label" for="agreeTerms">I agree to Nyumbani <a tabindex="-1" href="#">Privacy Policy</a> &amp; <a tabindex="-1" href="#">Terms.</a></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button type="submit" ID="btnSubmit" class="btn btn-lg btn-primary btn-block" runat="server" ValidationGroup="signup" Text="Login" OnClick="btnSubmit_Click" />
                                    </div>
                                </form>
                                <!-- form -->
                                <div class="form-note-s2 pt-4">
                                    Don't have an account ? <a href="signup.aspx"><strong>Sign up instead</strong></a>
                                </div>
                        
                            </div>
                            <!-- .nk-block -->
                            <div class="nk-block nk-auth-footer">
                                <div class="nk-block-between">
                                    <ul class="nav nav-sm">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Terms & Condition</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Privacy Policy</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Help</a>
                                        </li>
                                        <li class="nav-item dropup">
                                            <a class="dropdown-toggle dropdown-indicator has-indicator nav-link" data-toggle="dropdown" data-offset="0,10"><small>English</small></a>
                                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                <ul class="language-list">
                                                    <li>
                                                        <a href="#" class="language-item">
                                                            <img src="./images/flags/english.png" alt="" class="language-flag"/>
                                                            <span class="language-name">English</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="language-item">
                                                            <img src="./images/flags/spanish.png" alt="" class="language-flag"/>
                                                            <span class="language-name">Español</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="language-item">
                                                            <img src="./images/flags/french.png" alt="" class="language-flag"/>
                                                            <span class="language-name">Français</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="language-item">
                                                            <img src="./images/flags/turkey.png" alt="" class="language-flag"/>
                                                            <span class="language-name">Türkçe</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                    <!-- nav -->
                                </div>
                                <div class="mt-3">
                                    <p>&copy; 2021 Nyumbani. All Rights Reserved.</p>
                                </div>
                            </div>
                            <!-- nk-block -->
                        </div>
                        <!-- nk-split-content -->
                        <div class="nk-split-content nk-split-stretch bg-abstract"></div>
                        <!-- nk-split-content -->
                    </div>
                    <!-- nk-split -->
                </div>
                <!-- wrap @e -->
            </div>
            <!-- content @e -->
        </div>
        <!-- main @e -->
    </div>
    <script src="./assets/js/bundle.js?ver=2.2.0"></script>
    <script src="./assets/js/scripts.js?ver=2.2.0"></script>




</body>
</html>
