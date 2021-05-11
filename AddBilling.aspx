<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="AddBilling.aspx.cs" Inherits="Nyumbani_Landlords.AddBilling" %>
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
                                    <h4 class="title nk-block-title">Add Bills</h4>
                                    <div class="nk-block-des">
                                    </div>
                                </div>

                                <%--  Alerts--%>
                                <div class="example-alert" id="divMsgSuccess" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Billing information saved</strong> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while adding Billing information.
                     
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-inner">
                                    <div class="form-validate is-alter">
                                        <div class="row g-gs">

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtTenantName">Tenant </label>
                                                    <div class="form-control-wrap">
                                                        <asp:DropDownList ID="ddlTenant" runat="server" CssClass="form-control  form-select" Enabled="true">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtbuildingtype">Bill</label>
                                                    <div class="form-control-wrap ">
                                                        <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control  form-select" Enabled="true">
                                                            <asp:ListItem Value="0">Select Bill </asp:ListItem>
                                                            <asp:ListItem>Rent </asp:ListItem>
                                                            <asp:ListItem>Electricity</asp:ListItem>
                                                            <asp:ListItem>Water</asp:ListItem>
                                                            <asp:ListItem>Repairs</asp:ListItem>
                                                            <asp:ListItem>Management Fees</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtDeposit">Amount Due</label>
                                                    <div class="form-control-wrap">
                                                        <input type="Number" class="form-control" id="txtDeposit" name="txtDeposit" runat="server" placeholder="e.g Kes 30,000" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtRent">Recurrency</label>
                                                       <div class="form-control-wrap">
                                                        <asp:DropDownList ID="ddlBillOccurence" runat="server" CssClass="form-control  form-select" Enabled="true">
                                                            <asp:ListItem>Monthly </asp:ListItem>
                                                             <asp:ListItem>Quaterly </asp:ListItem>
                                                             <asp:ListItem>Semi-Annually </asp:ListItem>
                                                             <asp:ListItem>Annually </asp:ListItem>
                                                             <asp:ListItem>None </asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtStart">Due Date</label>
                                                    <div class="form-control-wrap">
                                                        <div class="form-icon form-icon-left">
                                                            <em class="icon ni ni-calendar"></em>
                                                        </div>
                                                        <input type="text" id="txtStart" class="form-control date-picker" runat="server" data-date-format="yyyy-mm-dd" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtEnd">Send Notification</label>
                                                    <div class="form-control-wrap">
                                                        <asp:DropDownList ID="ddlNotification" runat="server" CssClass="form-control  form-select" Enabled="true">
                                                             <asp:ListItem>Now </asp:ListItem>
                                                            <asp:ListItem>Monthly </asp:ListItem>
                                                             <asp:ListItem>None </asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                                <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtNotes">Notes</label>
                                                    <div class="form-control-wrap">
                                                        <asp:TextBox ID="txtNotes" CssClass="form-control" Style="width: 100%" TextMode="MultiLine" runat="server"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="customFile">Attatch Receipt</label>
                                                    <div class="custom-file">
                                                        <asp:FileUpload CssClass="custom-file-input" ID="UploadImage" runat="server" />
                                                        <label class="custom-file-label" for="UploadImage">Choose file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:Image ID="imgDisplayPicture" Visible="false" runat="server" Style="padding-left: 15px" Height="100px" Width="120px" />

                                        <%--    <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Status</label>
                                                    <ul class="custom-control-group g-3 align-center">
                                                        <li>
                                                            <asp:CheckBox ID="txtStatus" Width="16px" runat="server" />
                                                            <label for="txtStatus">Valid</label>

                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>--%>
                                            <div class="col-md-12">
                                                <div class="form-group">

                                                    <asp:Button ID="btnSubmit" runat="server" Text="Save Information" class="btn btn-lg btn-primary"/>
                                                    <asp:Button ID="btnDelete" runat="server" Text="Terminate " Visible="false" class="btn btn-lg btn-danger" />
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
