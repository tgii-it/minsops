<%@page import="java.util.Date"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String useraccessname = "";
    String camp = request.getParameter("camp");
    if (camp == null) {
        camp = "";
    }
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/camps.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | EDIT RECORD</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 

        <script>
            $(document).ready(function () {
                load_json_data('mid');
                function load_json_data(id, parent_id)
                {
                    var html_code = '';
                    $.getJSON('https://lxxncu6awrxkpqa-db202010270820.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1b/memEditJson/', function (data) {

                        html_code += '<option value="">- Search and Select.. -</option>';
                        var items = data.items.map(function (item) {
                            html_code += '<option value="' + item.mid + '">' + item.name_str + '</option>';
                        });

                        $('#' + id).html(html_code);
                    });
                }
            });
        </script>
        <style>
            .ui-autocomplete {
                max-height: auto;
                overflow-y: auto;
                /* prevent horizontal scrollbar */
                overflow-x: hidden;
            }
            /* IE 6 doesn't support max-height
             * we use height instead, but this forces the menu to always be this tall
             */
            * html .ui-autocomplete {
                height: auto;
            }
        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="js/camps.js"></script>
        <script src="js/contactperson.js"></script>
        <script src="js/designation.js"></script>
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

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 14px;}
            }
        </style>
        <style>
            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }
            h2 {
                font-size: 22px;
                text-transform: uppercase;
                color: #fff;
                font-weight: 400;
                margin-bottom: 10px;
            }
            h3 {
                font-size: 18px;
                text-transform: initial;
                color: #fff;
                font-weight: 300;
                margin-bottom: 15px;
            }
            h4 {
                font-size: 19px;
                line-height: 1.375em;
                color: #428bca;
                font-weight: 300;
                margin-bottom: 20px;
            } 
            h5 {
                font-size: 18px;
                text-transform: initial;
                color: #428bca;
                font-weight: 300;
                margin-bottom: 15px;
            }
            h6 {
                font-size: 20px;
                text-transform: initial;
                color: #428bca;
                font-weight: bold;
                margin-bottom: 20px;
            } 
            .jumbotron {
                background-color: #428bca;
                color: #fff;
                padding: 15px 25px;
                font-family: Montserrat, sans-serif;
            }
            .container-fluid {
                padding-left: 10px;
                padding-right: 10px;
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
            .navbar {
                margin-bottom: 0;
                background-color: #01354a;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;
            }
            .navbar-brand {
                margin-top: 0;
                margin-bottom: 0;
                background-color: #01354a;
                z-index: 9999;
                border: 0;
                font-size: 28px !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;  
                cursor:pointer; 
                vertical-align: middle;
            }
            .navbar li a, .navbar .navbar-brand {
                color: #ffe114 !important;
            }
            .navbar-nav li a:hover {
                color: #01354a !important;
                background-color: #ffe114 !important;
            }
            .navbar-nav li.active a {
                color: #01354a !important;
                background-color: #ffe114 !important;
            }
            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
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
            @media screen and (max-width: 768px) {
                .col-sm-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .btn-lg {
                    width: 100%;
                    margin-bottom: 35px;
                }
            }
            @media screen and (max-width: 480px) {
                .logo {
                    font-size: 150px;
                }
            }

            .modal{
                margin-top: 0px;
                padding-top: 0px;
                top:0px;
            }
            .modal-dialog{
                margin-top: 0px;
                padding-top: 0px;
                top:0px;
                width:96%;
            }
            tooltip{
                background-color: black;
                color: blue;
            }
            .navbar{
                top:0;
                width:100%; 
                z-index: 9999;
                position: fixed;
                background-color: #01354a;
            }
        </style>
    </head>
    <body id="myContainer" style="background-color: #fff; width: 100%;" onload="Signup();">
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn navbar-link" onclick="closeNav()"> &times;</a> 
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-My_Details">
                <i class="glyphicon glyphicon-briefcase"></i>&nbsp; My Dashboard
            </a>
            <a href="friend.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Add FoG
            </a>
            <a href="fogTbl.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; List of FoG's
            </a>
            <%
                if (useraccessname.contains("Sunitha")) {
            %>
            <a href="Renewals@HokitosDeskforDeptHead.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Zone 6 Renewals
            </a>               
            <%
                }
            %>
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
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Profile
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Leave DB
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Leave DB
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Reset Password
            </a>
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
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #ffe114; color: #01354a; font-size: 12px; font-weight: bold;">My Dashboard &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="PendingRenewals.jsp">
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Pending Renewal
                                    </a></li>
                                <li><a href="Renewed.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Renewal Request Processed
                                    </a></li>
                                <li>
                                    <a href="PendingRenewalsCampWise.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Direct Renewal
                                    </a>
                                </li>
                                <!-- <li><a href="RenewalMis.jsp" >
                                         <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Direct Renewals 
                                     </a></li> -->
                                <li><a href="CompleteMembershipReoprt.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; Complete Camp Report
                                    </a></li>
                                <li><a href="memList.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; List of Members/Officers
                                    </a></li>
                                <li><a href="memEdit.jsp" >
                                        <i class="glyphicon glyphicon-user"></i>&nbsp; View Member Profile
                                    </a></li>
                                <li><a href="#" >
                                        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Profile
                                    </a></li>
                                <li><a href="#" >
                                        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Leave DB
                                    </a></li>
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
                                        <li><a href="https://mis.gideons.org.in/membership_reports.jsp" target="_blank"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Reports</a></li>
                                        <li><a href="https://mis.gideons.org.in/campOfficersList.jsp" target="_blank"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Camp Cabinet List</a></li>
                                        <li><a href="https://mis.gideons.org.in/StateWiseReport.jsp" target="_blank"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; State wise Members List</a></li>                                        
                                    </ul>
                                </li>
                            </ul>
                        </li>
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
                                    <a href="StatePerformanceReport.jsp&StateAsso=1">
                                        SA 1 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=1"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=1"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=1"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=1"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=1"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=2">
                                        SA 2 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=2"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=2"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=2"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=2"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=2"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=3">
                                        SA 3 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=3"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=3"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=3"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=3"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=3"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=4">
                                        SA 4 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=4"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=4"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=4"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=4"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=4"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=5">
                                        SA 5 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=5"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=5"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=5"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=5"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=5"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=6">
                                        SA 6 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=6"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=6"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=6"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=6"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=6"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=7">
                                        SA 7 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=7"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=7"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=7"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=7"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=7"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=8">
                                        SA 8 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=8"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=8"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=8"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=8"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=8"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=9">
                                        SA 9 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=9"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=9"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=9"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=9"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=9"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=10">
                                        SA 10 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=10"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=10"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=10"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=10"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=10"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=11">
                                        SA 11 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=11"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=11"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=11"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=11"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=11"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=12">
                                        SA 12 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=12"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=12"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=12"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=12"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=12"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=13">
                                        SA 13 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=13"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=13"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=13"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=13"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=13"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp&StateAsso=14">
                                        OS - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp&StateAsso=14"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp&StateAsso=14"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp&StateAsso=14"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp&StateAsso=14"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp&StateAsso=14"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
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
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Camps Master &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Active Camps</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; In-Active Camps</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Merged Camps</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Closed Camps</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 1</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 2</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 3</a></li>
                            </ul>
                        </li>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Officers Directory &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; National Officers</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; State Officers</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; State Program Coordinators</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Regional Directors</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Program Leaders</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Area Directors</a></li>
                                <li><a href="https://mis.gideons.org.in/campOfficersList.jsp" target="_blank"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Camp Officers</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Field Officers</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; NHQ Staff Members</a></li>
                            </ul>
                        </li>
                    </ul> 
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Sign out &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="logout.jsp">
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">   
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm2" method="post">                      
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; S T E P &nbsp;1&nbsp;:&nbsp;&nbsp; E N T E R &nbsp; M E M B E R S H I P  &nbsp;I D
                                    </h3>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="form-row"> 
                                        <div class="form-group col-md-9" >
                                            <label for="namestr">Search & select the Record</label>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-list"></span>
                                                </span>
                                                <select name="mid" id="mid" class="form-control input-md" style="font-size: 13px; color: navy;" required>
                                                    <option value="0">Search & select..</option>
                                                </select>
                                            </div>                              
                                        </div> 
                                        <div class="form-group col-md-3" hidden>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </span>
                                                <input type='text' style="padding: 5px; font-size:11px;" class="form-control editRow" name="mid"  id="mid" placeholder="Search"/>
                                            </div>                                            
                                        </div>  
                                        <div class="form-group col-md-3" hidden>
                                            <label for="namestr">&nbsp;</label>
                                            <div class='input-group'>                                                
                                                <input style="padding: 5px; font-size:11px;" class="btn btn-primary pull-right editRow " value="CLICK HERE" placeholder="CLICK HERE" readonly>   
                                            </div>                                            
                                        </div> 
                                    </div>                                    
                                    <div id="snackbar"></div>
                                </div>
                            </div>
                        </form>                        
                        <form name="frm_apply" id="frm_apply" class="registration-form">
                            <div class='panel panel-default panel-accent-gold'>                              
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; S T E P &nbsp;2&nbsp;:&nbsp;&nbsp; L I S I T &nbsp; O F &nbsp; T H E  &nbsp; R E C O R D
                                    </h3>
                                </div>
                                <br>                              
                                <div class="row" style=" padding: -5px; vertical-align: middle; font-size: 11px; height: auto;">   
                                    <div class="col-sm-12 form-group">   
                                        <div class="col-sm-2 form-group" hidden>
                                            <label>Zone Name</label>
                                            <input type="text" style="padding: 5px;" name="zone1"  class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>State Name</label>
                                            <input type="text" style="padding: 5px;" name="state_association" id="state_association" class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Region Name</label>
                                            <input type="text" style="padding: 5px;" name="region_name" id="region_name" class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Area Name</label>
                                            <input type="text" style="padding: 5px;" name="area_name" id="area_name"class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Camp Name</label>
                                            <input type="text"  style="padding: 5px;" name="camp" id="camp" class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Member's ID</label>
                                            <input type="text" style="padding: 5px;" name="mid1" id="mid1" class="form-control" readonly>
                                        </div>	
                                    </div>
                                </div>
                                <div class="row" style=" padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">  
                                        <div class="col-sm-3 form-group">
                                            <label> Name</label>
                                            <input type="text" style="padding: 5px;" name="name" id="name" class="form-control">
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Date of Birth</label>
                                            <input type="text" style="padding: 5px;"  name="date_of_birth" maxlength="10" id="date_of_birth" class="form-control">
                                        </div> 	
                                        <div class="col-sm-2 form-group">
                                            <label> Mobile No</label>
                                            <input inputmode="numeric" style="padding: 5px;"  name="phone" maxlength="10"  id="phone" class="form-control">
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Landline No</label>
                                            <input type="text" style="padding: 5px;"  name="mobile2" maxlength="10" id="mobile2" class="form-control">
                                        </div>  
                                        <div class="col-sm-3 form-group">
                                            <label>WhatsApp No</label>
                                            <input inputmode="numeric" style="padding: 5px;"  name="mobile3" maxlength="10" id="mobile3" class="form-control">
                                        </div>
                                    </div>
                                </div>	
                                <div class="row" style=" padding: -10px; vertical-align: middle; font-size: 11px; height: auto;" >
                                    <div class="col-sm-12 form-group">  
                                        <div class="col-sm-2 form-group">
                                            <label>Email</label>
                                            <input type="email" style="padding: 5px;" name="email" id="email" class="form-control">
                                        </div>
                                        <div class="col-sm-5 form-group">
                                            <label>Address</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" name="address" id="address"  class="form-control">
                                        </div>	
                                        <div class="col-sm-5 form-group">
                                            <label>Address 2</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" name="address2" id="address2"  class="form-control">
                                        </div>
                                    </div>
                                </div>	
                                <div class="row" style=" padding: -10px; vertical-align: middle; font-size: 11px; height: auto;" hidden>
                                    <div class="col-sm-12 form-group">  
                                        <div class="col-sm-3 form-group" >
                                            <label>Auxiliary Name</label>
                                            <input type="text" style="padding: 5px;" name="wname" id="wname" class="form-control">
                                        </div>	
                                        <div class="col-sm-3 form-group">
                                            <label> Aux Phone No (1)</label>
                                            <input type="text" style="padding: 5px;"  name="wmobile" maxlength="10"  id="wmobile" class="form-control">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Aux WhatsApp Number</label>
                                            <input inputmode="numeric" style="padding: 5px;" name="mobile" maxlength="10" id="mobile" class="form-control">
                                        </div>  
                                        <div class="col-sm-3 form-group">
                                            <label>Aux Email</label>
                                            <input type="email" style="padding: 5px;" name="wemail" id="wemail" class="form-control">
                                        </div>	
                                    </div>
                                </div>	
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">                                                                                

                                        <div class="col-sm-3 form-group">
                                            <label>Street</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" id="street"  name="street"   class="form-control">
                                        </div>	
                                        <div class="col-sm-3 form-group">
                                            <label>City</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" id="city" class="form-control"  name="city">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>State</label>
                                            <select class="form-control" style="font-size:11px; padding: 5px;" id="state" name="state" required="on">
                                                <option value="0">-- Select State --</option>                                        
                                                <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>                                        
                                                <option value="Andhra Pradesh">Andhra Pradesh </option>                                        
                                                <option value="Arunachal Pradesh">Arunachal Pradesh </option>                                        
                                                <option value="Assam">Assam</option>                                        
                                                <option value="Bihar" >Bihar</option>                                        
                                                <option value="Chandigarh">Chandigarh</option>                                        
                                                <option value="Chhattisgarh">Chhattisgarh</option>                                        
                                                <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>                                        
                                                <option value="Daman and Diu">Daman and Diu</option>                                        
                                                <option value="Delhi">Delhi</option>                                        
                                                <option value="Goa">Goa</option>                                        
                                                <option value="Gujarat">Gujarat</option>                                        
                                                <option value="Haryana">Haryana</option>                                        
                                                <option value="Himachal Pradesh">Himachal Pradesh</option>                                        
                                                <option value="Jammu and Kashmir">Jammu and Kashmir</option>                                        
                                                <option value="Jharkhand">Jharkhand</option>                                        
                                                <option value="Karnataka">Karnataka</option>                                        
                                                <option value="Kerala">Kerala</option>                                        
                                                <option value="Lakshadweep">Lakshadweep</option>                                        
                                                <option value="Madhya Pradesh" >Madhya Pradesh</option>                                        
                                                <option value="Maharashtra">Maharashtra</option>                                        
                                                <option value="Manipur">Manipur</option>                                        
                                                <option value="Meghalaya">Meghalaya</option>                                        
                                                <option value="Mizoram">Mizoram</option>                                        
                                                <option value="Nagaland">Nagaland</option>                                        
                                                <option value="Orissa">Orissa</option>                                        
                                                <option value="Puducherry">Puducherry</option>                                        
                                                <option value="Punjab">Punjab</option>                                        
                                                <option value="Rajasthan">Rajasthan</option>                                        
                                                <option value="Sikkim">Sikkim</option>                                        
                                                <option value="Tamil Nadu">Tamil Nadu</option>                                    
                                                <option value="Telangana">Telangana</option>                                        
                                                <option value="Tripura">Tripura</option>                                        
                                                <option value="Uttar Pradesh">Uttar Pradesh</option>                                        
                                                <option value="Uttarakhand" >Uttarakhand</option>                                        
                                                <option value="West Bengal">West Bengal</option> 
                                            </select>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Pin Code</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" maxlength="6" id="pincode" class="form-control"  name="pincode">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">  
                                        <div class="form-group col-md-3">
                                            <label>Designation</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" id="designation" class="form-control"  name="designation">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Church Name</label>
                                            <input type="text" id="church" style="font-size:11px; padding: 5px;" class="form-control" placeholder="Name of the Church" name="church">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Church Address</label>
                                            <input type="text" id="caddress" style="font-size:11px; padding: 5px;" class="form-control" placeholder="Church Address" name="caddress">
                                        </div>

                                    </div>
                                </div>						
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group"> 
                                        <div class="form-group col-md-3 col-sm-3">
                                            <label>Church Number</label>
                                            <input  id="cmobile" maxlength="10" style="font-size:11px; padding: 5px;"  pattern="\d{10}" class="form-control"  name="cmobile">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Pastor Name</label>
                                            <input type="text" id="pastor_name" style="font-size:11px; padding: 5px;" class="form-control" name="pastor_name">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Pastor Number</label>
                                            <input type="text" id="pastor_mobile" style="font-size:11px; padding: 5px;" maxlength="10"  pattern="\d{10}" class="form-control" name="pastor_mobile">
                                        </div>
                                        <div class="form-group col-md-3 ">
                                            <label>Pastor email</label>
                                            <input  id="pastor_email" style="font-size:11px; padding: 5px;" name="pastor_email" class="form-email form-control"  >
                                        </div>
                                    </div>
                                </div>                                                            
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">  
                                        <div class="form-group col-md-3">
                                            <label>Membership Status</label>
                                            <select class="form-control" style="font-size:11px; padding: 5px;"  name="status" id="status" onchange="Signup()">
                                                <option value="0">---Select----</option>
                                                <option>Current</option>
                                                <option>Grace</option>
                                                <option>Dropped</option>
                                                <option>Applied</option>
                                                <option>Deceased</option>
                                                <option>Canceled</option>
                                                <option>Barred</option>
                                                <option>Revoked</option>
                                            </select>
                                        </div>	
                                        <div class="form-group col-md-3" id="deceased_div">
                                            <label>Deceased Date</label>
                                            <div class='input-group date' id="event_date_cal7">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text"  class="form-control" style="font-size:11px; padding: 5px;" id="deceased_date"  placeholder="DD/MM/YYY" name="deceased_date">
                                            </div>
                                        </div> 
                                        <div class="form-group col-sm-3" >
                                            <label>Membership Type</label>
                                            <select class="form-control first" style="font-size:11px; padding: 5px;" name="mtype"  id="mtype" >
                                                <option value="0">None</option>
                                                <option value="Auxiliary(TGII) Annual Member">Auxiliary Annual Member</option>
                                                <option value="Gideon(TGII) Annual Member">Gideon Annual Member </option>
                                                <option value="Auxiliary(TGII) Life Member">Auxiliary Life Member</option>
                                                <option value="Gideon(TGII) Life Member">Gideon Life Member</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3" >
                                            <label> Annual Start Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text"   class="form-control" style="font-size:11px; padding: 5px;" id="annual_start_date"  placeholder="Start" name="annual_start_date" >
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3" >
                                            <label>Annual End Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control"  style="font-size:11px; padding: 5px;" placeholder="end date" id="annual_end_date" name="annual_end_date">
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3" >
                                            <label>Life Start Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text"  class="form-control" style="font-size:11px; padding: 5px;" id="life_start_date"  placeholder="Start" name="life_start_date">
                                            </div>
                                        </div> 
                                        <div class="form-group col-sm-3" >
                                            <label>Sign-up Type</label>
                                            <select class="form-control first" style="font-size:11px; padding: 5px;" name="source_of_application" id="source_of_application" >
                                                <option value="0">-Select-</option>
                                                <option value="Personal Sign-up (PSU)">Personal Sign-up (PSU)</option>
                                                <option value="Field - Personal Sign-up (F-PSU)">Field - Personal Sign-up (F-PSU)</option>
                                                <option value="Field - New Member Plan (F-NMP)">Field - New Member Plan (F-NMP)</option>
                                                <option value="Church Presentation Sign-up (PSU@CP)">Church Presentation Sign-up (PSU@CP)</option>
                                                <option value="Church Presentation Sign-up (F_PSU@CP)">Church Presentation Sign-up (F_PSU@CP)</option>
                                                <option value="Annual Membership Dinner (AMD)">Annual Membership Dinner (AMD)</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Credited to</label>
                                            <input type="text" id="cred_nfr_res_per_state" style="font-size:11px; padding: 5px;" class="form-control" name="cred_nfr_res_per_state">
                                        </div>
                                    </div>                                                          
                                    <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                        <div class="col-sm-9 form-group">  
                                            <button id="myButton" type="button" class="btn btn-primary editRowSubmit pull-right" >SUBMIT</button>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </form>	
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
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://editor.datatables.net/extensions/Editor/js/editor.bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.6/dist/loadingoverlay.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script>

                                                $('#event_date_cal0').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#date_of_birth').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#annual_start_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#annual_end_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#life_start_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#deceased_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

        </script>
        <script>
            function Signup() {
                if (document.frm_apply.status.value === "Deceased") {
                    document.getElementById("deceased_div").hidden = false;

                } else
                {
                    document.getElementById("deceased_div").hidden = true;
                    document.getElementById("deceased_date").value = "";

                }
            }
        </script>
        <script>

            $('#event_date_cal2').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });

        </script>
        <script>

            $('#event_date_cal1').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true,
                forceParse: false,
                autosize: true,
                changeMonth: true,
                changeYear: true
            });

        </script>
        <script>

            $('#event_date_cal7').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true,
                forceParse: false,
                autosize: true,
                changeMonth: true,
                changeYear: true
            });

        </script>
        <script>
            $(document).on('click', '.first', function (e) {
                e.preventDefault();
                if (document.frm_apply.mtype.value === "Auxiliary(TGII) Annual Member") {
                    document.getElementById("annual_start").hidden = false;
                    document.getElementById("annual_end").hidden = false;
                    document.getElementById("life_start").hidden = true;
                    document.getElementById("life_start_date").value = "";
                } else if (document.frm_apply.mtype.value === "Gideon(TGII) Annual Member") {
                    document.getElementById("annual_start").hidden = false;
                    document.getElementById("annual_end").hidden = false;
                    document.getElementById("life_start").hidden = true;
                    document.getElementById("life_start_date").value = "";
                } else if (document.frm_apply.mtype.value === "Auxiliary(TGII) Life Member")
                {
                    document.getElementById("annual_start").hidden = true;
                    document.getElementById("annual_end").hidden = true;
                    document.getElementById("life_start").hidden = false;
                    document.getElementById("anuual_start_date").value = "";
                    document.getElementById("anuual_end_date").value = "";
                } else if (document.frm_apply.mtype.value === "Gideon(TGII) Life Member")
                {
                    document.getElementById("annual_start").hidden = true;
                    document.getElementById("annual_end").hidden = true;
                    document.getElementById("life_start").hidden = false;
                    document.getElementById("anuual_start_date").value = "";
                    document.getElementById("anuual_end_date").value = "";
                }
            });
        </script>


        <script>
            $(document).on('click', '.editRowSubmit', function () {
                var mid = $("#mid").val();
                var name = $("#name").val();
                var address = $("#address").val();
                var address2 = $("#address2").val();
                var street = $("#street").val();
                var city = $("#city").val();
                var state = $("#state").val();
                var date_of_birth = $("#date_of_birth").val();
                var phone = $("#phone").val();
                var pincode = $("#pincode").val();
                var deceased_date = $("#deceased_date").val();
                var mobile2 = $("#mobile2").val();
                var mobile3 = $("#mobile3").val();
                var email = $("#email").val();
                var designation = $("#designation").val();
                var church = $("#church").val();
                var caddress = $("#caddress").val();
                var cemail = $("#cemail").val();
                var cmobile = $("#cmobile").val();
                var pastor_name = $("#pastor_name").val();
                var pastor_email = $("#pastor_email").val();
                var pastor_mobile = $("#pastor_mobile").val();
                var mtype = $("#mtype").val();
                var annual_start_date = $("#annual_start_date").val();
                var life_start_date = $("#life_start_date").val();
                var annual_end_date = $("#annual_end_date").val();
                var cred_nfr_res_per_state = $("#cred_nfr_res_per_state").val();
                var source_of_application = $("#source_of_application").val();
                var status = $("#status").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'single_trendsSave.jsp?action=Update&mid=' + mid + '&name=' + name + '&date_of_birth=' + date_of_birth + '&address=' + address + '&street=' + street + '&city=' + city + '&state=' + state + '&phone=' + phone + '&email=' + email + '&church=' + church + '&caddress=' + caddress + '&cemail=' + cemail + '&cmobile=' + cmobile + '&pastor_name=' + pastor_name + '&pastor_email=' + pastor_email + '&pastor_mobile=' + pastor_mobile + '&mtype=' + mtype + '&annual_start_date=' + annual_start_date + '&annual_end_date=' + annual_end_date + '&status=' + status + '&life_start_date=' + life_start_date + '&designation=' + designation + '&mobile2=' + mobile2 + '&mobile3=' + mobile3 + '&pincode=' + pincode + '&address2=' + address2 + '&deceased_date=' + deceased_date + '&source_of_application=' + source_of_application + '&cred_nfr_res_per_state=' + cred_nfr_res_per_state,
                        data: {"action": "Update", "mid": mid},
                        success: function (data) {
                            alert(data);
                            $('#myButton').show();
                            $("#mid").val('');
                            $("#region_name").val('');
                            $("#state_association").val('');
                            $("#area_name").val('');
                            $("#name").val('');
                            $("#date_of_birth").val('');
                            $("#address").val('');
                            $("#address2").val('');
                            $("#street").val('');
                            $("#city").val('');
                            $("#state").val('');
                            $("#pincode").val('');
                            $("#phone").val('');
                            $("#mobile2").val('');
                            $("#mobile3").val('');
                            $("#email").val('');
                            $("#marital_staus").val('');
                            $("#designation").val('');
                            $("#dob").val('');
                            $("#church").val('');
                            $("#caddress").val('');
                            $("#cemail").val('');
                            $("#cmobile").val('');
                            $("#pastor_name").val('');
                            $("#pastor_email").val('');
                            $("#pastor_mobile").val('');
                            $("#pastor_confirmation").val('');
                            $("#mtype").val('');
                            $("#deceased_date").val('');
                            $("#life_start_date").val('');
                            $("#annual_start_date").val('');
                            $("#annual_end_date").val('');
                            $("#wname").val('');
                            $("#hname").val('');
                            $("#wmobile").val('');
                            $("#wemail").val('');
                            $("#wdob").val('');
                            $("#status").val('');
                            $("#camp").val('');
                            $("#credential_addr").val('');
                            $("#physical_form_received").val('');
                            $("#cred_nfr_res_per_state").val('');
                            $("#source_of_application").val('0');
                        }
                    });
                }
            }
            );
        </script>
        <script>
            $(document).on('keyup', '#mid', function (e) {
                var mid = $("#mid").val();
                Signup();
                $("#myContainer").LoadingOverlay("show", {
                    background: "rgba(165, 190, 100, 0.5)"
                });
                $.ajax({
                    url: 'single_trendsEdit.jsp?action=Edit&mid=' + mid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#snackbar1").hide();
                        $("#res").show();
                        $('#mid1').val(data.mid);
                        $("#name").val(data.name);
                        $("#date_of_birth").val(data.date_of_birth);
                        $("#address").val(data.address);
                        $("#deceased_date").val(data.deceased_date);
                        $("#address2").val(data.address2);
                        $("#street").val(data.street);
                        $("#state_association").val(data.state_association);
                        $("#area_name").val(data.area_name);
                        $("#region_name").val(data.region_name);
                        $("#pincode").val(data.pincode);
                        $("#wname").val(data.wname);
                        $("#wmobile").val(data.wmobile);
                        $("#wemail").val(data.wemail);
                        $("#phone").val(data.phone);
                        $("#email").val(data.email);
                        $("#mobile2").val(data.mobile2);
                        $("#mobile3").val(data.mobile3);
                        $("#city").val(data.city);
                        $("#state").val(data.state);
                        $("#marital_status").val(data.marital_status);
                        $("#designation").val(data.designation);
                        $("#church").val(data.church);
                        $("#caddress").val(data.caddress);
                        $("#cemail").val(data.cemail);
                        $("#cmobile").val(data.cmobile);
                        $("#pastor_name").val(data.pastor_name);
                        $("#pastor_email").val(data.pastor_email);
                        $("#pastor_mobile").val(data.pastor_mobile);
                        $("#business_name").val(data.business_name);
                        $("#nature_of_job").val(data.nature_of_job);
                        $("#qualification").val(data.qualification);
                        $("#qualification_others").val(data.qualification_others);
                        $("#mtype").val(data.mtype);
                        $("#life_start_date").val(data.life_start_date);
                        $("#annual_start_date").val(data.annual_start_date);
                        $("#annual_end_date").val(data.annual_end_date);
                        $("#cred_nfr_res_per_state").val(data.cred_nfr_res_per_state);
                        $("#source_of_application").val(data.source_of_application);
                        $("#status").val(data.status);
                        $("#camp").val(data.camp);
                        Signup();
                    }
                }).done(function () {
                    $("#myContainer").LoadingOverlay("hide", true);
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