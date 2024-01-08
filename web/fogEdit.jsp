<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String sa_no = request.getParameter("sa_no");
    String useraccessname = "";
    if (sa_no == null) {
        sa_no = "";
    }
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("/misLogin.jsp");
    } else if (OBJ.equals("Sucharitha") || OBJ.equals("Anbalagan") || OBJ.equals("Mr Sam Varghese") || OBJ.equals("Sunitha")) {
        useraccessname = session.getAttribute("useraccessname").toString();
    } else if (OBJ.equals("Basavaraj")) {
        response.sendRedirect("DispatchMis.jsp");
    } else if (OBJ.equals("Sidhu")) {
        response.sendRedirect("DispatchMis.jsp");
    } else if (OBJ.equals("Madhavi")) {
        response.sendRedirect("je.jsp");
    } else if (OBJ.equals("Manish")) {
        response.sendRedirect("je.jsp");
    } else if (OBJ.equals("Chandrakala")) {
        response.sendRedirect("je.jsp");
    } else if (OBJ.equals("Vijay")) {
        response.sendRedirect("je.jsp");
    } else if (OBJ.equals("Shantha")) {
        response.sendRedirect("CardPrintingMis.jsp");
    } else if (OBJ.equals("Deepika")) {
        response.sendRedirect("PendingRenewals.jsp");
    } else if (OBJ.equals("Benjamin")) {
        response.sendRedirect("PendingRenewals.jsp");
    } else if (OBJ.equals("Ann")) {
        response.sendRedirect("je.jsp");
    } else if (OBJ.equals("Ambica")) {
        response.sendRedirect("designationUpdate.jsp");
    } else {
        System.out.println(session.getAttribute("useraccessname").toString() + " tried to login in Camp Transfer");
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Friends Of Gideons</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">   
                <div class="row">
                    <div class="col-md-12">                                    
                        <form name="frm_apply" method="post">
                            <div class='panel panel-default panel-accent-gold'>                              
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7; letter-spacing: 3px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp;FoG : Edit Record
                                        <button type='button' class='btn btn-success btn-xs pull-right createRow' title='View List' style="padding-left:10px; padding-right:10px;"><a href="fogTbl.jsp" target="_blank" style="text-decoration: none; color: #fff;"><i class='fa fa-plus-square-o' aria-hidden='true'>&nbsp; View FoG List</i></a></button>
                                        <button type='button' class='btn btn-info btn-xs pull-right createRow' title='Add New' style="padding-left:10px; padding-right:10px;"><a href="friend.jsp" target="_self" style="text-decoration: none; color: #fff;"><i class='fa fa-pencil-square-o' aria-hidden='true'>&nbsp; Add New</i></a></button>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </h3>
                                </div>
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="example" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;" nowrap>RID</th>
                                                <th nowrap>Camp</th>
                                                <th nowrap>Name</th>
                                                <th nowrap>Mobile</th>  
                                                <th nowrap>Email</th>
                                                <th nowrap>Action</th>   
                                            </tr>
                                        </thead>                                     
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff; letter-spacing: 3px;">Edit Information</h4>
                        </center>
                    </div>    
                    <div id="snackbar1"></div>
                    <div class="modal-body" id="res">
                        <form id="new" class="new">
                            <div style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                <div class="row">
                                    <div class="col-md-6">  
                                        <table class="table table-striped table-responsive" style="float: left; width: 100%">
                                            <tbody>
                                                <tr>
                                                    <td colspan="1" style="width: 50%">                                                                                                       
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Name *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="name" name="name" placeholder="Name" class="form-control" required="true" value="" type="text"></div>
                                                                <input type='hidden' class="form-control" name="rid" id="rid" readonly/>
                                                                <input type='hidden' class="form-control" name="username" id="username" value="Bercy_test" readonly/>

                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Address Line 1 *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="address" name="address" placeholder="Address Line 1" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>                       
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">City *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="city" name="city" placeholder="City" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>                         

                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Email *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="email" name="email" placeholder="Email" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Mobile No *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="mobile" name="mobile" maxlength="10" placeholder="Phone Number" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Referring Gideon's Name</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="refer_gideon" name="refer_gideon" placeholder="Gideon" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Church</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="church" name="church" placeholder="Church Name" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>                         
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>  
                                    </div>
                                    <div class="col-md-6">  
                                        <table class="table table-striped table-responsive" style="float: left; width: 100%">
                                            <tbody>
                                                <tr>
                                                    <td colspan="1" style="width: 50%">                                                   
                                                        <div class="form-group" >
                                                            <label class="col-md-4 control-label" >Address Line 2</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span><input id="address2" name="address2" placeholder="Address Line 2" class="form-control" required="true" value="" type="text" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;"></div>
                                                            </div>
                                                        </div> 
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Pin code *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="pincode" name="pincode" maxlength="6"  placeholder="Postal Code/ZIP" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">State *</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                                    <select style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" class="selectpicker form-control" id="state" name="state"> <option value="0" selected>-- Select State --</option>                                        
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
                                                                        <option value="West Bengal">West Bengal</option>   </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Secondary Email</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="email2" name="email2" placeholder="Email" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Alternate Number</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;"  maxlength="10"  id="mobile2" name="mobile2" placeholder="Phone Number" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Camp</label>
                                                            <div class="col-md-8 inputGroupContainer">
                                                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-liste"></i></span><input style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;" id="camp" name="camp" placeholder="Camp Name" class="form-control" required="true" value="" type="text"></div>
                                                            </div>
                                                        </div>

                                                        <p><input class="w3-check w3-medium w3-border" type="checkbox" value="1" name="pp" id="pp">
                                                            <label>Yes, I would like to be a Prayer Partner</label>
                                                        </p>
                                                        <p><input class="w3-check w3-medium w3-border" type="checkbox" value="1" name="d" id="d" onclick="cAmount();">
                                                            <label>Yes, I also want to be a Financial Partner to Donate Gideons Ministry</label>
                                                        </p>
                                                        <div id="camountdiv" hidden>
                                                            <label style="font-weight: bold; color: blue; font-size: small;">I would like to donate Funds in the below designated manner to support the printing of Scriptures &nbsp; (Average cost of 1 New Testament is Rs.35)</label>
                                                            <select class="form-control col-md-8" style="padding: 10px; vertical-align: middle; font-size: 13px; height: auto;"  name="camount" id="camount">                                
                                                                <option value="0">- Select support amount -</option>
                                                                <option value="m350">Rs 350 monthly</option>
                                                                <option value="m500">Rs 500 monthly</option>
                                                                <option value="m1000">Rs 1000 monthly</option>
                                                                <option value="m3500">Rs 3500 monthly</option>                                    
                                                                <option value="0">---</option>
                                                                <option value="y350">Rs 350 annually</option>
                                                                <option value="y500">Rs 500 annually</option>
                                                                <option value="y1000">Rs 1000 annually</option>
                                                                <option value="y3500">Rs 3500 annually</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>    
                                        <label>(*) Mandatory Part</label>
                                        <button type="submit" class="btn btn-primary action_add pull-right" id="action_add">SUBMIT</button> 
                                    </div> 
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="snackbar1"></div>
                    <br>
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

        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                var table = $('#example').DataTable({
                                                                    destroy: true,
                                                                    responsive: true,
                                                                    "ordering": true,
                                                                    'processing': true,
                                                                    'language': {
                                                                        'loadingRecords': '&nbsp;',
                                                                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                                                                    },
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
                                                                    ajax: {
                                                                        method: "POST",
                                                                        url: 'fog_edit_display_table.jsp',
                                                                        dataSrc: "datas"
                                                                    },
                                                                    columns: [
                                                                        {"data": "rid"},
                                                                        {"data": "camp"},
                                                                        {"data": "name"},
                                                                        {"data": "mobile"},
                                                                        {"data": "email"},
                                                                        {"data": "action"}
                                                                    ]
                                                                });
                                                            });
        </script>
        <script>
            $('#mobile2,#mobile,#pincode').keypress(function (e) {
                if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

        </script>
        <script>
            function cAmount() {
                if (document.getElementById("d").checked) {
                    document.getElementById("camountdiv").hidden = false;
                    alert("# Please fill in the information under Prayer Partner and then complete the following.\n\# Indicate your donation participation level below to receive the exclusive benefits of a Financial Partner");
                } else {
                    document.getElementById("camountdiv").hidden = true;

                }
            }
        </script>
        <script>
            $(document).on('click', '.delete', function (e) {
                var rid = $(this).attr('rid');
                var username = $("#username").val();
                e.preventDefault();
                var r = confirm("Are you sure ? Do you want to delete this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'fog_edit_save.jsp',
                        method: "POST",
                        data: {"action": "delete", "rid": rid, "username": username},
                        success: function (data) {
                            alert(data);
                            $('#example').DataTable().ajax.reload();
                            $('.modal-backdrop').remove();
                        }
                    });
                } else {
                    $('#myModal').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.action_add', function (e) {
                var hasError = false;
                $('#snackbar1').show();
                e.preventDefault();
                $(".error").hide();
                var rid = $("#rid").val();
                var camp = $("#camp").val();
                var name = $("#name").val();
                var email = $("#email").val();
                var email2 = $("#email2").val();
                var address = $("#address").val();
                var d = $("#d").val();
                var username = $("#username").val();
                var pp = $("#pp").val();
                var church = $("#church").val();
                var refer_gideon = $("#refer_gideon").val();
                var camount = $("#camount").val();
                var pincode = $("#pincode").val();
                var city = $("#city").val();
                var state = $("#state").val();
                var mobile2 = $("#mobile2").val();
                var mobile = $("#mobile").val();
                var address2 = $("#address2").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'fog_edit_save.jsp?action=Update&username=' + username + '&address2=' + address2 + '&mobile=' + mobile + '&mobile2=' + mobile2 + '&state=' + state + '&rid=' + rid + '&refer_gideon=' + refer_gideon + '&city=' + city + '&church=' + church + '&email=' + email + '&pincode=' + pincode + '&camount=' + camount + '&address=' + address + '&name=' + name + '&camp=' + camp + '&pp=' + pp + '&email2=' + email2 + '&d=' + d,
                        method: "POST",
                        data: {"action": "Update", "rid": rid, "username": username},
                        success: function (data) {
                            $("#snackbar1").hide();
                            alert(data);
                            $('#example').DataTable().ajax.reload();
                            $('#action_add').show();
                            $('.modal-backdrop').remove();
                            $('#myModal').modal('hide');
                            // $('#myModal').hide();
                        }
                    });
                } else {
                    $('#myModal').modal('show');
                    return false;
                }
            });
        </script>     

        <script>
            $(document).on('click', '.editRow1', function () {
                var rid = $(this).attr('rid');
                $("#camp").val('');
                $("#name").val('');
                $("#email").val('');
                $("#email2").val('');
                $("#address").val('');
                $("#address2").val('');
                $("#mobile").val('');
                $("#mobile2").val('');
                $("#state").val('');
                $("#city").val('');
                $("#pincode").val('');
                $("#camount").val('');
                $("#refer_gideon").val('');
                $("#church").val('');
                $("#pp").val('');
                $("#d").val('');
                $("#res").hide();
                $("#snackbar1").show();
                $("#snackbar1").html('<p style="width:100%; padding-top:20px; padding-bottom:20px; font-size:14px; height:60px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                $.ajax({
                    url: 'fog_edit_display.jsp?action=Edit&rid=' + rid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#snackbar1").hide();
                        $("#res").show();
                        $("#camp").val(data.camp);
                        $("#name").val(data.name);
                        $("#email").val(data.email);
                        $("#email2").val(data.email2);
                        $("#address").val(data.address);
                        $("#address2").val(data.address2);
                        $("#mobile").val(data.mobile);
                        $("#mobile2").val(data.mobile2);
                        $("#state").val(data.state);
                        $("#city").val(data.city);
                        $("#pincode").val(data.pincode);
                        $("#camount").val(data.camount);
                        $("#refer_gideon").val(data.refer_gideon);
                        $("#church").val(data.church);
                        $('#rid').val(data.rid);
                        //   $("#pp").val(data.pp);
                        // $('#d').val(data.fp);
                        if (data.pp = 1) {
                            $("#pp").prop("checked", 1);
                        } else {
                            $('#pp').val(data.pp);
                        }
                        if (data.fp = 1) {
                            $("#d").prop("checked", 1);
                        } else {
                            $('#d').val(data.fp);
                        }

                    }
                });
            });
        </script>
    </body>
</html>