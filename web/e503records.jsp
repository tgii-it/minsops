<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page language="java" import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="loadbaseinfo.jsp" %>	
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | e503 History</title>   
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
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
        <style>
            .ui-autocomplete {
                max-height: auto;
                overflow-y: auto;
                overflow-x: hidden;
            }

            * html .ui-autocomplete {
                height: auto;
            }
        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    
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

            #events {
                margin-bottom: 1em;
                padding: 1em;
                background-color: #f6f6f6;
                border: 1px solid #999;
                border-radius: 3px;
                height: 100px;
                overflow: auto;
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
            $(document).on('click', '.submit-btn', function (e) {

                if (frm2.fdate.value === "")
                {
                    alert("Please Select The Starting Date");
                    frm2.fdate.focus();
                    return (false);
                }
                if (frm2.todate.value === "")
                {
                    alert("Please Select The Ending Date");
                    frm2.todate.focus();
                    return (false);
                }
                $("#snackbar1").html('<p style="width:100%; height: 50px; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                $("final-submit").val("Processing, please wait...");

            });
        </script>
    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;" > 
        <%@ include file="menu.jsp" %>	
        <section class="container-fluid" style="padding: 60px 0px;" >  
            <form name="frm2" id="frm2" method="post" action="e503records.jsp" >  
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                            <i class="fa fa-fw fa-share"></i>&nbsp;e503&nbsp;Complete Report
                        </h3>
                    </div>
                    <div class="panel-body" style="padding-top: 20px;"> 
                        <div class="form-row"> 
                            <div class="form-group col-md-2">
                                <div class='input-group date' id="event_date_cal1">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    <input type="text" class="form-control" id="fdate" name="fdate" placeholder="DD/MM/YYYY" value="<%= fdate%>" autocomplete="off"/>
                                </div>
                            </div> 
                            <div class="form-group col-md-2">
                                <div class='input-group date' id="event_date_cal">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    <input type="text" class="form-control" id="todate" placeholder="DD/MM/YYYY" name="todate" value="<%= todate%>" autocomplete="off"/>
                                </div>
                            </div> 
                            <div class="form-group col-md-2">
                                <div class='input-group'>
                                    <input type="submit" class="btn btn-primary submit-btn" id="submit-btn" value="Get Records">
                                </div>                                            
                            </div>                                            
                        </div>
                    </div>                                    
                    <div id="snackbar"></div>
                    <div class="table-responsive" style="vertical-align: middle; width: 100%;  padding: 5px;">
                        <table id="comp_table" class="table table-bordered table-responsive table-hover" style="width:100%; font-size: 10px; color: navy; ">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr>
                                    <th style="text-align: left;" nowrap>MID</th> 
                                    <th style="text-align: left;" nowrap>Camp</th> 
                                    <th style="text-align: left;" nowrap>Submitted On</th> 
                                    <th style="text-align: right;" nowrap>View Payments</th>                                                 
                                    <th style="text-align: right;" nowrap>View SF</th>                                                   
                                    <th style="text-align: right;" nowrap>View Admin</th> 
                                    <th style="text-align: right;" nowrap>View Membership</th>    
                                    <th style="text-align: right;" nowrap>View PWT</th>                                              
                                    <th style="text-align: right;" nowrap>View Special Bible</th>
                                    <th style="text-align: right;" nowrap>View Merchandise</th>
                                    <th style="text-align: right;" nowrap>View CRO</th>
                                    <th style="text-align: center;" nowrap>Church Retiring Offertory Count</th> 
                                    <th style="text-align: right;" nowrap>Church Retiring Offertory Amount</th>
                                    <th style="text-align: center;" nowrap>National Convention Count</th>  
                                    <th style="text-align: right;" nowrap>National Convention CRO</th> 
                                    <th style="text-align: center;" nowrap>State Convention Count</th>  
                                    <th style="text-align: right;" nowrap>State Convention CRO</th>  
                                    <th style="text-align: center;" nowrap>Gideon Card Program Count</th> 
                                    <th style="text-align: right;" nowrap>Gideon Card Program</th>  
                                    <th style="text-align: right;" nowrap>Pastors Banquet (PAB)</th>  
                                    <th style="text-align: right;" nowrap>National Convention PAB</th>  
                                    <th style="text-align: right;" nowrap>State Convention PAB</th>
                                    <th style="text-align: right;" nowrap>Faith Fund Rally</th> 
                                    <th style="text-align: right;" nowrap>Faith Fund Gideons</th>  
                                    <th style="text-align: right;" nowrap>Faith Fund Auxiliary</th>  
                                    <th style="text-align: right;" nowrap>Faith Fund - Non Gideons</th>                                           
                                    <th style="text-align: right;" nowrap>Auxiliary Luncheon National</th>   
                                    <th style="text-align: right;" nowrap>Auxiliary Luncheon State	</th>   
                                    <th style="text-align: right;" nowrap>National Convention Special Offering</th>  
                                    <th style="text-align: right;" nowrap>State Convention Special Offering</th>  
                                    <th style="text-align: right;" nowrap>State Convention CD100</th>  
                                    <th style="text-align: right;" nowrap>State Convention Aux Heart Fund</th>  
                                    <th style="text-align: right;" nowrap>Total SF</th>
                                    <th style="text-align: left;" nowrap>SF Remarks</th>
                                    <th style="text-align: right;" nowrap>National Convention Contribution</th>  
                                    <th style="text-align: right;" nowrap>State Convention Contribution</th>
                                    <th style="text-align: right;" nowrap>Contribution to Administrative Funds</th>
                                    <th style="text-align: right;" nowrap>Total Administrative Fund</th>
                                    <th style="text-align: center;" nowrap>Annual Gideon Renewal Count</th>
                                    <th style="text-align: right;" nowrap>Annual Gideon Renewal </th>
                                    <th style="text-align: center;" nowrap>Annual Auxiliary Renewal Count</th>
                                    <th style="text-align: right;" nowrap>Annual Auxiliary Renewal</th>
                                    <th style="text-align: center;" nowrap>Life Opted Gideon Count</th>
                                    <th style="text-align: right;" nowrap>Life Opted Gideon</th>
                                    <th style="text-align: center;" nowrap>Life Opted Auxiliary Count</th>
                                    <th style="text-align: right;" nowrap>Life Opted Auxiliary</th>
                                    <th style="text-align: center;" nowrap>New Gideon Annual Count</th>    
                                    <th style="text-align: right;" nowrap>New Gideon Annual</th>  
                                    <th style="text-align: center;" nowrap>New Auxiliary Annual Count</th>    
                                    <th style="text-align: right;" nowrap>New Auxiliary Annual</th>
                                    <th style="text-align: center;" nowrap>New Gideon Life Count</th> 
                                    <th style="text-align: right;" nowrap>New Gideon Life</th>
                                    <th style="text-align: center;" nowrap>New Auxiliary Life Count</th>  
                                    <th style="text-align: right;" nowrap>New Auxiliary Life</th>
                                    <th style="text-align: center;" nowrap> Total Membership Count</th> 
                                    <th style="text-align: right;" nowrap> Total Membership</th>                                            
                                    <th style="text-align: left;" nowrap>Membership  Remarks</th> 
                                    <th style="text-align: center;" nowrap>PWT Gideon  Count</th>   
                                    <th style="text-align: right;" nowrap>PWT Gideon</th>   
                                    <th style="text-align: center;" nowrap>PWT Auxiliary Count</th>                                              
                                    <th style="text-align: right;" nowrap>PWT Auxiliary</th>                                            
                                    <th style="text-align: center;" nowrap>PWT Holy Bible Count</th> 
                                    <th style="text-align: right;" nowrap>PWT Holy Bible</th>  
                                    <th style="text-align: center;" nowrap>PWT Leather Bound Count</th>  
                                    <th style="text-align: right;" nowrap>PWT Leather Bound</th> 
                                    <th style="text-align: right;" nowrap> Total PWT amount</th>                                               
                                    <th style="text-align: left;" nowrap>PWT Remarks</th> 
                                    <th style="text-align: center;" nowrap>Slim Line Count</th>  
                                    <th style="text-align: right;" nowrap>Slim Line</th>  
                                    <th style="text-align: center;" nowrap>Dignitary - Indian Count</th>  
                                    <th style="text-align: right;" nowrap>Dignitary - Indian</th>  
                                    <th style="text-align: center;" nowrap>Dignitary - International Count</th> 
                                    <th style="text-align: right;" nowrap>Dignitary - International</th> 
                                    <th style="text-align: center;" nowrap>Total Special Bible Count</th>   
                                    <th style="text-align: right;" nowrap>Total Special Bible Amount</th> 
                                    <th style="text-align: center;" nowrap>Dispensers Count</th> 
                                    <th style="text-align: right;" nowrap>Dispensers Amount</th> 
                                    <th style="text-align: center;" nowrap>Gideon Guide Book Count</th> 
                                    <th style="text-align: right;" nowrap>Gideon Guide Book</th> 
                                    <th style="text-align: center;" nowrap>Auxiliary Guide Book Count</th>    
                                    <th style="text-align: right;" nowrap>Auxiliary Guide Book</th>   
                                    <th style="text-align: center;" nowrap>Gideon Emblem Count</th>    
                                    <th style="text-align: right;" nowrap>Gideon Emblem</th> 
                                    <th style="text-align: center;" nowrap>Auxiliary Emblem Count</th>  
                                    <th style="text-align: right;" nowrap>Auxiliary Emblem</th> 
                                    <th style="text-align: center;" nowrap>Testimony Booklets Count</th> 
                                    <th style="text-align: right;" nowrap>Testimony Booklets</th>  
                                    <th style="text-align: center;" nowrap>Song Books Count</th>  
                                    <th style="text-align: right;" nowrap>Song Books</th> 
                                    <th style="text-align: center;" nowrap>Paper Weight Count</th>   
                                    <th style="text-align: right;" nowrap>Paper Weight</th>   
                                    <th style="text-align: center;" nowrap>Car / Scooter Stickers Count</th> 
                                    <th style="text-align: right;" nowrap>Car / Scooter Stickers </th> 
                                    <th style="text-align: center;" nowrap>Count of Merchandise</th>
                                    <th style="text-align: right;" nowrap>Total of Merchandise</th> 
                                    <th style="text-align: center;" nowrap>Tally No</th>   
                                    <th style="text-align: center;" nowrap>Tally Date</th>      
                                    <th style="text-align: left;" nowrap>Tally Remarks</th>      
                                    <th style="text-align: left;" nowrap>State Association</th>   
                                    <th style="text-align: left;" nowrap>Remitter</th> 
                                </tr>
                            </thead> 
                            <%
                                String sql = "select remitter,nvl(cpcnt,'0') cpcnt,nvl(croamount,'0') croamount,modified_on,nvl(rlgamount,'0') rlgamount,rid,nvl(camp,'-') camp,nvl(nlgamount,'0') nlgamount,nvl(nlaamount,'0') nlaamount,nvl(mocnt,'0') mocnt,nvl(moamount,'0') moamount,nvl(pwtgcnt,'0') pwtgcnt,nvl(pwtgamount,'0') pwtgamount,nvl(pwtacnt,'0') pwtacnt,nvl(pwtaamount,'0') pwtaamount,nvl( pwthbcnt,'0') pwthbcnt,nvl( pwthbamount,'0') pwthbamount,nvl( pwtlbcnt,'0') pwtlbcnt,nvl( pwtlbamount,'0') pwtlbamount,nvl( pwtcnt,'0') pwtcnt,nvl( pwtamount,'0') pwtamount,nvl( slcnt,'0') slcnt,nvl( slamount,'0') slamount,nvl( dicnt,'0') dicnt,nvl( diamount,'0') diamount,nvl( diincnt,'0') diincnt,nvl( diinamount,'0') diinamount,nvl( splbcnt,'0') splbcnt,nvl( splbamount,'0') splbamount,nvl( ncpcnt,'0') ncpcnt,nvl( ncroamount,'0') ncroamount,nvl( scpcnt,'0') scpcnt,nvl( scroamount,'0') scroamount,nvl( pabcnt,'0') pabcnt,nvl( pabamount,'0') pabamount,nvl( ncpabamount,'0') ncpabamount,nvl( scpabamount,'0')scpabamount,nvl( ffrcnt,'0') ffrcnt,nvl( fframount,'0') fframount,nvl( gcbpcnt,'0') gcbpcnt,nvl( gcbpamount,'0') gcbpamount,nvl( ffgcnt,'0') ffgcnt,nvl( ffgamount,'0') ffgamount,nvl( ffacnt,'0') ffacnt,nvl( ffaamount,'0') ffaamount,nvl( ffocnt,'0') ffocnt,nvl( ffoamount,'0') ffoamount,nvl( ffbamount,'0') ffbamount,nvl( splocnt,'0') splocnt,nvl( sploamount,'0') sploamount,nvl( ncogcnt,'0') ncogcnt,nvl( ncogamount,'0')ncogamount,nvl( ncoacnt,'0') ncoacnt,nvl( ncoaamount,'0') ncoaamount,nvl( scogcnt,'0') scogcnt,nvl( scogamount,'0') scogamount,nvl( scoacnt,'0') scoacnt,nvl( scoaamount,'0')scoaamount,nvl( sf1cnt,'0') sf1cnt,nvl( sf1fee,'0') sf1fee,nvl( nccamount,'0') nccamount,nvl( sccamount,'0') sccamount,nvl( cafamount,'0') cafamount,nvl( afamount,'0')afamount,nvl( ggbcnt,'0') ggbcnt,nvl( ggbamount,'0') ggbamount,nvl( dispcnt,'0') dispcnt,nvl( dispamount,'0') dispamount,nvl( agbcnt,'0') agbcnt,nvl( agbamount,'0') agbamount,nvl( gecnt,'0') gecnt,nvl( geamount,'0') geamount,nvl( aecnt,'0') aecnt,nvl( aeamount,'0') aeamount,nvl( tbcnt,'0') tbcnt,nvl( tbamount,'0') tbamount,nvl( sbcnt,'0') sbcnt,nvl( sbamount,'0') sbamount,nvl( pwcnt,'0') pwcnt,nvl( pwamount,'0') pwamount,nvl( stickerscnt,'0') stickerscnt,nvl( stickersamount,'0') stickersamount,nvl( sf2cnt,'0') sf2cnt,nvl( sf2fee,'0') sf2fee,nvl( total_amount,'0') total_amount,nvl( remitter,'-') remitter,nvl( mremarks,'-') mremarks,nvl( pwtremarks,'-') pwtremarks,nvl( sf1remarks,'-') sf1remarks,nvl( miremarks,'-') miremarks,nvl( rlaamount,'0') rlaamount,nvl( nagcnt,'0') nagcnt,nvl( naacnt,'0') naacnt,nvl( nlgcnt,'0') nlgcnt,nvl( nlacnt,'0') nlacnt,nvl( nagamount,'0') nagamount,nvl( naaamount,'0') naaamount,nvl( ragcnt,'0') ragcnt,nvl( raacnt,'0') raacnt,nvl( rlgcnt,'0') rlgcnt,nvl( rlacnt,'0') rlacnt,nvl( ragamount,'0') ragamount,nvl( raaamount,'0') raaamount,nvl(e503_Get_TallyNo(rid),'Reconciliation Pending') e503_tallyno,nvl(e503_Get_TallyDate(rid),'-') e503_tallydate,nvl(e503_get_Tally_Remarks(rid),'-') tally_remarks,nvl(Cars_get_StateAsso(camp),'-') SA from e503 where rid in (select distinct mid from e503_payment where to_date(e503date,'DD-MM-YY') between to_date('" + fdate + "','DD/MM/YYYY') and to_date('" + todate + "','DD/MM/YYYY')) order by rid asc";
                                String remitter = "";
                                DataSource ds = null;
                                Connection con = null;
                                ResultSet resultSet = null;
                                Context context = new InitialContext();
                                Context envCtx = (Context) context.lookup("java:comp/env");
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                try {
                                    con = ds.getConnection();
                                    Statement statement = con.createStatement();
                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                        remitter = resultSet.getString("remitter");
                                        if (remitter == null) {
                                            remitter = "";
                                        } else if (remitter == "0" || remitter.equalsIgnoreCase("0")) {
                                            remitter = "";
                                        }
                                        if (resultSet.getString("e503_tallyno").contains("Pending")) {
                            %>
                            <tr style="background-color: yellow; font-weight: bold; font-size: 11px; color: navy;">
                                <%
                                } else {
                                %>
                            <tr>
                                <%
                                    }
                                %>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("rid")%></td>                               
                                <td style="text-align: left;" nowrap><%=resultSet.getString("camp")%></td>  
                                <td style="text-align: left;" nowrap><%=resultSet.getString("modified_on")%></td>
                                <%
                                    if (Integer.parseInt(resultSet.getString("total_amount")) > 0) {
                                %>
                                <td rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal' class='first' name='editRow'  title='View this record' style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: antiquewhite; color:black;' nowrap><%=resultSet.getString("total_amount")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("total_amount")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("sf1fee")) > 0) {
                                %>
                                <td  class='second' name='editRow1' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal1' title='View this record'  style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: wheat; color:black;' nowrap><%=resultSet.getString("sf1fee")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("sf1fee")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("afamount")) > 0) {
                                %>
                                <td  class='third' name='editRow2' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal2' title='View this record'  style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: wheat; color:black;' nowrap><%=resultSet.getString("afamount")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("afamount")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("moamount")) > 0) {
                                %>
                                <td   class='fourth' name='editRow3' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal3' title='View this record'  style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: wheat; color:black;' nowrap><%=resultSet.getString("moamount")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("moamount")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("pwtamount")) > 0) {
                                %>
                                <td class='fivth' name='editRow4' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal4' title='View this record'  style='cursor:pointer; font-weight: bold; background-color: wheat; color:black; text-decoration: none; text-align: center;' nowrap><%=resultSet.getString("pwtamount")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("pwtamount")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("splbamount")) > 0) {
                                %>
                                <td  class=' sixth' name='editRow5' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal5' title='View this record'  style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: wheat; color:black;' nowrap><%=resultSet.getString("splbamount")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("splbamount")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("sf2fee")) > 0) {
                                %>
                                <td class='seventh' name='editRow6' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal6' title='View this record'  style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: wheat; color:black;' nowrap><%=resultSet.getString("sf2fee")%></td>
                                <%
                                } else {
                                %>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("sf2fee")%></td>
                                <%
                                    }
                                    if (Integer.parseInt(resultSet.getString("croamount")) > 0) {
                                %>
                                <td class='tenth' name='editRow10' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal10' title='View this record'  style='cursor:pointer; text-decoration: none; text-align: center; font-weight: bold; background-color: wheat; color:black;' nowrap><%=resultSet.getString("croamount")%></td>
                                <%
                                } else {
                                %>

                                <td style="text-align: center;" nowrap><%=resultSet.getString("croamount")%></td>
                                <%
                                    }
                                %>

                                <td style="text-align: center;" nowrap><%=resultSet.getString("cpcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("croamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("ncpcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncroamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("scpcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("scroamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("gcbpcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbpamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pabamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncpabamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("scpabamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("fframount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffgamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffaamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffoamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffbamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sploamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncogamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncoaamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("scogamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("scoaamount")%></td>                                  
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf1fee")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("sf1remarks")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("nccamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sccamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cafamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("afamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("ragcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ragamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("raacnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("raaamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("rlgcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("rlgamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("rlacnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("rlaamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("nagcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("nagamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("naacnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("naaamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("nlgcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("nlgamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("nlacnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("nlaamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("mocnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("moamount")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mremarks")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("pwtgcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwtgamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("pwtacnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwtaamount")%></td>                                  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("pwthbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwthbamount")%></td>                                  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("pwtlbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwtlbamount")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwtamount")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("pwtremarks")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("slcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("slamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("dicnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("diamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("diincnt")%></td>                                  
                                <td style="text-align: right;" nowrap><%=resultSet.getString("diinamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("splbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("splbamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("dispcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("dispamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("ggbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ggbamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("agbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("agbamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("gecnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("geamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("aecnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aeamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("tbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("tbamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("sbcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sbamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("pwcnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("stickerscnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("stickersamount")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("sf2cnt")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf2fee")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("e503_tallyno")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("e503_tallydate")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("tally_remarks")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("SA")%></td>                            
                                <td style="text-align: left;" nowrap><%=remitter%></td>
                            </tr>
                            <%
                                    }
                                    resultSet.close();
                                    statement.close();
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <tfoot style="background-color: yellow;">
                                <tr>            
                                    <th colspan="3" style="text-align:right">Page Total: <br>Overall Total:</th>
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 

                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th colspan="1" ></th>
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>  
                                    <th colspan="1" ></th>
                                    <th style="text-align: center;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>  
                                    <th style="text-align: center;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>  
                                    <th style="text-align: center;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>  
                                    <th style="text-align: center;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>  
                                    <th colspan="1" ></th>
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>  
                                    <th style="text-align: center;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>  
                                    <th style="text-align: center;" nowrap></th>  
                                    <th style="text-align: right;" nowrap></th>    
                                    <th style="text-align: right;" nowrap></th>    
                                    <th style="text-align: right;" nowrap></th>     
                                    <th style="text-align: right;" nowrap></th>     
                                    <th style="text-align: right;" nowrap></th>      
                                    <th style="text-align: right;" nowrap></th>  
                                </tr>
                            </tfoot>
                        </table>                                     
                    </div>
                </div>
            </form>
        </section> 
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form name="frm_apply" method="post"  >
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Payments In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="payment" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>          
                                                <th style="text-align: center;" nowrap>RID</th>
                                                <th style="text-align: left;" nowrap>Adjustment Date</th>
                                                <th style="text-align: left;" nowrap>E503 Month</th>
                                                <th style="text-align: left;" nowrap>E503 Year</th>
                                                <th style="text-align: left;" nowrap>Camp</th>
                                                <th style="text-align: left;" nowrap>Contact Person</th>
                                                <th style="text-align: left;" nowrap>Status</th>  
                                                <th style="text-align: left;" nowrap>Pay Mode</th>   
                                                <th style="text-align: left;" nowrap>Transaction Number</th>   
                                                <th style="text-align: left;" nowrap>Transaction Date</th>
                                                <th style="text-align: right;" nowrap>Transaction Amount</th>                                                
                                                <th style="text-align: left;" nowrap>Transaction Bank</th>                                                
                                                <th style="text-align: left;" nowrap>Transaction Branch</th>
                                                <th style="text-align: left;" nowrap>Transaction Remarks</th>
                                                <th style="text-align: left;" nowrap>Tally Number</th>   
                                                <th style="text-align: left;" nowrap>Tally Date</th>   
                                                <th style="text-align: left;" nowrap>Voucher Type</th>  
                                                <th style="text-align: left;" nowrap>Debit Ledger</th>  
                                                <th style="text-align: left;" nowrap>Bank Voucher</th>  
                                                <th style="text-align: left;" nowrap>Cheque Issued Bank</th>  
                                                <th style="text-align: left;" nowrap>Deposit Date</th>
                                                <th style="text-align: left;" nowrap>Tally Remarks</th>  
                                                <th style="text-align: left;" nowrap>Reconciled By</th>  
                                                <th style="text-align: left;" nowrap>Reconciled On</th>  
                                            </tr>
                                        </thead>                                     
                                        <tfoot>
                                            <tr>
                                                <th colspan="10" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th  colspan="13" style="text-align:right"></th>                                                                                                 
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>   
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Scripture Fund In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="sf" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>Church Retiring Offertory Count</th>
                                                <th style="text-align: center;" nowrap>Church Retiring Offertory (CRO)</th>                                                 
                                                <th style="text-align: center;" nowrap>National Convention Count</th>
                                                <th style="text-align: center;" nowrap>National Convention CRO</th>                                                
                                                <th style="text-align: center;" nowrap>State Convention Count</th>
                                                <th style="text-align: center;" nowrap>State Convention CRO</th>                                                
                                                <th style="text-align: center;" nowrap>Gideon Card Program Count</th>   
                                                <th style="text-align: center;" nowrap>Gideon Card Program</th>   
                                                <th style="text-align: center;" nowrap>Pastors Banquet (PAB)</th>   
                                                <th style="text-align: center;" nowrap>National Convention PAB</th>
                                                <th style="text-align: center;" nowrap>State Convention PAB</th>                                                
                                                <th style="text-align: center;" nowrap>Faith Fund Rally</th>                                                
                                                <th style="text-align: center;" nowrap>Faith Fund Gideons</th>
                                                <th style="text-align: center;" nowrap>Faith Fund Auxiliary</th>  
                                                <th style="text-align: center;" nowrap>Faith Fund - Non Gideons</th>
                                                <th style="text-align: center;" nowrap>Auxiliary Luncheon National</th>
                                                <th style="text-align: center;" nowrap>Auxiliary Luncheon State</th>
                                                <th style="text-align: center;" nowrap>National Convention Special Offering</th>   
                                                <th style="text-align: center;" nowrap>State Convention Special Offering</th>   
                                                <th style="text-align: center;" nowrap>State Convention CD100</th>
                                                <th style="text-align: center;" nowrap>State Convention Aux Heart Fund</th>    
                                            </tr>
                                        </thead>
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Administrative Fund in Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="admin" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>National Convention Contribution</th>
                                                <th style="text-align: center;" nowrap>State Convention Contribution</th>
                                                <th style="text-align: center;" nowrap>Contribution to Administrative Funds</th>                                                
                                            </tr>
                                        </thead> 
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Member In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="member" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>Camp</th>
                                                <th style="text-align: left;" nowrap>Name</th>
                                                <th style="text-align: left;" nowrap>Member Plan</th>
                                                <th style="text-align: left;" nowrap>Member Status</th>   
                                                <th style="text-align: left;" nowrap>Phone</th>   
                                                <th style="text-align: left;" nowrap>Record Status</th>
                                                <th style="text-align: left;" nowrap>Submitted On</th>                                                
                                                <th style="text-align: left;" nowrap>Contact Person</th>   
                                                <th style="text-align: left;" nowrap>Tally Receipt Number</th>
                                                <th style="text-align: left;" nowrap>Email</th>                                                
                                            </tr>
                                        </thead>                                       
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>PWT In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="pwt" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: left;" nowrap>Type</th>
                                                <th style="text-align: left;" nowrap>Language</th>
                                                <th style="text-align: left;" nowrap>Color</th>
                                                <th style="text-align: right;" nowrap>Quantity</th> 
                                                <th style="text-align: right;" nowrap>Amount</th> 
                                            </tr>
                                        </thead> 
                                        <tfoot>
                                            <tr>
                                                <th colspan="3" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>     
                                                <th></th>     
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Special Bible In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="sb" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: left;" nowrap>Type</th>
                                                <th style="text-align: right;" nowrap>Quantity</th>
                                                <th style="text-align: right;" nowrap>Amount</th>
                                            </tr>
                                        </thead> 
                                        <tfoot>
                                            <tr>
                                                <th colspan="1" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th></th>                                                                                                                                              
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Merchandise In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="merchan" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>Gideon Guide Book Count</th> 
                                                <th style="text-align: center;" nowrap>Gideon Guide Book</th> 
                                                <th style="text-align: center;" nowrap>Auxiliary Guide Book Count</th>    
                                                <th style="text-align: center;" nowrap>Auxiliary Guide Book</th>   
                                                <th style="text-align: center;" nowrap>Gideon Emblem Count</th>    
                                                <th style="text-align: center;" nowrap>Gideon Emblem</th> 
                                                <th style="text-align: center;" nowrap>Auxiliary Emblem Count</th>  
                                                <th style="text-align: center;" nowrap>Auxiliary Emblem</th> 
                                                <th style="text-align: center;" nowrap>Testimony Booklets Count</th> 
                                                <th style="text-align: center;" nowrap>Testimony Booklets</th>  
                                                <th style="text-align: center;" nowrap>Song Books Count</th>  
                                                <th style="text-align: center;" nowrap>Song Books</th> 
                                                <th style="text-align: center;" nowrap>Paper Weight Count</th>   
                                                <th style="text-align: center;" nowrap>Paper Weight</th>   
                                                <th style="text-align: center;" nowrap>Car / Scooter Stickers Count</th> 
                                                <th style="text-align: center;" nowrap>Car / Scooter Stickers </th> 
                                            </tr>
                                        </thead> 
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="reso">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center> 
                                        <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>CRO In Detail</b>
                                        </h3>
                                    </center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy;  padding: 5px;">
                                    <table id="cro" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: left;" nowrap>Church Name</th> 
                                                <th style="text-align: left;" nowrap>Church Address</th> 
                                                <th style="text-align: left;" nowrap>Speaker Name</th>    
                                                <th style="text-align: left;" nowrap>Pastor Name</th>   
                                                <th style="text-align: left;" nowrap>CP Date</th>    
                                                <th style="text-align: right;" nowrap>CP Amount</th> 
                                                <th style="text-align: left;" nowrap>Pastor Number</th>  
                                                <th style="text-align: left;" nowrap>Pastor Email</th> 
                                                <th style="text-align: left;" nowrap>Camp</th> 
                                                <th style="text-align: left;" nowrap>Submitted By</th>  
                                                <th style="text-align: left;" nowrap>Submitted On</th>  
                                                <th style="text-align: center;" nowrap>RID</th> 
                                                <th style="text-align: center;" nowrap>MID</th>   
                                            </tr>
                                        </thead> 
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
        <!--   <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script> -->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#comp_table').DataTable({
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
                    ], columnDefs: [
                        {className: 'text-center', targets: [10, 12, 14, 16, 37, 39, 41, 43, 45, 47, 49, 51, 53, 56, 58, 60, 62, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90]}

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
                        total3 = api
                                .column(3)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total4 = api
                                .column(4)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total5 = api
                                .column(5)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total6 = api
                                .column(6)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total7 = api
                                .column(7)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total8 = api
                                .column(8)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total9 = api
                                .column(9)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        total10 = api
                                .column(10)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total11 = api
                                .column(11)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total12 = api
                                .column(12)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total13 = api
                                .column(13)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total14 = api
                                .column(14)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total15 = api
                                .column(15)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total16 = api
                                .column(16)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total17 = api
                                .column(17)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total18 = api
                                .column(18)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total19 = api
                                .column(19)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total20 = api
                                .column(20)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        total21 = api
                                .column(21)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total22 = api
                                .column(22)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total23 = api
                                .column(23)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total24 = api
                                .column(24)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total25 = api
                                .column(25)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total26 = api
                                .column(26)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total27 = api
                                .column(27)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total28 = api
                                .column(28)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total29 = api
                                .column(29)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total30 = api
                                .column(30)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total31 = api
                                .column(31)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        total33 = api
                                .column(33)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total34 = api
                                .column(34)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total35 = api
                                .column(35)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total36 = api
                                .column(36)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total37 = api
                                .column(37)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total38 = api
                                .column(38)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total39 = api
                                .column(39)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total40 = api
                                .column(40)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total41 = api
                                .column(41)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total42 = api
                                .column(42)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total43 = api
                                .column(43)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total44 = api
                                .column(44)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total45 = api
                                .column(45)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total46 = api
                                .column(46)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total47 = api
                                .column(47)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total48 = api
                                .column(48)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total49 = api
                                .column(49)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total50 = api
                                .column(50)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total51 = api
                                .column(51)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total52 = api
                                .column(52)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total53 = api
                                .column(53)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total54 = api
                                .column(54)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        total56 = api
                                .column(56)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total57 = api
                                .column(57)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total58 = api
                                .column(58)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total59 = api
                                .column(59)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total60 = api
                                .column(60)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total61 = api
                                .column(61)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total62 = api
                                .column(62)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total63 = api
                                .column(63)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total64 = api
                                .column(64)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        total66 = api
                                .column(66)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total67 = api
                                .column(67)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total68 = api
                                .column(68)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total69 = api
                                .column(69)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total70 = api
                                .column(70)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total71 = api
                                .column(71)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total72 = api
                                .column(72)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total73 = api
                                .column(73)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total74 = api
                                .column(74)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total75 = api
                                .column(75)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total76 = api
                                .column(76)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total77 = api
                                .column(77)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total78 = api
                                .column(78)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total79 = api
                                .column(79)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total80 = api
                                .column(80)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total81 = api
                                .column(81)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total82 = api
                                .column(82)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total83 = api
                                .column(83)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total84 = api
                                .column(84)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total85 = api
                                .column(85)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total86 = api
                                .column(86)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total87 = api
                                .column(87)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total88 = api
                                .column(88)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total89 = api
                                .column(89)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        total90 = api
                                .column(90)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        total91 = api
                                .column(91)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal3 = api
                                .column(3, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal4 = api
                                .column(4, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal5 = api
                                .column(5, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal6 = api
                                .column(6, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal7 = api
                                .column(7, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal8 = api
                                .column(8, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal9 = api
                                .column(9, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal10 = api
                                .column(10, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal11 = api
                                .column(11, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal12 = api
                                .column(12, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal13 = api
                                .column(13, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal14 = api
                                .column(14, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal15 = api
                                .column(15, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal16 = api
                                .column(16, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal17 = api
                                .column(17, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal18 = api
                                .column(18, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal19 = api
                                .column(19, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal20 = api
                                .column(20, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal21 = api
                                .column(21, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal22 = api
                                .column(22, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal23 = api
                                .column(23, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal24 = api
                                .column(24, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal25 = api
                                .column(25, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal26 = api
                                .column(26, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal27 = api
                                .column(27, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal28 = api
                                .column(28, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal29 = api
                                .column(29, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal30 = api
                                .column(30, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal31 = api
                                .column(31, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal33 = api
                                .column(33, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal34 = api
                                .column(34, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal35 = api
                                .column(35, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal36 = api
                                .column(36, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal37 = api
                                .column(37, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal38 = api
                                .column(38, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal39 = api
                                .column(39, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal40 = api
                                .column(40, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal41 = api
                                .column(41, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal42 = api
                                .column(42, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal43 = api
                                .column(43, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal44 = api
                                .column(44, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal45 = api
                                .column(45, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal46 = api
                                .column(46, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal47 = api
                                .column(47, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal48 = api
                                .column(48, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal49 = api
                                .column(49, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal50 = api
                                .column(50, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal51 = api
                                .column(51, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal52 = api
                                .column(52, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal53 = api
                                .column(53, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal54 = api
                                .column(54, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal56 = api
                                .column(56, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal57 = api
                                .column(57, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal58 = api
                                .column(58, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal59 = api
                                .column(59, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal60 = api
                                .column(60, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal61 = api
                                .column(61, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal62 = api
                                .column(62, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal63 = api
                                .column(63, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal64 = api
                                .column(64, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal66 = api
                                .column(66, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal67 = api
                                .column(67, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal68 = api
                                .column(68, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal69 = api
                                .column(69, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal70 = api
                                .column(70, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal71 = api
                                .column(31, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal72 = api
                                .column(72, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal73 = api
                                .column(73, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal74 = api
                                .column(74, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal75 = api
                                .column(75, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal76 = api
                                .column(76, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal77 = api
                                .column(77, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal78 = api
                                .column(78, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal79 = api
                                .column(79, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal80 = api
                                .column(80, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal81 = api
                                .column(81, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal82 = api
                                .column(82, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal83 = api
                                .column(83, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal84 = api
                                .column(84, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal85 = api
                                .column(85, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal86 = api
                                .column(86, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal87 = api
                                .column(87, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal88 = api
                                .column(88, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);

                        pageTotal89 = api
                                .column(89, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal90 = api
                                .column(90, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        pageTotal91 = api
                                .column(91, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        $(api.column(3).footer()).html(
                                '' + pageTotal3 + '<br>(' + total3 + ')'
                                );
                        $(api.column(4).footer()).html(
                                '' + pageTotal4 + '<br>(' + total4 + ')'
                                );

                        $(api.column(5).footer()).html(
                                '' + pageTotal5 + '<br>(' + total5 + ')'
                                );
                        $(api.column(6).footer()).html(
                                '' + pageTotal6 + '<br>(' + total6 + ')'
                                );
                        $(api.column(7).footer()).html(
                                '' + pageTotal7 + '<br>(' + total7 + ')'
                                );
                        $(api.column(8).footer()).html(
                                '' + pageTotal8 + '<br>(' + total8 + ')'
                                );
                        $(api.column(9).footer()).html(
                                '' + pageTotal9 + '<br>(' + total9 + ')'
                                );
                        $(api.column(10).footer()).html(
                                '' + pageTotal10 + '<br>(' + total10 + ')'
                                );
                        $(api.column(11).footer()).html(
                                '' + pageTotal11 + '<br>(' + total11 + ')'
                                );
                        $(api.column(12).footer()).html(
                                '' + pageTotal12 + '<br>(' + total12 + ')'
                                );
                        $(api.column(13).footer()).html(
                                '' + pageTotal13 + '<br>(' + total13 + ')'
                                );
                        $(api.column(14).footer()).html(
                                '' + pageTotal14 + '<br>(' + total14 + ')'
                                );

                        $(api.column(15).footer()).html(
                                '' + pageTotal15 + '<br>(' + total15 + ')'
                                );
                        $(api.column(16).footer()).html(
                                '' + pageTotal16 + '<br>(' + total16 + ')'
                                );
                        $(api.column(17).footer()).html(
                                '' + pageTotal17 + '<br>(' + total17 + ')'
                                );
                        $(api.column(18).footer()).html(
                                '' + pageTotal18 + '<br>(' + total18 + ')'
                                );
                        $(api.column(19).footer()).html(
                                '' + pageTotal19 + '<br>(' + total19 + ')'
                                );
                        $(api.column(20).footer()).html(
                                '' + pageTotal20 + '<br>(' + total20 + ')'
                                );

                        $(api.column(21).footer()).html(
                                '' + pageTotal21 + '<br>(' + total21 + ')'
                                );
                        $(api.column(22).footer()).html(
                                '' + pageTotal22 + '<br>(' + total22 + ')'
                                );
                        $(api.column(23).footer()).html(
                                '' + pageTotal23 + '<br>(' + total23 + ')'
                                );
                        $(api.column(24).footer()).html(
                                '' + pageTotal24 + '<br>(' + total24 + ')'
                                );
                        $(api.column(25).footer()).html(
                                '' + pageTotal25 + '<br>(' + total25 + ')'
                                );
                        $(api.column(26).footer()).html(
                                '' + pageTotal26 + '<br>(' + total26 + ')'
                                );
                        $(api.column(27).footer()).html(
                                '' + pageTotal27 + '<br>(' + total27 + ')'
                                );
                        $(api.column(28).footer()).html(
                                '' + pageTotal28 + '<br>(' + total28 + ')'
                                );
                        $(api.column(29).footer()).html(
                                '' + pageTotal29 + '<br>(' + total29 + ')'
                                );
                        $(api.column(30).footer()).html(
                                '' + pageTotal30 + '<br>(' + total30 + ')'
                                );
                        $(api.column(31).footer()).html(
                                '' + pageTotal31 + '<br>(' + total31 + ')'
                                );

                        $(api.column(33).footer()).html(
                                '' + pageTotal33 + '<br>(' + total33 + ')'
                                );
                        $(api.column(34).footer()).html(
                                '' + pageTotal34 + '<br>(' + total34 + ')'
                                );

                        $(api.column(35).footer()).html(
                                '' + pageTotal35 + '<br>(' + total35 + ')'
                                );
                        $(api.column(36).footer()).html(
                                '' + pageTotal36 + '<br>(' + total36 + ')'
                                );
                        $(api.column(37).footer()).html(
                                '' + pageTotal37 + '<br>(' + total37 + ')'
                                );
                        $(api.column(38).footer()).html(
                                '' + pageTotal38 + '<br>(' + total38 + ')'
                                );
                        $(api.column(39).footer()).html(
                                '' + pageTotal39 + '<br>(' + total39 + ')'
                                );
                        $(api.column(40).footer()).html(
                                '' + pageTotal40 + '<br>(' + total40 + ')'
                                );

                        $(api.column(41).footer()).html(
                                '' + pageTotal41 + '<br>(' + total41 + ')'
                                );
                        $(api.column(42).footer()).html(
                                '' + pageTotal42 + '<br>(' + total42 + ')'
                                );
                        $(api.column(43).footer()).html(
                                '' + pageTotal43 + '<br>(' + total43 + ')'
                                );
                        $(api.column(44).footer()).html(
                                '' + pageTotal44 + '<br>(' + total44 + ')'
                                );
                        $(api.column(45).footer()).html(
                                '' + pageTotal45 + '<br>(' + total45 + ')'
                                );
                        $(api.column(47).footer()).html(
                                '' + pageTotal47 + '<br>(' + total47 + ')'
                                );
                        $(api.column(48).footer()).html(
                                '' + pageTotal48 + '<br>(' + total48 + ')'
                                );
                        $(api.column(49).footer()).html(
                                '' + pageTotal49 + '<br>(' + total49 + ')'
                                );
                        $(api.column(50).footer()).html(
                                '' + pageTotal50 + '<br>(' + total50 + ')'
                                );
                        $(api.column(51).footer()).html(
                                '' + pageTotal51 + '<br>(' + total51 + ')'
                                );
                        $(api.column(52).footer()).html(
                                '' + pageTotal52 + '<br>(' + total52 + ')'
                                );
                        $(api.column(53).footer()).html(
                                '' + pageTotal53 + '<br>(' + total53 + ')'
                                );
                        $(api.column(54).footer()).html(
                                '' + pageTotal54 + '<br>(' + total54 + ')'
                                );

                        $(api.column(56).footer()).html(
                                '' + pageTotal56 + '<br>(' + total56 + ')'
                                );
                        $(api.column(57).footer()).html(
                                '' + pageTotal57 + '<br>(' + total57 + ')'
                                );
                        $(api.column(58).footer()).html(
                                '' + pageTotal58 + '<br>(' + total58 + ')'
                                );
                        $(api.column(59).footer()).html(
                                '' + pageTotal59 + '<br>(' + total59 + ')'
                                );
                        $(api.column(60).footer()).html(
                                '' + pageTotal60 + '<br>(' + total60 + ')'
                                );
                        $(api.column(61).footer()).html(
                                '' + pageTotal61 + '<br>(' + total61 + ')'
                                );
                        $(api.column(62).footer()).html(
                                '' + pageTotal62 + '<br>(' + total62 + ')'
                                );
                        $(api.column(63).footer()).html(
                                '' + pageTotal63 + '<br>(' + total63 + ')'
                                );
                        $(api.column(64).footer()).html(
                                '' + pageTotal64 + '<br>(' + total64 + ')'
                                );


                        $(api.column(66).footer()).html(
                                '' + pageTotal66 + '<br>(' + total66 + ')'
                                );
                        $(api.column(67).footer()).html(
                                '' + pageTotal67 + '<br>(' + total67 + ')'
                                );
                        $(api.column(68).footer()).html(
                                '' + pageTotal68 + '<br>(' + total68 + ')'
                                );
                        $(api.column(69).footer()).html(
                                '' + pageTotal69 + '<br>(' + total69 + ')'
                                );
                        $(api.column(70).footer()).html(
                                '' + pageTotal70 + '<br>(' + total70 + ')'
                                );
                        $(api.column(71).footer()).html(
                                '' + pageTotal71 + '<br>(' + total71 + ')'
                                );
                        $(api.column(72).footer()).html(
                                '' + pageTotal72 + '<br>(' + total72 + ')'
                                );
                        $(api.column(73).footer()).html(
                                '' + pageTotal73 + '<br>(' + total73 + ')'
                                );
                        $(api.column(74).footer()).html(
                                '' + pageTotal74 + '<br>(' + total74 + ')'
                                );

                        $(api.column(75).footer()).html(
                                '' + pageTotal75 + '<br>(' + total75 + ')'
                                );
                        $(api.column(76).footer()).html(
                                '' + pageTotal76 + '<br>(' + total76 + ')'
                                );
                        $(api.column(77).footer()).html(
                                '' + pageTotal77 + '<br>(' + total77 + ')'
                                );
                        $(api.column(78).footer()).html(
                                '' + pageTotal78 + '<br>(' + total78 + ')'
                                );
                        $(api.column(79).footer()).html(
                                '' + pageTotal79 + '<br>(' + total79 + ')'
                                );

                        $(api.column(80).footer()).html(
                                '' + pageTotal80 + '<br>(' + total80 + ')'
                                );
                        $(api.column(81).footer()).html(
                                '' + pageTotal81 + '<br>(' + total81 + ')'
                                );
                        $(api.column(82).footer()).html(
                                '' + pageTotal82 + '<br>(' + total82 + ')'
                                );
                        $(api.column(83).footer()).html(
                                '' + pageTotal83 + '<br>(' + total83 + ')'
                                );
                        $(api.column(84).footer()).html(
                                '' + pageTotal84 + '<br>(' + total84 + ')'
                                );

                        $(api.column(85).footer()).html(
                                '' + pageTotal85 + '<br>(' + total85 + ')'
                                );
                        $(api.column(86).footer()).html(
                                '' + pageTotal86 + '<br>(' + total86 + ')'
                                );
                        $(api.column(87).footer()).html(
                                '' + pageTotal87 + '<br>(' + total87 + ')'
                                );
                        $(api.column(88).footer()).html(
                                '' + pageTotal88 + '<br>(' + total88 + ')'
                                );
                        $(api.column(89).footer()).html(
                                '' + pageTotal89 + '<br>(' + total89 + ')'
                                );
                        $(api.column(90).footer()).html(
                                '' + pageTotal90 + '<br>(' + total90 + ')'
                                );
                        $(api.column(91).footer()).html(
                                '' + pageTotal91 + '<br>(' + total91 + ')'
                                );
                    }
                });
            });
        </script>       
        <script >

            $('#event_date_cal').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
        </script>
        <script >

            $('#event_date_cal1').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
        </script>
        <script>
            $(document).on('click', '.seventh', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'MerchanView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#merchan').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "MerchanView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "ggbcnt"},
                                {"data": "ggbamount"},
                                {"data": "agbcnt"},
                                {"data": "agbamount"},
                                {"data": "gecnt"},
                                {"data": "geamount"},
                                {"data": "aecnt"},
                                {"data": "aeamount"},
                                {"data": "tbcnt"},
                                {"data": "tbamount"},
                                {"data": "sbcnt"},
                                {"data": "sbamount"},
                                {"data": "pwcnt"},
                                {"data": "pwamount"},
                                {"data": "stickerscnt"},
                                {"data": "stickersamount"}
                            ], columnDefs: [
                                {className: 'text-center', targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]}

                            ]
                        });

                    }
                });
            });
        </script>

        <script>
            $(document).on('click', '.tenth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'CROView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#cro').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "CROView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "church_name"},
                                {"data": "church_address"},
                                {"data": "speaker_name"},
                                {"data": "pastor_name"},
                                {"data": "cp_date"},
                                {"data": "cp_amount"},
                                {"data": "pastor_number"},
                                {"data": "pastor_email"},
                                {"data": "camp"},
                                {"data": "submitted_by"},
                                {"data": "submitted_on"},
                                {"data": "rid"},
                                {"data": "mid"}
                            ], columnDefs: [
                                {className: 'text-right', targets: [5]}

                            ]
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.third', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'AdminView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#admin').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "AdminView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "nccamount"},
                                {"data": "sccamount"},
                                {"data": "cafamount"}
                            ], columnDefs: [
                                {className: 'text-center', targets: [0, 1, 2]}

                            ]
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.fivth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'PWTView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#pwt').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "PWTView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "type"},
                                {"data": "language"},
                                {"data": "color"},
                                {"data": "qty"},
                                {"data": "cost"},
                            ], columnDefs: [
                                {className: 'text-right', targets: [3, 4]}

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



                                total3 = api
                                        .column(3)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);

                                total4 = api
                                        .column(4)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                // Total over this page


                                pageTotal3 = api
                                        .column(3, {page: 'current'})
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                pageTotal4 = api
                                        .column(4, {page: 'current'})
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);

                                // Update footer

                                $(api.column(3).footer()).html(
                                        '' + pageTotal3 + '<br>(' + total3 + ')'
                                        );
                                $(api.column(4).footer()).html(
                                        '' + pageTotal4 + '<br>(' + total4 + ')'
                                        );


                            }
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.sixth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'SBView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#sb').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "SBView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "type"},
                                {"data": "qty"},
                                {"data": "cost"}
                            ], columnDefs: [
                                {className: 'text-right', targets: [1, 2]}

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
                                        .column(1)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                total2 = api
                                        .column(2)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                // Total over this page



                                pageTotal1 = api
                                        .column(1, {page: 'current'})
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                pageTotal2 = api
                                        .column(2, {page: 'current'})
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);

                                // Update footer


                                $(api.column(1).footer()).html(
                                        '' + pageTotal1 + '<br>(' + total1 + ')'
                                        );
                                $(api.column(2).footer()).html(
                                        '' + pageTotal2 + '<br>(' + total2 + ')'
                                        );

                            }
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.fourth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'MemberView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#member').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "MemberView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "camp"},
                                {"data": "name"},
                                {"data": "memplan"},
                                {"data": "memstatus"},
                                {"data": "phone"},
                                {"data": "record_status"},
                                {"data": "submitted_on"},
                                {"data": "contactperson"},
                                {"data": "tally_receipt_no"},
                                {"data": "email"}
                            ]
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.second', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'SFView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#sf').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "SFView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "cpcnt"},
                                {"data": "croamount"},
                                {"data": "ncpcnt"},
                                {"data": "ncroamount"},
                                {"data": "scpcnt"},
                                {"data": "scroamount"},
                                {"data": "gcbpcnt"},
                                {"data": "gcbpamount"},
                                {"data": "pabamount"},
                                {"data": "ncpabamount"},
                                {"data": "scpabamount"},
                                {"data": "fframount"},
                                {"data": "ffgamount"},
                                {"data": "ffaamount"},
                                {"data": "ffoamount"},
                                {"data": "ffbamount"},
                                {"data": "sploamount"},
                                {"data": "ncogamount"},
                                {"data": "ncoaamount"},
                                {"data": "scogamount"},
                                {"data": "scoaamount"}
                            ], columnDefs: [
                                {className: 'text-center', targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]}

                            ]
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.first', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'PaymentViewE503?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#payment').DataTable({
                            destroy: true,
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
                            ajax: {
                                method: "POST",
                                url: "PaymentViewE503?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "rid"},
                                {"data": "e503date"},
                                {"data": "e503month"},
                                {"data": "e503year"},
                                {"data": "camp"},
                                {"data": "contactperson"},
                                {"data": "rstatus"},
                                {"data": "paymode"},
                                {"data": "trno"},
                                {"data": "trdate"},
                                {"data": "tramount"},
                                {"data": "trbank"},
                                {"data": "trbranch"},
                                {"data": "trremarks"},
                                {"data": "tallyno"},
                                {"data": "tallydate"},
                                {"data": "voucher_type"},
                                {"data": "debit_ledger"},
                                {"data": "bank_voucher"},
                                {"data": "cheque_issued"},
                                {"data": "depositdate"},
                                {"data": "tallyremarks"},
                                {"data": "submitted_by"},
                                {"data": "submitted_on"}
                            ], columnDefs: [
                                {className: 'text-right', targets: [10]}

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


                                total10 = api
                                        .column(10)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
                                // Total over this page


                                pageTotal10 = api
                                        .column(10, {page: 'current'})
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);

                                // Update footer

                                $(api.column(10).footer()).html(
                                        '' + pageTotal10 + '<br>(' + total10 + ')'
                                        );
                            }
                        });

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


