<%-- 
    Document   : CampsMaster
    Created on : 28 Nov, 2019, 5:02:28 AM
    Author     : Anbalagan M
--%>
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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Camps Master</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
    </head>
    <body style="background-color: #fff; width: 100%;">
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm_apply" method="post" action="ProcessDispatchRequest" onsubmit="return validateCheckbox(this)">
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; CAMPS MASTER : PY 2021 - 22
                                    </h3>
                                </div>
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;">Zone</th>
                                                <th style="text-align: center;" nowrap>SA</th>
                                                <th style="text-align: left;" nowrap>State Association Name</th>
                                                <th style="text-align: center;" nowrap>Region</th>
                                                <th style="text-align: center;" nowrap>Area</th>
                                                <th style="text-align: left;" nowrap>Camp</th>
                                                <th style="text-align: center;" nowrap>Camp No</th>
                                                <th style="text-align: left;" nowrap>Status</th>
                                                <th style="text-align: left;" nowrap>Start_Date</th>
                                                <th style="text-align: left;" nowrap>Old_Name</th>
                                                <th style="text-align: left;" nowrap>Remarks, if any</th>
                                            </tr>
                                        </thead>
                                        <tbody id='mytab' class="table-search"> 
                                            <%  String camp = "";
                                                String zone = "";
                                                String state_asso = "";
                                                String region = "";
                                                String area = "";
                                                String sa_no = "";
                                                String remarks = "";
                                                String status = "";
                                                String camp_no = "";
                                                String old_name = "";
                                                String start_date = "";

                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();

                                                    String query1 = "select to_char(start_date,'DD-MON-YYY') start_date,a.* from Camps_Master a where rownum<10 order by zone,sa_no,region,area,camp";

                                                    Statement st1 = con.createStatement();
                                                    ResultSet rs1 = st1.executeQuery(query1);
                                                    while (rs1.next()) {
                                                        camp_no = rs1.getString("camp_no");
                                                        camp = rs1.getString("camp");
                                                        sa_no = rs1.getString("sa_no");
                                                        region = rs1.getString("region");
                                                        area = rs1.getString("area");
                                                        status = rs1.getString("status");
                                                        state_asso = rs1.getString("state_asso");
                                                        zone = rs1.getString("zone");
                                                        old_name = rs1.getString("old_name");
                                                        start_date = rs1.getString("start_date");
                                                        remarks = rs1.getString("remarks");

                                                        if (region == null) {
                                                            region = "";
                                                        }

                                                        if (area == null) {
                                                            area = "";
                                                        }

                                                        if (zone == null) {
                                                            zone = "";
                                                        }

                                                        if (start_date == null) {
                                                            start_date = "";
                                                        }

                                                        if (zone.equalsIgnoreCase("7")) {
                                                            zone = "OS";
                                                        }

                                                        if (sa_no.equalsIgnoreCase("14")) {
                                                            sa_no = "OS";
                                                        }

                                                        if (region.equalsIgnoreCase("0")) {
                                                            region = "";
                                                        }

                                                        if (area.equalsIgnoreCase("0")) {
                                                            area = "";
                                                        }

                                                        if (status.equalsIgnoreCase("Active")) {
                                                            status = "Active Camp";
                                                        }

                                                        if (remarks == null) {
                                                            remarks = "--";
                                                        }

                                                        if (old_name == null) {
                                                            old_name = "--";
                                                        }

                                                        if (camp_no == null) {
                                                            camp_no = "--";
                                                        }

                                            %> 
                                            <tr style='cursor: pointer;' title='Click here to Update' data-toggle="modal" data-target="#myModal" onclick="update('<%out.print(camp);%>')">                                               
                                                <td style="text-align: center;"><%=zone%></td>
                                                <td style="text-align: center;" nowrap>&nbsp;<%= sa_no%></td>
                                                <td nowrap><%= state_asso%></td>
                                                <td style="text-align: center;" nowrap><%= region%></td>
                                                <td style="text-align: center;"><%= area%></td>
                                                <td nowrap><%= camp%></td>
                                                <td style="text-align: center;"><%= camp_no%></td> 
                                                <td nowrap><%= status%></td> 
                                                <td nowrap><%= start_date%></td> 
                                                <td nowrap><%= old_name%></td> 
                                                <td nowrap><%= remarks%></td>
                                                <%
                                                        }
                                                        st1.close();
                                                        rs1.close();
                                                        con.close();
                                                    } catch (Exception e) {
                                                    }
                                                %>                                                  
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
        </section>

        <div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin: 0; padding: 0;">
                <div class="modal-content" style="height: auto; min-height: 100%;">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <div class='panel panel-default panel-accent-gold'>
                            <div class="panel-heading" style="background-color: #fff;">
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                    <i class="fa fa-fw fa-share"></i>&nbsp; CAMPS MASTER
                                </h3>
                            </div>
                            <div class="panel-body" style="padding-top: 20px;"> 
                                <div class="form-row">   
                                    <div class="form-group col-md-1" >
                                        <label for="memtype">Zone</label>
                                        <div class='input-group'>
                                            <select class="form-control" id="ZONE" name="ZONE">
                                                <option value="0">- Select Zone -</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                            </select>
                                        </div>
                                    </div>    
                                    <div class="form-group col-md-1" >
                                        <label for="memtype">SA No</label>
                                        <div class='input-group'>
                                            <select class="form-control" id="SA_NO" name="SA_NO">
                                                <option value="0">- Select SA No -</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                            </select>
                                        </div>
                                    </div>   
                                    <div class="form-group col-md-1" >
                                        <label for="memtype">SA</label>
                                        <div class='input-group'>
                                            <select class="form-control" id="SA" name="SA">
                                                <option value="0">- Select SA-</option>
                                                <option value="SA1">SA 1</option>
                                                <option value="SA2">SA 2</option>
                                                <option value="SA3">SA 3</option>
                                                <option value="SA4">SA 4</option>
                                                <option value="SA5">SA 5</option>
                                                <option value="SA6">SA 6</option>
                                                <option value="SA7">SA 7</option>
                                                <option value="SA8">SA 8</option>
                                                <option value="SA9">SA 9</option>
                                                <option value="SA10">SA 10</option>
                                                <option value="SA11">SA 11</option>
                                                <option value="SA12">SA 12</option>
                                                <option value="SA13">SA 3</option>
                                            </select>
                                        </div>
                                    </div> 
                                    <div class="form-group col-md-4" >
                                        <label for="STATE_ASSO">STATE_ASSO</label>
                                        <div class='input-group'>
                                            <input class="form-control" type="text" name="STATE_ASSO1" id="STATE_ASSO1" autocomplete="off">
                                        </div>
                                    </div>  
                                    <div class="form-group col-md-1" >
                                        <label for="memtype">Region</label>
                                        <div class='input-group'>
                                            <select class="form-control" id="REGION" name="REGION">
                                                <option value="0">- Select Region -</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                            </select>
                                        </div>
                                    </div>   
                                    <div class="form-group col-md-1" >
                                        <label for="memtype">Area</label>
                                        <div class='input-group'>
                                            <select class="form-control" id="AREA" name="AREA">
                                                <option value="0">- Select Area -</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                            </select>
                                        </div>
                                    </div>       
                                    <div class="form-group col-md-2" >
                                        <label for="camp">Camp</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-list"></span>
                                            </span>
                                            <%  String camp_sql = "";
                                                String mcamp = "";
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();
                                                    Statement statement = con.createStatement();
                                                    camp_sql = "select distinct camp from Camps_Master order by camp";
                                                    ResultSet resultSet = statement.executeQuery(camp_sql);
                                            %>
                                            <input name="camp" list="mCamp" class="form-control" id="camp">
                                            <datalist id="mCamp">
                                                <%
                                                    while (resultSet.next()) {
                                                        mcamp = resultSet.getString("camp");
                                                %>
                                                <option value="<%=mcamp%>">
                                                    <%
                                                        }
                                                    %>
                                            </datalist>
                                            <%
                                                    resultSet.close();
                                                    statement.close();
                                                    con.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </div>                                            
                                    </div>                                   
                                    <div class="form-group col-md-2">
                                        <label for="CAMP_NO">CAMP NO</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="CAMP_NO" id="CAMP_NO" autocomplete="off"/>
                                        </div>                                            
                                    </div>                                  
                                    <div class="form-group col-md-2">
                                        <label for="START_DATE">START DATE</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="START_DATE" id="START_DATE" placeholder=" DD/MM/YYYY"/>
                                        </div>                                            
                                    </div>                              
                                    <div class="form-group col-md-2">
                                        <label for="OLD_NAME">OLD NAME</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="OLD_NAME" id="OLD_NAME" autocomplete="off"/>
                                        </div>                                            
                                    </div>   
                                    <div class="form-group col-md-3">
                                        <label for="REMARKS">Remarks /comments</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </span>
                                            <input type='text' class="form-control" name="REMARKS" id="REMARKS" placeholder="Remarks, if any"/>
                                            <input type='hidden' class="form-control" name="useraccessname" id="useraccessname" value="<%=useraccessname%>" >
                                            <input type='hidden' name="so_mid" id="so_mid">
                                        </div>                                            
                                    </div>                               
                                    <div class="form-group col-md-2">
                                        <label for="CATEGORY">CATEGORY</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="CATEGORY" id="CATEGORY" autocomplete="off"/>
                                        </div>                                            
                                    </div>                              
                                    <div class="form-group col-md-2">
                                        <label for="STATUS">STATUS</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="STATUS" id="STATUS" autocomplete="off"/>
                                        </div>                                            
                                    </div>                               
                                    <div class="form-group col-md-2">
                                        <label for="ORBITID">ORBITID</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="ORBITID" id="ORBITID" autocomplete="off"/>
                                        </div>                                            
                                    </div>                              
                                    <div class="form-group col-md-6">
                                        <label for="AREA_REGION">AREA_REGION</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="AREA_REGION" id="AREA_REGION" autocomplete="off"/>
                                        </div>                                            
                                    </div>
                                </div>
                                <div id="snackbar1"></div>
                            </div>
                        </div>  
                        <div class="modal-footer">
                            <button type="submit" name="final-submit" id="final-submit" class="btn btn-primary final-submit">Submit</button> 
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close window</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:location.reload();">Close & Reload</button>
                        </div> 
                    </div>   
                </div>
            </div>
        </div>        
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
        <script type="text/javascript">
                                $(document).ready(function () {
                                    var printCounter = 0;
                                    // Append a caption to the table before the DataTables initialisation
                                    // $('#gideon').append('<caption style="caption-side: top">The Gideons International in India</caption>');
                                    // DataTable
                                    $('#gideon thead tr').clone(true).appendTo('#gideon thead');
                                    $('#gideon thead tr:eq(1) th').each(function (i) {
                                        var title = $(this).text();
                                        $(this).html('<input type="text" style="color: navy; width: 50px;" title="  ' + title + ' search.."/>');

                                        $('input', this).on('keyup change', function () {
                                            if (table.column(i).search() !== this.value) {
                                                table
                                                        .column(i)
                                                        .search(this.value)
                                                        .draw();
                                            }
                                        });
                                    });
                                    var table = $('#gideon').DataTable({
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

            function update(camp)
            {
                alert("The selected record is\n-----------------------\nCamp : " + camp);
                $("#CAMP").val(camp);
                $("#ORBITID").val('0');
                $("#STATE_ASSO1").val('0');
                $("#AREA_REGION").val('0');
                $("#ZONE").val('0');
                $("#SA_NO").val('0');
                $("#REGION").val('0');
                $("#AREA").val('0');
                $("#SA").val('0');
                $("#STATUS").val('0');
                $("#CAMP_NO").val('0');
                $("#OLD_NAME").val('0');
                $("#REMARKS").val('0');
                $("#START_DATE").val('0');
                $("#CATEGORY").val('0');

                $.ajax({
                    url: 'CampsMasterEditMIDjson.jsp?camp=' + camp,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        alert("The selected record is\n-----------------------\nSTATE_ASSO : " + data.STATE_ASSO);
                        $("#CAMP").val(data.CAMP);
                        $("#ORBITID").val(data.ORBITID);
                        $("#STATE_ASSO1").val(data.STATE_ASSO);
                        $("#AREA_REGION").val(data.AREA_REGION);
                        $("#ZONE").val(data.ZONE);
                        $("#SA_NO").val(data.SA_NO);
                        $("#REGION").val(data.REGION);
                        $("#AREA").val(data.AREA);
                        $("#SA").val(data.SA);
                        $("#STATUS").val(data.STATUS);
                        $("#CAMP_NO").val(data.CAMP_NO);
                        $("#OLD_NAME").val(data.OLD_NAME);
                        $("#REMARKS").val(data.REMARKS);
                        $("#START_DATE").val(data.START_DATE);
                        $("#CATEGORY").val(data.CATEGORY);
                    }
                });
            }
        </script>
    </body>
</html>