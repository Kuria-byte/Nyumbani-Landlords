<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewAnnouncment.aspx.cs" Inherits="Nyumbani_Landlords.ViewAnnouncment" %>

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
                                <h3 class="card-title">Announcments </h3>
                            </div>
                            <div class="alert alert-fill alert-warning alert-icon" style="background-color: white; height: 4.5rem">

                                <%-- <a style="float: left;" href="#" class="btn btn-outline-primary">Add new building</a>--%>
                                <a href="#" style="float: right; margin-right: 1rem;" class="btn btn-outline btn-primary"><em class="icon ni ni-bell"></em><span>Add new</span> </a>


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


                            <span id="spnCustomerRecords" visible="false" runat="server" class="btn btn-default" style="width: 100%; height: 40px; margin-bottom: 10px; text-align: left; color: black">No building records found</span>

                            <asp:Repeater ID="Repeater2" runat="server">


                                <ItemTemplate>

                                  
                                    <div id="accordion" class="accordion">


                                        <div class="accordion-item">
                                            <span class="accordion-head collapsed" data-toggle="collapse" data-target="<%#"accordion-item-"+DataBinder.Eval(Container.DataItem, "AnnouncmentID") %>">
                                                <h6 class="title"><%# DataBinder.Eval(Container.DataItem, "AnnouncmentHeader") %></h6>
                                                <span class="accordion-icon"></span>
                                            </span>
                                            <div class="accordion-body collapse show" id="<%# "accordion-item-"+ DataBinder.Eval(Container.DataItem, "AnnouncmentID") %>" data-parent="#accordion">
                                                <div class="accordion-inner">
                                                    <p><%# DataBinder.Eval(Container.DataItem, "AnnouncmentBody") %></p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <%--    <div class="accordion-item">
                                        <a href="#" class="accordion-head collapsed" data-toggle="collapse" data-target="#accordion-item-3">
                                            <h6 class="title">What is the relationship </h6>
                                            <span class="accordion-icon"></span>
                                        </a>
                                        <div class="accordion-body collapse" id="accordion-item-3" data-parent="#accordion">
                                            <div class="accordion-inner">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                            </div>
                                        </div>
                                    </div>--%>
                                </ItemTemplate>






                            </asp:Repeater>


                            <%--                            <h2 class="lead"><b>   <%# DataBinder.Eval(Container.DataItem, "BuildingName") %></b></h2>
                           
                                
                                <p class="text-muted text-sm"><b>Total Orders: <%# DataBinder.Eval(Container.DataItem, "BuildingCity") %> </b> </p>--%>
                        </div>
                        
                    </div>
                </div>
            </div>
            


        </section>
        <!-- /.content -->
    </div>
    
    <!-- /.content-wrapper -->
</asp:Content>
