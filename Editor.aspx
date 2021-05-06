<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="Nyumbani_Landlords.Editor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="nk-content" style="padding-top: 50px">
        <div class="container-fluid">
            <div class="nk-content-inner">
                <div class="nk-content-body">
                    <div class="components-preview wide-md mx-auto">
                        <div class="nk-block-head nk-block-head-lg wide-sm">
                            <div class="nk-block-head-content">
                            </div>
                        </div>

                        <!-- .nk-block -->
                        <div class="nk-block nk-block-lg">
                            <div class="nk-block-head">
                                <div class="nk-block-head-sub"><a class="back-to" href="/"><em class="icon ni ni-arrow-left"></em><span>Home</span></a></div>

                                <div class="nk-block-head-content">
                                    <h4 class="title nk-block-title">Manage Tenant</h4>
                                    <div class="nk-block-des">
                                    </div>
                                </div>

                                <%--  Alerts--%>
                                <div class="example-alert" id="divMsgSuccess" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Tenant information saved</strong> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while adding tenant information.
                     
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-inner">
                                    <div class="form-validate is-alter">
                                        <%-- <div class="row g-gs">--%>




                                        <ul class="nav nav-tabs">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#tabItem5"><em class="icon ni ni-user"></em><span>Personal</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tabItem6"><em class="icon ni ni-lock-alt"></em><span>Contact</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tabItem7"><em class="icon ni ni-bell"></em><span>Info</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tabItem8"><em class="icon ni ni-link"></em><span>Finish</span></a>
                                            </li>
                                        </ul>





                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tabItem5">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtTenantName">Full Names </label>
                                                        <div class="form-control-wrap">

                                                            <input type="text" id="txtTenantName" class="form-control form-control" runat="server" placeholder="Tenant's Name" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <br />

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtNationalID">National ID</label>
                                                        <div class="form-control-wrap">
                                                            <input type="text" class="form-control" id="txtNationalID" name="txtUnitSize" runat="server" placeholder="34201440" required>
                                                        </div>
                                                    </div>
                                                </div>


                                                <br />
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtNationalID">Password</label>
                                                        <div class="form-control-wrap">
                                                            <input type="text" class="form-control" id="Text1" name="txtUnitSize" runat="server" placeholder="*********" disabled>
                                                        </div>
                                                    </div>
                                                </div>

                                                <br />

                                                <asp:Button ID="btnDelete" data-toggle="tab" href="#tabItem6" Style="margin-left: 1rem" runat="server" Text="Next" Visible="true" class="btn btn-lg btn-primary nav-link" />
                                            </div>

                                            <div class="tab-pane" id="tabItem6">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtCompany">Organisation</label>
                                                        <div class="form-control-wrap">
                                                            <input type="text" class="form-control" id="txtCompany" name="txtCompany" placeholder="Safaricom" runat="server" required>
                                                        </div>
                                                    </div>
                                                </div>


                                                <br />


                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtTenantEmail">Email</label>
                                                        <div class="form-control-wrap">
                                                            <input type="text" class="form-control" id="txtTenantEmail" name="txtUnitNumber" runat="server" placeholder="example@gmail.com" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <br />
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtPhone">Phone</label>
                                                        <div class="form-control-wrap">
                                                            <input type="number" class="form-control" id="txtPhone" runat="server" name="txtaddress" placeholder="0722-123-456" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtAddress">Current Address</label>
                                                        <div class="form-control-wrap">

                                                            <input type="text" id="txtAddress" class="form-control" runat="server" placeholder="Nairobi" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="tab-pane" id="tabItem7">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtPhone">Contracts</label>
                                                        <div class="form-control-wrap">
                                                            <input type="number" class="form-control" id="Number1" runat="server" name="txtaddress" placeholder="0722-123-456" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtPhone">Status</label>
                                                        <div class="form-control-wrap">
                                                            <input type="number" class="form-control" id="Number2" runat="server" name="txtaddress" placeholder="0722-123-456" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="txtPhone">Bills</label>
                                                        <div class="form-control-wrap">
                                                            <input type="number" class="form-control" id="Number3" runat="server" name="txtaddress" placeholder="0722-123-456" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                            </div>




                                            <div class="tab-pane" id="tabItem8">

                                                <table class="email-body text-center" ">
                                                    <tbody>
                                                        <tr>
                                                            <td class="px-3 px-sm-5 pt-3 pt-sm-5 pb-4">
                                                                <img class="w-100px" src="./images/email/kyc-progress.png" alt="In Process">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="px-3 px-sm-5 pb-3 pb-sm-5">
                                                                <h5 class="text-primary mb-3">Save the information.</h5>
                                                                <p>Please make sure to save your current information before proceeding. </p>
                                                            </td>

                                                        </tr>

                                                    </tbody>
                                                </table>


                                                <asp:Button ID="Button1" data-toggle="tab" href="#tabItem6" Style="margin-left: 2rem; margin-bottom: 1rem;" runat="server" Text="Save Information" Visible="true" class="btn btn-lg btn-primary nav-link" />



<%--                                                <asp:Button ID="Button2" data-toggle="tab" href="#tabItem6" Style="margin-left: 1rem; margin-bottom: 1rem;" runat="server" Text="Delete Record" Visible="true" class="btn btn-lg btn-danger nav-link" />--%>



                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>




                    </div>

                </div>
            </div>
        </div>
    </div>



</asp:Content>
