<%@page import="java.text.DecimalFormat"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String useraccessname = "";
    String userName = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
        userName = session.getAttribute("useraccessname").toString();
    }

    String v_sa_no = request.getParameter("StateAsso");
    String v_sa_display = request.getParameter("StateAsso");

    if (v_sa_no
            == null) {
        v_sa_no = "";
    }

    if (v_sa_no.equalsIgnoreCase(
            "14")) {
        v_sa_display = "OS";
    } else if (v_sa_no.equalsIgnoreCase(
            "1")) {
        v_sa_display = "SA 1 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "2")) {
        v_sa_display = "SA 2 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "3")) {
        v_sa_display = "SA 3 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "4")) {
        v_sa_display = "SA 4 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "5")) {
        v_sa_display = "SA 5 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "6")) {
        v_sa_display = "SA 6 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "7")) {
        v_sa_display = "SA 7 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "8")) {
        v_sa_display = "SA 8 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "9")) {
        v_sa_display = "SA 9 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "10")) {
        v_sa_display = "SA 10 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "11")) {
        v_sa_display = "SA 11 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "12")) {
        v_sa_display = "SA 12 : ";
    } else if (v_sa_no.equalsIgnoreCase(
            "13")) {
        v_sa_display = "SA 13 : ";
    }

    String sql1 = "";
    String report_as_on = "";

    DataSource ds = null;
    Connection conn = null;
    ResultSet result = null;
    Statement stmt = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");

    try {
        conn = ds.getConnection();
        stmt = conn.createStatement();
        sql1 = "SELECT date_time FROM REPORT_GENERATED_LOG WHERE id in (select max(id) from REPORT_GENERATED_LOG) ORDER BY ID DESC";
        ResultSet resultSet = stmt.executeQuery(sql1);
        while (resultSet.next()) {
            report_as_on = resultSet.getString("date_time");
            if (report_as_on == null) {
                report_as_on = "Area Total";
            }
        }
        resultSet.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGI India | State Performance Reports</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.3.1/css/fixedColumns.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"> 
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <style>            
            html, body {
                height: 100%;
                width: 100%;
            }
            .fill-height {
                min-height: 100%;
                min-width: 100%;
                height:auto !important; /* cross-browser */
                width: 100%; 
                width: auto !important;
                height: 100%; /* cross-browser */
            }
            .tab-content{
                padding: 3px;
                background: #fdfdfd;
                line-height: 15px;
                border: 1px solid #ddd;
                border-top:5px solid #ffe114;
                border-bottom:5px solid #ffe114;
            }
            .chip {
                display: inline-block;
                padding: 0 25px;
                height: 30px;
                font-size: 11px;
                line-height: 30px;
                border-radius: 25px;
                background-color: #f1f1f1;
            }
            .chip img {
                float: left;
                margin: 0 10px 0 -25px;
                height: 30px;
                width: 30px;
                border-radius: 50%;
            }
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

            .tab-content{
                padding: 3px;
                background: #fdfdfd;
                line-height: 15px;
                border: 1px solid #ddd;
                border-top:5px solid #ffe114;
                border-bottom:5px solid #ffe114;
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

            th, td { white-space: nowrap; }
            div.dataTables_wrapper {
                margin: 0 auto;
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
                width:98%;
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
            .nav-tabs > li.active > a {
                background-color: #ffe114 !important;
                color: #01354a;
                border: medium none;
                border-radius: 0;
            }
        </style>
    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;" > 
        <%@ include file="menu.jsp" %>
        <section class="container-fluid" style="padding: 60px 2px;" >
            <div class='panel panel-default panel-accent-gold'>
                <div class="panel-heading" style="background-color: #fff;">
                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                        <i class="fa fa-fw fa-share"></i>&nbsp; <%=v_sa_display%> Performance Report
                    </h3>
                </div>
                <div class="panel-body" style="padding-top: 10px; width: 100%"> 
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2021-22">2021 - 22</a></li>
                        <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2020-21">2020 - 21</a></li>
                        <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2019-20">2019 - 20</a></li>
                        <li class="dropdown"><a href="#detailed_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Download &nbsp; <span class="caret"></span></a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="DownloadStatePerformanceSummaryReport_2021_22.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2021-22 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2021_22.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2021-22 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2021_22.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2021-22 In-Active Camps Report</a></li>
                                <li class="divider"></li>
                                <li><a href="DownloadStatePerformanceSummaryReport_2020_21.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2020-21 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2020_21.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2020-21 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2020_21.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2020-21 In-Active Camps Report</a></li>
                                <li class="divider"></li>
                                <li><a href="DownloadStatePerformanceSummaryReport_2019_20.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2019-20 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2019_20.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2019-20 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2019_20.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2019-20 In-Active Camps Report</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="PY2021-22" class="tab-pane fade in active">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2021-22">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2021-22">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2021-22">In-Active</a></li>
                            </ul>
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: blue;"><b>Note :</b> This report is as on <%= report_as_on%></p>
                            <div class="tab-content">
                                <div id="s2021-22" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="5"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>                                      
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camps</th>  

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 May 2022</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Received</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>EMI</th>   

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AME+Field)</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--  <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                      <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>  -->

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                                    <th style="text-align: left;  background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Auxiliary Area Director</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 May 2022</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Received</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>      
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>EMI</th>     

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AMD+Field)</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>                                  

                                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--  <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                      <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>   -->                                   

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead>
                                            <%
                                                String display_sa = "";
                                                String sql = "";
                                                String Area_Director = "";
                                                String Aux_Area_Director = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    DecimalFormat f = new DecimalFormat("##");

                                                    sql = "select no_of_camps,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo, "
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            // + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed1/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            //  + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Area_Director,"
                                                            + "Get_Aux_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Aux_Area_Director,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_SUMMARY_REPORT_C_2021_22  a where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";
                                                    System.out.println("State Performance Summary Report " + sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");
                                                        Aux_Area_Director = resultSet.getString("Aux_Area_Director");

                                                        double gytr = resultSet.getInt("gid_ytr");
                                                        double aytr = resultSet.getInt("aux_ytr");
                                                        double tgideon = resultSet.getInt("Total_Gideon");
                                                        double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                                        double tgytr = (tgideon - gytr);
                                                        double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                                        double taux = resultSet.getInt("Total_Auxiliary");
                                                        double taytr = (taux - aytr);

                                                        double pgytr = 0;
                                                        double paytr = 0;

                                                        if (tgid_goal != 0) {
                                                            pgytr = 100 * (tgytr / tgid_goal);
                                                        }
                                                        if (taux_goal != 0) {
                                                            paytr = 100 * (taytr / taux_goal);
                                                        }

                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura Meghalaya and Lower Assam)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland Manipur and Upper Assam)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }

                                                        if (Aux_Area_Director == null || Aux_Area_Director == "") {
                                                            Aux_Area_Director = "-";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp;(C)&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_emi")%></td>                                 

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                              <!--  <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td  nowrap><%=Aux_Area_Director%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_emi")%></td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                            <!--    <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                                              
                                    </div>
                                </div>

                                <div id="d2021-22" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="6"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>                                                         
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp_Name</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Status</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Metro</th> 

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 May 2022</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Received</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>EMI</th>   

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AME+Field)</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--   <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                       <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> --> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 May 2022</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Received</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>      
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>EMI</th>     

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AMD+Field)</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>                                  

                                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--   <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                       <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>     -->                                 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead> 
                                            <%
                                                String display_camp = "";
                                                display_sa = "";
                                                String camp_status = "";
                                                String camp_type = "";
                                                sql = "";
                                                DecimalFormat f = new DecimalFormat("##");
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select (select status from camps_master where upper(camp)=upper(a.camp)) camp_status,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                                            + "(select decode(type,'EM','Emerging Metro','RG','ReGrow Metro','RV','Revive Metro','METRO','Metro','','--') from camps_master where upper(camp)=upper(a.camp)) camp_type,"
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            //  + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when (Aux_Renewed1>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed1/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            // + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_Detailed_Report_21_22fa a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',a.region)>0 order by sa_no,a.region,area,camp";
                                                    //     System.out.println("State Detailed Report " + sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        camp_status = resultSet.getString("camp_status");
                                                        camp_type = resultSet.getString("camp_type");

                                                        double gytr = resultSet.getInt("gid_ytr");
                                                        double aytr = resultSet.getInt("aux_ytr");
                                                        double tgideon = resultSet.getInt("Total_Gideon");
                                                        double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                                        double tgytr = (tgideon - gytr);
                                                        double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                                        double taux = resultSet.getInt("Total_Auxiliary");
                                                        double taytr = (taux - aytr);

                                                        double pgytr = 0;
                                                        double paytr = 0;

                                                        if (tgid_goal != 0) {
                                                            pgytr = 100 * (tgytr / tgid_goal);
                                                        }
                                                        if (taux_goal != 0) {
                                                            paytr = 100 * (taytr / taux_goal);
                                                        }

                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (camp_status == null) {
                                                            camp_status = "--";
                                                        }
                                                        if (camp_type == null) {
                                                            camp_type = "--";
                                                        }
                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td  nowrap><%=camp_status%></td>
                                                <td  nowrap><%=camp_type%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_emi")%></td>                                 

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                              <!--  <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_emi")%></td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                             <!--   <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2021-22" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>   

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance as on<br>01 May 2022</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>( A + B )</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance as on<br>01 May 2022</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>     
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>( A + B )</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>                                    

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Per %</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select (nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed1/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,"
                                                            + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,"
                                                            + "round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,"
                                                            + "round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,"
                                                            + "round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,"
                                                            + "round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_INACTIVE_REPORT_C_2021_22 a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";
                                                    System.out.println(sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>


                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>                                                

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 2020 - 21 Performance year report -->
                        <div id="PY2020-21" class="tab-pane fade">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2020-21">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2020-21">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2020-21">In-Active</a></li>
                            </ul>
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: #337ab7;"><b>Note :</b> Final report of PY 2020-21</p>
                            <div class="tab-content">
                                <div id="s2020-21" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead>
                                            <%
                                                display_sa = "";
                                                sql = "";
                                                Area_Director = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select no_of_camps,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            // + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            //  + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Area_Director,"
                                                            + "Get_Aux_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Aux_Area_Director,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_SUMMARY_REPORT_C_2020_21_FINAL  a where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");

                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp(C)&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="d2020-21" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: scenter; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select "
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            //  + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            // + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_DETAILED_REPORT_20_21FA_FINAL a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',a.region)>0 order by sa_no,a.region,area,camp";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2020-21" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();

                                                    sql = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,"
                                                            + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,"
                                                            + "round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,"
                                                            + "round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,"
                                                            + "round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,"
                                                            + "round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_INACTIVE_REPORT_C_2020_21_FINAL a "
                                                            + "where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 2019 - 20 Performance year report -->
                        <div id="PY2019-20" class="tab-pane fade">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2019-20">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2019-20">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2019-20">In-Active</a></li>
                            </ul>
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: #337ab7;"><b>Note :</b> Final report of PY 2019-20</p>
                            <div class="tab-content">
                                <div id="s2019-20" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead>
                                            <%
                                                display_sa = "";
                                                sql = "";
                                                Area_Director = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select * from State_Performance_Report_S_19 where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");

                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp(C)&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="d2019-20" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select * from State_Performance_Report_D_19 "
                                                            + "where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area,camp";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2019-20" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select * from State_Performance_Report_IA_19 a where sa_no='" + v_sa_no + "' order by sa_no,a.region,area,camp";
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (display_sa.equalsIgnoreCase("1")) {
                                                            display_sa = "SA1 (Tamil Nadu)";
                                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                                            display_sa = "SA2 (Kerala)";
                                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                                            display_sa = "SA3 (Karnataka and Goa)";
                                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                                            display_sa = "SA4 (Andhra Pradesh)";
                                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                                            display_sa = "SA5 (Telangana)";
                                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                                            display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                                            display_sa = "SA7 (Maharashtra and Gujarat)";
                                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                                            display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                                            display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                                            display_sa = "SA10 (Bihar and Jharkhand)";
                                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                                            display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                                            display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                                            display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                                        } else if (display_sa.equalsIgnoreCase("14")) {
                                                            display_sa = "OS (Outreach States)";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </section>
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
        <!--<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>-->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#summary').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#detailed').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#summary202021').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#detailed202021').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
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