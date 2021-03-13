<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewBuildings.aspx.cs" Inherits="Nyumbani_Landlords.ViewBuildings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $('[id*=GridView1]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                "responsive": true,
                "sPaginationType": "full_numbers"
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Menu List</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="./Dashboard.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Restaurant Menu List</li>
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
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Manage Buildings </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">

                                <%--  Alerts--%>
                                <div class="example-alert" id="divMsgSuccess" visible="false" runat="server">
                                    <div class="alert alert-fill alert-success alert-icon">
                                        <em class="icon ni ni-check-circle"></em><strong>Building information saved</strong>> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while adding building information.
                     
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
                            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" class="table table-striped table-bordered ">
                                <Columns>

                                    <asp:HyperLinkField DataNavigateUrlFields="BuildingID" HeaderText="Update"
                                        DataNavigateUrlFormatString="AddUpdateBuilding.aspx?id={0}"
                                        Text="Edit" NavigateUrl="AddUpdateBuilding.aspx" />

                                    <asp:BoundField HeaderText="Type" DataField="BuildingType" />
                                    <%-- <asp:BoundField HeaderText="Restaurant" DataField="RestaurantName" />--%>
                                    <asp:BoundField HeaderText="Name" DataField="BuildingName" />
                                    <asp:BoundField HeaderText="City" DataField="BuildingCity" />
                                    <asp:BoundField HeaderText="Total" DataField="TotalUnits" />
                                    <asp:BoundField HeaderText="Contractor" DataField="Contractor" />
                                    <asp:BoundField HeaderText="Completed" DataField="CompletionDate" />



                                    <%--  <asp:TemplateField HeaderText="Picture ">
                           <ItemTemplate>
                              <img src='<%# ResolveUrl(global_asax.gShowMenuPicturesFiles + "\\" + Eval("MenuPicture")) %>' width="100" height="100" />
                              </ItemTemplate>
                     </asp:TemplateField>--%>





                                    <asp:BoundField HeaderText="Status" DataField="IsActive" />



                                </Columns>
                                <EmptyDataTemplate>No Menu items found</EmptyDataTemplate>
                                <%--<table class="datatable-init nowrap nk-tb-list is-separate" data-auto-responsive="false">--%>
                                <%--  <thead>
                            <tr class="nk-tb-item nk-tb-head">
                                <th class="nk-tb-col nk-tb-col-check">
                                    <div class="custom-control custom-control-sm custom-checkbox notext">
                                        <input type="checkbox" class="custom-control-input" id="puid">
                                        <label class="custom-control-label" for="puid"></label>
                                    </div>
                                </th>
                                <th class="nk-tb-col tb-col-sm"><span>Name</span></th>
                                <th class="nk-tb-col"><span>SKU</span></th>
                                <th class="nk-tb-col"><span>Price</span></th>
                                <th class="nk-tb-col"><span>Stock</span></th>
                                <th class="nk-tb-col tb-col-md"><span>Category</span></th>
                                <th class="nk-tb-col tb-col-md"><em class="tb-asterisk icon ni ni-star-round"></em></th>
                                <th class="nk-tb-col nk-tb-col-tools">
                                   
                                </th>
                            </tr>
                            <!-- .nk-tb-item -->
                        </thead>
                        <tbody>
                            <tr class="nk-tb-item">
                                <td class="nk-tb-col nk-tb-col-check">
                                    <div class="custom-control custom-control-sm custom-checkbox notext">
                                        <input type="checkbox" class="custom-control-input" id="puid1">
                                        <label class="custom-control-label" for="puid1"></label>
                                    </div>
                                </td>
                                <td class="nk-tb-col tb-col-sm">
                                    <span class="tb-product">
                                        <img src="./images/product/a.png" alt="" class="thumb">
                                        <span class="title">Pink Fitness Tracker</span>
                                    </span>
                                </td>
                                <td class="nk-tb-col">
                                    <span class="tb-sub">UY3749</span>
                                </td>
                                <td class="nk-tb-col">
                                    <span class="tb-lead">$ 99.49</span>
                                </td>
                                <td class="nk-tb-col">
                                    <span class="tb-sub">49</span>
                                </td>
                                <td class="nk-tb-col tb-col-md">
                                    <span class="tb-sub">Fitbit, Tracker</span>
                                </td>
                                <td class="nk-tb-col tb-col-md">
                                    <div class="asterisk tb-asterisk">
                                        <a href="#"><em class="asterisk-off icon ni ni-star"></em><em class="asterisk-on icon ni ni-star-fill"></em></a>
                                    </div>
                                </td>
                                <td class="nk-tb-col nk-tb-col-tools">
                                    <ul class="nk-tb-actions gx-1 my-n1">
                                        <li class="mr-n1">
                                            <div class="dropdown">
                                                <a href="#" class="dropdown-toggle btn btn-icon btn-trigger" data-toggle="dropdown"><em class="icon ni ni-more-h"></em></a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <ul class="link-list-opt no-bdr">
                                                        <li><a href="#"><em class="icon ni ni-edit"></em><span>Edit Product</span></a></li>
                                                        <li><a href="#"><em class="icon ni ni-eye"></em><span>View Product</span></a></li>
                                                        <li><a href="#"><em class="icon ni ni-activity-round"></em><span>Product Orders</span></a></li>
                                                        <li><a href="#"><em class="icon ni ni-trash"></em><span>Remove Product</span></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </td>
                            </tr>

                        </tbody>--%>
                            </asp:GridView>
                            <%--     </div>--%>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->


                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>




</asp:Content>
