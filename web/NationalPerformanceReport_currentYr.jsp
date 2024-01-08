<%@page import="java.text.DecimalFormat"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String username = "";
    String useraccessno = "";
    String mobile = "";
    String email = "";
    String designation = "";

    String username1 = "";
    String useraccessno1 = "";
    String mobile1 = "";
    String email1 = "";
    String designation1 = "";
    String orbitid1 = "";
    String camp = "";

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
        v_sa_display = "O S : ";
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
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>National Performance Report</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
            .nav-tabs > li.active > a {
                background-color: #ffe114 !important;
                color: #01354a;
                border: medium none;
                border-radius: 0;
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

        <script>
            function show_confirm()
            {
                var r = confirm("Are you sure 'Do you want to process the selected record(s)' ?");
                if (r === true)
                {
                    $("#final-submit").hide();
                    $("#snackbar").show();
                    $("#snackbar").html('<p style="width:100%; height: 50px; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                    return true;
                } else
                {
                    $("#final-submit").show();
                    $("#snackbar").hide();
                    return false;
                }
            }

            function validateCheckbox(f)
            {
                var payStatus = $("#payStatus").val();
                payStatus = payStatus.trim();
                var paymentdate = $("#paymentdate").val();
                paymentdate = paymentdate.trim();
                var remarks = $("#remarks").val();
                remarks = remarks.trim();

                var checked = false, e, i = 0;
                while (e = f.elements[i++]) {
                    if (e.type === 'checkbox' && e.checked)
                        checked = true;
                }

                if (!checked) {
                    $("#snackbar").hide();
                    $("#final-submit").show();
                    alert("Please Select a Record To Process!");
                } else if (paymentdate === '') {
                    alert("Select Payment Date ");
                    $("#paymentdate").focus();
                    return false;
                } else if (remarks === '' || remarks === null) {
                    alert("Enter Remarks ");
                    $("#remarks").focus();
                    return false;
                } else {
                    checked = show_confirm();
                }
                return checked;

            }

            function selectToggle(toggle, form) {
                var myForm = document.forms[form];
                for (var i = 0; i < myForm.length; i++) {
                    if (toggle) {
                        myForm.elements[i].checked = "checked";
                    } else {
                        myForm.elements[i].checked = "";
                    }
                }
            }
            function genPDF() {
                document.frm1.btnSubmit.disabled = 'false';
            }
        </script>
    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;" > 
        <%@ include file="menu.jsp" %>
        <section class="container-fluid" style="padding: 60px 2px;">
            <div class="panel-heading" style="background-color: #fff;">
                <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                    <i class="fa fa-fw fa-share"></i> National Performance Reports
                </h3>
            </div>
            <ul class="nav nav-tabs" style="padding-top: 10px;">
                <li class='active'><a data-toggle="tab" href="#PY2023-24" style="font-size: 12px; font-weight: bold;">2023-24</a></li>
                <!--<li><a data-toggle="tab" href="#PY2022_23" style="font-size: 12px; font-weight: bold;">2022-23</a></li>-->
                <li class="dropdown"><a href="#" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Download &nbsp; <span class="caret"></span></a>
                    <ul class="dropdown-menu dmenu">
                        <li><a href="DownloadNationalPerformanceSummaryReport_2023_24.jsp?exportToExcel=YES">2023-24 Performance Report</a></li> 
                    </ul>
                </li>   
            </ul>
            <div class="tab-content">
                <div id="PY2023-24" class="tab-pane fade in active">
                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 590px; background-color: #fff; overflow-y: scroll; padding-left: 10px; padding-right:10px;">
                        <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: blue;"><b>Note :</b>This report is as on &nbsp;<b><%=report_as_on%></b></p>
                        <table id="2023_24" class="table table-bordered table-responsive table-hover">
                            <thead style="background-color: #01354a; color: #ffe114;">   
                                <tr>
                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" hidden>&nbsp;</th>
                                    <th colspan="3" style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                    <th colspan="8" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
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
                                    <th colspan="8" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                </tr>                                                          
                                <tr>    
                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" hidden>Sl_No</th>
                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Zone</th>
                                    <th style="text-align: right; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>State<br>Association</th> 
                                    <th style="text-align: right; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>No of<br>Camps</th>  

                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped + In_Transit)</th>  
                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 Jan 2024</th> 
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
                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Yet to renew</th>           
                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> 

                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual<br>(A)</th> 
                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Suspense_Fund<br>(B)</th>
                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;">PWT<br>Scripture_Fund<br>(C)</th>
                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Total<br>Scripture_Fund<br>&nbsp;<br>( A + B + C )</th> 
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

                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total<br>Events</th>
                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Events</th>
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
                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped + In_Transit)</th>  
                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>001 Jan 2024</th> 
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
                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Yet to renew</th>           
                                    <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> 

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
                            <tbody>
                                <%
                                    String sql = "";
                                    String display_sa = "";
                                    String display_zone = "";
                                    int slno = 0;
                                    String ffr_cnt = "";
                                    String pab_cnt = "";
                                    DecimalFormat f = new DecimalFormat("##");
                                    try {
                                        conn = ds.getConnection();
                                        stmt = conn.createStatement();
                                        sql = "select rownum slno,nvl(pwt_sf,'0') pwt_sf,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,gid_ytr,aux_ytr,"
                                                //                                                + "nvl((select gid_ytr from V_RENEWAL_DASHBOARD_DYNAMIC_VALUES_NAT_PERF_REPORT_VALUES_1 where zone=decode(a.zone,'OS','7',a.zone) and sa_no=decode(a.sa_no,'Zone_Total','17',a.sa_no)),'0') gid_ytr ,"
                                                //                                                + "nvl((select aux_ytr from V_RENEWAL_DASHBOARD_DYNAMIC_VALUES_NAT_PERF_REPORT_VALUES_1 where zone=decode(a.zone,'OS','7',a.zone) and sa_no=decode(a.sa_no,'Zone_Total','17',a.sa_no)),'0') aux_ytr,"
                                                //                                                + "nvl((select gid_ytr from v_MEMBERSHIP_WEEKLY_RAW_dropped_members_28April2022_5 where zone=a.zone and sa_no=decode(a.sa_no,'17','Zone_Total',a.sa_no) and rownum<2),'0') gid_ytr,"
                                                //                                                + "nvl((select aux_ytr from v_MEMBERSHIP_WEEKLY_RAW_dropped_members_28April2022_5 where zone=a.zone and sa_no=decode(a.sa_no,'17','Zone_Total',a.sa_no) and rownum<2),'0') aux_ytr,"
                                                + "nvl((select friends from Friends_NPR_Dec_2023_24_final where zone=a.zone and sa_no=a.sa_no),'0') friends,"
                                                + "nvl((select friends from PAB_NPR_Dec_2023_24_final where zone=a.zone and sa_no=a.sa_no),'0') pab_cnt1,"
                                                + "nvl((select friends from Ffr_NPR_Dec_2023_24_final where zone=a.zone and sa_no=a.sa_no),'0') ffr_cnt1,"
                                                + "(SELECT EMI_GID FROM v_renewal_dashboard_dynamic_values_tbl_3 WHERE ZONE = A.ZONE AND SA_NO = A.SA_NO and rownum<2) EMI_GID,"
                                                + "(SELECT EMI_AUX FROM v_renewal_dashboard_dynamic_values_tbl_3 WHERE ZONE=A.ZONE AND SA_NO = A.SA_NO and rownum<2) EMI_AUX,"
                                                + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) g_nm_per,"
                                                + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) a_nm_per,"
                                                //                                                + "round(case when new_nm_goal_alex_02March2023>0 then round(100*(g_nm/new_nm_goal_alex_02March2023),2) else 0 end,0) g_nm_per,"
                                                + "round(case when Memberships_Aux_Op_Bal>0 then round(100*((Aux_Renewed1)/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                                + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*((Gideon_Renewed1)/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                                + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,nvl(overall_sf,'0') total_sf,round(case when total_sf_goal>0 then round(100*((nvl(overall_sf,'0'))/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,nvl(pwt_sf,'0') pwt_sf,"
                                                + "a.* from V_E503_NATIONAL_SUM_REPORT_B2 a order by decode(zone,'OS','7',zone) asc,sa_no";

//                                        System.out.println("National Performance Report 2023_24 : " + sql);
                                        ResultSet resultSet = stmt.executeQuery(sql);
                                        while (resultSet.next()) {
                                            display_sa = resultSet.getString("sa_no");
                                            pab_cnt = resultSet.getString("pab_cnt1");
                                            ffr_cnt = resultSet.getString("ffr_cnt1");
                                            slno = resultSet.getInt("slno");
                                            double gytr = resultSet.getInt("gid_ytr");
                                            double aytr = resultSet.getInt("aux_ytr");
                                            double tgideon = resultSet.getInt("Total_Gideon");
                                            double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                            double tgytr = (tgideon - gytr);
                                            double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                            double taux = resultSet.getInt("Total_Auxiliary");
                                            double taytr = (taux - aytr);

                                            System.out.println(display_sa + " : " + tgytr + " = " + tgideon + " - " + gytr);

                                            double pgytr = 0;
                                            double paytr = 0;

                                            if (ffr_cnt == null) {
                                                ffr_cnt = "0";
                                            }
                                            if (pab_cnt == null) {
                                                pab_cnt = "0";
                                            }

                                            if (tgid_goal != 0) {
                                                pgytr = 100 * (tgytr / tgid_goal);
                                            }
                                            if (taux_goal != 0) {
                                                paytr = 100 * (taytr / taux_goal);
                                            }

                                            //    System.out.println("tgid_goal " + tgid_goal + " tgideon" + tgideon + " gytr" + gytr + " tgytr" + tgytr + " pgytr" + pgytr);
                                            //    System.out.println("taux_goal " + taux_goal + " taytr" + taytr + " paytr" + paytr);
                                            if (display_sa.equalsIgnoreCase("1")) {
                                                display_sa = "S A - 1";
                                            } else if (display_sa.equalsIgnoreCase("2")) {
                                                display_sa = "S A - 2";
                                            } else if (display_sa.equalsIgnoreCase("3")) {
                                                display_sa = "S A - 3";
                                            } else if (display_sa.equalsIgnoreCase("4")) {
                                                display_sa = "S A - 4";
                                            } else if (display_sa.equalsIgnoreCase("5")) {
                                                display_sa = "S A - 5";
                                            } else if (display_sa.equalsIgnoreCase("6")) {
                                                display_sa = "S A - 6";
                                            } else if (display_sa.equalsIgnoreCase("7")) {
                                                display_sa = "S A - 7";
                                            } else if (display_sa.equalsIgnoreCase("8")) {
                                                display_sa = "S A - 8";
                                            } else if (display_sa.equalsIgnoreCase("9")) {
                                                display_sa = "S A - 9";
                                            } else if (display_sa.equalsIgnoreCase("11")) {
                                                display_sa = "S A - 11";
                                            } else if (display_sa.equalsIgnoreCase("12")) {
                                                display_sa = "S A - 12";
                                            } else if (display_sa.equalsIgnoreCase("13")) {
                                                display_sa = "S A - 13";
                                            } else if (display_sa.equalsIgnoreCase("14")) {
                                                display_sa = "OS";
                                            } else if (display_sa.equalsIgnoreCase("17")) {
                                                display_sa = "OS";
                                            } else if (display_sa.equalsIgnoreCase("15")) {
                                                display_sa = "Other Contributions";
                                            }

                                            if (resultSet.getString("zone").equalsIgnoreCase("8")) {
                                                display_zone = "OC";
                                            } else if (resultSet.getString("zone").equalsIgnoreCase("7")) {
                                                display_zone = "OS";
                                            } else if (resultSet.getString("zone").equalsIgnoreCase("OS")) {
                                                display_zone = "OS";
                                            } else {
                                                display_zone = "Zone " + resultSet.getString("zone");
                                            }

                                            if (resultSet.getString("zone").equalsIgnoreCase("National_Total")) {
                                %>
                                <tr style="background-color: #01354a; font-weight: bold; font-size: 11px; color: rgb(255, 225, 20);">
                                    <td hidden><%=slno%></td>
                                    <td></td>
                                    <td style="text-align: right;">National Total&nbsp; </td>
                                    <%
                                    } else if (resultSet.getString("sa_no").equalsIgnoreCase("Zone_Total")) {
                                    %>
                                <tr style="background-color: #F0FFFF; font-weight: bold; color: navy;">
                                    <td hidden><%=slno%></td>
                                    <td></td>
                                    <td style="text-align: right;" nowrap><%=display_zone%>&nbsp; Total&nbsp;</td>
                                    <%
                                    } else if (resultSet.getString("sa_no").equalsIgnoreCase("15")) {
                                    %>
                                <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">
                                    <td hidden><%=slno%></td>
                                    <td></td>
                                    <td style="text-align: right;" nowrap>Other Contributions</td>
                                    <%
                                    } else if (resultSet.getString("sa_no").equalsIgnoreCase("16")) {
                                    %>
                                <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">
                                    <td hidden><%=slno%></td>
                                    <td></td>
                                    <td style="text-align: right;" nowrap>National Suspense A/c</td>
                                    <%
                                    } else {
                                    %>
                                <tr style="color: navy;">
                                    <td hidden><%=slno%></td>
                                    <td style="text-align: center;" nowrap><%=display_zone%></td>
                                    <td style="text-align: right;" nowrap><%=display_sa%></td>
                                    <%
                                        }
                                    %>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("no_of_camps")%></td>
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
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("EMI_GID")%></td>  

                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Gid_New_Member_goal")%></td>  
                                    <!--<td style="text-align: center;" nowrap><%=resultSet.getString("new_nm_goal_alex_02March2023")%></td>-->  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_per")%>&nbsp;%</td>

                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td> 
                                    <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                    <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                    <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> 

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sa_suspense")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("pwt_sf")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf")%></td>
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

                                    <td style="text-align: right;" nowrap><%=pab_cnt%></td> 
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                    <td style="text-align: right;" nowrap><%=ffr_cnt%></td> 
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
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("EMI_AUX")%></td>  

                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_New_Member_goal")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_per")%>&nbsp;%</td>  

                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                    <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                    <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                    <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> 

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
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </tbody>
                        </table>                                
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
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
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