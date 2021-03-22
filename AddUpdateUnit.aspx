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
                                                        <asp:DropDownList ID="ddlBuildings" runat="server" CssClass="form-control  form-select" Enabled="true"></asp:DropDownList>
                                                    </div>


                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtbuildingtype">Unit Type</label>
                                                    <div class="form-control-wrap ">
                                                        <asp:DropDownList ID="ddlUnitTypes" runat="server"  CssClass="form-control  form-select" Enabled="true" >
                                                           <asp:ListItem Value="0">Select Unit Type </asp:ListItem>
                                                            <asp:ListItem>Bungalow </asp:ListItem>
                                                            <asp:ListItem>Mansionette</asp:ListItem>
                                                             <asp:ListItem>Detatched</asp:ListItem>
                                                            <asp:ListItem>Studio</asp:ListItem>
                                                            <asp:ListItem>Apartment Unit</asp:ListItem>
                                                            <asp:ListItem>Hotel Unit</asp:ListItem>
                                                            <asp:ListItem>Storage Unit</asp:ListItem>
                                                        </asp:DropDownList>
                                                      
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtPrice">Unit Price </label>
                                                    <div class="form-control-wrap">

                                                        <input type="number" id="txtPrice" class="form-control form-control" runat="server" placeholder="Rental Price for Unit" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtUnitNumber">Unit Number</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtUnitNumber" name="txtUnitNumber" runat="server" placeholder="F29 -15 " required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtFloorLevel">Floor Level</label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txtFloorLevel" runat="server" name="txtaddress" placeholder="Unit Floor Level" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtUnitSize">Unit Area (ft)</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtUnitSize" name="txtUnitSize" runat="server" placeholder="Unit area in feet" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtUnitAddress">Address</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="txtUnitAddress" name="txtAddress" placeholder="Unit Address" runat="server" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtCity">City </label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" id="txtCity" class="form-control" runat="server" placeholder="City" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtDescription">Desctiption </label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" id="txtDescription" class="form-control" runat="server" placeholder="A short description about the unit" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtBedrooms">Bedrooms </label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txtBedrooms" name="txtBedrooms" runat="server" placeholder="Number of bedrooms" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtBathrooms">Bathrooms </label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txtBathrooms" name="txtBathrooms" runat="server"  placeholder="Number of bathrooms" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label" for="txtKitchen">Kitchen </label>
                                                    <div class="form-control-wrap">
                                                        <input type="number" class="form-control" id="txtKitchen" name="txtKitchen" runat="server" placeholder="Number of kitchens" required>
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
                                              <asp:Image ID="imgDisplayPicture" Visible="false" runat="server" style="padding-left: 15px" Height="100px" Width="120px" />
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Ammenities</label>
                                                    <ul class="custom-control-group g-3 align-center">
                                                        <li>
                                                            <asp:CheckBox ID="txtGarage" Width="16px" runat="server" />
                                                            <label for="txtparking">Garage</label>

                                                        </li>
                                                        <li>
                                                            <asp:CheckBox ID="txtFurnsihing" Width="16px" runat="server" />
                                                            <label for="txtsecurity">Furnsihing</label>

                                                        </li>
                                                           <li>
                                                            <asp:CheckBox ID="txtAvailable" Width="16px" runat="server" />
                                                            <label for="txtAvailable">Available</label>

                                                        </li>


                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">

                                                    <asp:Button ID="btnSubmit" runat="server" Text="Save Information" class="btn btn-lg btn-primary" OnClick="btnSubmit_Click" />
                                                       <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="false" class="btn btn-lg btn-danger" />
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
