<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="AddUpdateTenant.aspx.cs" Inherits="Nyumbani_Landlords.AddUpdateTenant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- content @s -->
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
                                        <div class="row g-gs">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtTenantName">Full Names </label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" id="txtTenantName" class="form-control form-control" runat="server" placeholder="Tenant's Name" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtbuildingtype">Occupation</label>
                                                    <div class="form-control-wrap ">
                                                        <asp:DropDownList ID="ddlOccupation" runat="server" CssClass="form-control  form-select" Enabled="true">
                                                            <asp:ListItem Value="0">Select occupation </asp:ListItem>
                                                            <asp:ListItem>Student </asp:ListItem>
                                                            <asp:ListItem>Employed</asp:ListItem>
                                                            <asp:ListItem>Employee</asp:ListItem>
                                                            <asp:ListItem>Retired</asp:ListItem>

                                                        </asp:DropDownList>

                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtNationalID">National ID</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtNationalID" name="txtUnitSize" runat="server" placeholder="34201440" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtTenantEmail">Email</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtTenantEmail" name="txtUnitNumber" runat="server" placeholder="example@gmail.com" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtPhone">Phone</label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txtPhone" runat="server" name="txtaddress" placeholder="0722-123-456" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtAddress">Current Address</label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" id="txtAddress" class="form-control" runat="server" placeholder="Nairobi" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtCompany">Organisation</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtCompany" name="txtCompany" placeholder="Safaricom" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>






                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="customFile">Pictures</label>
                                                    <div class="custom-file">
                                                        <asp:FileUpload CssClass="custom-file-input" ID="UploadImage" runat="server" />
                                                        <label class="custom-file-label" for="UploadImage">Choose file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:Image ID="imgDisplayPicture" Visible="false" runat="server" Style="padding-left: 15px" Height="100px" Width="120px" />

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Status</label>
                                                    <ul class="custom-control-group g-3 align-center">
                                                        <li>
                                                            <asp:CheckBox ID="txtStatus" Width="16px" runat="server" />
                                                            <label for="txtStatus">Available</label>

                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">

                                                    <asp:Button ID="btnSubmit" runat="server" Text="Save Information" class="btn btn-lg btn-success" OnClick="btnSubmit_Click" />
                                                    <%--  <button id="btnLoading" class="btn btn-lg btn-primary" type="button" disabled  style="visibility:hidden " runat="server">
                                                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                                        <span>Loading... </span>
                                                    </button>--%>
                                                    <asp:Button ID="btnContract" runat="server" Text="Manage contract" Visible="false" class="btn btn-lg btn-primary" />

<%--                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Style="float: right" Visible="false" class="btn btn-lg btn-danger" />--%>

                                                    <span  class="btn btn-lg btn-danger" Style="float: right">
                                                         <em class="icon ni ni-trash"></em>
                                                    </span>
                                                 





                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- .nk-block -->
                    </div>
                    <!-- .components-preview -->
                </div>
            </div>
        </div>
    </div>
    <!-- content @e -->


</asp:Content>
