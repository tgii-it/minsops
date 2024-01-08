<%-- 
    Document   : renewals
    Created on : Mar 7, 2019, 12:52:55 PM
    Author     : Anbalagan
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    
    String designation = session.getAttribute("designation").toString();
    String useraccessname = session.getAttribute("useraccessname").toString();
    String useraccessno = session.getAttribute("useraccessno").toString();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | PG Renewal Transactions</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">
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
            <!--<a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-My_Details">
                <i class="glyphicon glyphicon-briefcase"></i>&nbsp; My Dashboard
            </a>
            <a href="PendingRenewals.jsp" class="list-group-item active" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Pending Renewal
            </a>
            <a href="Renewed.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Renewal Request Processed
            </a>
            <a href="RenewalMis.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Camp Direct Renewals 
            </a>
            <a href="CompleteMembershipReoprt.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Complete Camp Report
            </a>
            <a href="memList.jsp" class="list-group-item " id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; List of Members/Officers
            </a>
            <a href="memEdit.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; View Member Profile
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Profile
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Leave DB
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Reset Password
            </a>
            <a href="logout.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-globe"></i>&nbsp; Logout
            </a>-->
        </div>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div> 
                <span class="navbar-brand pull-left" onclick="openNav()">&#9776;</span>               
                <a href="#"><img alt="The Gideons International" src="./images/GideonsLogo2.png" align="left"  height="50" width="170"  style="padding: 5px;"/></a>
                <!--<a class="btn btn-cust pull-right" href="/logout.jsp"><span title="Logout" class="glyphicon glyphicon-log-out" style="font-size: 15px; vertical-align: middle; color: #ffe114; padding-top: 8px;"></span></a>-->
            </div>
        </nav>
        <section id="main" class="container" style="padding: 60px 0px;">
            <ul class="nav nav-tabs">
                <li class="dropdown active"><a href="#" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Renewals 2020 &nbsp; <span class="caret"></span></a>
                    <ul class="dropdown-menu dmenu">
                        <li><a data-toggle="tab" href="#2020Rs_list">PG Success Transactions</a></li>
                        <li><a data-toggle="tab" href="#2020Rf_list">PG Failure Transactions</a></li>
                        <li><a data-toggle="tab" href="#2020R_list">All Records</a></li>
                    </ul>
                </li>  
                <li class="dropdown"><a href="#" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Renewals 2019 &nbsp; <span class="caret"></span></a>
                    <ul class="dropdown-menu dmenu">
                        <li><a data-toggle="tab" href="#2019Rs_list">PG Success Transactions</a></li>
                        <li><a data-toggle="tab" href="#2019Rf_list">PG Failure Transactions</a></li>
                        <li><a data-toggle="tab" href="#2019R_list">All Records</a></li>
                    </ul>
                </li>
            </ul>
            <div class="tab-content">
                <div id="2020Rs_list" class="tab-pane fade in active"> 
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;PG Success records from 1<sup>st</sup> April 2020
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2020successlist" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>TGII_REFNO</th>
                                        <th style="text-align: left;" nowrap>MEMBERSHIP_PLAN</th>
                                        <th nowrap>MEMBER_NAME</th>
                                        <th style="text-align: right;" nowrap>RENEWAL_FEE</th>
                                        <th nowrap>TR_STATUS</th>
                                        <th nowrap>PAY_MODE</th>
                                        <th nowrap>ICICI_REFNO</th>
                                        <th nowrap>ICICI_TR_DATE_TIME</th>
                                        <th nowrap>ICICI_TR_AMOUNT</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>REMARKS</th>
                                        <th nowrap>STATE_ASSOCIATION</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        String SAN_REMARKS = "";
                                        String MODIFIED_ON = "";
                                        String MODIFIED_BY = "";
                                        String RECORD_STATUS = "";
                                        String RID = "";
                                        String SUBMITTED_ON = "";
                                        String REMARKS = "";
                                        String CONTACT_PERSON = "";
                                        String PAYMODE = "";
                                        String ICICI_TR_DATE_TIME = "";
                                        String TGII_REFNO = "";
                                        String ICICI_REFNO = "";
                                        String STATUS = "";
                                        String ICICI_TR_AMOUNT = "";
                                        String RENEWAL_FEE = "";
                                        String NAME = "";
                                        String MEMBERSHIP_PLAN = "";
                                        String MEMBERSHIP_TYPE = "";
                                        String camp = "";
                                        String state_asso = "";

                                        DataSource ds = null;
                                        Connection con = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from MEMBERSHIP_RENEWALS_ONLINE_ALL where tgii_refno like '%2020R%' and status='Success' order by icici_refno desc";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                MEMBERSHIP_TYPE = rs1.getString("MEMBERSHIP_TYPE");
                                                MEMBERSHIP_PLAN = rs1.getString("MEMBERSHIP_PLAN");
                                                NAME = rs1.getString("NAME");
                                                RENEWAL_FEE = rs1.getString("RENEWAL_FEE");
                                                ICICI_TR_AMOUNT = rs1.getString("ICICI_TR_AMOUNT");
                                                STATUS = rs1.getString("STATUS");
                                                ICICI_REFNO = rs1.getString("ICICI_REFNO");
                                                TGII_REFNO = rs1.getString("TGII_REFNO");
                                                ICICI_TR_DATE_TIME = rs1.getString("ICICI_TR_DATE_TIME");
                                                PAYMODE = rs1.getString("PAYMODE");
                                                CONTACT_PERSON = rs1.getString("CONTACT_PERSON");
                                                REMARKS = rs1.getString("REMARKS");
                                                SUBMITTED_ON = rs1.getString("SUBMITTED_ON");
                                                RID = rs1.getString("RID");
                                                RECORD_STATUS = rs1.getString("RECORD_STATUS");
                                                MODIFIED_BY = rs1.getString("MODIFIED_BY");
                                                MODIFIED_ON = rs1.getString("MODIFIED_ON");
                                                SAN_REMARKS = rs1.getString("SAN_REMARKS");
                                                camp = rs1.getString("camp");
                                                state_asso = rs1.getString("state_asso");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (state_asso == null) {
                                                    state_asso = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (MEMBERSHIP_TYPE == null) {
                                                    MEMBERSHIP_TYPE = "";
                                                }
                                                if (MEMBERSHIP_PLAN == null) {
                                                    MEMBERSHIP_PLAN = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }
                                                if (RENEWAL_FEE == null) {
                                                    RENEWAL_FEE = "";
                                                }
                                                if (ICICI_TR_AMOUNT == null) {
                                                    ICICI_TR_AMOUNT = "";
                                                }
                                                if (SAN_REMARKS == null) {
                                                    SAN_REMARKS = "";
                                                }
                                                if (MODIFIED_ON == null) {
                                                    MODIFIED_ON = "";
                                                }
                                                if (MODIFIED_BY == null) {
                                                    MODIFIED_BY = "";
                                                }
                                                if (RID == null) {
                                                    RID = "";
                                                }
                                                if (SUBMITTED_ON == null) {
                                                    SUBMITTED_ON = "";
                                                }
                                                if (REMARKS == null) {
                                                    REMARKS = "";
                                                }
                                                if (CONTACT_PERSON == null) {
                                                    CONTACT_PERSON = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (ICICI_TR_DATE_TIME == null) {
                                                    ICICI_TR_DATE_TIME = "";
                                                }
                                                if (TGII_REFNO == null) {
                                                    TGII_REFNO = "";
                                                }
                                                if (ICICI_REFNO == null) {
                                                    ICICI_REFNO = "";
                                                }
                                                if (STATUS == null) {
                                                    STATUS = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }

                                    %> 
                                    <tr> 
                                        <td hidden>&nbsp;</td> 
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= TGII_REFNO%></td> 
                                        <td nowrap><%= MEMBERSHIP_PLAN%></td>                                           
                                        <td nowrap><%= NAME%></td> 
                                        <td style="text-align: right; padding-right: 15px;"><%= RENEWAL_FEE%></td>
                                        <td><%= STATUS%></td> 
                                        <td><%= PAYMODE%></td> 
                                        <td><%= ICICI_REFNO%></td>
                                        <td><%= ICICI_TR_DATE_TIME%></td>   
                                        <td style="text-align: right; padding-right: 15px;"><%= ICICI_TR_AMOUNT%></td> 
                                        <td><%= SUBMITTED_ON%></td> 
                                        <td nowrap><%= REMARKS%></td>
                                        <td nowrap><%= state_asso%></td>
                                        <%
                                                }
                                                rs1.close();
                                                st1.close();
                                                con.close();
                                            } catch (Exception e1) {
                                            }
                                        %>                                                  
                                    </tr>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th colspan="4" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                        <th style="text-align: right;"></th>
                                        <th colspan="8"></th> 
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="2020R_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;All records from 1<sup>st</sup> April 2020
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2020list" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>TGII_REFNO</th>
                                        <th style="text-align: left;" nowrap>MEMBERSHIP_PLAN</th>
                                        <th nowrap>MEMBER_NAME</th>
                                        <th style="text-align: right;" nowrap>RENEWAL_FEE</th>
                                        <th nowrap>TR_STATUS</th>
                                        <th nowrap>PAY_MODE</th>
                                        <th nowrap>ICICI_REFNO</th>
                                        <th nowrap>ICICI_TR_DATE_TIME</th>
                                        <th nowrap>ICICI_TR_AMOUNT</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>REMARKS</th>
                                        <th nowrap>STATE_ASSOCIATION</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        SAN_REMARKS = "";
                                        MODIFIED_ON = "";
                                        MODIFIED_BY = "";
                                        RECORD_STATUS = "";
                                        RID = "";
                                        SUBMITTED_ON = "";
                                        REMARKS = "";
                                        CONTACT_PERSON = "";
                                        PAYMODE = "";
                                        ICICI_TR_DATE_TIME = "";
                                        TGII_REFNO = "";
                                        ICICI_REFNO = "";
                                        STATUS = "";
                                        ICICI_TR_AMOUNT = "";
                                        RENEWAL_FEE = "";
                                        NAME = "";
                                        MEMBERSHIP_PLAN = "";
                                        MEMBERSHIP_TYPE = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from MEMBERSHIP_RENEWALS_ONLINE_ALL where tgii_refno like '%2020R%' order by icici_refno desc";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                MEMBERSHIP_TYPE = rs1.getString("MEMBERSHIP_TYPE");
                                                MEMBERSHIP_PLAN = rs1.getString("MEMBERSHIP_PLAN");
                                                NAME = rs1.getString("NAME");
                                                RENEWAL_FEE = rs1.getString("RENEWAL_FEE");
                                                ICICI_TR_AMOUNT = rs1.getString("ICICI_TR_AMOUNT");
                                                STATUS = rs1.getString("STATUS");
                                                ICICI_REFNO = rs1.getString("ICICI_REFNO");
                                                TGII_REFNO = rs1.getString("TGII_REFNO");
                                                ICICI_TR_DATE_TIME = rs1.getString("ICICI_TR_DATE_TIME");
                                                PAYMODE = rs1.getString("PAYMODE");
                                                CONTACT_PERSON = rs1.getString("CONTACT_PERSON");
                                                REMARKS = rs1.getString("REMARKS");
                                                SUBMITTED_ON = rs1.getString("SUBMITTED_ON");
                                                RID = rs1.getString("RID");
                                                RECORD_STATUS = rs1.getString("RECORD_STATUS");
                                                MODIFIED_BY = rs1.getString("MODIFIED_BY");
                                                MODIFIED_ON = rs1.getString("MODIFIED_ON");
                                                SAN_REMARKS = rs1.getString("SAN_REMARKS");
                                                camp = rs1.getString("camp");
                                                state_asso = rs1.getString("state_asso");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (state_asso == null) {
                                                    state_asso = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (MEMBERSHIP_TYPE == null) {
                                                    MEMBERSHIP_TYPE = "";
                                                }
                                                if (MEMBERSHIP_PLAN == null) {
                                                    MEMBERSHIP_PLAN = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }
                                                if (RENEWAL_FEE == null) {
                                                    RENEWAL_FEE = "";
                                                }
                                                if (ICICI_TR_AMOUNT == null) {
                                                    ICICI_TR_AMOUNT = "";
                                                }
                                                if (SAN_REMARKS == null) {
                                                    SAN_REMARKS = "";
                                                }
                                                if (MODIFIED_ON == null) {
                                                    MODIFIED_ON = "";
                                                }
                                                if (MODIFIED_BY == null) {
                                                    MODIFIED_BY = "";
                                                }
                                                if (RID == null) {
                                                    RID = "";
                                                }
                                                if (SUBMITTED_ON == null) {
                                                    SUBMITTED_ON = "";
                                                }
                                                if (REMARKS == null) {
                                                    REMARKS = "";
                                                }
                                                if (CONTACT_PERSON == null) {
                                                    CONTACT_PERSON = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (ICICI_TR_DATE_TIME == null) {
                                                    ICICI_TR_DATE_TIME = "";
                                                }
                                                if (TGII_REFNO == null) {
                                                    TGII_REFNO = "";
                                                }
                                                if (ICICI_REFNO == null) {
                                                    ICICI_REFNO = "";
                                                }
                                                if (STATUS == null) {
                                                    STATUS = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }

                                    %> 
                                    <tr> 
                                        <td hidden>&nbsp;</td> 
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= TGII_REFNO%></td> 
                                        <td nowrap><%= MEMBERSHIP_PLAN%></td>                                           
                                        <td nowrap><%= NAME%></td> 
                                        <td style="text-align: right; padding-right: 15px;"><%= RENEWAL_FEE%></td>
                                        <td><%= STATUS%></td> 
                                        <td><%= PAYMODE%></td> 
                                        <td><%= ICICI_REFNO%></td>
                                        <td><%= ICICI_TR_DATE_TIME%></td>   
                                        <td style="text-align: right; padding-right: 15px;"><%= ICICI_TR_AMOUNT%></td> 
                                        <td><%= SUBMITTED_ON%></td> 
                                        <td nowrap><%= REMARKS%></td>
                                        <td nowrap><%= state_asso%></td>
                                        <%
                                                }
                                                rs1.close();
                                                st1.close();
                                                con.close();
                                            } catch (Exception e1) {
                                            }
                                        %>                          
                                    </tr>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th colspan="4" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                        <th style="text-align: right;"></th>
                                        <th colspan="8"></th> 
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="2020Rf_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;PG Failure records from 1<sup>st</sup> April 2020
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2020failurelist" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>TGII_REFNO</th>
                                        <th style="text-align: left;" nowrap>MEMBERSHIP_PLAN</th>
                                        <th nowrap>MEMBER_NAME</th>
                                        <th style="text-align: right;" nowrap>RENEWAL_FEE</th>
                                        <th nowrap>TR_STATUS</th>
                                        <th nowrap>PAY_MODE</th>
                                        <th nowrap>ICICI_REFNO</th>
                                        <th nowrap>ICICI_TR_DATE_TIME</th>
                                        <th nowrap>ICICI_TR_AMOUNT</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>REMARKS</th>
                                        <th nowrap>STATE_ASSOCIATION</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        SAN_REMARKS = "";
                                        MODIFIED_ON = "";
                                        MODIFIED_BY = "";
                                        RECORD_STATUS = "";
                                        RID = "";
                                        SUBMITTED_ON = "";
                                        REMARKS = "";
                                        CONTACT_PERSON = "";
                                        PAYMODE = "";
                                        ICICI_TR_DATE_TIME = "";
                                        TGII_REFNO = "";
                                        ICICI_REFNO = "";
                                        STATUS = "";
                                        ICICI_TR_AMOUNT = "";
                                        RENEWAL_FEE = "";
                                        NAME = "";
                                        MEMBERSHIP_PLAN = "";
                                        MEMBERSHIP_TYPE = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from MEMBERSHIP_RENEWALS_ONLINE_ALL where tgii_refno like '%2020R%' and status!='Success' order by icici_refno desc";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                MEMBERSHIP_TYPE = rs1.getString("MEMBERSHIP_TYPE");
                                                MEMBERSHIP_PLAN = rs1.getString("MEMBERSHIP_PLAN");
                                                NAME = rs1.getString("NAME");
                                                RENEWAL_FEE = rs1.getString("RENEWAL_FEE");
                                                ICICI_TR_AMOUNT = rs1.getString("ICICI_TR_AMOUNT");
                                                STATUS = rs1.getString("STATUS");
                                                ICICI_REFNO = rs1.getString("ICICI_REFNO");
                                                TGII_REFNO = rs1.getString("TGII_REFNO");
                                                ICICI_TR_DATE_TIME = rs1.getString("ICICI_TR_DATE_TIME");
                                                PAYMODE = rs1.getString("PAYMODE");
                                                CONTACT_PERSON = rs1.getString("CONTACT_PERSON");
                                                REMARKS = rs1.getString("REMARKS");
                                                SUBMITTED_ON = rs1.getString("SUBMITTED_ON");
                                                RID = rs1.getString("RID");
                                                RECORD_STATUS = rs1.getString("RECORD_STATUS");
                                                MODIFIED_BY = rs1.getString("MODIFIED_BY");
                                                MODIFIED_ON = rs1.getString("MODIFIED_ON");
                                                SAN_REMARKS = rs1.getString("SAN_REMARKS");
                                                camp = rs1.getString("camp");
                                                state_asso = rs1.getString("state_asso");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (state_asso == null) {
                                                    state_asso = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (MEMBERSHIP_TYPE == null) {
                                                    MEMBERSHIP_TYPE = "";
                                                }
                                                if (MEMBERSHIP_PLAN == null) {
                                                    MEMBERSHIP_PLAN = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }
                                                if (RENEWAL_FEE == null) {
                                                    RENEWAL_FEE = "";
                                                }
                                                if (ICICI_TR_AMOUNT == null) {
                                                    ICICI_TR_AMOUNT = "";
                                                }
                                                if (SAN_REMARKS == null) {
                                                    SAN_REMARKS = "";
                                                }
                                                if (MODIFIED_ON == null) {
                                                    MODIFIED_ON = "";
                                                }
                                                if (MODIFIED_BY == null) {
                                                    MODIFIED_BY = "";
                                                }
                                                if (RID == null) {
                                                    RID = "";
                                                }
                                                if (SUBMITTED_ON == null) {
                                                    SUBMITTED_ON = "";
                                                }
                                                if (REMARKS == null) {
                                                    REMARKS = "";
                                                }
                                                if (CONTACT_PERSON == null) {
                                                    CONTACT_PERSON = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (ICICI_TR_DATE_TIME == null) {
                                                    ICICI_TR_DATE_TIME = "";
                                                }
                                                if (TGII_REFNO == null) {
                                                    TGII_REFNO = "";
                                                }
                                                if (ICICI_REFNO == null) {
                                                    ICICI_REFNO = "";
                                                }
                                                if (STATUS == null) {
                                                    STATUS = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }

                                    %> 
                                    <tr> 
                                        <td hidden>&nbsp;</td> 
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= TGII_REFNO%></td> 
                                        <td nowrap><%= MEMBERSHIP_PLAN%></td>                                           
                                        <td nowrap><%= NAME%></td> 
                                        <td style="text-align: right; padding-right: 15px;"><%= RENEWAL_FEE%></td>
                                        <td><%= STATUS%></td> 
                                        <td><%= PAYMODE%></td> 
                                        <td><%= ICICI_REFNO%></td>
                                        <td><%= ICICI_TR_DATE_TIME%></td>   
                                        <td style="text-align: right; padding-right: 15px;"><%= ICICI_TR_AMOUNT%></td> 
                                        <td><%= SUBMITTED_ON%></td> 
                                        <td nowrap><%= REMARKS%></td>
                                        <td nowrap><%= state_asso%></td>
                                        <%
                                                }
                                                rs1.close();
                                                st1.close();
                                                con.close();
                                            } catch (Exception e1) {
                                            }
                                        %>                          
                                    </tr>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th colspan="4" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                        <th style="text-align: right;"></th>
                                        <th colspan="8"></th> 
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="2019R_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;All records till 31<sup>st</sup> March 2020
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2019list" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>TGII_REFNO</th>
                                        <th style="text-align: left;" nowrap>MEMBERSHIP_PLAN</th>
                                        <th nowrap>MEMBER_NAME</th>
                                        <th style="text-align: right;" nowrap>RENEWAL_FEE</th>
                                        <th nowrap>TR_STATUS</th>
                                        <th nowrap>PAY_MODE</th>
                                        <th nowrap>ICICI_REFNO</th>
                                        <th nowrap>ICICI_TR_DATE_TIME</th>
                                        <th nowrap>ICICI_TR_AMOUNT</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>REMARKS</th>
                                        <th nowrap>STATE_ASSOCIATION</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        SAN_REMARKS = "";
                                        MODIFIED_ON = "";
                                        MODIFIED_BY = "";
                                        RECORD_STATUS = "";
                                        RID = "";
                                        SUBMITTED_ON = "";
                                        REMARKS = "";
                                        CONTACT_PERSON = "";
                                        PAYMODE = "";
                                        ICICI_TR_DATE_TIME = "";
                                        TGII_REFNO = "";
                                        ICICI_REFNO = "";
                                        STATUS = "";
                                        ICICI_TR_AMOUNT = "";
                                        RENEWAL_FEE = "";
                                        NAME = "";
                                        MEMBERSHIP_PLAN = "";
                                        MEMBERSHIP_TYPE = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from MEMBERSHIP_RENEWALS_ONLINE_ALL where tgii_refno like '%2019R%'";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                MEMBERSHIP_TYPE = rs1.getString("MEMBERSHIP_TYPE");
                                                MEMBERSHIP_PLAN = rs1.getString("MEMBERSHIP_PLAN");
                                                NAME = rs1.getString("NAME");
                                                RENEWAL_FEE = rs1.getString("RENEWAL_FEE");
                                                ICICI_TR_AMOUNT = rs1.getString("ICICI_TR_AMOUNT");
                                                STATUS = rs1.getString("STATUS");
                                                ICICI_REFNO = rs1.getString("ICICI_REFNO");
                                                TGII_REFNO = rs1.getString("TGII_REFNO");
                                                ICICI_TR_DATE_TIME = rs1.getString("ICICI_TR_DATE_TIME");
                                                PAYMODE = rs1.getString("PAYMODE");
                                                CONTACT_PERSON = rs1.getString("CONTACT_PERSON");
                                                REMARKS = rs1.getString("REMARKS");
                                                SUBMITTED_ON = rs1.getString("SUBMITTED_ON");
                                                RID = rs1.getString("RID");
                                                RECORD_STATUS = rs1.getString("RECORD_STATUS");
                                                MODIFIED_BY = rs1.getString("MODIFIED_BY");
                                                MODIFIED_ON = rs1.getString("MODIFIED_ON");
                                                SAN_REMARKS = rs1.getString("SAN_REMARKS");
                                                camp = rs1.getString("camp");
                                                state_asso = rs1.getString("state_asso");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (state_asso == null) {
                                                    state_asso = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (MEMBERSHIP_TYPE == null) {
                                                    MEMBERSHIP_TYPE = "";
                                                }
                                                if (MEMBERSHIP_PLAN == null) {
                                                    MEMBERSHIP_PLAN = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }
                                                if (RENEWAL_FEE == null) {
                                                    RENEWAL_FEE = "";
                                                }
                                                if (ICICI_TR_AMOUNT == null) {
                                                    ICICI_TR_AMOUNT = "";
                                                }
                                                if (SAN_REMARKS == null) {
                                                    SAN_REMARKS = "";
                                                }
                                                if (MODIFIED_ON == null) {
                                                    MODIFIED_ON = "";
                                                }
                                                if (MODIFIED_BY == null) {
                                                    MODIFIED_BY = "";
                                                }
                                                if (RID == null) {
                                                    RID = "";
                                                }
                                                if (SUBMITTED_ON == null) {
                                                    SUBMITTED_ON = "";
                                                }
                                                if (REMARKS == null) {
                                                    REMARKS = "";
                                                }
                                                if (CONTACT_PERSON == null) {
                                                    CONTACT_PERSON = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (ICICI_TR_DATE_TIME == null) {
                                                    ICICI_TR_DATE_TIME = "";
                                                }
                                                if (TGII_REFNO == null) {
                                                    TGII_REFNO = "";
                                                }
                                                if (ICICI_REFNO == null) {
                                                    ICICI_REFNO = "";
                                                }
                                                if (STATUS == null) {
                                                    STATUS = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }

                                    %> 
                                    <tr> 
                                        <td hidden>&nbsp;</td> 
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= TGII_REFNO%></td> 
                                        <td nowrap><%= MEMBERSHIP_PLAN%></td>                                           
                                        <td nowrap><%= NAME%></td> 
                                        <td style="text-align: right; padding-right: 15px;"><%= RENEWAL_FEE%></td>
                                        <td><%= STATUS%></td> 
                                        <td><%= PAYMODE%></td> 
                                        <td><%= ICICI_REFNO%></td>
                                        <td><%= ICICI_TR_DATE_TIME%></td>   
                                        <td style="text-align: right; padding-right: 15px;"><%= ICICI_TR_AMOUNT%></td> 
                                        <td><%= SUBMITTED_ON%></td> 
                                        <td nowrap><%= REMARKS%></td>
                                        <td nowrap><%= state_asso%></td>
                                        <%
                                                }
                                                rs1.close();
                                                st1.close();
                                                con.close();
                                            } catch (Exception e1) {
                                            }
                                        %>                          
                                    </tr>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th colspan="4" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                        <th style="text-align: right;"></th>
                                        <th colspan="8"></th> 
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="2019Rs_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;PG Success records till 31<sup>st</sup> March 2020
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2019successlist" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>TGII_REFNO</th>
                                        <th style="text-align: left;" nowrap>MEMBERSHIP_PLAN</th>
                                        <th nowrap>MEMBER_NAME</th>
                                        <th style="text-align: right;" nowrap>RENEWAL_FEE</th>
                                        <th nowrap>TR_STATUS</th>
                                        <th nowrap>PAY_MODE</th>
                                        <th nowrap>ICICI_REFNO</th>
                                        <th nowrap>ICICI_TR_DATE_TIME</th>
                                        <th nowrap>ICICI_TR_AMOUNT</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>REMARKS</th>
                                        <th nowrap>STATE_ASSOCIATION</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        SAN_REMARKS = "";
                                        MODIFIED_ON = "";
                                        MODIFIED_BY = "";
                                        RECORD_STATUS = "";
                                        RID = "";
                                        SUBMITTED_ON = "";
                                        REMARKS = "";
                                        CONTACT_PERSON = "";
                                        PAYMODE = "";
                                        ICICI_TR_DATE_TIME = "";
                                        TGII_REFNO = "";
                                        ICICI_REFNO = "";
                                        STATUS = "";
                                        ICICI_TR_AMOUNT = "";
                                        RENEWAL_FEE = "";
                                        NAME = "";
                                        MEMBERSHIP_PLAN = "";
                                        MEMBERSHIP_TYPE = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from MEMBERSHIP_RENEWALS_ONLINE_ALL where tgii_refno like '%2019R%' and status='Success' order by icici_refno desc";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                MEMBERSHIP_TYPE = rs1.getString("MEMBERSHIP_TYPE");
                                                MEMBERSHIP_PLAN = rs1.getString("MEMBERSHIP_PLAN");
                                                NAME = rs1.getString("NAME");
                                                RENEWAL_FEE = rs1.getString("RENEWAL_FEE");
                                                ICICI_TR_AMOUNT = rs1.getString("ICICI_TR_AMOUNT");
                                                STATUS = rs1.getString("STATUS");
                                                ICICI_REFNO = rs1.getString("ICICI_REFNO");
                                                TGII_REFNO = rs1.getString("TGII_REFNO");
                                                ICICI_TR_DATE_TIME = rs1.getString("ICICI_TR_DATE_TIME");
                                                PAYMODE = rs1.getString("PAYMODE");
                                                CONTACT_PERSON = rs1.getString("CONTACT_PERSON");
                                                REMARKS = rs1.getString("REMARKS");
                                                SUBMITTED_ON = rs1.getString("SUBMITTED_ON");
                                                RID = rs1.getString("RID");
                                                RECORD_STATUS = rs1.getString("RECORD_STATUS");
                                                MODIFIED_BY = rs1.getString("MODIFIED_BY");
                                                MODIFIED_ON = rs1.getString("MODIFIED_ON");
                                                SAN_REMARKS = rs1.getString("SAN_REMARKS");
                                                camp = rs1.getString("camp");
                                                state_asso = rs1.getString("state_asso");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (state_asso == null) {
                                                    state_asso = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (MEMBERSHIP_TYPE == null) {
                                                    MEMBERSHIP_TYPE = "";
                                                }
                                                if (MEMBERSHIP_PLAN == null) {
                                                    MEMBERSHIP_PLAN = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }
                                                if (RENEWAL_FEE == null) {
                                                    RENEWAL_FEE = "";
                                                }
                                                if (ICICI_TR_AMOUNT == null) {
                                                    ICICI_TR_AMOUNT = "";
                                                }
                                                if (SAN_REMARKS == null) {
                                                    SAN_REMARKS = "";
                                                }
                                                if (MODIFIED_ON == null) {
                                                    MODIFIED_ON = "";
                                                }
                                                if (MODIFIED_BY == null) {
                                                    MODIFIED_BY = "";
                                                }
                                                if (RID == null) {
                                                    RID = "";
                                                }
                                                if (SUBMITTED_ON == null) {
                                                    SUBMITTED_ON = "";
                                                }
                                                if (REMARKS == null) {
                                                    REMARKS = "";
                                                }
                                                if (CONTACT_PERSON == null) {
                                                    CONTACT_PERSON = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (ICICI_TR_DATE_TIME == null) {
                                                    ICICI_TR_DATE_TIME = "";
                                                }
                                                if (TGII_REFNO == null) {
                                                    TGII_REFNO = "";
                                                }
                                                if (ICICI_REFNO == null) {
                                                    ICICI_REFNO = "";
                                                }
                                                if (STATUS == null) {
                                                    STATUS = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }

                                    %> 
                                    <tr> 
                                        <td hidden>&nbsp;</td> 
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= TGII_REFNO%></td> 
                                        <td nowrap><%= MEMBERSHIP_PLAN%></td>                                           
                                        <td nowrap><%= NAME%></td> 
                                        <td style="text-align: right; padding-right: 15px;"><%= RENEWAL_FEE%></td>
                                        <td><%= STATUS%></td> 
                                        <td><%= PAYMODE%></td> 
                                        <td><%= ICICI_REFNO%></td>
                                        <td><%= ICICI_TR_DATE_TIME%></td>   
                                        <td style="text-align: right; padding-right: 15px;"><%= ICICI_TR_AMOUNT%></td> 
                                        <td><%= SUBMITTED_ON%></td> 
                                        <td nowrap><%= REMARKS%></td>
                                        <td nowrap><%= state_asso%></td>
                                        <%
                                                }
                                                rs1.close();
                                                st1.close();
                                                con.close();
                                            } catch (Exception e1) {
                                            }
                                        %>                     
                                    </tr>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th colspan="4" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                        <th style="text-align: right;"></th>
                                        <th colspan="8"></th> 
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="2019Rf_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;PG Failure records till 31<sup>st</sup> March 2020
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2019failurelist" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>TGII_REFNO</th>
                                        <th style="text-align: left;" nowrap>MEMBERSHIP_PLAN</th>
                                        <th nowrap>MEMBER_NAME</th>
                                        <th style="text-align: right;" nowrap>RENEWAL_FEE</th>
                                        <th nowrap>TR_STATUS</th>
                                        <th nowrap>PAY_MODE</th>
                                        <th nowrap>ICICI_REFNO</th>
                                        <th nowrap>ICICI_TR_DATE_TIME</th>
                                        <th nowrap>ICICI_TR_AMOUNT</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>REMARKS</th>
                                        <th nowrap>STATE_ASSOCIATION</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        SAN_REMARKS = "";
                                        MODIFIED_ON = "";
                                        MODIFIED_BY = "";
                                        RECORD_STATUS = "";
                                        RID = "";
                                        SUBMITTED_ON = "";
                                        REMARKS = "";
                                        CONTACT_PERSON = "";
                                        PAYMODE = "";
                                        ICICI_TR_DATE_TIME = "";
                                        TGII_REFNO = "";
                                        ICICI_REFNO = "";
                                        STATUS = "";
                                        ICICI_TR_AMOUNT = "";
                                        RENEWAL_FEE = "";
                                        NAME = "";
                                        MEMBERSHIP_PLAN = "";
                                        MEMBERSHIP_TYPE = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from MEMBERSHIP_RENEWALS_ONLINE_ALL where tgii_refno like '%2019R%' and status!='Success' order by icici_refno desc";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                MEMBERSHIP_TYPE = rs1.getString("MEMBERSHIP_TYPE");
                                                MEMBERSHIP_PLAN = rs1.getString("MEMBERSHIP_PLAN");
                                                NAME = rs1.getString("NAME");
                                                RENEWAL_FEE = rs1.getString("RENEWAL_FEE");
                                                ICICI_TR_AMOUNT = rs1.getString("ICICI_TR_AMOUNT");
                                                STATUS = rs1.getString("STATUS");
                                                ICICI_REFNO = rs1.getString("ICICI_REFNO");
                                                TGII_REFNO = rs1.getString("TGII_REFNO");
                                                ICICI_TR_DATE_TIME = rs1.getString("ICICI_TR_DATE_TIME");
                                                PAYMODE = rs1.getString("PAYMODE");
                                                CONTACT_PERSON = rs1.getString("CONTACT_PERSON");
                                                REMARKS = rs1.getString("REMARKS");
                                                SUBMITTED_ON = rs1.getString("SUBMITTED_ON");
                                                RID = rs1.getString("RID");
                                                RECORD_STATUS = rs1.getString("RECORD_STATUS");
                                                MODIFIED_BY = rs1.getString("MODIFIED_BY");
                                                MODIFIED_ON = rs1.getString("MODIFIED_ON");
                                                SAN_REMARKS = rs1.getString("SAN_REMARKS");
                                                camp = rs1.getString("camp");
                                                state_asso = rs1.getString("state_asso");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (state_asso == null) {
                                                    state_asso = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (MEMBERSHIP_TYPE == null) {
                                                    MEMBERSHIP_TYPE = "";
                                                }
                                                if (MEMBERSHIP_PLAN == null) {
                                                    MEMBERSHIP_PLAN = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }
                                                if (RENEWAL_FEE == null) {
                                                    RENEWAL_FEE = "";
                                                }
                                                if (ICICI_TR_AMOUNT == null) {
                                                    ICICI_TR_AMOUNT = "";
                                                }
                                                if (SAN_REMARKS == null) {
                                                    SAN_REMARKS = "";
                                                }
                                                if (MODIFIED_ON == null) {
                                                    MODIFIED_ON = "";
                                                }
                                                if (MODIFIED_BY == null) {
                                                    MODIFIED_BY = "";
                                                }
                                                if (RID == null) {
                                                    RID = "";
                                                }
                                                if (SUBMITTED_ON == null) {
                                                    SUBMITTED_ON = "";
                                                }
                                                if (REMARKS == null) {
                                                    REMARKS = "";
                                                }
                                                if (CONTACT_PERSON == null) {
                                                    CONTACT_PERSON = "";
                                                }
                                                if (PAYMODE == null) {
                                                    PAYMODE = "";
                                                }
                                                if (ICICI_TR_DATE_TIME == null) {
                                                    ICICI_TR_DATE_TIME = "";
                                                }
                                                if (TGII_REFNO == null) {
                                                    TGII_REFNO = "";
                                                }
                                                if (ICICI_REFNO == null) {
                                                    ICICI_REFNO = "";
                                                }
                                                if (STATUS == null) {
                                                    STATUS = "";
                                                }
                                                if (NAME == null || NAME == "null") {
                                                    NAME = "";
                                                }

                                    %> 
                                    <tr> 
                                        <td hidden>&nbsp;</td> 
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= TGII_REFNO%></td> 
                                        <td nowrap><%= MEMBERSHIP_PLAN%></td>                                           
                                        <td nowrap><%= NAME%></td> 
                                        <td style="text-align: right; padding-right: 15px;"><%= RENEWAL_FEE%></td>
                                        <td><%= STATUS%></td> 
                                        <td><%= PAYMODE%></td> 
                                        <td><%= ICICI_REFNO%></td>
                                        <td><%= ICICI_TR_DATE_TIME%></td>   
                                        <td style="text-align: right; padding-right: 15px;"><%= ICICI_TR_AMOUNT%></td> 
                                        <td><%= SUBMITTED_ON%></td> 
                                        <td nowrap><%= REMARKS%></td>
                                        <td nowrap><%= state_asso%></td>
                                        <%
                                                }
                                                rs1.close();
                                                st1.close();
                                                con.close();
                                            } catch (Exception e1) {
                                            }
                                        %>                                                  
                                    </tr>
                                </tbody>
                                <tfoot style="background-color: yellow; color: navy;">
                                    <tr>
                                        <th colspan="4" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                        <th style="text-align: right;"></th>
                                        <th colspan="8"></th> 
                                    </tr>
                                </tfoot>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript">
                    $(document).ready(function () {
                        var table = $('#2020successlist,#2020failurelist,#2020list').DataTable({
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
                                total4 = api
                                        .column(5)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                pageTotal4 = api
                                        .column(5, {page: 'current'})
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                // Update footer
                                $(api.column(4).footer()).html(
                                        '' + pageTotal4 + '<br>(' + total4 + ')'
                                        );
                            }
                        });
                    });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#2019successlist,#2019failurelist,#2019list').DataTable({
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
                        total4 = api
                                .column(5)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal4 = api
                                .column(5, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Update footer
                        $(api.column(4).footer()).html(
                                '' + pageTotal4 + '<br>(' + total4 + ')'
                                );
                    }
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