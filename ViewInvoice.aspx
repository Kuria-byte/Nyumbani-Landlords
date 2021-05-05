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
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Manage Invoice </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">

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
                                               <asp:TemplateField HeaderText="Tenant Info">
                                        <ItemTemplate>

                                            <strong>Email : </strong><%# Eval("TenantName")%>
                                            <br />
                                            <strong>Phone : </strong><%# Eval("TenantPhone")%>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:BoundField HeaderText="Amount Due" DataField="InvoiceAmount" DataFormatString="{0:C}" />

                         
                                    <asp:BoundField HeaderText="Due Date" DataField="InvoiceDueDate" DataFormatString="{0:dd-MM-yyyy}" />
                                     <asp:BoundField HeaderText="Status" DataField="InvoiceStatus"  />

                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>

                                            <asp:Button ID="btnReady" runat="server" class="btn btn-success" Style="max-width:6.8rem;  text-align:center; height: 50px; margin-right: -7rem" ClientIDMode="Static" Text="Paid"  />
                                        </ItemTemplate>
                                    </asp:TemplateField>



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
