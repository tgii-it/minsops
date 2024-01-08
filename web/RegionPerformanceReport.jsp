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

    String useraccessno = session.getAttribute("useraccessno").toString();
    String username1 = "";
    String useraccessno1 = "";
    String mobile1 = "";
    String email1 = "";
    String email = "";
    String designation1 = "";
    String orbitid1 = "";
    String camp = "";

    String v_sa = request.getParameter("stateasso");
    String v_area_region = request.getParameter("region");

    if (v_sa == null || v_sa.isEmpty()) {
        v_sa = "";
    }

    if (v_area_region == null || v_area_region.isEmpty()) {
        v_area_region = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=v_sa%> &nbsp; Region <%=v_area_region%> Performance</title>

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

        <script type="text/javascript">
            function getXMLHttpRequest() {
                var xmlHttpReq;
                if (window.XMLHttpRequest) {
                    xmlHttpReq = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    try {
                        xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (exp1) {
                        try {
                            xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (exp2) {
                            alert("Exception in getXMLHttpRequest()!");
                        }
                    }
                }
                return xmlHttpReq;
            }

            // function loadStateAsso() {
            //     var xmlHttpRequest = getXMLHttpRequest();
            //     xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
            //    xmlHttpRequest.open("POST", "LoadStateAssociationRegion", true);
            //     xmlHttpRequest.send();
            // }
            function getRegions(src) {
                var sele = document.getElementById("region");
                var item = src.options[src.selectedIndex];

                if (item.value !== "-State Association-")
                {
                    var xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
                    xmlHttpRequest.open("POST", "LoadStateAssociationRegion?type=region&data=" + item.value, true);
                    xmlHttpRequest.send();
                    sele.options.length = 1;

                } else if (item.value === "-State Association-")
                {
                    sele.options.length = 1;
                }
            }
            function getReadyStateHandler(xmlHttpRequest) {
                return function () {
                    if (xmlHttpRequest.readyState === 4) {
                        if (xmlHttpRequest.status === 200) {
                            var a = xmlHttpRequest.responseText.split(",");

                            if (a[0] === "1") {

                                for (i = 1; i < a.length; i++) {
                                    var select = document.getElementById("stateasso");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                            if (a[0] === "2") {

                                for (i = 1; i < a.length; i++) {

                                    var select = document.getElementById("region");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                        }
                        // else {
                        //     alert("Http error " + xmlHttpRequest.status + ":" + xmlHttpRequest.statusText);
                        //  }
                    }
                };
            }
        </script>
        <script>
            function FrontPage_Form1_Validator(theForm)
            {
                if (theForm.stateasso.value === "0")
                {
                    alert("Please select State Association");
                    theForm.stateasso.focus();
                    return (false);
                }
                if (theForm.region.value === "0")
                {
                    alert("Please select Region");
                    theForm.region.focus();
                    return (false);
                }
                return (true);
            }
        </script>
    </head>
    <body style="background-color: #fff;">
        <%@ include file="menu.jsp" %>
        <section class="container-fluid" style="padding: 60px 2px;" >
            <form name="frm2" method="post" action="RegionPerformanceReport.jsp" onsubmit="return FrontPage_Form1_Validator(this)">     
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-body" style="padding-top: 20px;"> 
                        <div class="form-row">                                       
                            <div class="form-group col-md-4">
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </span>
                                    <select class="form-control" name="stateasso" id="stateasso" onchange="getRegions(this)" required>
                                        <option value="0">- Select State Association -</option>
                                        <option value="SA1 (Tamil Nadu)">SA1 (Tamil Nadu)</option>
                                        <option value="SA2 (Kerala)">SA2 (Kerala)</option>
                                        <option value="SA3 (Karnataka and Goa)">SA3 (Karnataka and Goa)</option>
                                        <option value="SA4 (Andhra Pradesh)">SA4 (Andhra Pradesh)</option>
                                        <option value="SA5 (Telangana)">SA5 (Telangana)</option>
                                        <option value="SA6 (Madhya Pradesh and Chattisgarh)">SA6 (Madhya Pradesh and Chattisgarh)</option> 
                                        <option value="SA7 (Maharashtra and Gujarat)">SA7 (Maharashtra and Gujarat)</option> 
                                        <option value="SA8 (Rajasthan Delhi Punjab Haryana HP Ladakh Jammu Kashmir)">SA8 (Rajasthan Delhi Punjab Haryana HP Ladakh Jammu Kashmir)</option> 
                                        <option value="SA9 (Uttar Pradesh and Uttarakhand)">SA9 (Uttar Pradesh and Uttarakhand)</option> 
                                        <option value="SA10 (Bihar and Jharkhand)">SA10 (Bihar and Jharkhand)</option> 
                                        <option value="SA11 (Orissa West Bengal and Sikkim)">SA11 (Orissa West Bengal and Sikkim)</option> 
                                        <option value="SA12 (Mizoram Tripura Meghalaya and Lower Assam)">SA12 (Mizoram Tripura Meghalaya and Lower Assam)</option>
                                        <option value="SA13 (Arunachal Pradesh Nagaland Manipur and Upper Assam)">SA13 (Arunachal Pradesh Nagaland Manipur and Upper Assam)</option>
                                        <option value="OS (Outreach States)">OS (Outreach States)</option>
                                    </select>
                                </div>                                            
                            </div>                                      
                            <div class="form-group col-md-4">
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </span>
                                    <select class="form-control" name="region" id="region" required="">
                                        <option value="0">- Select Region -</option>
                                    </select>

                                </div>                                            
                            </div>                                       
                            <div class="form-group col-md-4 pull-right">
                                <div class='input-group'>
                                    <input type="submit" class="btn btn-primary" id="submit-btn" value="Proceed">
                                </div>                                            
                            </div>                                         
                        </div>                                    
                        <div id="snackbar"></div>
                    </div>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#summary_tab" style="font-size: 12px; font-weight: bold;"><%=v_sa%>&nbsp;Region : <%= v_area_region%> -:- Summary</a></li>
                    <li><a data-toggle="tab" href="#detailed_tab" style="font-size: 12px; font-weight: bold;"><%=v_sa%>&nbsp;Region : <%= v_area_region%> -:- Detailed</a></li>

                    <!--<li class="dropdown"><a href="#detailed_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Download &nbsp; <span class="caret"></span></a>
                        <ul class="dropdown-menu dmenu">
                            <li><a href="DownloadRegionPerformanceSummaryReport.jsp?stateasso=<%=v_sa%>&region=<%=v_area_region%>&exportToExcel=YES">Summary Report</a></li>
                            <li><a href="DownloadRegionPerformanceDetailedReport.jsp?stateasso=<%=v_sa%>&region=<%=v_area_region%>&exportToExcel=YES">Detailed Report</a></li>
                        </ul>
                    </li>-->
                </ul>
                <div class="tab-content">
                    <div id="summary_tab" class="tab-pane fade in active">
                        <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 480px; background-color: #fff; overflow-y: scroll;">
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

                                        <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance</th> 
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

                                        <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance</th> 
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

                                    String display_sa = "";
                                    String sql = "";
                                    DataSource ds = null;
                                    Connection con = null;
                                    Context context = new InitialContext();
                                    Context envCtx = (Context) context.lookup("java:comp/env");
                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                    try {
                                        con = ds.getConnection();
                                        Statement statement = con.createStatement();
                                        // sql = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0',region)),to_number(decode(area,'Region_Total','0',area))) Area_Director,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                        //         + "a.* from E503_STATE_Summary_Report a where sa_no=nvl(trim(substr('" + v_sa + "',3,2)),'14') and region='" + v_area_region + "' order by sa_no,region,area";
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
                                                + "a.* from STATE_SUMMARY_REPORT_C_2021_22  a where sa_no=nvl(trim(substr('" + v_sa + "',3,2)),'14') and region='" + v_area_region + "' order by sa_no,region,area";

                                        ResultSet resultSet = statement.executeQuery(sql);
                                        while (resultSet.next()) {
                                            display_sa = resultSet.getString("sa_no");

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

                                            if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                %>
                                <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                    <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
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
                                    <td style="text-align: left;" nowrap><%=resultSet.getString("Area_Director")%></td>
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
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </table>                                
                        </div>
                    </div>
                    <div id="detailed_tab" class="tab-pane fade">
                        <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 480px; background-color: #fff; overflow-y: scroll;">
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
                                        <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp Name</th>  

                                        <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                        <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                        <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                        <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                        <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                        <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                        <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                        <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance</th> 
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

                                        <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance</th> 
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
                                    String display_camp = "";
                                    display_sa = "";
                                    sql = "";
                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                    try {
                                        con = ds.getConnection();
                                        Statement statement = con.createStatement();
                                        //  sql = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,a.* from E503_STATE_REPORT_TBL a "
                                        //        + "where sa_no=nvl(trim(substr('" + v_sa + "',3,2)),'14') and region='" + v_area_region + "' order by sa_no,region,area,camp";

                                        sql = "select "
                                                + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                //  + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                // + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                + "a.* from STATE_Detailed_Report_21_22fa a "
                                                + "where sa_no=nvl(trim(substr('" + v_sa + "',3,2)),'14') and region='" + v_area_region + "' order by sa_no,region,area,camp";
                                        ResultSet resultSet = statement.executeQuery(sql);
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

                                            if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                %>
                                <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                    <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
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
                                    <td style="text-align: left;" nowrap><%=display_camp%></td>
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
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </table>                                
                        </div>
                    </div>
                </div>
            </form>
        </section>

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