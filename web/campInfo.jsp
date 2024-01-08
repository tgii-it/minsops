<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="loadbaseinfo.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String camp = request.getParameter("camp");
    String usercamp = "";
    String sql = "";
    if (camp == null) {
        camp = usercamp;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | People's Tab</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
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
            .form-control{display:block;width:100%;height:26px;padding:3px 6px;font-size:12px;line-height:0.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}

            .ui-autocomplete {
                z-index: 215000000 !important;
            }
        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="js/campsN.js" type="text/javascript"></script>
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
    <body style="background-color: #fff; width: 100%;" id="myContainer">
        <nav class="navbar navbar-default navbar-fixed-top">
            <a href="secondpage.html" style="font-size:17px;color:#ffe114; float:left;text-decoration: none;">
                <i class="fa fa-arrow-left" style="color:#ffe114; font-size: 24px;margin-top:13px;margin-left: 10px; "></i> Back</a>
            <p style="color:#ffe114; text-align: right; margin-top: 15px; margin-right: 20px; font-size: 16px;"><b>Camp Information</b> </p>
        </nav>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">   
                <div class="row">
                    <div class="col-md-12">                    
                        <div class='panel panel-default panel-accent-gold'>
                            <div class="panel-heading" style="background-color: #fff;">
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                    <i class="fa fa-fw fa-share"></i>&nbsp; CAMP NAME
                                </h3>
                            </div>
                            <div class="panel-body" style="padding-top: 20px;"> 
                                <form name="frm2" method="post" action="campInfo.jsp">                
                                    <div class="form-row">                                       
                                        <div class="form-group col-md-3">
                                            <div class="input-group">
                                                <span class="input-group-addon" style="background-color: rgb(91, 192, 222); border-color: rgb(70, 184, 218)"><i class="glyphicon glyphicon-list" style="color: #fff;"></i></span>
                                                <input type="hidden" name="qmid" id="qmid"/>
                                                <input name="camp" class="form-control" id="camp" value="<%=camp%>" style="text-align: left; height: 35px; background-color: #fff;" placeholder=".. Search.." rel="camp" data-html="true" title="Search & select .." data-toggle="tooltip" data-placement="top" autofocus/>

                                                <span class="input-group-btn">
                                                    <button type="submit" class="btn btn-info" id="getdetails">Show</button>
                                                </span>
                                            </div>
                                        </div>     
                                    </div>
                                </form>
                            </div>
                        </div>
                        <ul class="nav nav-tabs">
                            <li class="dropdown active"><a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Members &nbsp; <span class="caret"></span></a>
                                <ul class="dropdown-menu dmenu">
                                    <li><a data-toggle="tab" href="#members_table_tab">All Members</a></li>
                                    <li><a data-toggle="tab" href="#life_table_tab">Life Members only</a></li>
                                    <li><a data-toggle="tab" href="#annual_table_tab">Annual Members only</a></li>
                                </ul>
                            </li>  
                            <li class="dropdown"><a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Renewals &nbsp; <span class="caret"></span></a>
                                <ul class="dropdown-menu dmenu">
                                    <li><a data-toggle="tab" href="#ytr_table_tab">Yet to Renew</a></li>
                                </ul>
                            </li>  
                            <li><a data-toggle="tab" href="#officers_table_tab" style="font-size: 12px; font-weight: bold;">Officers</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="members_table_tab" class="tab-pane fade in active">   
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                    <table id="members" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Member Name</th>
                                                <th style="text-align: left;" nowrap>ID</th>
                                                <th style="text-align: left;" nowrap>Phone</th>
                                                <th style="text-align: left;" nowrap>Member Type</th>
                                                <th style="text-align: left;" nowrap>Member Status</th>
                                                <th style="text-align: left;" nowrap>Membership valid till</th>
                                                <th style="text-align: left;" nowrap>Member since</th>  
                                            </tr>
                                        </thead>                                        
                                    </table>
                                </div>
                            </div>

                            <div id="officers_table_tab" class="tab-pane fade"> 
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                    <table id="officer_tbl" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;" nowrap>Sl No</th>
                                                <th style="text-align: left;" nowrap>Designation</th>
                                                <th style="text-align: left;" nowrap>Name</th>
                                                <th style="text-align: left;" nowrap>ID</th>
                                                <th style="text-align: left;" nowrap>Phone</th>
                                            </tr>
                                        </thead>                                        
                                    </table>
                                </div>
                            </div>

                            <div id="life_table_tab" class="tab-pane fade"> 
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                    <table id="life_table" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Member Name</th>
                                                <th style="text-align: left;" nowrap>ID</th>
                                                <th style="text-align: left;" nowrap>Phone</th>
                                                <th style="text-align: left;" nowrap>Member Type</th>
                                                <th style="text-align: left;" nowrap>Member Status</th>
                                                <th style="text-align: left;" nowrap>Membership valid till</th>
                                                <th style="text-align: left;" nowrap>Member since</th>  
                                            </tr>
                                        </thead>                                        
                                    </table>
                                </div>
                            </div>

                            <div id="annual_table_tab" class="tab-pane fade"> 
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                    <table id="annual_table" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Member Name</th>
                                                <th style="text-align: left;" nowrap>ID</th>
                                                <th style="text-align: left;" nowrap>Phone</th>
                                                <th style="text-align: left;" nowrap>Member Type</th>
                                                <th style="text-align: left;" nowrap>Member Status</th>
                                                <th style="text-align: left;" nowrap>Membership valid till</th>
                                                <th style="text-align: left;" nowrap>Member since</th>  
                                            </tr>
                                        </thead>                                        
                                    </table>
                                </div>
                            </div>

                            <div id="ytr_table_tab" class="tab-pane fade"> 
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                    <table id="ytr_table" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Member Name</th>
                                                <th style="text-align: left;" nowrap>ID</th>
                                                <th style="text-align: left;" nowrap>Phone</th>
                                                <th style="text-align: left;" nowrap>Member Type</th>
                                                <th style="text-align: left;" nowrap>Member Status</th>
                                                <th style="text-align: left;" nowrap>Membership valid till</th>
                                                <th style="text-align: left;" nowrap>Member since</th>  
                                            </tr>
                                        </thead>                                        
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                var v_camp = $("#camp").val();

                var table;
                table = $('#members').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    ajax: {
                        method: "POST",
                        url: 'GmapPeoplesTabMembersList?type=all&camp=' + v_camp,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "name"},
                        {"data": "mem_id"},
                        {"data": "mobile"},
                        {"data": "mtype"},
                        {"data": "status"},
                        {"data": "end_date"},
                        {"data": "year"}
                    ]
                });

                var ytr;
                ytr = $('#ytr_table').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    ajax: {
                        method: "POST",
                        url: 'GmapPeoplesTabMembersList?type=ytr&camp=' + v_camp,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "name"},
                        {"data": "mem_id"},
                        {"data": "mobile"},
                        {"data": "mtype"},
                        {"data": "status"},
                        {"data": "end_date"},
                        {"data": "year"}
                    ]
                });

                var life;
                life = $('#life_table').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    ajax: {
                        method: "POST",
                        url: 'GmapPeoplesTabMembersList?type=life&camp=' + v_camp,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "name"},
                        {"data": "mem_id"},
                        {"data": "mobile"},
                        {"data": "mtype"},
                        {"data": "status"},
                        {"data": "end_date"},
                        {"data": "year"}
                    ]
                });

                var annual;
                annual = $('#annual_table').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    ajax: {
                        method: "POST",
                        url: 'GmapPeoplesTabMembersList?type=annual&camp=' + v_camp,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "name"},
                        {"data": "mem_id"},
                        {"data": "mobile"},
                        {"data": "mtype"},
                        {"data": "status"},
                        {"data": "end_date"},
                        {"data": "year"}
                    ]
                });

                var table1;
                table1 = $('#officer_tbl').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    ajax: {
                        method: "POST",
                        url: 'GmapPeoplesTabOffList?type=officer&camp=' + v_camp,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "slno"},
                        {"data": "designation"},
                        {"data": "name"},
                        {"data": "mem_id"},
                        {"data": "mobile"}
                    ],
                    "columnDefs": [
                        {
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        }
                    ]
                });
            });
        </script>
    </body>
</html>