<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="ViewUnits.aspx.cs" Inherits="Nyumbani_Landlords.ViewUnits" %>

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
                        <h1>Unit List</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="./Dashboard.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Unit List</li>
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
                                <h3 class="card-title">Manage Units </h3>
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

                                    <div class="nk-block-des">
                                    </div>
                                </div>
                            </div>
                            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false" ClientIDMode="Static" class="table table-striped table-bordered ">
                                <Columns>

                                    <asp:HyperLinkField DataNavigateUrlFields="UnitID" HeaderText="Update"
                                        DataNavigateUrlFormatString="AddUpdateUnit.aspx?id={0}"
                                        Text="Edit" NavigateUrl="AddUpdateUnit.aspx" />

                                    <asp:BoundField HeaderText="Type" DataField="UnitType" />

                                    <asp:BoundField HeaderText="Unit" DataField="UnitNumber" />



                                    <asp:TemplateField HeaderText="Unit Info">
                                        <ItemTemplate>
                                        
                                            <strong>Floor : </strong><%# Eval("FloorLevel")%>
                                            <br />
                                            <strong>Size : </strong><%# Eval("UnitSize")%>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                   
                          
                              
                                     <asp:TemplateField HeaderText="Unit Address">
                                        <ItemTemplate>
                                            <strong>Address :</strong> <%# Eval("UnitAddress")%>
                                            <br />
                                            <strong>City: </strong><%# Eval("UnitCity")%>
                                           
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                       <%--<asp:BoundField HeaderText="Description" DataField="Description" />--%>

                                       <asp:TemplateField HeaderText="Unit Metrics">
                                        <ItemTemplate>
                                            <strong>Bathroom :</strong> <%# Eval("Bathrooms")%>
                                            <br />
                                            <strong>Kitchen : </strong><%# Eval("Kitchen")%>
                                            <br />
                                            <strong>Bedroom : </strong><%# Eval("Bedrooms")%>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                                                
                                    <asp:BoundField HeaderText="Added on" DataField="UnitAddedOn" />  
                                    
                                    
                                       <asp:TemplateField HeaderText="Ammenities">
                                        <ItemTemplate>
                                            <strong>Garage :</strong> <%# Eval("Garage")%>
                                            <br />
                                            <strong>Furnishing : </strong><%# Eval("Furnishing")%>
                                        
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                   
                                    <asp:BoundField HeaderText="Available" DataField="Available" />



                                    <%--  <asp:TemplateField HeaderText="Picture ">
                           <ItemTemplate>
                              <img src='<%# ResolveUrl(global_asax.gShowMenuPicturesFiles + "\\" + Eval("MenuPicture")) %>' width="100" height="100" />
                              </ItemTemplate>
                     </asp:TemplateField>--%>



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
