<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="AddAnnouncment.aspx.cs" Inherits="Nyumbani_Landlords.AddAnnouncment" %>
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
                                    <h4 class="title nk-block-title">Make Announcment</h4>   
                                    <div class="nk-block-des">
                                    </div>
                                </div>

                                <%--  Alerts--%>
                                <div class="example-alert" id="divMsgSuccess" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Announcement sent</strong> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while submitting announcment
                     
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-inner">
                                    <div class="form-validate is-alter">
                                        <div class="row g-gs">

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="ddlBuilding">Building </label>
                                                    <div class="form-control-wrap">
                                                        <asp:DropDownList ID="ddlBuilding" runat="server" CssClass="form-control  form-select" Enabled="true">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                        
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtDeposit">Message</label>
                                                    <div class="form-control-wrap">
                                                   <asp:TextBox runat="server" Cssclass="form-control" ID="txtAnnouncment" TextMode="MultiLine" Rows="6"  name="txtAnnouncment"  placeholder="e.g Expected water shortage on Monday 17th" />

                                                        </div>
                                                </div>
                                            </div>

                 


                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="customFile">Attatchment</label>
                                                    <div class="custom-file">
                                                        <asp:FileUpload CssClass="custom-file-input" ID="UploadImage" runat="server" />
                                                        <label class="custom-file-label" for="UploadImage">Choose file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:Image ID="imgDisplayPicture" Visible="false" runat="server" Style="padding-left: 15px" Height="100px" Width="120px" />

                                            <div class="col-md-12">
                                                <div class="form-group">

                                                    <asp:Button ID="btnSubmit" runat="server" Text="Send Announcment" class="btn btn-lg btn-primary" onClick="btnSubmit_Click" />
                                               
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
