<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="AddUpdateBuilding.aspx.cs" Inherits="Nyumbani_Landlords.AddUpdateBuilding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- content @s -->
    <div class="nk-content ">
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
                                <div class="nk-block-head-sub"><a class="back-to" href="html/components.html"><em class="icon ni ni-arrow-left"></em><span>Home</span></a></div>

                                <div class="nk-block-head-content">
                                    <h4 class="title nk-block-title">Manage Building</h4>
                                    <div class="nk-block-des">
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-inner">
                                    <form action="#" class="form-validate is-alter">
                                        <div class="row g-gs">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-full-name">Building Name</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="fva-full-name" name="fva-full-name" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-topics">Type</label>
                                                    <div class="form-control-wrap ">
                                                        <select class="form-control form-select" id="fva-topics" name="fva-topics" data-placeholder="Select a option" required>
                                                            <option label="empty" value=""></option>
                                                            <option value="fva-gq">General Question</option>
                                                            <option value="fva-tq">Tachnical Question</option>
                                                            <option value="fva-ab">Account &amp; Billing</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-email">City</label>
                                                    <div class="form-control-wrap">
                                                        <input type="email" class="form-control" id="fva-email" name="fva-email" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-subject">Address</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="fva-subject" name="fva-subject" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-subject">Total Units</label>
                                                    <div class="form-control-wrap">
                                                        <input type="text" class="form-control" id="fva-subjec" name="fva-subject" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-subject">Contractor</label>
                                                    <div class="form-control-wrap">

                                                        <input type="text" class="form-control" id="fva-subje" name="fva-subject" required>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-message">Completion Year</label>
                                                    <div class="form-control-wrap">
                                                        <div class="form-icon form-icon-left">
                                                            <em class="icon ni ni-calendar"></em>
                                                        </div>
                                                        <input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="fva-message">Picture</label>
                                                    <div class="custom-file">
                                                        <input type="file" multiple class="custom-file-input" id="customFile">
                                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Ammenities</label>
                                                    <ul class="custom-control-group g-3 align-center">
                                                        <li>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="fva-com" id="fva-com-email" required>
                                                                <label class="custom-control-label" for="fva-com-email">Parking</label>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="fva-com" id="fva-com-sm" required>
                                                                <label class="custom-control-label" for="fva-com-sms">Security</label>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="fva-com" id="fva-com-sms" required>
                                                                <label class="custom-control-label" for="fva-com-sms">Kid Friendly</label>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-lg btn-primary">Save Informations</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
