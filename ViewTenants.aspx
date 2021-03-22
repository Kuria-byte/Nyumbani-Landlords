<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewTenants.aspx.cs" Inherits="Nyumbani_Landlords.ViewTenants" %>

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
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Manage Tenants </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">

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
                            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" class="table table-striped table-bordered ">
                                <Columns>

                                    <asp:HyperLinkField DataNavigateUrlFields="TenantID" HeaderText="Update"
                                        DataNavigateUrlFormatString="AddUpdateTenant.aspx?id={0}"
                                        Text="Edit" NavigateUrl="AddUpdateTenant.aspx" />

                                    <asp:TemplateField HeaderText="Picture ">
                                        <ItemTemplate>
                                            <img src='<%# "TenantImages" + "\\" + Eval("TenantPicture") %>' width="100" height="100" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField HeaderText="Name" DataField="TenantName" />

                                    <asp:BoundField HeaderText="National ID" DataField="TenantNationalID" />

                                    <asp:TemplateField HeaderText="Contact Info">
                                        <ItemTemplate>

                                            <strong>Email : </strong><%# Eval("TenantEmail")%>
                                            <br />
                                            <strong>Phone : </strong><%# Eval("TenantPhone")%>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Previous Address" DataField="TenantHomeAddress" />

                                    <asp:TemplateField HeaderText="Work Info">
                                        <ItemTemplate>

                                            <strong>Occupation : </strong><%# Eval("TenantOccupation")%>
                                            <br />
                                            <strong>Company : </strong><%# Eval("TenantCompany")%>
                                        </ItemTemplate>

                                    </asp:TemplateField>


                                    <asp:BoundField HeaderText="Added On" DataField="TenantAddedOn" />



                                    <%--  <asp:TemplateField HeaderText="Picture ">
                           <ItemTemplate>
                              <img src='<%# ResolveUrl(global_asax.gShowMenuPicturesFiles + "\\" + Eval("MenuPicture")) %>' width="100" height="100" />
                              </ItemTemplate>
                     </asp:TemplateField>--%>

                                    <asp:BoundField HeaderText="Status" DataField="Status" />



                                </Columns>
                                <EmptyDataTemplate>No Menu items found</EmptyDataTemplate>

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
