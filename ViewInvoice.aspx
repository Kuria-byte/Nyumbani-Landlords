<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewInvoice.aspx.cs" Inherits="Nyumbani_Landlords.ViewInvoice" %>

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
                        <h1>Invoice List</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="./Dashboard.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Invoice List</li>
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
                                <h3 class="card-title">Manage Invoices </h3>
                            </div>
                            <div class="alert alert-fill alert-warning alert-icon" style="background-color: white; height: 4.5rem">
                                <%--   <div>
                                        <a style="float: right;" href="#" class="btn btn-outline-primary">Add new contract</a>
                                    </div>--%>
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
                                        <em class="icon ni ni-check-circle"></em><strong>Invoice information saved</strong>> successfully
                                    </div>
                                </div>
                                <div class="example-alert" id="divMsgError" visible="false" runat="server">
                                    <div class="alert alert-fill alert-warning alert-icon">
                                        <em class="icon ni ni-alert-circle"></em><strong>Oops!</strong> error occured while adding invoice information.
                     
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

                                    <asp:HyperLinkField DataNavigateUrlFields="InvoiceID" HeaderText="ID"
                                        DataNavigateUrlFormatString="GenerateInvoice.aspx?id={0}"
                                        DataTextField="InvoiceID" NavigateUrl="GenerateInvoice.aspx" />

                                    <asp:BoundField HeaderText="Invoice " DataField="InvoiceType" />


                                    <asp:TemplateField HeaderText="Tenant " ItemStyle-HorizontalAlign="left" ItemStyle-Width="20%">
                                        <ItemTemplate>
                                            <img src='<%# "TenantImages" + "\\" + Eval("TenantPicture") %>' style="margin-bottom: 0.4rem; border-radius: 50%; object-fit: cover; flex: none;" width="65" height="65" />
                                            <span class="user-name" style="margin-left: 0.5rem; font-size: 1rem;">
                                                <strong></strong><%# Eval("TenantName")%>

                                            </span>
                                            <br />

                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Payment Info" ItemStyle-Width="25%">
                                        <ItemTemplate>


                                            <strong class="user-name" style="font-size: 1rem; padding-right: 3px;"><em class="icon ni ni-coin"></em> Due:</strong>   <%# String.Format("{0:C}",  Eval("InvoiceAmount"))%> </a>
                                            <br />
                                            <strong class="user-name" style="font-size: 1rem; padding-right: 3px;"><em class="icon ni ni-money"></em> Paid: </strong><%#String.Format("{0:C}", Eval("AmountPaid"))%>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                   


                     

                                       <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="12%">
                                        <ItemTemplate>
                                            <%# ShowDate( Convert.ToDateTime(Eval("InvoiceDueDate"))) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="12%">
                                        <ItemTemplate>
                                            <%# ShowStatus(Eval("InvoiceStatus").ToString()) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <%--  <asp:TemplateField HeaderText="">
                                        <ItemTemplate>

                                            <asp:Button ID="btnReady" runat="server" class="btn btn-success" Style="max-width: 6.8rem; text-align: center; height: 50px; margin-right: -7rem" ClientIDMode="Static" Text="Paid" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                                <EmptyDataTemplate>No items found</EmptyDataTemplate>

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
