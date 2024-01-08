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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>State wise Renewals Repprt</title>
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
                        <i class="fa fa-fw fa-share"></i>&nbsp; State wise Renewals : Realtime Report
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
                                    <option value="Outreach States (Bihar Jharkhand)">Outreach States (Bihar Jharkhand)</option>
                                    <option value="SA11 (Orissa West Bengal and Sikkim)">SA11 (Orissa West Bengal and Sikkim)</option>
                                    <option value="SA12 (Mizoram Tripura and Meghalaya)">SA12 (Mizoram Tripura and Meghalaya)</option>
                                    <option value="SA13 (Arunachal Pradesh Nagaland and Manipur)">SA13 (Arunachal Pradesh Nagaland and Manipur)</option>
                                    <!--<option value="OS (Outreach States)">OS (Outreach States)</option>-->
                                    <option value="AllRecords">Show All SA Records</option>
                                </select>
                            </div> 
                        </div>
                        <div class="form-group col-md-6" hidden>   
                            <div class='input-group'>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-list"></span>
                                </span>
                                <select class="form-control goevent" name="eventName" id="eventName" required>
                                    <option value="0">-Select Events-</option>
                                    <option value="Current" selected>Current Members</option>
                                </select>
                            </div> 
                        </div>                                     
                        <div id="snackbar"></div>
                    </div>

                    <div class="table table-responsive" style="padding: 10px; vertical-align: middle; font-size: 12px; color: black; height: auto;">
                        <table id="example" class="table table-responsive table-bordered table-hover">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr>
                                    <th style="text-align: left;" nowrap>MID</th>  
                                    <th style="text-align: left;" nowrap>NAME</th> 
                                    <th style="text-align: left;" nowrap>MTYPE</th>
                                    <th style="text-align: right;" nowrap>GENDER</th>
                                    <th style="text-align: center;" nowrap>STATUS</th>  
                                    <th style="text-align: center;" nowrap>ANNUAL_END_DATE</th> 
                                    <th style="text-align: left;" nowrap>ANNUAL_START_DATE</th>   
                                    <th style="text-align: center;" nowrap>PHONE</th>   
                                    <th style="text-align: center;" nowrap>MOBILE2</th>    
                                    <th style="text-align: center;" nowrap>MOBILE3</th>    
                                    <th style="text-align: center;" nowrap>EMAIL</th>    
                                    <th style="text-align: center;" nowrap>CAMP</th>    
                                    <th style="text-align: center;" nowrap>STATE_ASSOCIATION</th>   
                                    <th style="text-align: center;" nowrap>REMITTER</th> 
                                    <th style="text-align: left;" nowrap>ADDRESS</th>   
                                    <th style="text-align: center;" nowrap>ADDRESS2</th>   
                                    <th style="text-align: center;" nowrap>STREET</th>    
                                    <th style="text-align: center;" nowrap>CITY</th>    
                                    <th style="text-align: center;" nowrap>STATE</th>    
                                    <th style="text-align: center;" nowrap>PINCODE</th>    
                                    <th style="text-align: center;" nowrap>BASKET</th>   
                                </tr>
                            </thead>
                        </table>
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
                            method: "GET",
                            url: "https://lxxncu6awrxkpqa-db202010270820.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1r/MembershipRenewalsReportJson/?state_association=" + $('#camp').val(),
                            dataSrc: "items"
                        },
                        columns: [
                            {"data": "mid"},
                            {"data": "name"},
                            {"data": "mtype"},
                            {"data": "gender"},
                            {"data": "status"},
                            {"data": "annual_end_date"},
                            {"data": "annual_start_date"},
                            {"data": "phone"},
                            {"data": "mobile2"},
                            {"data": "mobile3"},
                            {"data": "email"},
                            {"data": "camp"},
                            {"data": "state_association"},
                            {"data": "remitter"},
                            {"data": "address"},
                            {"data": "address2"},
                            {"data": "street"},
                            {"data": "city"},
                            {"data": "state"},
                            {"data": "pincode"},
                            {"data": "basket"}
                        ], columnDefs: [
                        {className: 'text-nowrap', targets: [1, 2, 11, 12, 13, 14, 15, 16, 17, 18, 20]}
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
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script> 
    </body>
</html>