<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewTenants.aspx.cs" Inherits="Nyumbani_Landlords.ViewTenants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $('[id*=GridView1]').prepend($("<thead ></thead>").append($(this).find("tr:first"))).DataTable({
                "responsive": true,
                "sPaginationType": "full_numbers",
                "bPaginate": true,
                "bSort": true,
                "iDisplayLength": 10,
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

                        <!-- /.tool Tip -->
                        <div class="example-alert" id="div1" style="margin-bottom: 2rem; display:grid" visible="true" runat="server">
                            <div class="card-header">
                                <h3 class="card-title">Manage Tenants </h3>
                            </div>
                            <div class="alert alert-fill alert-warning alert-icon" style="background-color: white; height: 4.5rem">
                                <div>
                                    <a style="float: right;" href="#" class="btn btn-outline-primary">Add new tenant</a>
                                </div>
                                <div>
                                    <a href="#" style="float: right; margin-right: 1rem;" class="btn btn-outline btn-primary"><em class="icon ni ni-setting"></em><span>Export CSV</span> </a>
                                </div>  

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
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" class="table table-striped table-bordered ">
                                <Columns>

                                    <asp:HyperLinkField DataNavigateUrlFields="TenantID" HeaderText="Update"
                                        DataNavigateUrlFormatString="AddUpdateTenant.aspx?id={0}"
                                        Text="Edit" NavigateUrl="AddUpdateTenant.aspx" ItemStyle-Width="15%" />

                                    <asp:TemplateField HeaderText="Picture " ItemStyle-HorizontalAlign="left" ItemStyle-Width="25%">
                                        <ItemTemplate>
                                            <img src='<%# "TenantImages" + "\\" + Eval("TenantPicture") %>' style="margin-bottom: 0.4rem; border-radius: 50%; object-fit: cover; flex: none;" width="65" height="65" />
                                            <span class="user-name" style="margin-left: 0.5rem; font-size: 1rem;">
                                                <strong></strong><%# Eval("TenantName")%>

                                            </span>
                                            <br />

                                        </ItemTemplate>

                                    </asp:TemplateField>


                                    <%--   <asp:BoundField HeaderText="National ID" DataField="TenantNationalID" />--%>

                                    <asp:TemplateField HeaderText="Contact Info" ItemStyle-Width="25%">
                                        <ItemTemplate>


                                            <strong class="user-name" style="font-size: 1rem; padding-right: 3px;"><em class="icon ni ni-mail"></em></strong><a href='<%# Eval("TenantEmail")%>'><%# Eval("TenantEmail")%> </a>
                                            <br />
                                            <strong class="user-name" style="font-size: 1rem;  padding-right: 3px;"><em class="icon ni ni-call-fill"></em></strong><%# Eval("TenantPhone")%>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Address" ItemStyle-Width="13%">
                                        <ItemTemplate>


                                            <strong class="user-name" style="font-size: 1rem;"><em class="icon ni ni-map-pin-fill"></em></strong><%# Eval("TenantHomeAddress")%>
                                            <%--       <br />
                                            <strong class="user-name" style="font-size: 1rem;"> <em class="icon ni ni-call-fill"></em>Since : </strong><%# Eval("TenantPhone")%>--%>
                                        </ItemTemplate>

                                    </asp:TemplateField>






                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="12%">
                                        <ItemTemplate>
                                           <a href="Editor.aspx"> <%# ShowUnitStatus(Eval("Status").ToString()) %></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <EmptyDataTemplate>No Tenant info found</EmptyDataTemplate>

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
