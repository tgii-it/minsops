<%@page import="java.util.Date"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String useraccessname = "";
    String camp = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Daily Renewals</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <style>
            .high {
                background-color: greenyellow;
                color: black;
            }
            .low {
                background-color: #ffb3b3;
                color: black;
            }
            .loading{
                width:90%;
                margin:0 auto;
                height:8px;
                background-color:lightblue;
                position:relative;
                transition: all 300ms ease-in-out;
                z-index: 1;
            }
            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #ffe114 !important;
                overflow-x: hidden;
                transition: 0.1s;
                padding-top: 90px;
                z-index: 1000;
            }

            .sidenav a {
                padding: 5px 5px 5px 20px;
                text-decoration: none;
                font-size: 13px;
                font-weight: bold;
                color: #01354a;
                display: block;
                transition: 0.3s;
                z-index: 1;
            }

            .sidenav a:hover {
                background-color: #01354a !important; 
                color: #ffe114;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 7px;
                font-size: 25px;
                font-weight: bold;
                padding-top: 45px;
            }
            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #01354a !important;
                color: #ffe114;
                text-align: center;
                font-size: 10px;
            }


        </style>
        <style>
            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }

            .jumbotron {
                background-color: #428bca;
                color: #fff;
                padding: 15px 25px;
                font-family: Montserrat, sans-serif;
            }
            .container-fluid {
                height:100%;
                width:100%;
            }
            .bg-grey {
                background-color: #f6f6f6;
            }
            .bg-blue {
                background-color: #f2f7fd;
            }
            .logo-small {
                color: #428bca;
                font-size: 50px;
            }
            .logo {
                color: #428bca;
                font-size: 200px;
            }
            .thumbnail {
                padding: 0 0 15px 0;
                border: none;
                border-radius: 0;
            }
            .thumbnail img {
                width: 100%;
                height: 100%;
                margin-bottom: 10px;
            }
            .carousel-control.right, .carousel-control.left {
                background-image: none;
                color: #428bca;
            }
            .carousel-indicators li {
                border-color: #428bca;
            }
            .carousel-indicators li.active {
                background-color: #428bca;
            }
            .item h4 {
                font-size: 19px;
                line-height: 1.375em;
                font-weight: 400;
                font-style: italic;
                margin: 70px 0;
            }
            .item span {
                font-style: normal;
            }
            .panel {
                border: 1px solid #ffe114; 
                border-radius:3px !important;
                transition: box-shadow 0.3s;
            }
            .panel:hover {
                box-shadow: 5px 0px 30px rgba(0,0,0, .2);
            }
            .panel-footer .btn:hover {
                border: 1px solid #ffe114;
                background-color: #fff !important;
                color: #428bca;
            }
            .panel-heading {
                color: #fff !important;
                background-color: #ffe114 !important;
                padding: 15px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-sub-heading {
                color: #fff !important;
                background-color: #428bca !important;
                padding: 5px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-footer {
                background-color: white !important;
            }
            .panel-footer h3 {
                font-size: 32px;
            }
            .panel-footer h4 {
                color: #aaa;
                font-size: 14px;
            }
            .panel-footer h5 {
                font-size: 22px;
            }
            .panel-footer h6 {
                font-size: 13px;
            }
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #428bca;
                color: #fff;
            }

            .slideanim {visibility:hidden;}
            .slide {
                animation-name: slide;
                -webkit-animation-name: slide;
                animation-duration: 1s;
                -webkit-animation-duration: 1s;
                visibility: visible;
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    transform: translateY(0%);
                }
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
            }

        </style>
        <style>
            .dropbtn {
                background-color: #2185eb;
                color: white;
                padding: 0px 0px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                float:right;
                margin-right: 5px;
            }

            .dropdown {
                position: relative;
                display: inline-block;

            }

            .dropdown-content {            
                display: none;   
                margin-top: 31px;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 16px;
                font-size: 12px;
                right: 6px;
                z-index: 1;
                box-sizing: content-box;
                width: 120px;
                height: 110px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover { background-color: #ccc}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #2185eb;;
            }

            .dropdown:hover .dmenu {
                display: block;
            }
            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu>.dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -1px;
                -webkit-border-radius: 0 6px 6px 6px;
                -moz-border-radius: 0 6px 6px;
                border-radius: 0 6px 6px 6px;
            }

            .dropdown-submenu:hover>.dropdown-menu {
                display: block;
            }

            .dropdown-submenu>a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #ccc;
                margin-top: 5px;
                margin-right: -10px;
            }

            .dropdown-submenu:hover>a:after {
                border-left-color: #fff;
            }

            .dropdown-submenu.pull-left {
                float: none;
            }

            .dropdown-submenu.pull-left>.dropdown-menu {
                left: -100%;
                margin-left: 10px;
                -webkit-border-radius: 6px 0 6px 6px;
                -moz-border-radius: 6px 0 6px 6px;
                border-radius: 6px 0 6px 6px;
            }
            .navbar{
                top:0;
                width:100%; 
                z-index: 9999;
                position: fixed;
                background-color: #01354a;
            }

            .navbar-brand {
                margin-top: 0;
                margin-bottom: 0;
                background-color: #01354a;
                color: #ffe114 !important;
                z-index: 9999;
                border: 0;
                font-size: 28px !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;  
                cursor:pointer; 
                vertical-align: middle;
            }
        </style>
    </head>
    <body style="background-color: #fff; width: 100%;">
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn navbar-link" onclick="closeNav()"> &times;</a> 
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-My_Details">
                <i class="glyphicon glyphicon-briefcase"></i>&nbsp; Home
            </a>
            <%
                if (useraccessname.contains("Sucharitha")) {
            %> 
            <a href="friend.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Add FoG
            </a>
            <a href="fogTbl.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; List of FoG's
            </a>  
            <a href="fogEdit.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Edit FoG record
            </a>
            <a href="designationUpdate.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Designation Update
            </a>
            <a href="camp_transfer.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Transfer
            </a>
            <a href="memEdit.jsp" class="list-group-item active" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Edit Membership
            </a> 
            <a href="memcList.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Complete List of Members
            </a>
            <a href="memList.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp wise Members List
            </a>
            <a href="CompleteMembershipReoprt.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Complete Camp Report
            </a>         
            <%
                }

                if (useraccessname.contains("Sunitha")) {
            %>
            <a href="friend.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Add FoG
            </a>
            <a href="fogTbl.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; List of FoG's
            </a>  
            <a href="fogEdit.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Edit FoG record
            </a>
            <a href="designationUpdate.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Designation Update
            </a>
            <a href="camp_transfer.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Transfer
            </a>
            <a href="memEdit.jsp" class="list-group-item active" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Edit Membership
            </a> 
            <a href="Renewals@HokitosDeskforDeptHead.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Zone 6 Renewals
            </a> 
            <a href="PendingRenewals.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Pending Renewal
            </a>
            <a href="Renewed.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Renewal Request Processed
            </a>
            <a href="PendingRenewalsCampWise.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Direct Renewals 
            </a>
            <a href="RenewalsDB.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Renewals Dashboard
            </a>
            <a href="DirectReInstatedCampWise.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Direct Reinstated 
            </a>
            <a href="memcList.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Complete List of Members
            </a>
            <a href="memList.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp wise Members List
            </a>
            <a href="CompleteMembershipReoprt.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Complete Camp Report
            </a>              
            <%
                }
            %>
            <a href="logout.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-globe"></i>&nbsp; Logout
            </a>
        </div>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div>   
                <span class="navbar-brand pull-left" onclick="openNav()">&#9776;</span>                
                <a href="#"><img alt="The Gideons International" src="./images/GideonsLogo2.png" align="left"  height="50" width="170"  style="padding: 5px;"/></a>
            </div>
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="myNavbar" style="background-color: #01354a;">
                    <ul class="nav navbar-nav navbar-left">
                        <%
                            if (useraccessname.contains("Sunitha") || useraccessname.contains("Deepika")) {
                        %>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #ffe114; color: #01354a; font-size: 12px; font-weight: bold;">Renewals/Reinstated &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="RenewalsDB.jsp">
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Renewals Dashboard
                                    </a>
                                </li>
                                <li>
                                    <a href="dailyRenewals.jsp">
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Daily Renewals Report
                                    </a>
                                </li>
                                <li>
                                    <a href="PendingRenewals.jsp">
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Pending Renewal
                                    </a>
                                </li>
                                <li>
                                    <a href="Renewed.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Renewal Request Processed
                                    </a>
                                </li>
                                <li>
                                    <a href="PendingRenewalsCampWise.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Direct Renewal
                                    </a>
                                </li>
                                <li>
                                    <a href="DirectReInstatedCampWise.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Direct Reinstated
                                    </a>
                                </li>
                                <li>
                                    <a href="memEdit.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Member Profile
                                    </a>
                                </li>
                                <li><a href="CompleteMembershipReoprt.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Complete Camp Report
                                    </a>
                                </li>
                                <li>
                                    <a href="memList.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Members /Officers List
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Department Reports &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu" style="padding-right:8px;">
                                <li class="dropdown-submenu">
                                    <a href="#">
                                        Membership Dept
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="membership_reports.jsp" target="_blank"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Reports</a></li>
                                        <li><a href="StateWiseReport.jsp" target="_blank"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; State wise Members List</a></li>
                                        <li><a href="campOfficersAddressList.jsp" target="_blank"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; Camp Officers Address List</a></li>                                                                                
                                    </ul>
                                </li>
                            </ul>
                        </li>

                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Address List &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="campOfficersAddressList.jsp">
                                        Camp Officers Address List
                                    </a>
                                </li>
                                <li>
                                    <a href="DownloadCampOfficersAddressList.jsp?exportToExcel=YES">Download <i class="fa fa-file-excel-o" style="float: right; font-size: 24px; color:#ffe114; margin-top: -36px;margin-right: 30px;" ></i></a>
                                </li>
                            </ul>
                        </li>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Dispatch Section &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="DispatchMis.jsp">
                                        Dispatch Pending
                                    </a>
                                </li>
                                <li>
                                    <a href="DispatchMis_processed.jsp">
                                        Dispatch Processed
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="campOfficersAddressList.jsp">
                                        Camp Officers Address List
                                    </a>
                                </li>
                                <li>
                                    <a href="DownloadCampOfficersAddressList.jsp?exportToExcel=YES">Download as MsExcel &nbsp;&nbsp; <i class="fa fa-file-excel-o"></i></a>
                                </li>
                            </ul>
                        </li>
                        <%
                            }

                            if (useraccessname.contains("Benjamin")) {
                        %>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #ffe114; color: #01354a; font-size: 12px; font-weight: bold;">Renewals/Reinstated &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="PendingRenewals.jsp">
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Pending Renewal
                                    </a>
                                </li>
                                <li><a href="Renewed.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Renewal Request Processed
                                    </a>
                                </li>
                                <li>
                                    <a href="PendingRenewalsCampWise.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Direct Renewal
                                    </a>
                                </li>
                                <li>
                                    <a href="DirectReInstatedCampWise.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Direct Reinstated
                                    </a>
                                </li>
                                <li><a href="memEdit.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Member Profile
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Performance Reports &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="NationalPerformanceReport.jsp">
                                        National Performance Report
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=1">
                                        SA 1 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=1"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=1"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=1"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=1"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=1"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=2">
                                        SA 2 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=2"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=2"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=2"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=2"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=2"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=3">
                                        SA 3 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=3"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=3"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=3"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=3"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=3"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=4">
                                        SA 4 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=4"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=4"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=4"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=4"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=4"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=5">
                                        SA 5 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=5"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=5"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=5"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=5"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=5"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=6">
                                        SA 6 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=6"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=6"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=6"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=6"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=6"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=7">
                                        SA 7 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=7"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=7"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=7"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=7"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=7"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=8">
                                        SA 8 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=8"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=8"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=8"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=8"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=8"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=9">
                                        SA 9 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=9"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=9"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=9"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=9"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=9"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=10">
                                        SA 10 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=10"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=10"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=10"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=10"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=10"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=11">
                                        SA 11 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=11"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=11"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=11"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=11"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=11"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=12">
                                        SA 12 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=12"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=12"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=12"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=12"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=12"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=13">
                                        SA 13 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=13"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=13"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=13"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=13"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=13"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?StateAsso=14">
                                        OS - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?StateAsso=14"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?StateAsso=14"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?StateAsso=14"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?StateAsso=14"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?StateAsso=14"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="CampPerformanceReport.jsp">
                                        Camp Performance Report
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul> 
                    <ul class="nav navbar-nav navbar-left">
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Officers List &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="nationalOfficers.jsp">National Leaders</a></li>
                                <li><a href="zoneOfficers.jsp">Zone Trustees</a></li>
                                <li><a href="stateOfficers.jsp">State Officers</a></li>
                                <li><a href="programCoordinators.jsp">Program Coordinators</a></li>
                                <li><a href="regionOfficers.jsp">Region Directors</a></li>
                                <li><a href="programLeaders.jsp">Program Leaders</a></li>
                                <li><a href="areaOfficers.jsp">Area Directors</a></li>
                                <li><a href="campOfficers.jsp">Camp Officers</a></li>
                                <li><a href="allOfficers.jsp">The Complete List</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="CampsMaster.jsp" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">
                                Camps Master
                            </a>
                        </li>
                        <li>
                            <a href="CampPerformance.jsp" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">
                                Camp Perf / Transactions
                            </a>
                        </li>
                        <%
                            if (useraccessname.contains("Basavaraj")) {
                        %>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Dispatch Section &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="DispatchMis.jsp">
                                        Dispatch Pending
                                    </a>
                                </li>
                                <li>
                                    <a href="DispatchMis_processed.jsp">
                                        Dispatch Processed
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="campOfficersAddressList.jsp">
                                        Camp Officers Address List
                                    </a>
                                </li>
                                <li>
                                    <a href="DownloadCampOfficersAddressList.jsp?exportToExcel=YES">Download as MsExcel &nbsp;&nbsp; <i class="fa fa-file-excel-o"></i></a>
                                </li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">&nbsp;<%=useraccessname%>&nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="logout.jsp">
                                        Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section id="main" class="container" style="padding: 60px 0px;">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#sa_wise_cnt" style="font-size: 12px; font-weight: bold;">SA wise Count</a></li>
                <li><a data-toggle="tab" href="#gid_list" style="font-size: 12px; font-weight: bold;">Gideon List</a></li>
                <li><a data-toggle="tab" href="#aux_list" style="font-size: 12px; font-weight: bold;">Auxiliary List</a></li>
            </ul>
            <div class="tab-content">
                <div id="sa_wise_cnt" class="tab-pane fade in active"> 
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; PREVIOUS DAY RENEWALS : 
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="sacnt" class="table table-bordered table-responsive table-hover table-striped" style="width: 100%;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden>Sl_No</th>
                                        <th nowrap>State Association</th>
                                        <th style="text-align: center;" nowrap>IR_Gideon</th>
                                        <th style="text-align: center;" nowrap>DR_Gideon</th>
                                        <th style="text-align: center;" nowrap>Total_Gideon</th>
                                        <th style="text-align: center;" nowrap>IR_Auxiliary</th>
                                        <th style="text-align: center;" nowrap>DR_Auxiliary</th>
                                        <th style="text-align: center;" nowrap>Total_Auxiliary</th>
                                        <th style="text-align: center;" nowrap>Overall_Total</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        String total = "";
                                        String auxiliary = "";
                                        String gideon = "";
                                        String state_association = "";
                                        int slno_sa_o = 0;

                                        DataSource ds = null;
                                        Connection con = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            String sql = "select * from v_yday_renewals_tbl";
                                            ResultSet resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                                state_association = resultSet.getString("state_association");
                                                slno_sa_o = slno_sa_o + 1;
                                    %>
                                    <tr>
                                        <td style="text-align:center;" hidden><%= slno_sa_o%></td>
                                        <td style="font-weight: bold;" nowrap><%= state_association%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("ir_gideon")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("dr_gideon")%></td>
                                        <td style="text-align: center; background-color:#F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("total_gideon")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("ir_auxiliary")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("dr_auxiliary")%></td>
                                        <td style="text-align: center; background-color:#ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("total_auxiliary")%></td>
                                        <td style="text-align: center; background-color:yellow; font-weight: bold;" nowrap><%=resultSet.getString("total")%></td>
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th style="text-align: right;">Total</th>
                                        <th style="text-align: center;"></th> 
                                        <th style="text-align: center;"></th> 
                                        <th style="text-align: center;"></th> 
                                        <th style="text-align: center;"></th> 
                                        <th style="text-align: center;"></th> 
                                        <th style="text-align: center;"></th> 
                                        <th style="text-align: center;"></th> 
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="gid_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; GIDEON - PREVIOUS DAY RENEWALS : 
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="gidlist" class="table table-bordered table-responsive table-hover table-striped" style="width: 100%;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th>Mem No</th>
                                        <th nowrap>Camp Name</th>
                                        <th nowrap>Member Name</th>
                                        <th nowrap>Membership Type</th>
                                        <th nowrap>Status</th>
                                        <th nowrap>Start Date</th>   
                                        <th nowrap>End Date</th>   
                                        <th nowrap>Mobile Number</th>
                                        <th nowrap>Email</th>
                                        <th nowrap>Address</th>
                                        <th nowrap>Remitter Information</th>
                                        <th nowrap>State Association</th>
                                        <th nowrap>Basket</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        String mid = "";
                                        String annual_end_date = "";
                                        String annual_start_date = "";
                                        String phone = "";
                                        state_association = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            String sql = "select * from yday_renewals_tbl_Gid_list ";
                                            ResultSet resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                                mid = resultSet.getString("mid");
                                                camp = resultSet.getString("camp");
                                                annual_end_date = resultSet.getString("annual_end_date");
                                                annual_start_date = resultSet.getString("annual_start_date");
                                                phone = resultSet.getString("phone");
                                                state_association = resultSet.getString("state_association");
                                                if (annual_end_date == null) {
                                                    annual_end_date = "-";
                                                }
                                                if (annual_start_date == null) {
                                                    annual_start_date = "-";
                                                }
                                                if (phone == "0") {
                                                    phone = "-";
                                                }
                                                if (state_association == null) {
                                                    state_association = "";
                                                }
                                    %>
                                    <tr>
                                        <td nowrap><%= mid%></td>
                                        <td nowrap><%=resultSet.getString("camp")%></td>
                                        <td nowrap><%=resultSet.getString("name")%></td>
                                        <td nowrap><%=resultSet.getString("mtype")%></td>
                                        <td nowrap><%=resultSet.getString("status")%></td>
                                        <td nowrap><%=annual_start_date%></td>
                                        <td nowrap><%=annual_end_date%></td>
                                        <td nowrap><%=phone%> &nbsp;,&nbsp; <%=resultSet.getString("mobile2")%> &nbsp;, &nbsp;<%=resultSet.getString("mobile3")%></td>                                      
                                        <td nowrap><%=resultSet.getString("email")%></td>    
                                        <td nowrap><%=resultSet.getString("address")%>&nbsp;,&nbsp;<%=resultSet.getString("address2")%>&nbsp;,&nbsp;<%=resultSet.getString("street")%>&nbsp;,&nbsp;<%=resultSet.getString("city")%>&nbsp;,&nbsp;<%=resultSet.getString("state")%>&nbsp;-&nbsp;<%=resultSet.getString("pincode")%>&nbsp;</td>
                                        <td nowrap><%=resultSet.getString("remitter")%></td>
                                        <td nowrap><%=state_association%></td>
                                        <td nowrap><%=resultSet.getString("basket")%></td>
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="aux_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; AUXILIARY - PREVIOUS DAY RENEWALS : 
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="auxlist" class="table table-bordered table-responsive table-hover table-striped" style="width: 100%;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th>Mem No</th>
                                        <th nowrap>Camp Name</th>
                                        <th nowrap>Member Name</th>
                                        <th nowrap>Membership Type</th>
                                        <th nowrap>Status</th>
                                        <th nowrap>Start Date</th>   
                                        <th nowrap>End Date</th>   
                                        <th nowrap>Mobile Number</th>
                                        <th nowrap>Email</th>
                                        <th nowrap>Address</th>
                                        <th nowrap>Remitter Information</th>
                                        <th nowrap>State Association</th>
                                        <th nowrap>Basket</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        mid = "";
                                        annual_end_date = "";
                                        annual_start_date = "";
                                        phone = "";
                                        state_association = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            String sql = "select * from yday_renewals_tbl_Aux_list ";
                                            ResultSet resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                                mid = resultSet.getString("mid");
                                                camp = resultSet.getString("camp");
                                                annual_end_date = resultSet.getString("annual_end_date");
                                                annual_start_date = resultSet.getString("annual_start_date");
                                                phone = resultSet.getString("phone");
                                                state_association = resultSet.getString("state_association");
                                                if (annual_end_date == null) {
                                                    annual_end_date = "-";
                                                }
                                                if (annual_start_date == null) {
                                                    annual_start_date = "-";
                                                }
                                                if (phone == "0") {
                                                    phone = "-";
                                                }
                                                if (state_association == null) {
                                                    state_association = "";
                                                }
                                    %>
                                    <tr>
                                        <td nowrap><%= mid%></td>
                                        <td nowrap><%=resultSet.getString("camp")%></td>
                                        <td nowrap><%=resultSet.getString("name")%></td>
                                        <td nowrap><%=resultSet.getString("mtype")%></td>
                                        <td nowrap><%=resultSet.getString("status")%></td>
                                        <td nowrap><%=annual_start_date%></td>
                                        <td nowrap><%=annual_end_date%></td>
                                        <td nowrap><%=phone%> &nbsp;,&nbsp; <%=resultSet.getString("mobile2")%> &nbsp;, &nbsp;<%=resultSet.getString("mobile3")%></td>                                      
                                        <td nowrap><%=resultSet.getString("email")%></td>    
                                        <td nowrap><%=resultSet.getString("address")%>&nbsp;,&nbsp;<%=resultSet.getString("address2")%>&nbsp;,&nbsp;<%=resultSet.getString("street")%>&nbsp;,&nbsp;<%=resultSet.getString("city")%>&nbsp;,&nbsp;<%=resultSet.getString("state")%>&nbsp;-&nbsp;<%=resultSet.getString("pincode")%>&nbsp;</td>
                                        <td nowrap><%=resultSet.getString("remitter")%></td>
                                        <td nowrap><%=state_association%></td>
                                        <td nowrap><%=resultSet.getString("basket")%></td>
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br><br>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/buttons.bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script type="text/javascript">
                    $(document).ready(function () {
                        var table = $('#sacnt').DataTable({
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [20, 50, -1],
                                ['20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            "footerCallback": function (row, data, start, end, display) {
                                var api = this.api(), data;
                                // Remove the formatting to get integer data for summation
                                var intVal = function (i) {
                                    return typeof i === 'string' ?
                                            i.replace(/[\$,]/g, '') * 1 :
                                            typeof i === 'number' ?
                                            i : 0;
                                };
                                // Total over all pages
                                total1 = api
                                        .column(2)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total2 = api
                                        .column(3)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total3 = api
                                        .column(4)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total4 = api
                                        .column(5)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total5 = api
                                        .column(6)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total6 = api
                                        .column(7)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total7 = api
                                        .column(8)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                // Update footer
                                $(api.column(1).footer()).html(total1);
                                $(api.column(2).footer()).html(total2);
                                $(api.column(3).footer()).html(total3);
                                $(api.column(4).footer()).html(total4);
                                $(api.column(5).footer()).html(total5);
                                $(api.column(6).footer()).html(total6);
                                $(api.column(7).footer()).html(total7);
                            }
                        });
                    });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#gidlist').DataTable({
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    lengthMenu: [
                        [10, 20, 50, -1],
                        ['10 rows', '20 rows', '50 rows', 'Show all']
                    ],
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength',
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ]
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#auxlist').DataTable({
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    lengthMenu: [
                        [10, 20, 50, -1],
                        ['10 rows', '20 rows', '50 rows', 'Show all']
                    ],
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength',
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ]
                });
            });
        </script>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script> 
    </body>
</html>