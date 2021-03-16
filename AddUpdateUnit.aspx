<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="AddUpdateUnit.aspx.cs" Inherits="Nyumbani_Landlords.AddUpdateUnit" %>

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
                                    <h4 class="title nk-block-title">Manage Unit</h4>
                                    <div class="nk-block-des">
                                    </div>
                                </div>

                                <%--  Alerts--%>
                                <div class="example-alert" id="divMsgSuccess" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Unit information saved</strong> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while adding unit information.
                     
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-inner">
                                    <div class="form-validate is-alter">
                                        <div class="row g-gs">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtxname">Building </label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtname" name="txtname" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtbuildingtype">Unit Type</label>
                                                    <div class="form-control-wrap ">
                                                        <select class="form-control form-select" id="txtbuildingtype" name="txtbuildingtype" data-placeholder="Select a option" runat="server" required>
                                                            <option label="empty" value=""></option>
                                                            <option value="txtApartment">Bungalow</option>
                                                            <option value="txtHotel">Mansionette</option>
                                                            <option value="txtStorage">Hotel Unit</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtdate">Unit Price </label>
                                                    <div class="form-control-wrap">

                                                        <input type="number" id="Text5" class="form-control form-control" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtcity">Unit Number</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtcity" name="txtcity" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtaddress">Floor Level</label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txtaddress" runat="server" name="txtaddress" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txttotals">Unit Size</label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txttotals" name="txttotals" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtcontractor">Address</label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" class="form-control" id="txtcontractor" name="txtcontractor" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtdate">City </label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" id="txtdate" class="form-control date-picker" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtdate">Desctiption </label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" id="Text1" class="form-control" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtdate">Bedrooms </label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="Number1" name="txttotals" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtdate">Bathrooms </label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="Number2" name="txttotals" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtdate">Kitchen </label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="Number3" name="txttotals" runat="server" required>
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
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Ammenities</label>
                                                    <ul class="custom-control-group g-3 align-center">
                                                        <li>
                                                            <asp:CheckBox ID="txtparking" Width="16px" runat="server" />
                                                            <label for="txtparking">Garage</label>

                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="txtsecurity" Width="16px" runat="server" />
                                                            <label for="txtsecurity">Furnsihing</label>

                                                        </li>


                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">

                                                    <asp:Button ID="btnSubmit" runat="server" Text="Save Information" class="btn btn-lg btn-primary" />
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
