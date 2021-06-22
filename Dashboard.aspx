<%@ Page Title="" Language="C#" MasterPageFile="~/Nyumbani.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Nyumbani_Landlords.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="nk-content" style="padding-top:100px">
        <div class="container-fluid">
            <div class="nk-content-inner">
                <div class="nk-content-body">
                    <div class="nk-block-head nk-block-head-sm">
                        <div class="nk-block-between">
                            <div class="nk-block-head-content">
                                <h3 class="nk-block-title page-title">Dashboard</h3>
                            </div>
                            <!-- .nk-block-head-content -->
                            <div class="nk-block-head-content">
                                <div class="toggle-wrap nk-block-tools-toggle">
                                    <a href="#" class="btn btn-icon btn-trigger toggle-expand mr-n1" data-target="pageMenu"><em class="icon ni ni-more-v"></em></a>
                                    <div class="toggle-expand-content" data-content="pageMenu">
                                        <ul class="nk-block-tools g-3">
                                            <li>
                                                <div class="drodown">
                                                    <a href="#" class="dropdown-toggle btn btn-white btn-dim btn-outline-light" data-toggle="dropdown"><em class="d-none d-sm-inline icon ni ni-calender-date"></em><span><span class="d-none d-md-inline">Last</span> 30 Days</span><em class="dd-indc icon ni ni-chevron-right"></em></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <ul class="link-list-opt no-bdr">
                                                            <li><a href="#"><span>Last 30 Days</span></a></li>
                                                            <li><a href="#"><span>Last 6 Months</span></a></li>
                                                            <li><a href="#"><span>Last 1 Years</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="nk-block-tools-opt"><a href="#" class="btn btn-primary"><em class="icon ni ni-reports"></em><span>Reports</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- .nk-block-head-content -->
                        </div>
                        <!-- .nk-block-between -->
                    </div>
                    <!-- .nk-block-head -->
                    <div class="nk-block">
                        <div class="row g-gs">
                                        <!-- .col -->
                            <div class="col-xxl-3 col-sm-6">
                                <div class="card">
                                    <div class="nk-ecwg nk-ecwg6">
                                        <div class="card-inner">
                                            <div class="card-title-group">
                                                <div class="card-title">
                                                    <h6 class="title">Revenue</h6>
                                                </div>
                                            </div>
                                            <div class="data">
                                                <div class="data-group">
                                                    <div class="amount">Kes 650,000</div>
                                                     <div class="nk-ecwg6-ck" style="padding-bottom:3em; padding-left:1em; position:relative">
                                                        <em class="icon ni ni-coin" style=" font-size:70px";  ></em>
                                                    </div>
                                                </div>
                                                  <span class="change up text-danger"><em class="icon ni ni-arrow-long-up"></em>View More</span>
                                            </div>
                                          
                                        </div>
                                        <!-- .card-inner -->
                                    </div>
                                    <!-- .nk-ecwg -->
                                </div>
                                <!-- .card -->
                            </div>
                            <!-- .col -->
                                           <div class="col-xxl-3 col-sm-6">
                                <div class="card">
                                    <div class="nk-ecwg nk-ecwg6">
                                        <div class="card-inner">
                                            <div class="card-title-group">
                                                <div class="card-title">
                                                    <h6 class="title">Outstanding  </h6>
                                                </div>
                                            </div>
                                            <div class="data">
                                                <div class="data-group">
                                                    <div class="amount">Kes 23,485</div>
                                                     <div class="nk-ecwg6-ck" style="padding-bottom:3em; padding-left:1em; position:relative">
                                                        <em class="icon ni ni-info" style=" font-size:70px";  ></em>
                                                    </div>
                                                </div>
                                              <span class="change up text-danger"><em class="icon ni ni-arrow-long-up"></em>View More</span>

                                            </div>
                                        </div>
                                        <!-- .card-inner -->
                                    </div>
                                    <!-- .nk-ecwg -->
                                </div>
                                <!-- .card -->
                            </div>
                            <!-- .col -->
                            <div class="col-xxl-3 col-sm-6">
                                <div class="card">
                                    <div class="nk-ecwg nk-ecwg6">
                                        <div class="card-inner">
                                            <div class="card-title-group">
                                                <div class="card-title">
                                                    <h6 class="title">Total Tenants</h6>
                                                </div>
                                            </div>
                                            <div class="data">
                                                <div class="data-group">
                                                    <div class="amount">200</div>
                                                    <div class="nk-ecwg6-ck" style="padding-bottom:3em; padding-left:1em; position:relative">
                                                        <em class="icon ni ni-users" style=" font-size:70px";  ></em>
                                                    </div>
                                                </div>
                                                <span class="change up text-danger"><em class="icon ni ni-arrow-long-up"></em>View More</span>
                                            </div>
                                        </div>
                                        <!-- .card-inner -->
                                    </div>
                                    <!-- .nk-ecwg -->
                                </div>
                                <!-- .card -->
                            </div>
                            <!-- .col -->
                            <div class="col-xxl-3 col-sm-6">
                                <div class="card">
                                    <div class="nk-ecwg nk-ecwg6">
                                        <div class="card-inner">
                                            <div class="card-title-group">
                                                <div class="card-title">
                                                    <h6 class="title">Vacant units</h6>
                                                </div>
                                            </div>
                                            <div class="data">
                                                <div class="data-group">
                                                    <div class="amount">15</div>
                                                   <div class="nk-ecwg6-ck" style="padding-bottom:3em; padding-left:1em; position:relative">
                                                        <em class="icon ni ni-home-alt" style=" font-size:70px";  ></em>
                                                    </div>
                                                </div>
                                                 <span class="change up text-danger"><em class="icon ni ni-arrow-long-up"></em>View More</span>
                                            </div>
                                        </div>
                                        <!-- .card-inner -->
                                    </div>
                                    <!-- .nk-ecwg -->
                                </div>
                                <!-- .card -->
                            </div>
                
           
                            <div class="col-xxl-6">
                                <div class="card card-full">
                                    <div class="nk-ecwg nk-ecwg8 h-100">
                                        <div class="card-inner">
                                            <div class="card-title-group mb-3">
                                                <div class="card-title">
                                                    <h6 class="title">Revenue Statistics</h6>
                                                </div>
                                                <div class="card-tools">
                                                    <div class="dropdown">
                                                        <a href="#" class="dropdown-toggle link link-light link-sm dropdown-indicator" data-toggle="dropdown">Weekly</a>
                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                            <ul class="link-list-opt no-bdr">
                                                                <li><a href="#"><span>Daily</span></a></li>
                                                                <li><a href="#" class="active"><span>Weekly</span></a></li>
                                                                <li><a href="#"><span>Monthly</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="nk-ecwg8-legends">
                                                <li>
                                                    <div class="title">
                                                        <span class="dot dot-lg sq" data-bg="#6576ff"></span>
                                                        <span>Recieved Payment</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="title">
                                                        <span class="dot dot-lg sq" data-bg="#eb6459"></span>
                                                        <span>Pending Payment</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="nk-ecwg8-ck">
                                                <canvas class="ecommerce-line-chart-s4" id="salesStatistics"></canvas>
                                            </div>
                                            <div class="chart-label-group pl-5">
                                                <div class="chart-label">01 Jul, 2020</div>
                                                <div class="chart-label">30 Jul, 2020</div>
                                            </div>
                                        </div>
                                        <!-- .card-inner -->
                                    </div>
                                </div>
                                <!-- .card -->
                            </div>
                            <!-- .col -->
                            <div class="col-xxl-3 col-md-6">
                                <div class="card card-full overflow-hidden">
                                    <div class="nk-ecwg nk-ecwg7 h-100">
                                        <div class="card-inner flex-grow-1">
                                            <div class="card-title-group mb-4">
                                                <div class="card-title">
                                                    <h6 class="title">Unit Statistics</h6>
                                                </div>
                                            </div>
                                            <div class="nk-ecwg7-ck">
                                                <canvas class="ecommerce-doughnut-s1" id="orderStatistics"></canvas>
                                            </div>
                                            <ul class="nk-ecwg7-legends">
                                                <li>
                                                    <div class="title">
                                                        <span class="dot dot-lg sq" data-bg="#816bff"></span>
                                                        <span>Completed</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="title">
                                                        <span class="dot dot-lg sq" data-bg="#13c9f2"></span>
                                                        <span>Maintenance</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="title">
                                                        <span class="dot dot-lg sq" data-bg="#ff82b7"></span>
                                                        <span>Empty</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- .card-inner -->
                                    </div>
                                </div>
                                <!-- .card -->
                            </div>
                            <!-- .col -->
                            <div class="col-xxl-3 col-md-6">
                                <div class="card h-100">
                                    <div class="card-inner">
                                        <div class="card-title-group mb-2">
                                            <div class="card-title">
                                                <h6 class="title">User Statistics</h6>
                                            </div>
                                        </div>
                                        <ul class="nk-store-statistics">
                                            <li class="item">
                                                <div class="info">
                                                    <div class="title">Contract Valid</div>
                                                    <div class="count">5</div>
                                                </div>
                                                <em class="icon bg-primary-dim ni ni-bag"></em>
                                            </li>
                                            <li class="item">
                                                <div class="info">
                                                    <div class="title">Contract Expired</div>
                                                    <div class="count">2</div>
                                                </div>
                                                <em class="icon bg-info-dim ni ni-users"></em>
                                            </li>
                                            <li class="item">
                                                <div class="info">
                                                    <div class="title">User Complains</div>
                                                    <div class="count">1</div>
                                                </div>
                                                <em class="icon bg-pink-dim ni ni-box"></em>
                                            </li>
                                            <li class="item">
                                                <div class="info">
                                                    <div class="title">Payment Pending</div>
                                                    <div class="count">3</div>
                                                </div>
                                                <em class="icon bg-purple-dim ni ni-server"></em>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- .card-inner -->
                                </div>
                                <!-- .card -->
                            </div>
                            <!-- .col -->
                            <div class="col-xxl-12">
                                <div class="card card-full">
                                    <div class="card-inner">
                                        <div class="card-title-group">
                                            <div class="card-title">
                                                <h6 class="title">Recent payments</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="nk-tb-list mt-n2">
                                        <div class="nk-tb-item nk-tb-head">
                                            <div class="nk-tb-col"><span>Payment No.</span></div>
                                            <div class="nk-tb-col tb-col-sm"><span>Tenant</span></div>
                                            <div class="nk-tb-col tb-col-md"><span>Date</span></div>
                                            <div class="nk-tb-col"><span>Amount</span></div>
                                            <div class="nk-tb-col"><span class="d-none d-sm-inline">Status</span></div>
                                        </div>
                                        <div class="nk-tb-item">
                                            <div class="nk-tb-col">
                                                <span class="tb-lead"><a href="#">#95954</a></span>
                                            </div>
                                            <div class="nk-tb-col tb-col-sm">
                                                <div class="user-card">
                                                    <div class="user-avatar sm bg-warning-dim">
                                                        <img src="./TenantImages\Ian Kuria-34201440-ian.jpg" alt="">
                                                    </div>
                                                    <div class="user-name">
                                                        <span class="tb-lead">Ian Kuria</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="nk-tb-col tb-col-md">
                                                <span class="tb-sub">17/05/2021</span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="tb-sub tb-amount">4,596.75 <span>KES</span></span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="badge badge-dot badge-dot-xs badge-success">Paid</span>
                                            </div>
                                        </div>
                                        <div class="nk-tb-item">
                                            <div class="nk-tb-col">
                                                <span class="tb-lead"><a href="#">#95850</a></span>
                                            </div>
                                            <div class="nk-tb-col tb-col-sm">
                                                <div class="user-card">
                                                    <div class="user-avatar sm bg-azure-dim">
                                                        <span>BK</span>
                                                    </div>
                                                    <div class="user-name">
                                                        <span class="tb-lead">Brian Katela</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="nk-tb-col tb-col-md">
                                                <span class="tb-sub">02/02/2020</span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="tb-sub tb-amount">596.75 <span>KES</span></span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="badge badge-dot badge-dot-xs badge-danger">Canceled</span>
                                            </div>
                                        </div>
                                        <div class="nk-tb-item">
                                            <div class="nk-tb-col">
                                                <span class="tb-lead"><a href="#">#95812</a></span>
                                            </div>
                                            <div class="nk-tb-col tb-col-sm">
                                                <div class="user-card">
                                                    <div class="user-avatar sm bg-warning-dim">
                                                        <img src="./TenantImages\Romeo Kala-32015689-man.jpg" alt="">
                                                    </div>
                                                    <div class="user-name">
                                                        <span class="tb-lead">Romeo Kala</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="nk-tb-col tb-col-md">
                                                <span class="tb-sub">04/05/2021</span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="tb-sub tb-amount">3450.99 <span>KES</span></span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="badge badge-dot badge-dot-xs badge-success">Paid</span>
                                            </div>
                                        </div>
                                        <div class="nk-tb-item">
                                            <div class="nk-tb-col">
                                                <span class="tb-lead"><a href="#">#95256</a></span>
                                            </div>
                                            <div class="nk-tb-col tb-col-sm">
                                                <div class="user-card">
                                                    <div class="user-avatar sm bg-purple-dim">
                                                        <span>SL</span>
                                                    </div>
                                                    <div class="user-name">
                                                        <span class="tb-lead">Shao Lynn </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="nk-tb-col tb-col-md">
                                                <span class="tb-sub">01/29/2020</span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="tb-sub tb-amount">1099.99 <span>KES</span></span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="badge badge-dot badge-dot-xs badge-success">Paid</span>
                                            </div>
                                        </div>
                                        <div class="nk-tb-item">
                                            <div class="nk-tb-col">
                                                <span class="tb-lead"><a href="#">#95135</a></span>
                                            </div>
                                            <div class="nk-tb-col tb-col-sm">
                                                <div class="user-card">
                                                     <div class="user-avatar sm bg-warning-dim">
                                                        <img src="./TenantImages\Lillian More-8562634-woman.png" alt="">
                                                    </div>
                                                    <div class="user-name">
                                                        <span class="tb-lead">Lillian More</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="nk-tb-col tb-col-md">
                                                <span class="tb-sub">01/29/2020</span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="tb-sub tb-amount">1099.99 <span>KES</span></span>
                                            </div>
                                            <div class="nk-tb-col">
                                                <span class="badge badge-dot badge-dot-xs badge-warning">Due</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- .card -->
                            </div>
                            <%--<div class="col-xxl-4 col-md-8 col-lg-6">
                                <div class="card h-100">
                                    <div class="card-inner">
                                        <div class="card-title-group mb-2">
                                            <div class="card-title">
                                                <h6 class="title">Announcments</h6>
                                            </div>
                                            <div class="card-tools">
                                                <div class="dropdown">
                                                    <a href="#" class="dropdown-toggle link link-light link-sm dropdown-indicator" data-toggle="dropdown">Weekly</a>
                                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                        <ul class="link-list-opt no-bdr">
                                                            <li><a href="#"><span>Daily</span></a></li>
                                                            <li><a href="#" class="active"><span>Weekly</span></a></li>
                                                            <li><a href="#"><span>Monthly</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nk-top-products">
                                            <li class="item">
                                                <div class="thumb">
                                                    <img src="./images/product/a.png" alt="">
                                                </div>
                                                <div class="info">
                                                    <div class="title">Pink Fitness Tracker</div>
                                                    <div class="price">$99.00</div>
                                                </div>
                                                <div class="total">
                                                    <div class="amount">$990.00</div>
                                                    <div class="count">10 Sold</div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="thumb">
                                                    <img src="./images/product/b.png" alt="">
                                                </div>
                                                <div class="info">
                                                    <div class="title">Purple Smartwatch</div>
                                                    <div class="price">$99.00</div>
                                                </div>
                                                <div class="total">
                                                    <div class="amount">$990.00</div>
                                                    <div class="count">10 Sold</div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="thumb">
                                                    <img src="./images/product/c.png" alt="">
                                                </div>
                                                <div class="info">
                                                    <div class="title">Black Mi Band Smartwatch</div>
                                                    <div class="price">$99.00</div>
                                                </div>
                                                <div class="total">
                                                    <div class="amount">$990.00</div>
                                                    <div class="count">10 Sold</div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="thumb">
                                                    <img src="./images/product/d.png" alt="">
                                                </div>
                                                <div class="info">
                                                    <div class="title">Black Headphones</div>
                                                    <div class="price">$99.00</div>
                                                </div>
                                                <div class="total">
                                                    <div class="amount">$990.00</div>
                                                    <div class="count">10 Sold</div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="thumb">
                                                    <img src="./images/product/e.png" alt="">
                                                </div>
                                                <div class="info">
                                                    <div class="title">iPhone 7 Headphones</div>
                                                    <div class="price">$99.00</div>
                                                </div>
                                                <div class="total">
                                                    <div class="amount">$990.00</div>
                                                    <div class="count">10 Sold</div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- .card-inner -->
                                </div>
                                <!-- .card -->
                            </div>--%>
                            <!-- .col -->
                        </div>
                        <!-- .row -->
                    </div>
                    <!-- .nk-block -->
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
