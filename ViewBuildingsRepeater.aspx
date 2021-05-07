<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewBuildingsRepeater.aspx.cs" Inherits="Nyumbani_Landlords.ViewBuildingsRepeater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Tenant List</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="./Dashboard.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Tenannt List</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <!-- /.tool Tip -->
                        <div class="example" id="div1" style="margin-bottom: 2rem;" visible="true" runat="server">
                            <div class="card-header">
                                <h3 class="card-title">Manage Buildings </h3>
                            </div>
                            <div class="alert alert-fill alert-warning alert-icon" style="background-color: white; height: 4.5rem">

                                <%-- <a style="float: left;" href="#" class="btn btn-outline-primary">Add new building</a>--%>
                                <a href="#" style="float: right; margin-right: 1rem;" class="btn btn-outline btn-primary"><em class="icon ni ni-property-add"></em><span>Add new building</span> </a>


                            </div>
                        </div>

                        <div class="card">


                            <!-- /.card-header -->
                            <div class="card-body" style="margin-top: -2.5rem">


                                <%--  Alerts--%>
                                <div class="example-alert" id="divMsgSuccess" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Tenant information saved</strong>> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while adding tenant information.
                     
                                    </div>
                                </div>



                            </div>

                            <div class="nk-block-head">
                                <div class="nk-block-head-content" style="padding-left: 10px;">
                                    <%--       <h4 class="nk-block-title">Buildings</h4>--%>
                                    <div class="nk-block-des">
                                    </div>
                                </div>
                            </div>
                            <div class="row g-gs">

                                <span id="spnCustomerRecords" visible="false" runat="server" class="btn btn-default" style="width: 100%; height: 40px; margin-bottom: 10px; text-align: left; color: black">No building records found</span>

                                <asp:Repeater ID="Repeater2" runat="server">


                                    <ItemTemplate>




                                        <div class="col-sm-6 col-lg-4 col-xxl-3">
                                            <div class="card">

                                                <div class="card-inner">
                                                    <div class="team">
                                                       <%-- <div class="team-status bg-success text-white"><em class="icon ni ni-check-thick"></em></div>--%>
                                                        <div class="team-options">
                                                            <div class="drodown">
                                                                <a href="#" class="dropdown-toggle btn btn-sm btn-icon btn-trigger" data-toggle="dropdown"><em class="icon ni ni-more-h"></em></a>
                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                    <ul class="link-list-opt no-bdr">
                                                                        <li><a href="#"><em class="icon ni ni-focus"></em><span>Manage</span></a></li>
                                                                        <li><a href="#"><em class="icon ni ni-trash"></em><span>Delete</span></a></li>
                     
                                                                      
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="user-card user-card-s2">
                                                            <div class="user-avatar md bg-primary">
                                                            <%--    <span>IK</span>--%>
                                                                <em class="icon ni ni-building" style="font-size:2rem;"></em>
                                                                <div class="status dot dot-lg dot-success"></div>
                                                            </div>
                                                            <div class="user-info">
                                                                <h6><%# DataBinder.Eval(Container.DataItem, "BuildingName") %></h6>
                                                                <span class="sub-text"><%# DataBinder.Eval(Container.DataItem, "BuildingType") %></span>
                                                            </div>
                                                        </div>
                                                        <div class="team-details">
                                                            <p><%# DataBinder.Eval(Container.DataItem, "BuildingAddress") %></p>
                                                        </div>
                                                        <ul class="team-statistics">
                                                            <li><span>200,000</span><span>Revenue</span></li>
                                                            <li><span>18</span><span>Empty</span></li>
                                                            <li><span>587</span><span>Tenants</span></li>
                                                        </ul>
                                                        <div class="team-view">
                                                            <a href="AddUpdateBuilding.aspx?id=<%# DataBinder.Eval(Container.DataItem, "BuildingID") %>"   class="btn btn-block btn-dim btn-primary"><span>Update Building</span></a>
                                                        </div>
                                                    </div>
                                                    <!-- .team -->
                                                </div>
                                                <!-- .card-inner -->
                                            </div>
                                            <!-- .card -->
                                        </div>
                                        <!-- .col -->

                                    </ItemTemplate>

                                    https://localhost:44330/AddUpdateBuilding?id=1
                          


                                </asp:Repeater>


                                <%--                            <h2 class="lead"><b>   <%# DataBinder.Eval(Container.DataItem, "BuildingName") %></b></h2>
                                            <p class="text-muted text-sm"><b>Total Orders: <%# DataBinder.Eval(Container.DataItem, "BuildingCity") %> </b> </p>--%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</asp:Content>
