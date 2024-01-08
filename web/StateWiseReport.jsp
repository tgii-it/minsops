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
    String camp = "";
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TGII | State wise Membership Repprt</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

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
        <script type="text/javascript">
            $(document).ready(function () {
                $('#event_date').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    autoclose: true,
                    todayHighlight: true,
                    forceParse: false,
                    autosize: true,
                    changeMonth: true,
                    changeYear: true
                });
                $("#event_date").datepicker("option", "yearRange", '2020:2021');
            });
        </script>
    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;" > 
        <%@ include file="menu.jsp" %>
        <div class="container-fluid" style="padding-top: 60px;" >             
            <div id="snackbar3"></div>
            <div id="snackbar"></div>
            <div class="loading-progress fade"></div>  
            <div class='panel panel-default panel-accent-gold'>
                <div class="panel-heading">
                    <div class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                        <i class="fa fa-fw fa-share"></i>&nbsp; State wise Membership Report
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-row">  
                        <div class="form-group col-md-6" >   
                            <div class='input-group'>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-list"></span>
                                </span>
                                <select class="form-control gocamp" name="camp" id="camp" required>
                                    <option value="0">-Select-</option>
                                    <option value="SA1 (Tamil Nadu)">SA1 (Tamil Nadu)</option>
                                    <option value="SA2 (Kerala)">SA2 (Kerala)</option>
                                    <option value="SA3 (Karnataka and Goa)">SA3 (Karnataka and Goa)</option>
                                    <option value="SA4 (Andhra Pradesh)">SA4 (Andhra Pradesh)</option>
                                    <option value="SA5 (Telangana)">SA5 (Telangana)</option>
                                    <option value="SA6 (Madhya Pradesh and Chattisgarh)">SA6 (Madhya Pradesh and Chattisgarh)</option>
                                    <option value="SA7 (Maharashtra and Gujarat)">SA7 (Maharashtra and Gujarat)</option>
                                    <option value="SA8 (Rajasthan Delhi Punjab Haryana Jammu Kashmir Himachal Pradesh and Ladakh)">SA8 (Rajasthan Delhi Punjab Haryana Jammu Kashmir Himachal Pradesh and Ladakh)</option>
                                    <option value="SA9 (Uttar Pradesh and Uttarakhand)">SA9 (Uttar Pradesh and Uttarakhand)</option>
                                    <option value="SA10 (Bihar and Jharkhand)">SA10 (Bihar and Jharkhand)</option>
                                    <option value="SA11 (Orissa West Bengal and Sikkim)">SA11 (Orissa West Bengal and Sikkim)</option>
                                    <option value="SA12 (Mizoram Tripura and Meghalaya)">SA12 (Mizoram Tripura and Meghalaya)</option>
                                    <option value="SA13 (Arunachal Pradesh Nagaland and Manipur)">SA13 (Arunachal Pradesh Nagaland and Manipur)</option>
                                    
                                </select>
                            </div> 
                        </div>
                        <div class="form-group col-md-6" >   
                            <div class='input-group'>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-list"></span>
                                </span>
                                <select class="form-control goevent" name="eventName" id="eventName" required>
                                    <option value="0">-Select Events-</option>
                                    <option value="Current">Current Members</option>
                                    <option value="Dropped">Dropped Members</option>
                                    <option value="Deceased">Deceased Members</option>
                                    <option value="Applied">Applied Members</option>
                                    <option value="Terminated">Terminated Members</option>
                                    <option value="1">View All Records</option>
                                </select>
                            </div> 
                        </div>                                     
                        <div id="snackbar"></div>
                    </div>

                    <div class="table table-responsive" style="padding: 10px; vertical-align: middle; font-size: 12px; color: black; height: auto;">
                        <table id="example" class="table table-responsive table-bordered table-hover">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr>
                                    <th nowrap>Zone</th>
                                    <th nowrap>State_Association</th>
                                    <th nowrap>Region</th>
                                    <th nowrap>Area</th>
                                    <th nowrap>Camp_Name</th>
                                    <th nowrap>Member_ID</th>
                                    <th nowrap>Member_Name</th>
                                    <th nowrap>Date_of_Birth</th>
                                    <th nowrap>Membership_Type</th>
                                    <th nowrap>Member_Since</th>
                                    <th nowrap>Life_Start_Date</th>
                                    <th nowrap>Annual_Start_Date</th>
                                    <th nowrap>Annual_End_Date</th>
                                    <th nowrap>Membership_Status</th>
                                    <th nowrap>Street</th>
                                    <th nowrap>Addr1</th>
                                    <th nowrap>Addr2</th>
                                    <th nowrap>City</th>
                                    <th nowrap>State</th>
                                    <th nowrap>Pincode</th>
                                    <th nowrap>Phone</th>
                                    <th nowrap>Email</th>
                                    <th nowrap>Designation</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div> 

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 100%; height: 100%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel" style="color: #fff;">Edit Page</h4>
                    </div>    
                    <div id="snackbar1"></div>
                    <div class="modal-body" id="res">
                        <form id="add" class="add">
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7; letter-spacing: 2px;">
                                        <i class="glyphicon glyphicon-th"></i>&nbsp; Event Details..
                                    </h3>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="row">
                                        <div class="form-group col-md-3" hidden>   
                                            <label>Record ID</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-paperclip"></span>
                                                </span>
                                                <input type='text' class="form-control" name="rid" id="rid" readonly/>
                                                <input type='hidden' name="username" id="username" value="<%= useraccessname%>"/>
                                                <input type="hidden" name="camp" id="camp" value="<%= camp%>"/>      
                                            </div>      
                                        </div>   
                                        <div class="form-group col-md-3" >   
                                            <label>Camp Name</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-paperclip"></span>
                                                </span>
                                                <input type='text' class="form-control" name="camp1" id="camp1" readonly/>
                                            </div>      
                                        </div> 
                                        <div class="form-group col-md-3" >   
                                            <label>Event Name</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-paperclip"></span>
                                                </span>
                                                <input type='text' class="form-control" name="etype" id="etype" readonly/>
                                            </div>      
                                        </div>  
                                        <div class="form-group col-md-2" hidden>
                                            <label for="paymentdate">Event Date</label>
                                            <div class='input-group date' id="event_date_cal">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control" id="event_date_old" name="event_date_old" autocomplete="off" readonly />
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-2">
                                            <label for="paymentdate">Event Date</label>
                                            <div class='input-group date' id="event_date_cal1">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control" id="event_date" name="event_date" autocomplete="off" />
                                            </div>
                                        </div>                                
                                        <div class="form-group col-md-2" hidden>
                                            <label>2020-21 Goal</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </span>
                                                <input type='text'  class="form-control"  name="sf_goal_old" id="sf_goal_old" readonly />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label>2020-21 Goal</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </span>
                                                <input type='text'  class="form-control"  name="sf_goal" id="sf_goal" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3" hidden>
                                            <label>Speaker Name</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input type='text' class="form-control" name="speakername_old" id="speakername_old" readonly/>
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label>Speaker Name</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input type='text'  class="form-control" name="speakername" id="speakername" />
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-3" hidden>
                                            <label>Contact Person</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input type='text' class="form-control" name="contact_person_old" id="contact_person_old" readonly />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label> Contact Person</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input type='text' class="form-control" name="contact_person" id="contact_person" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3" hidden>
                                            <label> Contact Phone</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-phone"></span>
                                                </span>
                                                <input type='text' class="form-control" name="contact_phone_old" id="contact_phone_old"  readonly />
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-2">
                                            <label>Phone No</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-phone"></span>
                                                </span>
                                                <input type='text' class="form-control" maxlength="10" name="contact_phone" id="contact_phone"   />
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label>Last modified by</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-user"></span>
                                                </span>
                                                <input type='text' class="form-control" name="modified_by" id="modified_by"  readonly />
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary action_add" id="action_add">Save changes</button>
                    </div>                     
                    <div id="snackbar1"></div>
                    <br>
                </div>
            </div>
        </div>
        <div class="modal fade" id="log" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 100%; height: 100%">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>                    

                    <div id="snackbar1"></div>
                    <div class="modal-body" id="res">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                        <i class="glyphicon glyphicon-th"></i>&nbsp; U P D A T E   &nbsp;H I S T O R Y 
                                    </h3>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; font-size: 12px; text-align: left; color: navy; font-weight: bold; padding: 5px; width:100%;">
                                    <table id="example1" class="table table-bordered table-responsive table-hover" style="width:100%">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Event Type</th>
                                                <th style="text-align: left;" nowrap>Old Speaker Name</th>
                                                <th style="text-align: left;" nowrap>New Speaker Name</th>
                                                <th style="text-align: left;" nowrap>Old Contact Person</th>
                                                <th style="text-align: left;" nowrap>New Contact Person</th>
                                                <th style="text-align: left;" nowrap>Old Contact Phone</th>
                                                <th style="text-align: left;" nowrap>New Contact Phone</th>
                                                <th style="text-align: left;" nowrap>Old SF goal (2019-20)</th>
                                                <th style="text-align: left;" nowrap>New SF goal(2019-20)</th>
                                                <th style="text-align: left;" nowrap> Old Event date </th>                                                
                                                <th style="text-align: left;" nowrap>New event date</th>
                                                <th style="text-align: left;" nowrap>Updated by</th>                                                
                                                <th style="text-align: left;" nowrap>Updated on</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <div id="snackbar2"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="log_delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 100%; height: 100%">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>                    

                    <div id="snackbar1"></div>
                    <div class="modal-body" id="res">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                        <i class="glyphicon glyphicon-th"></i>&nbsp; D E L E T E &nbsp;H I S T O R Y 
                                    </h3>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; font-size: 12px; text-align: left; color: navy; font-weight: bold; padding: 5px; width:100%;">
                                    <table id="example2" class="table table-bordered table-responsive table-hover" style="width:100%">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Contact Person</th>                                                             
                                                <th style="text-align: left;" nowrap>Contact Phone</th>   
                                                <th style="text-align: left;" nowrap>Speaker Name</th>
                                                <th style="text-align: left;" nowrap>SF Goal</th>
                                                <th style="text-align: left;" nowrap>Event date</th>  
                                                <th style="text-align: left;" nowrap>Deleted by</th>
                                                <th style="text-align: left;" nowrap>Deleted on</th>    
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <div id="snackbar2"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/buttons.bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.6/dist/loadingoverlay.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript">
            $(document).on('change', '.gocamp, .goevent', function () {
                var v_camp = $("#camp").val();
                var table;
                if ($("#eventName").val() === "0") {
                    $("#eventName").val("Current");
                }
                if (v_camp.length > 3) {
                    table = $('#example').DataTable({
                        destroy: true,
                        responsive: true,
                        stateSave: true,
                        "ordering": true,
                        'processing': true,
                        'language': {
                            'loadingRecords': '&nbsp;',
                            'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                        },
                        lengthMenu: [
                            [10, 25, 50, -1],
                            ['10 rows', '25 rows', '50 rows', 'Show all']
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
                        ajax: {
                            method: "POST",
                            url: "GetStateWiseMemberListJson.jsp?state_asso=" + $('#camp').val() + "&status=" + $('#eventName').val(),
                            dataSrc: "datas"
                        },
                        columns: [
                            {"data": "zone"},
                            {"data": "state_asso"},
                            {"data": "region"},
                            {"data": "area"},
                            {"data": "camp"},
                            {"data": "mid"},
                            {"data": "name"},
                            {"data": "dob"},
                            {"data": "mtype"},
                            {"data": "member_since"},
                            {"data": "life_start_date"},
                            {"data": "annual_start_date"},
                            {"data": "annual_end_date"},
                            {"data": "status"},
                            {"data": "street"},
                            {"data": "address"},
                            {"data": "address2"},
                            {"data": "city"},
                            {"data": "state"},
                            {"data": "pincode"},
                            {"data": "phone"},
                            {"data": "email"},
                            {"data": "designation"}
                        ], columnDefs: [
                            {className: 'text-nowrap', targets: [1, 4, 6, 8, 14, 15, 16, 17, 18, 22]}
                        ]
                    });
                    $("#hist").show();
                    $("#camp").val(v_camp);
                } else {
                    alert("Please select State Association..");
                    $("#camp").focus();
                }
            });
        </script>
        <script>
            $(document).on('click', '.editRow1', function () {
                var rid = $(this).attr('rid');
                $("#rid").val('');
                $("#modified_by").val('');
                $("#etype").val('');
                $("#sf_goal").val('');
                $("#contact_person").val('');
                $("#speakername").val('');
                $("#event_date").val('');
                $("#contact_phone").val('');
                $.ajax({
                    url: 'event_edit?action=Edit&rid=' + rid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#snackbar1").hide();
                        $("#res1").show();
                        $("#sf_goal_old").val(data.sf_goal);
                        $("#sf_goal").val(data.sf_goal);
                        $("#contact_phone_old").val(data.contact_phone);
                        $("#contact_phone").val(data.contact_phone);
                        $("#speakername_old").val(data.speakername);
                        $("#speakername").val(data.speakername);
                        $("#contact_person_old").val(data.contact_person);
                        $("#contact_person").val(data.contact_person);
                        $("#event_date_old").val(data.event_date);
                        $("#event_date").val(data.event_date);
                        $("#rid").val(data.rid);
                        $("#modified_by").val(data.modified_by);
                        $("#camp1").val(data.camp);
                        $("#etype").val(data.etype);
                    }
                });
            });
        </script>   
        <script>
            $(document).on('click', '.delete', function () {
                var rid = $(this).attr('rid');
                var username = $("#username").val();
                var msg = "";
                var r = confirm("Are you sure ? Do you want to delete this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $("#myContainer").LoadingOverlay("show", {
                        background: "rgba(165, 190, 100, 0.5)"
                    });
                    $("#snackbar3").show();
                    $("#snackbar3").html('<p style="width:100%; padding-top:20px; padding-bottom:20px; font-size:14px; height:60px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                    $.ajax({
                        url: 'events_update.jsp',
                        method: "POST",
                        data: {"action": "delete", "rid": rid, "username": username},
                        success: function (data) {
                            var result = $.trim(data.replace(/\s+/, ""));
                            if (result === "Success") {
                                msg = "Request processed Successfuly";
                            } else {
                                msg = "Sorry! Please contact Administrator";
                            }
                            $('#example').DataTable().ajax.reload();
                            // $('#example1').DataTable().ajax.reload();
                            // $('#example2').DataTable().ajax.reload();
                            $("#snackbar3").hide();
                            $('.modal-backdrop').remove();
                        }
                    }).done(function () {
                        alert(msg);
                        $("#myContainer").LoadingOverlay("hide", true);
                    });
                }
            });
        </script>
        <script>
            $(document).on('click', '.updatehistory', function (e) {
                var v_camp = $("#camp").val();
                var table;
                table = $('#example1').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    ajax: {
                        method: "POST",
                        url: 'events_update_log.jsp?action=table&camp=' + v_camp,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "etype"},
                        {"data": "speakername"},
                        {"data": "speakername_new"},
                        {"data": "contact_person"},
                        {"data": "contact_person_new"},
                        {"data": "contact_phone"},
                        {"data": "contact_phone_new"},
                        {"data": "sf_goal"},
                        {"data": "sf_goal_new"},
                        {"data": "event_date"},
                        {"data": "event_date_new"},
                        {"data": "updated_by"},
                        {"data": "updated_on"}
                    ]
                });
            });
        </script>
        <script>
            $(document).on('click', '.deletehistory', function (e) {
                var v_camp = $("#camp").val();
                var username = $("#username").val();
                var table;
                table = $('#example2').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    ajax: {
                        method: "POST",
                        url: 'events_delete_log.jsp?action=table&camp=' + v_camp + '&username=' + username,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "contact_person"},
                        {"data": "contact_phone"},
                        {"data": "speakername"},
                        {"data": "sf_goal"},
                        {"data": "event_date"},
                        {"data": "deleted_by"},
                        {"data": "deleted_on"}
                    ]
                });
            });
        </script>
        <script>
            $(document).on('click', '.action_add', function (e) {
                var hasError = false;
                $('#snackbar1').show();
                e.preventDefault();
                $(".error").hide();

                var rid = $("#rid").val();
                var event_date = $("#event_date").val();
                var stateAsso = $("#camp").val();
                var eventName = $("#eventName").val();
                var sf_goal = $("#sf_goal").val();
                var speakername = $("#speakername").val();
                var contact_person = $("#contact_person").val();
                var contact_phone = $("#contact_phone").val();
                var username = $("#username").val();

                var msg = "";
                var r = confirm("Are you sure ? Do you want to Update this record ?\n" + stateAsso + " - " + eventName);
                if (r === true) {
                    $(this).hide();
                    $("#myContainer").LoadingOverlay("show", {
                        background: "rgba(165, 190, 100, 0.5)"
                    });
                    $("#snackbar3").show();
                    $("#snackbar3").html('<p style="width:100%; padding-top:20px; padding-bottom:20px; font-size:14px; height:60px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                    $.ajax({
                        url: 'events_update.jsp?action=Update&event_date=' + event_date + '&sf_goal=' + sf_goal + '&speakername=' + speakername + '&contact_person=' + contact_person + '&contact_phone=' + contact_phone + '&rid=' + rid + '&username=' + username,
                        method: "POST",
                        data: {"action": "Update", "rid": rid, "username": username},
                        success: function (data) {
                            var result = $.trim(data.replace(/\s+/, ""));
                            if (result === "Success") {
                                msg = "Request processed Successfuly";
                            } else {
                                msg = "Sorry! Please contact Administrator";
                            }
                            $('#example').DataTable().ajax.reload();
                            // $('#example1').DataTable().ajax.reload();
                            // $('#example2').DataTable().ajax.reload();
                            $('#camp').val(stateAsso);
                            $('#eventName').val(eventName);
                            $('#action_add').show();
                            $("#snackbar3").hide();
                            $('.modal-backdrop').remove();
                        }
                    }).done(function () {
                        alert(msg);
                        $("#myContainer").LoadingOverlay("hide", true);
                    });
                }
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