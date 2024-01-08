<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    String camp2 = request.getParameter("camp2");
    String camp = request.getParameter("camp");
    String username = userName;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>2023_24 Camp Report</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.6/dist/loadingoverlay.min.js"></script>
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
            .nav-tabs > li > a {
                background-color: #fff !important;
                font-size: 13px;
                color: navy;
                border: medium none;
                border-radius: 0;
            }
            .nav-tabs > li.active > a {
                background-color: #ffffd4 !important;
                font-size: 13px;
                color: navy;
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
            function getXMLHttpRequestnew() {
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

            function loadLanguages1() {
                var xmlHttpRequest = getXMLHttpRequestnew();
                xmlHttpRequest.onreadystatechange = getReadyStateHandlernew(xmlHttpRequest);
                xmlHttpRequest.open("POST", "SD_load_Languages", true);
                xmlHttpRequest.send();
            }

            function getReadyStateHandlernew(xmlHttpRequest) {
                return function () {
                    if (xmlHttpRequest.readyState === 4) {
                        if (xmlHttpRequest.status === 200) {
                            var a = xmlHttpRequest.responseText.split(",");

                            if (a[0] === "1") {

                                for (i = 1; i < a.length; i++) {
                                    var select = document.getElementById("type");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                        }
                    }
                };
            }
        </script>

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

            function getLanguages(src) {
                var sele = document.getElementById("language");
                var item = src.options[src.selectedIndex];

                if (item.value !== "-- Select Type --")
                {
                    var xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
                    xmlHttpRequest.open("POST", "SD_load_Languages?type=type&data=" + item.value, true);
                    xmlHttpRequest.send();
                    sele.options.length = 1;

                } else if (item.value === "-- Select Type --")
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
                                    var select = document.getElementById("type");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                            if (a[0] === "2") {

                                for (i = 1; i < a.length; i++) {

                                    var select = document.getElementById("language");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                        }
                    }
                };
            }
        </script>
        <script type='text/javascript'>
            $(function () {
                $('img').imgPreload()
            })
        </script>
        <script>
            //paste this code under head tag or in a seperate js file.
            // Wait for window load
            $(window).load(function () {
                // Animate loader off screen
                $(".se-pre-con").fadeOut("slow");
                ;
            });
        </script>    
        <style type="text/css">
            /* Paste this css to your style sheet file or under head tag */
            /* This only works with JavaScript, 
            if it's not present, don't show loader */
            .no-js #loader { display: none;  }
            .js #loader { display: block; position: absolute; left: 100px; top: 0; }
            .se-pre-con {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 9999;
                background: url(https://sd.gideons.org.in/images/Preloader_3.gif) center no-repeat #fff;
            }
            .blinking{
                animation:blinkingText 15.0s infinite;
                font-weight: bold;
                font-size: 12px;
            }
            @keyframes blinkingText{
                0%{     color: black;    }
                24%{     color: black;    }
                25%{     color: black;    }
                49%{    color: transparent; }
                50%{    color: black;  }
                74%{     color: black;    }
                75%{     color: black;    }
                99%{    color:transparent;  }
                100%{   color: black;    }
            }
        </style>
    </head>
    <body style="background-color: #fff; width: 100%;" id="myContainer">
        <h4>Loading, please wait..</h4>
        <div id="loader" class="se-pre-con"></div>
        <%@ include file="menu.jsp" %>
        <section class="container-fluid" style="padding-top: 20px" >  
            <p style="font-size: 14px; font-weight: bold; color: blue; margin-left: 5px;">Camp Report : PY 2023_24</p>       
            <div class='panel panel-default panel-accent-gold'>
                <div class="panel-body">
                    <div class="row"> 
                        <div class="col-md-3">                                 
                            <div class="form-group">
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </span>
                                    <%  String name_sql = "";
                                        String mname = "";
                                        String mname_str = "";

                                        DataSource ds = null;
                                        Connection con = null;
                                        ResultSet result = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            name_sql = "select camp from camps_master where status in ('Active','In-Active') order by camp";

                                            ResultSet resultSet = statement.executeQuery(name_sql);
                                    %>
                                    <input name="camp" list="oName" class="form-control" id="camp" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
                                    <datalist id="oName">
                                        <%
                                            while (resultSet.next()) {
                                                mname_str = resultSet.getString("camp");
                                        %>
                                        <option value="<%=mname_str%>"><%=mname_str%></option>
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
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    Camp Information
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <tbody>
                                    <tr>
                                        <td style="background-color: #ffffd4; color: navy;">Camp Name</td>
                                        <td colspan="4" style="background-color: #ffffd4; color: navy;">
                                            <div style="" id="selected_camp"><input type="hidden" name="username" id="username" value="<%= username%>"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40%;">Comes under..</td>
                                        <td colspan="4">
                                            <div id="sa_no"></div>
                                        </td>
                                    </tr>  
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%;">Camp President</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_President"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">Camp Vice President</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Vice_President"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%;">Camp Secretary</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Secretary"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%;">Camp Treasurer</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Treasurer"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%;">Camp Chaplain</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Chaplain"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%;">Camp Auxiliary President</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Aux_President"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #F5EEF8; color: navy;">
                                        <td style="width: 40%;">Camp Auxiliary Secretary</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Aux_Secretary"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%;">Camp Auxiliary Chaplain</td>
                                        <td colspan="4">
                                            <div style="" id="Camp_Aux_Chaplain"></div>
                                        </td>
                                    </tr> 
                                </tbody>
                            </table>
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    Net Membership
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="" nowrap>Category</th>
                                        <th style="text-align: center;" nowrap>Life</th>
                                        <th style="text-align: center;" nowrap>Annual</th>
                                        <th style="text-align: center;" nowrap>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%; ">Gideon</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="gideon_life"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="gideon_annual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Total_Gideon"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Auxiliary</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_life"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_annual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Total_Auxiliary"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">Total</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="total_life"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="total_annual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="total_memberships"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    Renewals
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="" nowrap>Category</th>
                                        <th style="text-align: center;" nowrap>Goal</th>
                                        <th style="text-align: center;" nowrap>Achieved</th>
                                        <th style="text-align: center;" nowrap>Y T R</th>
                                        <th style="text-align: center;" nowrap>%</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%; ">Gideon</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Memberships_Gid_Op_Bal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Gideon_Renewed"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Gideon_ytr"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="gid_renewal_per"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Auxiliary</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Memberships_Aux_Op_Bal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Aux_Renewed"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Aux_ytr"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Aux_Renewal_per"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">Total</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="renewal_goal_total"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="renewal_achieved_total"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="renewal_total_ytr"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    New Members
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="" nowrap>Category</th>
                                        <th style="text-align: center;" nowrap>PSU</th>
                                        <th style="text-align: center;" nowrap>AMD</th>
                                        <th style="text-align: center;" nowrap>Field</th>
                                        <th style="text-align: center;" nowrap>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%; ">Gideon</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="g_nm_psu"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="g_nm_amd"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="g_nm_f"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="g_nm"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Auxiliary</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="a_nm_psu"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="a_nm_amd"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="a_nm_f"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="a_nm"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-3">  
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    Scripture Distribution
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: left;" nowrap>Category</th>
                                        <th style="text-align: center;" nowrap>Goal</th>
                                        <th style="text-align: center;" nowrap>Achieved</th>
                                        <th style="text-align: center;" nowrap>%</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">Scriptures</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="sd_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="sd_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="sd_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Aux Scriptures</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Aux_SD_Goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Aux_SD_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_sd_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #EAFAF1; color: navy;">
                                        <td style="width: 40%; ">Gideon PWT</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Gideon_PWT_Goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="Gideon_PWT_Actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="PWT_Gideon_per"></div>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Auxiliary PWT</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_pwt_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_pwt_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_pwt_per"></div>
                                        </td>
                                    </tr> 
                                </tbody>
                            </table> 
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    Scripture Fund
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="" nowrap>Category</th>
                                        <th style="text-align: center;" nowrap>Goal</th>
                                        <th style="text-align: center;" nowrap>Achieved</th>
                                        <th style="text-align: center;" nowrap>%</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">Scripture Fund</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="total_sf_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="total_sf_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="sf_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #fff; color: navy;">
                                        <td style="width: 40%; ">No of CP's</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cp_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cp_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cp_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">C R O</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cro_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cro_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cro_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #fff; color: navy;">
                                        <td style="width: 40%; ">F F R</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffr_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffr_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffr_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">P A B</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="pab_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="pab_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="pab_per"></div>
                                        </td>
                                    </tr>  
                                    <tr style="background-color: #fff; color: navy;">
                                        <td style="width: 40%; ">G C B P</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="gcbp_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="gcbp_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="gcbp_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">F F G</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffg_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffg_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffg_per"></div>
                                        </td>
                                    </tr>   
                                    <tr style="background-color: #fff; color: navy;">
                                        <td style="width: 40%; ">CD 100</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="cd100_actual"></div>
                                        </td>
                                        <td></td>
                                    </tr> 
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">Special Offerings</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="splo_actual"></div>
                                        </td>
                                        <td></td>
                                    </tr> 
                                    <tr style="background-color: #fff; color: navy;">
                                        <td style="width: 40%; ">Faith Fund Others</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffo_actual"></div>
                                        </td>
                                        <td></td>
                                    </tr> 
                                    <tr style="background-color: #ffffd4; color: navy;">
                                        <td style="width: 40%; ">NC Contribution</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ncc_actual"></div>
                                        </td>
                                        <td></td>
                                    </tr> 
                                    <tr style="background-color: #fff; color: navy;">
                                        <td style="width: 40%; ">SC Contribution</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="scc_actual"></div>
                                        </td>
                                        <td></td>
                                    </tr> 
                                </tbody>
                            </table>
                            <div class="panel-heading" >
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px;">
                                    Auxiliary Scripture Fund
                                </h3>
                            </div>
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; vertical-align: left; font-size: 11px; color:navy;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: left;" nowrap>Category</th>
                                        <th style="text-align: center;" nowrap>Goal</th>
                                        <th style="text-align: center;" nowrap>Achieved</th>
                                        <th style="text-align: center;" nowrap>%</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Auxiliary SF</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_sf_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_sf_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_sf_per"></div>
                                        </td>
                                    </tr> 
                                    <tr style="background-color: #F5EEF8; color: navy;">
                                        <td style="width: 40%; ">F F A</td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffa_goal"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffa_actual"></div>
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="ffa_per"></div>
                                        </td>
                                    </tr>    
                                    <tr style="background-color: #ffe9ec; color: navy;">
                                        <td style="width: 40%; ">Luncheon</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_luncheon"></div>
                                        </td>
                                        <td></td>
                                    </tr>    
                                    <tr style="background-color: #F5EEF8; color: navy;">
                                        <td style="width: 40%; ">Heart Fund</td>
                                        <td style="text-align: center;">
                                            &nbsp;
                                        </td>
                                        <td style="text-align: center;">
                                            <div style="text-align: center;" id="aux_heart_fund"></div>
                                        </td>
                                        <td></td>
                                    </tr> 
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <div class="container-fluid final" id="final" hidden>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #01354A; letter-spacing: 2px; padding-bottom: 8px;">
                                        Camp Transactions
                                        <input type="text" id="requested_on" class="form-control pull-right"  name="requested_on" placeholder="DD/MM/YYYY" style="width: 120px;" required>
                                    </h3>
                                </div>
                                <ul class="nav nav-tabs">   
                                    <li class="dropdown active">
                                        <a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Demands &nbsp; <span class="caret"></span></a>
                                        <ul class="dropdown-menu dmenu">
                                            <li><a data-toggle="tab" href="#home">All Indents</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Pending Indents</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Forwarded for Approval</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Release Processed</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">CoU Generated List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">LR Updated List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Confirmed & Closed List</a></li>
                                        </ul>
                                    </li>    
                                    <li class="dropdown">
                                        <a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Remittances &nbsp; <span class="caret"></span></a>
                                        <ul class="dropdown-menu dmenu">
                                            <li><a data-toggle="tab" href="#inwardsTab">All e503 entries</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Scripture Fund entries only</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Membership related entries only</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Admin fund related entries only</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">PWT related entries only</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Merchandise related entries only</a></li>
                                        </ul>
                                    </li>     
                                    <li class="dropdown">
                                        <a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Memberships &nbsp; <span class="caret"></span></a>
                                        <ul class="dropdown-menu dmenu">
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Members celebrating their Birthdays Today</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">All Members List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Life Members List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Annual Members List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Renewed List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Yet to Renew List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">FoG List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Dropped Members List</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Gone to be with the Lord List</a></li>
                                        </ul>
                                    </li>      
                                    <li class="dropdown">
                                        <a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Events &nbsp; <span class="caret"></span></a>
                                        <ul class="dropdown-menu dmenu">
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Forth coming events</a></li>
                                            <li><a data-toggle="tab" href="#inwardsTab">All Events</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Planned events</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Conducted events</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Not conducted events</a></li>
                                        </ul>
                                    </li>    
                                    <li class="dropdown">
                                        <a href="#members_table_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">CP's &nbsp; <span class="caret"></span></a>
                                        <ul class="dropdown-menu dmenu">
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Forth coming CP's</a></li>
                                            <li><a data-toggle="tab" href="#inwardsTab">All CP's list</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Planned CP's</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Conducted CP's</a></li>
                                            <li><a data-toggle="tab" href="#ytr_table_tab">Not conducted CP's</a></li>
                                        </ul>
                                    </li>                     
                                </ul>
                                <div  class="tab-content">    
                                    <div id="home" class="tab-pane fade in active">                  
                                        <div class="card" >
                                            <div class="container" id="openTabContainer" hidden> 
                                                <div class="form-group">
                                                    <input type="checkbox" name="fancy-checkbox-info" id="fancy-checkbox-info" checked autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-info" class=" btn btn-info"  style="vertical-align: middle; font-size: 15px; text-align: center; font-weight: bold; color: #01354a;">
                                                            <span class=" glyphicon glyphicon-ok "></span>
                                                            <span></span>
                                                        </label>
                                                        <label for="fancy-checkbox-info" class="btn btn-default active">
                                                            Provide Usage Details
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div  class="form-group reason" id="reason" hidden>
                                                <div  class="container" > 
                                                    <div class="form-group">
                                                        <input type="checkbox" name="fancy-checkbox-danger" id="fancy-checkbox-danger" autocomplete="off" />
                                                        <div class="btn-group">
                                                            <label for="fancy-checkbox-danger" class=" btn btn-info" style="vertical-align: middle; font-size: 15px; text-align: center; font-weight: bold; color: #01354a;">
                                                                <span ></span>
                                                                <span class="glyphicon glyphicon-ok"></span>
                                                            </label>
                                                            <label for="fancy-checkbox-danger" class="btn btn-default active">                                            
                                                                Reason for not providing
                                                            </label>                                          
                                                            <div class="form-group col-md-4 col-sm-4 responsive" style="margin-left: -15px;">
                                                                <select class="form-control col-md-4 col-sm-4" id="education" style="width:auto; height: 34px;" onChange="Education()">
                                                                    <option value="0">-----Select------</option>
                                                                    <option value="Not Sure about past stock">Not Sure about past stock</option>
                                                                    <option value="No idea of Distribution"> No idea of Distribution</option>
                                                                    <option value="Need more for upcoming Event">Need more for upcoming Event</option> 
                                                                    <option value="Yes">Others</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4 responsive" id="edu" hidden>                                      
                                                                <input  class="form-control" id="edu1"  placeholder="Specify the reason" name="qualification_others">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>               
                                            </div>
                                            <div class="row" id="reason_table">                                               
                                                <div class="col-md-12"  >
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title" style="vertical-align: middle; font-size: 11px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                                            <i class="fa fa-fw fa-share"></i>&nbsp; List of Camp Indents
                                                            <button type='button' class='btn btn-primary btn-xs pull-right createRow123' title='Create new record' style='cursor: pointer;'><i class='fa fa-refresh' aria-hidden='true'></i> &nbsp;Load Data</button>
                                                        </h3>
                                                    </div>
                                                    <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 11px; color: navy; padding: 3px;">
                                                        <table id="requested" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                                            <thead style="background-color: #01354a; color: #ffe114;">
                                                                <tr>
                                                                    <th style="text-align: left;" nowrap>Scripture_Type</th>  
                                                                    <th style="text-align: left;" nowrap>Language</th> 
                                                                    <th style="text-align: left;" nowrap>Color</th>
                                                                    <th style="text-align: right;" nowrap>Quantity</th>
                                                                    <th style="text-align: center;" nowrap>Order_Status</th>  
                                                                    <th style="text-align: center;" nowrap>Request_raised_by</th> 
                                                                    <th style="text-align: left;" nowrap>Mode_of_Request</th>   
                                                                    <th style="text-align: center;" nowrap>Requested_on</th>   
                                                                    <th style="text-align: center;" nowrap>Forwarded_on</th>    
                                                                    <th style="text-align: center;" nowrap>Approved_on</th>    
                                                                    <th style="text-align: center;" nowrap>Processed_on</th>    
                                                                    <th style="text-align: center;" nowrap>CoU_Date</th>    
                                                                    <th style="text-align: center;" nowrap>LR_Date</th>     
                                                                    <th style="text-align: center;" nowrap>LR_No</th>     
                                                                    <th style="text-align: center;" nowrap>Transporter</th>      
                                                                    <th style="text-align: center;" nowrap>Order_Received_on</th>   
                                                                    <th style="text-align: center;" nowrap>Order_Received_by</th>                          
                                                                </tr>
                                                            </thead>  
                                                            <tfoot>
                                                                <tr>
                                                                    <th colspan="3" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                                    <th></th>
                                                                    <th colspan="13" style="text-align:right"></th>                                                                                                 
                                                                </tr>
                                                            </tfoot>
                                                        </table>   
                                                    </div>
                                                </div>
                                            </div>              
                                        </div>
                                    </div>
                                    <div id="inwardsTab" class="tab-pane fade in">                  
                                        <div class="card" >
                                            <div class="row" id="inwards_table">                                               
                                                <div class="col-md-12"  >
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title" style="vertical-align: middle; font-size: 11px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                                            <i class="fa fa-fw fa-share"></i>&nbsp; Camp Remittance Information
                                                            <button type='button' class='btn btn-primary btn-xs pull-right inwardsInfo' title='Create new record' style='cursor: pointer;'><i class='fa fa-refresh' aria-hidden='true'></i> &nbsp;Load Data</button>
                                                        </h3>
                                                    </div>
                                                    <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 11px; color: navy; padding: 3px;">
                                                        <table id="CompleteReport" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                                            <thead style="background-color: #01354a; color: #ffe114;">
                                                                <tr> 
                                                                    <th style="text-align: left;" nowrap>e503 Month</th>
                                                                    <th style="text-align: left;" nowrap>Camp</th>
                                                                    <th style="text-align: left;" nowrap>State Association</th>
                                                                    <th style="text-align: right;" nowrap>SF</th>
                                                                    <th style="text-align: right;" nowrap>Admin</th>
                                                                    <th style="text-align: right;" nowrap>Mem</th>
                                                                    <th style="text-align: right;" nowrap>PWT</th>    
                                                                    <th style="text-align: right;" nowrap>Spl B</th>    
                                                                    <th style="text-align: right;" nowrap>Merc</th>    
                                                                    <th style="text-align: right;" nowrap>Total</th>     
                                                                    <th style="text-align: right;" nowrap>Tr Amount</th>                                               
                                                                    <th style="text-align: left;" nowrap>Submitted On</th>
                                                                    <th style="text-align: left;" nowrap>Pay Mode</th>    
                                                                    <th style="text-align: left;" nowrap>Tr No</th>   
                                                                    <th style="text-align: left;" nowrap>Tr Date</th>  
                                                                    <th style="text-align: left;" nowrap>Bank</th>  
                                                                    <th style="text-align: left;" nowrap>Branch</th> 
                                                                    <th style="text-align: left;" nowrap>Remitter</th> 
                                                                    <th style="text-align: left;" nowrap>Payment Remarks</th>    
                                                                    <th style="text-align: left;" nowrap>SF Remarks</th>    
                                                                    <th style="text-align: left;" nowrap>Membership Remarks</th>  
                                                                    <th style="text-align: left;" nowrap>PWT Remarks</th>  
                                                                    <th style="text-align: left;" nowrap>Merchandise Remarks</th>           
                                                                    <th style="text-align: left;" nowrap>Tally Receipt No</th>   
                                                                    <th style="text-align: left;" nowrap>Tally Entry Date</th>    
                                                                    <th style="text-align: left;" nowrap>Tally Remarks</th>     
                                                                    <th style="text-align: left;" nowrap>Record ID</th>  
                                                                </tr>
                                                            </thead>

                                                            <tbody id='mytab' class="table-search"> 
                                                                <% String submitted_on = "";
                                                                    String sa = "";
                                                                    String paymode = "";
                                                                    String trno = "";
                                                                    String scripture_fund = "";
                                                                    String e503_month = "";
                                                                    String Membership = "";
                                                                    String administrative_fund = "";
                                                                    String pwt = "";
                                                                    String spl_bible = "";
                                                                    String merchandise_amount = "";
                                                                    String total_amount = "";
                                                                    String tramount = "";
                                                                    String trdate = "";
                                                                    String bank = "";
                                                                    String branch = "";
                                                                    String remitter = "";
                                                                    String payment_remarks = "";
                                                                    String scripture_fund_remarks = "";
                                                                    String membership_remarks = "";
                                                                    String pwt_remarks = "";
                                                                    String merchandise_remarks = "";
                                                                    String tally_no = "";
                                                                    String tallydate = "";
                                                                    String tally_remarks = "";
                                                                    String rid = "";

                                                                    String query1 = "";
                                                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                                    try {
                                                                        con = ds.getConnection();

                                                                        query1 = "SELECT rid,modified_on submitted_on,e503month||'-'||e503year e503_month,initcap(camp) camp,"
                                                                                + "nvl(sf1fee,'0') scripture_fund, nvl(afamount,'0') administrative_fund,nvl(moamount,'0') Membership,nvl(pwtamount,'0') pwt,"
                                                                                + "nvl(splbamount,'0') spl_bible,nvl(sf2fee,'0') merchandise_amount,nvl(total_amount,'0') total_amount,"
                                                                                + "nvl(tramount,'0') tramount,nvl(paymode,'-') paymode,nvl(trno,'-') trno,trdate,nvl(trbank,'-') bank,"
                                                                                + "nvl(trbranch,'-') branch,nvl(remitter,'-') remitter,nvl(trremarks,'-') payment_remarks,"
                                                                                + "nvl(sf1remarks,'-') scripture_fund_remarks,nvl(mremarks,'-') membership_remarks,"
                                                                                + "nvl(pwtremarks,'-') pwt_remarks,nvl(miremarks,'-') merchandise_remarks,nvl(tallyno,'-') tally_no,"
                                                                                + "tallydate,nvl(tallyremarks,'-') tally_remarks FROM V_E503_OVERALL where upper(camp) = upper('" + camp + "') order by modified_on";

                                                                        Statement st1 = con.createStatement();
                                                                        ResultSet rs1 = st1.executeQuery(query1);
                                                                        while (rs1.next()) {
                                                                            rid = rs1.getString("rid");
                                                                            submitted_on = rs1.getString("submitted_on");
                                                                            camp = rs1.getString("camp");
                                                                            e503_month = rs1.getString("e503_month");
                                                                            scripture_fund = rs1.getString("scripture_fund");
                                                                            administrative_fund = rs1.getString("administrative_fund");
                                                                            Membership = rs1.getString("Membership");
                                                                            pwt = rs1.getString("pwt");
                                                                            spl_bible = rs1.getString("spl_bible");
                                                                            merchandise_amount = rs1.getString("merchandise_amount");
                                                                            total_amount = rs1.getString("total_amount");
                                                                            tramount = rs1.getString("tramount");
                                                                            paymode = rs1.getString("paymode");
                                                                            trno = rs1.getString("trno");
                                                                            trdate = rs1.getString("trdate");
                                                                            bank = rs1.getString("bank");
                                                                            branch = rs1.getString("branch");
                                                                            remitter = rs1.getString("remitter");
                                                                            payment_remarks = rs1.getString("payment_remarks");
                                                                            scripture_fund_remarks = rs1.getString("scripture_fund_remarks");
                                                                            membership_remarks = rs1.getString("membership_remarks");
                                                                            pwt_remarks = rs1.getString("pwt_remarks");
                                                                            merchandise_remarks = rs1.getString("merchandise_remarks");
                                                                            tally_no = rs1.getString("tally_no");
                                                                            tallydate = rs1.getString("tallydate");
                                                                            tally_remarks = rs1.getString("tally_remarks");

                                                                %> 
                                                                <tr style="font-size: 10px;">
                                                                    <td nowrap><%= e503_month%></td>
                                                                    <td nowrap><%= camp%></td>
                                                                    <td nowrap><%= sa%></td>
                                                                    <td style="text-align: right;"><%= scripture_fund%></td>
                                                                    <td style="text-align: right;"><%= administrative_fund%></td>
                                                                    <td style="text-align: right;"><%= Membership%></td>
                                                                    <td style="text-align: right;"><%= pwt%></td>
                                                                    <td style="text-align: right;"><%= spl_bible%></td>
                                                                    <td style="text-align: right;"><%= merchandise_amount%></td>
                                                                    <td style="text-align: right;"><%= total_amount%></td>                                                
                                                                    <td style="text-align: right;"><%= tramount%></td> 
                                                                    <td nowrap><%= submitted_on%></td>
                                                                    <td nowrap><%= paymode%></td>
                                                                    <td><%= trno%></td>  
                                                                    <td nowrap><%= trdate%></td> 
                                                                    <td><%= bank%></td> 
                                                                    <td><%= branch%></td> 
                                                                    <td><%= remitter%></td>   
                                                                    <td><%= payment_remarks%></td> 
                                                                    <td><%= scripture_fund_remarks%></td> 
                                                                    <td><%= membership_remarks%></td>
                                                                    <td><%= pwt_remarks%></td>
                                                                    <td><%= merchandise_remarks%></td>
                                                                    <td><%= tally_no%></td>
                                                                    <td nowrap><%= tallydate%></td>  
                                                                    <td><%= tally_remarks%></td> 
                                                                    <td><%= rid%></td> 
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
                                                                    <th colspan="3" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th style="text-align: right;"></th> 
                                                                    <th colspan="16"></th> 
                                                                </tr>
                                                            </tfoot>
                                                        </table>   
                                                    </div>
                                                </div>
                                            </div>              
                                        </div>
                                    </div>
                                    <div id="menu1" class="tab-pane fade">
                                        <!--<center>    
                                            <p style="color: red"><font style="font-size: 11px;"><b>Note:</b> Cost of each PWT is Rs.15/-</font></p>
                                            <a href="https://eazypay.icicibank.com/homePage" target="_blank"><font style="font-size: 11px;"><b> ICICI EasyPay - Pay Online</b></font></a>
                                            <br>
                                        </center>-->
                                        <form method="post">
                                            <div class='panel panel-default panel-accent-gold'>
                                                <div class="panel-heading" style="background-color: #fff;">
                                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                                        <i class="fa fa-fw fa-share"></i>&nbsp; PWT's
                                                        <button type='button' class='btn btn-primary btn-xs pull-right request' name='createRow' data-toggle='modal' data-target='#pwt' title='Create new record' style='cursor: pointer;'><i class='fa fa-plus-square' aria-hidden='true'></i> &nbsp;Add PWT's</button>
                                                    </h3>
                                                </div>
                                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                                    <table id="pwt_table" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                                        <thead style="background-color: #01354a; color: #ffe114;">
                                                            <tr>
                                                                <th style="text-align: left; width: 50px;" nowrap>Language</th>
                                                                <th style="text-align: left; width: 50px;" nowrap>Color</th>
                                                                <th style="text-align: right; width: 15px;" nowrap>Quantity</th> 
                                                                <th style="text-align: right; width: 15px;" nowrap>Amount (₹)</th> 
                                                                <th style="text-align: center; width: 25px;" nowrap>Action</th>   
                                                            </tr>
                                                        </thead>                                
                                                        <tfoot>
                                                            <tr>
                                                                <th colspan="2" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                                <th></th>
                                                                <th></th>
                                                                <th  colspan="1" style="text-align:right"></th>                                                                                                 
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </form>
                                        <div class='panel panel-default panel-accent-gold' id="pwt_address">
                                            <div class="panel-heading" style="background-color: #fff;">
                                                <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                                    <i class="fa fa-fw fa-share"></i>&nbsp; PWT DISPATCH TO ADDRESS
                                                </h3>
                                            </div>
                                            <div class="panel-body" style="padding-top: 17px; font-size:12px; color: navy;"> 
                                                <div class="form-row">   
                                                    <div class="form-group col-md-3" >
                                                        <label>Dispatch to - Name</label>
                                                        <input type="text" autocomplete="off" id="pwt_name" class="form-control"  placeholder="Name" name="pwt_name">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>Dispatch to - Mobile</label>
                                                        <input type="text" autocomplete="off" maxlength="10" id="pwt_mobile" class="form-control"  placeholder="Mobile" name="pwt_mobile">
                                                    </div>
                                                    <div class="form-group col-md-6" >
                                                        <label> Address Line No 1</label>
                                                        <input type="text" id="pwt_addr1" autocomplete="off" class="form-control"  placeholder="Line Number 1" name="pwt_addr1">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label> Address Line No 2</label>
                                                        <input type="text" id="pwt_addr2" autocomplete="off" class="form-control"  placeholder="Line Number 2" name="pwt_addr2">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>City</label>
                                                        <input type="text" id="pwt_city" autocomplete="off" class="form-control"  placeholder="City" name="pwt_city">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>State</label>
                                                        <select id="pwt_state" class="form-control" name="pwt_state">
                                                            <option value="0" selected>-- Select State --</option>                                        
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
                                                            <option value="West Bengal">West Bengal</option>        
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>Pincode</label>
                                                        <input type="text" maxlength="6" autocomplete="off" id="pwt_pincode" class="form-control"  placeholder="Pincode" name="pwt_pincode">
                                                    </div>      
                                                    <div class="form-group col-md-3" >
                                                        <label>Requested by</label>
                                                        <input type="text" id="pwt_requested_name" class="form-control"  placeholder="Requested Person Name" name="pwt_requested_name" required>
                                                    </div>      
                                                    <div class="form-group col-md-3" >
                                                        <label>Requested Person - Mobile No</label>
                                                        <input type="text" id="pwt_requested_mobile" class="form-control"  placeholder="Requested Person's Mobile No" name="pwt_requested_mobile" required>
                                                    </div>  
                                                    <div class="form-group col-md-3" >
                                                        <label>Requested Person - Member ID</label>
                                                        <input type="text" id="pwt_requested_mid" class="form-control"  placeholder="Membership ID" name="pwt_requested_mid" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-heading" style="background-color: #fff;">
                                                <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                                    <i class="fa fa-fw fa-share"></i>&nbsp; PAYMENT DETAILS
                                                </h3>
                                            </div>
                                            <div class="panel-body" style="padding-top: 17px; font-size: 12px; color: navy;"> 
                                                <div class="form-row">
                                                    <div class="form-group col-md-3">
                                                        <label for="email">Remitter Name</label>
                                                        <input type="text" class="form-control" name="contact_person" id="contact_person" style="text-align: left; background-color: #fff;" placeholder=".. Search &amp; select Remitter Name.." data-html="true" title="Search and select the '<b>Remitter name</b>' from the list.." data-toggle="tooltip" data-placement="top"/>
                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label for="email">Mode of Payment</label>
                                                        <select name="pay_mode" id="pay_mode" class="form-control" onchange="paymodechange();" required data-html="true" title="Please select '<b>Payment Mode</b>' from the list.." data-toggle="tooltip" data-placement="top">
                                                            <option value="0">- Select -</option>
                                                            <option value="Cash">- Cash -</option>
                                                            <option value="Cheque">- Cheque -</option>
                                                            <option value="DD">- Demand Draft -</option>
                                                            <option value="EasyPay">- ICICI EasyPay Portal -</option>
                                                            <option value="Direct Deposit">- Direct Deposit -</option>
                                                            <option value="NEFT">- NEFT -</option>
                                                            <option value="RTGS">- RTGS -</option>
                                                            <option value="UPI">- UPI -</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" id='vtrno' hidden>
                                                        <label for="email">Cheque / DD / Tr No</label>
                                                        <input type="text" class="form-control" name="trno" id="trno" style="text-align: left; background-color: #fff;" data-html="true" title="Please enter the '<b>Transaction No</b>' or '<b>Cheque No</b>' or '<b>DD No</b>' here.." data-toggle="tooltip" data-placement="bottom"/>
                                                    </div>
                                                    <div class="form-group col-md-3" id='vtrdate' hidden>
                                                        <label for="email">Transaction Date</label>
                                                        <div class='input-group date' id="event_date_cal5" >
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                            <input type="text" class="form-control" name="trdate" id="trdate" style="text-align: left; background-color: #fff;" maxlength="10" placeholder="DD/MM/YYYY" data-html="true" title="Please select '<b>Transaction Date</b>' or '<b>Cheque Date</b>' or '<b>DD Date</b>' from Calendar.." data-toggle="tooltip" data-placement="top"/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group col-md-3" id='vtramount' hidden>
                                                        <label for="email">Amount Transferred</label>
                                                        <input type="text" class="form-control" name="tramount" id="tramount" style="text-align: left; background-color: #fff;" maxlength="7" data-html="true" title="Please enter the '<b>Amount Transferred</b>' / '<b>going to be transferred</b>' here.." data-toggle="tooltip" data-placement="bottom"/>
                                                    </div>
                                                    <div class="form-group col-md-3" id='vtrbank' hidden>
                                                        <label for="email">Name of the Bank</label>
                                                        <select name="bank" class="form-control" id="bank" data-html="true" title="Please select the '<b>Name of the Bank</b>' from the list.." data-toggle="tooltip" data-placement="top">
                                                            <option value="0">-- Select Bank --</option>
                                                            <option value="Abu Dhabi Commercial Bank Ltd">Abu Dhabi Commercial Bank</option>
                                                            <option value="American Express Bank Ltd">American Express Bank</option>
                                                            <option value="Arab Bangladesh Bank Limited">Arab Bangladesh Bank</option>
                                                            <option value="Allahabad Bank">Allahabad Bank</option>
                                                            <option value="Andhra Bank">Andhra Bank</option>
                                                            <option value="Axis Bank">Axis Bank</option>
                                                            <option value="Antwerp Diamond Bank N.V.">Antwerp Diamond Bank</option>
                                                            <option value="Bank International Indonesia">Bank International Indonesia</option>
                                                            <option value="Bank of America N.A.">Bank of America N.A.</option>
                                                            <option value="Bank of Bahrain & Kuwait BSC">Bank of Bahrain & Kuwait</option>
                                                            <option value="Barclays Bank Plc">Barclays Bank Plc</option>
                                                            <option value="BNP PARIBAS">BNP PARIBAS</option>
                                                            <option value="Bank of Ceylon">Bank of Ceylon</option>
                                                            <option value="Bank of Baroda">Bank of Baroda</option>
                                                            <option value="Bank of India">Bank of India</option>
                                                            <option value="Bank of Maharashtra">Bank of Maharashtra</option>
                                                            <option value="Canara Bank">Canara Bank</option>
                                                            <option value="Central Bank of India">Central Bank of India</option>
                                                            <option value="Calyon Bank">Calyon Bank</option>
                                                            <option value="Citibank N.A.">Citibank N.A.</option>
                                                            <option value="Cho Hung Bank">Cho Hung Bank</option>
                                                            <option value="Chinatrust Commercial Bank Ltd">Chinatrust Commercial Bank</option>
                                                            <option value="City Union Bank Ltd">City Union Bank</option>
                                                            <option value="Coastal Local Area Bank Ltd">Coastal Local Area Bank</option>
                                                            <option value="Corporation Bank">Corporation Bank</option>
                                                            <option value="Catholic Syrian Bank Ltd">Catholic Syrian Bank</option>
                                                            <option value="Deutsche Bank AG">Deutsche Bank AG</option>
                                                            <option value="Development Credit Bank Ltd">Development Credit Bank</option>
                                                            <option value="Dena Bank">Dena Bank</option>
                                                            <option value="IndusInd Bank Limited">IndusInd Bank</option>
                                                            <option value="ICICI Bank">ICICI Bank</option>
                                                            <option value="Indian Bank">Indian Bank</option>
                                                            <option value="Indian Overseas Bank">Indian Overseas Bank</option>
                                                            <option value="Industrial Development Bank of India">IDBI</option>
                                                            <option value="ING Vysya Bank">ING Vysya Bank</option>
                                                            <option value="J P Morgan Chase Bank, National Association">J P Morgan Chase Bank</option>
                                                            <option value="Krung Thai Bank Public Company Limited">Krung Thai Bank</option>
                                                            <option value="Kotak Mahindra Bank Limited">Kotak Mahindra Bank</option>
                                                            <option value="Karnataka Bank">Karnataka Bank</option>
                                                            <option value="Karur Vysya Bank Limited">Karur Vysya Bank</option>
                                                            <option value="Lord Krishna Bank Ltd">Lord Krishna Bank</option>
                                                            <option value="Mashreqbank psc">Mashreqbank psc</option>
                                                            <option value="Mizuho Corporate Bank Ltd">Mizuho Corporate Bank</option>
                                                            <option value="Oman International Bank S A O G">Oman International Bank S A O G</option>
                                                            <option value="Oriental Bank of Commerce">Oriental Bank of Commerce</option>
                                                            <option value="Punjab & Sind Bank">Punjab & Sind Bank</option>
                                                            <option value="Punjab National Bank">Punjab National Bank</option>
                                                            <option value="Societe Generale">Societe Generale</option>
                                                            <option value="Sonali Bank">Sonali Bank</option>
                                                            <option value="Standard Chartered Bank">Standard Chartered Bank</option>
                                                            <option value="State Bank of Mauritius Ltd">State Bank of Mauritius</option>
                                                            <option value="SBI Commercial and International Bank Ltd">SBI Commercial and International</option>
                                                            <option value="State Bank of Bikaner and Jaipur">State Bank of Bikaner and Jaipur</option>
                                                            <option value="State Bank of Hyderabad">State Bank of Hyderabad</option>
                                                            <option value="State Bank of India">State Bank of India</option>
                                                            <option value="State Bank of Mysore">State Bank of Mysore</option>
                                                            <option value="State Bank of Patiala">State Bank of Patiala</option>
                                                            <option value="State Bank of Travancore">State Bank of Travancore</option>
                                                            <option value="Syndicate Bank">Syndicate Bank</option>
                                                            <option value="The Bank of Nova Scotia">The Bank of Nova Scotia</option>
                                                            <option value="The Bank of Tokyo-Mitsubishi, Ltd">The Bank of Tokyo-Mitsubishi</option>
                                                            <option value="The Development Bank of Singapore Ltd (DBS Bank Ltd)">DBS</option>
                                                            <option value="The Hongkong & Shanghai Banking Corporation Ltd">HSBC</option>
                                                            <option value="Tamilnad Mercantile Bank Ltd">Tamilnad Mercantile Bank</option>
                                                            <option value="The Dhanalakshmi Bank Limited">The Dhanalakshmi Bank</option>
                                                            <option value="The Federal Bank Ltd">Federal Bank Ltd</option>
                                                            <option value="The HDFC Bank Ltd">HDFC Bank Ltd</option>
                                                            <option value="The Jammu & Kashmir Bank Ltd">Jammu & Kashmir Bank</option>
                                                            <option value="The Nainital Bank Ltd">Nainital Bank</option>
                                                            <option value="The Sangli Bank Ltd">Sangli Bank</option>
                                                            <option value="The South Indian Bank Ltd">South Indian Bank</option>
                                                            <option value="The Ratnakar Bank Ltd">Ratnakar Bank</option>
                                                            <option value="The Royal Bank of Scotland N.V.">Royal Bank of Scotland</option>
                                                            <option value="The Lakshmi Vilas Bank Ltd">Lakshmi Vilas Bank</option>
                                                            <option value="UCO Bank">UCO Bank</option>
                                                            <option value="Union Bank of India">Union Bank of India</option>
                                                            <option value="United Bank Of India">United Bank Of India</option>
                                                            <option value="Vijaya Bank">Vijaya Bank</option>
                                                            <option value="Yes Bank">Yes Bank</option>
                                                            <option value="National Bank for Agriculture and Rural Development">NBARD</option>
                                                            <option value="Export-Import Bank of India">Export-Import Bank of India</option>
                                                            <option value="National Housing Bank">National Housing Bank</option>
                                                            <option value="Small Industries Development Bank of India">SIDBI</option>
                                                            <option value="Industrial Investment Bank of India Ltd.">IIBI</option>
                                                            <option value="North Eastern Development Finance Corporation">NEDFC</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3" id='vtrbranch' hidden>
                                                        <label for="email">Branch</label>
                                                        <input type="text" class="form-control" name="trbranch" id="trbranch" style="text-align: left; background-color: #fff;" data-html="true" title="Please enter the '<b>Branch name</b>' of the selected Bank.." data-toggle="tooltip" data-placement="bottom"/>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label for="email">Payment Remarks, if any</label>
                                                        <input type='text' class="form-control" name="trremarks" id="trremarks" placeholder=".. Payment transfer related Remarks, if any " style="font-size: 12px;" autocomplete="off" data-html="true" title="Please enter '<b>Payment Transfer to NHQ</b>' related <b>Remarks</b>, if any.." data-toggle="tooltip" data-placement="bottom"/>
                                                    </div>
                                                </div>                                    
                                                <div id="snackbar1"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="menu2" class="tab-pane fade">
                                        <!--<center><font style="font-size: 11px;"><b>Note:</b> For Special Bibles Please contact NHQ</font></center>
                                        <br>-->
                                        <form name="frm_special" id="frm_special">
                                            <div class='panel panel-default panel-accent-gold'>
                                                <div class="panel-heading" style="background-color: #fff;">
                                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                                        <i class="fa fa-fw fa-share"></i>&nbsp; SPECIAL BIBLES
                                                        <button type='button' class='btn btn-primary btn-xs pull-right addSpecialBible' name='createRow' data-toggle='modal' data-target='#specialadd' title='Create new record' style='cursor: pointer;'><i class='fa fa-plus-square' aria-hidden='true'></i> &nbsp;Add Special Bible's</button>
                                                    </h3>
                                                </div>
                                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                                    <table id="special_table" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%; ">
                                                            <tr>
                                                                <th style="text-align: center;" nowrap>Type</th>                                         
                                                                <th style="text-align: right;" nowrap>Quantity</th>  
                                                                <th style="text-align: right;" nowrap>Amount  (₹)</th>  
                                                                <th style="text-align: center;" nowrap>Action</th> 
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th colspan="1" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                                <th></th>
                                                                <th></th>
                                                                <th  colspan="1" style="text-align:right"></th>                                                                                                 
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </form>
                                        <div class='panel panel-default panel-accent-gold' id="special_address">
                                            <div class="panel-heading" style="background-color: #fff;">
                                                <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                                    <i class="fa fa-fw fa-share"></i>&nbsp; D I S P A T C H &nbsp;&nbsp; S P E C I A L &nbsp;B I B L E S &nbsp; T O
                                                </h3>
                                            </div>
                                            <div class="panel-body" style="padding-top: 17px; font-size:12px; color: navy;"> 
                                                <div class="form-row">   
                                                    <div class="form-group col-md-3" >
                                                        <label>Dispatch to - Name</label>
                                                        <input type="text" id="special_name" class="form-control"  placeholder="Name" name="special_name">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>Dispatch to - Mobile</label>
                                                        <input type="text" id="special_mobile" maxlength="10" class="form-control"  placeholder="Mobile" name="special_mobile">
                                                    </div>
                                                    <div class="form-group col-md-6" >
                                                        <label> Addr Line No 1</label>
                                                        <input type="text" id="special_addr1" class="form-control"  placeholder="Line Number 1" name="special_addr1">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label> Addr Line No 2</label>
                                                        <input type="text" id="special_addr2" class="form-control"  placeholder="Line Number 2" name="special_addr2">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>City</label>
                                                        <input type="text" id="special_city" class="form-control"  placeholder="City" name="special_city">
                                                    </div>
                                                    <div class="form-group col-md-3" >
                                                        <label>State</label>
                                                        <select  id="special_state" class="form-control"  name="special_state">
                                                            <option value="0" >-- Select State --</option>                                        
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
                                                    <div class="form-group col-md-3" >
                                                        <label>Pincode</label>
                                                        <input type="text" id="special_pincode" maxlength="6" class="form-control"  placeholder="Pincode" name="special_pincode">
                                                    </div>      
                                                    <div class="form-group col-md-3" >
                                                        <label>Requested by</label>
                                                        <input type="text" id="spl_requested_name" class="form-control"  placeholder="Requested Person Name" name="spl_requested_name" required>
                                                    </div>      
                                                    <div class="form-group col-md-3" >
                                                        <label>Requested Person - Mobile No</label>
                                                        <input type="text" id="spl_requested_mobile" class="form-control"  placeholder="Requested Person's Mobile No" name="spl_requested_mobile" required>
                                                    </div>  
                                                    <div class="form-group col-md-3" >
                                                        <label>Requested Person - Member ID</label>
                                                        <input type="text" id="spl_requested_mid" class="form-control"  placeholder="Membership ID" name="spl_requested_mid" required>
                                                    </div>
                                                </div>                                    
                                                <div id="snackbar"></div>
                                            </div>
                                        </div> 
                                    </div>
                                    <br>             
                                </div>
                                <div class="form-group col-md-3 col-sm-3" hidden >
                                    <label>Camp 9</label>
                                    <input type='text' class="form-control" name="camp9" id="camp9" />
                                    <input type='text' class="form-control" name="useraccessname" id="useraccessname" value="<%= useraccessname%>" style="font-size: 12px;"/>
                                </div>
                                <br>
                                <button type="button" class="btn btn-primary address_check"  id="address_check"  style="float: right;" hidden> View Cart </button>
                                <br>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>         
        </section> 
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
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
                                    <center>    
                                        <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>History of used Scripture</b>
                                        </h3>
                                    </center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="current_stock" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>                                                
                                                <th style="text-align: left;" nowrap>Category</th>
                                                <th style="text-align: center;" nowrap>Type</th>
                                                <th style="text-align: left;" nowrap>Language</th>   
                                                <th style="text-align: left;" nowrap>Color</th>   
                                                <th style="text-align: left;" nowrap>Stock</th>
                                                <th style="text-align: center;" nowrap>Used</th>                                                
                                                <th style="text-align: center;" nowrap>Balance</th>                                                
                                                <th style="text-align: left;" nowrap>Place</th>
                                                <th style="text-align: left;" nowrap>Date</th>    
                                                <th style="text-align: center;" nowrap>Remarks</th>
                                            </tr>
                                        </thead> 
                                        <tfoot>
                                            <tr>
                                                <th colspan="4" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th  colspan="3" style="text-align:right"></th>                                                                                                 
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
        <div class="modal fade" id="demand" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="res3">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center><h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp;<b>History of Requested Scripture</b>
                                        </h3>
                                    </center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="demand_table" class="table table-bordered table-responsive table-hover" style="width:100%">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Category</th>
                                                <th style="text-align: left;" nowrap>Type</th>
                                                <th style="text-align: left;" nowrap>Language</th>
                                                <th style="text-align: left;" nowrap>Color</th>
                                                <th style="text-align: left;" nowrap>Quantity</th>
                                                <th style="text-align: left;" nowrap>Name</th>
                                                <th style="text-align: left;" nowrap>Mobile</th>
                                                <th style="text-align: left;" nowrap>Addr 1</th>
                                                <th style="text-align: left;" nowrap>Addr 2</th>
                                                <th style="text-align: left;" nowrap>City</th>
                                                <th style="text-align: left;" nowrap>State</th>
                                                <th style="text-align: left;" nowrap>Pincode</th>
                                                <th style="text-align: left;" nowrap>Remarks</th>
                                            </tr>
                                        </thead> 
                                        <tfoot>
                                            <tr style="background-color: yellow;">
                                                <th colspan="4" style="text-align:right;">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th  colspan="8" style="text-align:right"></th>                                                                                                 
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="checkall" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #fff;">
                            <i class="glyphicon glyphicon-th"></i>&nbsp;<b> LIST OF ITEMS ADDED IN YOUR BASKET</b>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </h3>
                    </div>   
                    <form  id="checkallform" name="checkallform" class="checkallform">
                        <div class="modal-body" id="res3">
                            <div class='panel panel-default'>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="checkall_table" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                        <thead style="background-color: #01354a; color: #ffe114; font-weight: bold;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Category</th>   
                                                <th style="text-align: left;" nowrap>Type</th> 
                                                <th style="text-align: left;" nowrap>Language</th>  
                                                <th style="text-align: left;" nowrap>Color</th>
                                                <th style="text-align: right;" nowrap>Quantity</th>
                                                <th style="text-align: right;" nowrap>Amount</th>
                                                <th style="text-align: center;" nowrap>Remarks</th>                               
                                            </tr>
                                        </thead>  
                                        <tfoot>
                                            <tr>
                                                <th colspan="4" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th></th>
                                                <th colspan="1" style="text-align:right"></th>                                                                                                 
                                            </tr>
                                        </tfoot>
                                    </table>   
                                </div>
                                <br>

                            </div> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary pull-right final_submit" data-dismiss="modal" style="float: right;"> Final Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="edit_pwt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <b><span aria-hidden="true">&times;</span></b>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>    
                    <div id="snackbar1"></div>
                    <form>
                        <div class="modal-body" id="res_pwt">
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center> <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Editing Details</b>
                                        </h3></center>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;">
                                    <div class="form-bottom">
                                        <div class="row">
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Language</label>                                                
                                                <%  String name_sql4 = "";
                                                    String mname4 = "";
                                                    String mname_str4 = "";
                                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                    try {
                                                        con = ds.getConnection();
                                                        Statement statement = con.createStatement();
                                                        name_sql4 = "select distinct language from sd_wh order by language";

                                                        ResultSet resultSet = statement.executeQuery(name_sql4);
                                                %>
                                                <input name="language_edit" list="olanguage_edit" class="form-control" id="language_edit" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search.." >
                                                <datalist id="olanguage_edit">
                                                    <%
                                                        while (resultSet.next()) {
                                                            mname_str4 = resultSet.getString("language");
                                                    %>
                                                    <option value="<%=mname_str4%>"><%=mname_str4%></option>
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
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Color</label>
                                                <select name="color_edit" id="color_edit"   class="form-control"  required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Brown"> Brown</option>
                                                    <option value="Periwinkle">Periwinkle</option>                                                       
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Quantity</label>
                                                <input type='text' maxlength="6" class="form-control"   name="qty_edit" id="qty_edit" onchange="pwtedit();" />
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Amount</label>
                                                <input type='text' maxlength="6" class="form-control"   name="pwt_cost_edit" id="pwt_cost_edit" readonly />
                                            </div>
                                        </div>
                                    </div>
                                </div>                                             
                            </div>  
                        </div> 
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit"  data-dismiss="modal" id="pwt_edit_submit" class="btn btn-primary pwt_edit_submit pull-right">SUBMIT</button>   
                        </div>
                    </form> 
                </div>
            </div>
        </div>
        <div class="modal fade" id="editspecial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <b><span aria-hidden="true">&times;</span></b>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>     
                    <div id="snackbar1">  
                    </div>
                    <div class="modal-body" id="res">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center> <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Editing Details</b>
                                        </h3></center>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;">
                                    <div class="form-bottom">
                                        <div class="row">
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Bible Type</label>
                                                <select name="type4" id="type4" class="form-control" required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Indian Dignitary">Indian Dignitary -(Rs.600/-)</option>
                                                    <option value="International Dignitary">International Dignitary -(Rs.1200/-)</option>
                                                    <option value="Leather Bond PWT">Leather Bond PWT -(Rs.50/-)</option>
                                                    <option value="PWB Holy Bible">PWB Holy Bible -(Rs.100/-)</option>
                                                    <option value="Slim Line">Slim Line -(Rs.250/-)</option>
                                                </select> 
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Quantity</label>
                                                <input type='text' maxlength="6" class="form-control"  name="qty4" id="qty4" />
                                            </div>  
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Amount</label>
                                                <input type='text' maxlength="6" class="form-control" name="cost4" id="cost4" readonly />
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                            
                            </div>
                            <button type="submit" data-dismiss="modal" id="special_edit_submit"  class="btn btn-primary special_edit_submit pull-right">SUBMIT</button>   
                            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">CLOSE</button>
                            <br>
                        </form>
                    </div>  
                </div>
            </div>
        </div>
        <div class="modal fade" id="pwt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #fff; letter-spacing: 2px;">
                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>ADD PWT's IN YOUR BASKET</b>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <b><span aria-hidden="true">&times;</span></b>
                            </button>
                        </h3>
                    </div>      
                    <div id="snackbar1"></div>
                    <form  class="pwt_new" id="pwt_new">
                        <div class="modal-body" id="res">
                            <div class='panel panel-default'>
                                <div class="panel-body" style="padding-top: 20px;">
                                    <div class="form-bottom">   
                                        <div class="row">
                                            <div class="form-group col-md-2">
                                                <label>Type</label>
                                                <select name="pwttype" id="pwttype"   class="form-control"  required>
                                                    <option value="0">- Select -</option>
                                                    <option value="PWT-Gideon">PWT-Gideon</option>
                                                    <option value="PWT-Aux">PWT-Aux</option>                                                       
                                                </select>       
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Language</label>
                                                <%  String name_sql3 = "";
                                                    String mname3 = "";
                                                    String mname_str3 = "";
                                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                    try {
                                                        con = ds.getConnection();
                                                        Statement statement = con.createStatement();
                                                        name_sql3 = "select distinct language from sd_wh order by language";

                                                        ResultSet resultSet = statement.executeQuery(name_sql3);
                                                %>
                                                <input name="pwtlanguage" list="opwtlanguage" class="form-control" id="pwtlanguage" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
                                                <datalist id="opwtlanguage">
                                                    <%
                                                        while (resultSet.next()) {
                                                            mname_str3 = resultSet.getString("language");
                                                    %>
                                                    <option value="<%=mname_str3%>"><%=mname_str3%></option>
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
                                            <div class="form-group col-md-2">
                                                <label>Color</label>
                                                <select name="pwtcolor" id="pwtcolor"   class="form-control"  required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Brown"> Brown</option>
                                                    <option value="Periwinkle">Periwinkle</option>                                                       
                                                </select>       
                                            </div>
                                            <div class="form-group col-md-2" >
                                                <label>Quantity</label>
                                                <input type='text' maxlength="6" class="form-control"   name="qtypwt" id="qtypwt" onchange="pwtchange();"/>
                                            </div>
                                            <div class="form-group col-md-2" >
                                                <label>Amount</label>
                                                <input type='text' maxlength="6" class="form-control"   name="pwt_cost" id="pwt_cost" readonly/>
                                            </div>                                     

                                            <div class="form-group col-md-3" hidden>
                                                <label>Camp 6</label>
                                                <input type='text' class="form-control" name="camp6" id="camp6" />
                                                <input type='text' class="form-control" name="useraccessname" id="useraccessname" value="<%= useraccessname%>" style="font-size: 12px;"/>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body" id="remittance1" style="padding-top: 20px;" hidden> 
                                    <div class="form-row">
                                    </div>                                    
                                    <div id="snackbar"></div>
                                </div>
                                <br> 
                                <div id="pay" hidden>
                                    <p class="rem">
                                        <i class="fa fa-credit-card" style="font-size:18px; color: black;">
                                            Make Online payment
                                            <br>
                                            EazyPay-ICICI Bank
                                        </i>
                                    </p>
                                </div>
                                <br>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit"  class="btn btn-primary pwt_add pull-right" id="pwt_add" data-dismiss="modal">SUBMIT</button>   
                        </div>
                    </form>  
                </div>
            </div>
        </div>
        <div class="modal fade" id="specialadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #fff; letter-spacing: 2px;">
                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>ADD SPECIAL BIBLE's IN YOUR BASKET</b>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <b><span aria-hidden="true">&times;</span></b>
                            </button>
                        </h3>
                    </div>     
                    <div id="snackbar1"></div>
                    <form id="special_new" name="special_new" class="special_new">
                        <div class="modal-body" id="res4">
                            <div class='panel panel-default'>
                                <div class="panel-body" style="padding-top: 20px;">
                                    <div class="form-bottom">
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label>Bible Type</label>
                                                <select name="typespl" id="typespl" class="form-control" required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Indian Dignitary">Indian Dignitary -(Rs.600/-)</option>
                                                    <option value="International Dignitary">International Dignitary -(Rs.1200/-)</option>
                                                    <option value="Leather Bond PWT">Leather Bond PWT -(Rs.50/-)</option>
                                                    <option value="PWB Holy Bible">PWB Holy Bible -(Rs.100/-)</option>
                                                    <option value="Slim Line">Slim Line -(Rs.250/-)</option>
                                                </select> 
                                            </div>       
                                            <div class="form-group col-md-3" >
                                                <label>Quantity</label>
                                                <input type='text' maxlength="6" class="form-control" name="qtyspl" id="qtyspl"/>
                                            </div>
                                            <div class="form-group col-md-3" >
                                                <label>Amount</label>
                                                <input type='text' maxlength="6" class="form-control" name="special_cost" id="special_cost" readonly/>
                                            </div>

                                            <br>                                     
                                            <div class="form-group col-md-3" hidden >
                                                <label>Camp 4</label>
                                                <input type='text' class="form-control"  name="camp4" id="camp4" />
                                                <input type='text' class="form-control" name="useraccessname" id="useraccessname" value="<%= useraccessname%>" style="font-size: 12px;"/>

                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit" data-dismiss="modal" id="special_add_new" class="btn btn-primary special_add_new pull-right" >SUBMIT</button>  
                        </div>
                    </form>  
                </div>
            </div>
        </div>
        <div class="modal fade" id="new" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #fff; letter-spacing: 2px;">
                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>ADD SCRIPTURES IN THE BASKET</b>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <b><span aria-hidden="true">&times;</span></b>
                            </button>
                        </h3>
                    </div>     
                    <div id="snackbar1"></div>
                    <form id="new_request" name="new_request" class="new_request">
                        <div class="modal-body" id="res4">
                            <div class='panel panel-default'>
                                <div class="form-bottom">                                
                                    <div class="panel-body" style="padding-top: 20px;">
                                        <div class="row">
                                            <div class="form-group col-md-2">
                                                <label>Type</label>
                                                <select class="form-control" name="type" id="type" required >                                                 
                                                    <option  selected>New Testament</option>
                                                    <option >Holy Bible</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label>Language</label>
                                                <%  String name_sql1 = "";
                                                    String mname1 = "";
                                                    String mname_str1 = "";
                                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                    try {
                                                        con = ds.getConnection();
                                                        Statement statement = con.createStatement();
                                                        name_sql1 = "select distinct language from sd_wh order by language";

                                                        ResultSet resultSet = statement.executeQuery(name_sql1);
                                                %>
                                                <input name="language" list="oLanguage" class="form-control" id="language" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
                                                <datalist id="oLanguage">
                                                    <%
                                                        while (resultSet.next()) {
                                                            mname_str1 = resultSet.getString("language");
                                                    %>
                                                    <option value="<%=mname_str1%>"><%=mname_str1%></option>
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
                                            <div class="form-group col-md-2">
                                                <label>Color</label>
                                                <select class="form-control" name="color" id="color" required>
                                                    <option value="0">-- Select Color --</option>
                                                    <option value="BLUE">BLUE</option>
                                                    <option value="BROWN">BROWN</option>
                                                    <option value="BURGUNDY">BURGUNDY</option>
                                                    <option value="CAMOUFLAGE">CAMOUFLAGE</option>
                                                    <option value="COAT">COAT</option>
                                                    <option value="CROWN">CROWN</option>
                                                    <option value="GREEN">GREEN</option>
                                                    <option value="LT BLUE">LT BLUE</option>
                                                    <option value="WHITE">WHITE</option>
                                                </select>   
                                            </div>
                                            <div class="form-group col-md-2" >
                                                <label>Quantity</label>
                                                <input type='text' maxlength="6" class="form-control" name="qty" id="qty" />
                                            </div>

                                            <div class="form-group col-md-4" >
                                                <label>Remarks</label>
                                                <input type="text"  id="scrip_remarks" class="form-control"  placeholder="Remarks" name="scrip_remarks" required>
                                            </div>
                                        </div>
                                    </div>   
                                    <div class="form-group col-md-3" hidden>
                                        <label>Camp 5</label>
                                        <input type='text' class="form-control"  name="camp5" id="camp5" />
                                        <input type='text' class="form-control" name="useraccessname" id="useraccessname" value="<%= useraccessname%>" style="font-size: 12px;"/>
                                    </div>  
                                </div>                                               
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit" data-dismiss="modal" id="scripture_add" class="btn btn-primary scripture_add pull-right">SUBMIT</button>   
                        </div>
                    </form>  
                </div>
            </div>
        </div>
        <div class="modal fade" id="action" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <b><span aria-hidden="true">&times;</span></b>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>     
                    <div id="snackbar1">  
                    </div>
                    <div class="modal-body" id="res4">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>
                                        <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Provide Usage</b>
                                        </h3>
                                    </center>
                                </div>
                                <div class="form-bottom">                                
                                    <div class="panel-body" style="padding-top: 20px;">
                                        <div class="row">
                                            <div class="form-group col-md-3 col-md-3">
                                                <label>Type</label>
                                                <select class="form-control" name="type1" id="type1" disabled>
                                                    <option value="0">---SELECT---</option>
                                                    <option value="New Testament">New Testament</option>
                                                    <option value="English">English</option>
                                                    <option value="Indian Dignitary">Indian Dignitary -(Rs.600/-)</option>
                                                    <option value="International Dignitary">International Dignitary -(Rs.1200/-)</option>
                                                    <option value="Leather Bond PWT">Leather Bond PWT -(Rs.50/-)</option>
                                                    <option value="PWB Holy Bible">PWB Holy Bible -(Rs.100/-)</option>
                                                    <option value="Slim Line">Slim Line -(Rs.250/-)</option>
                                                    <option value="gideon"> PWT-Gideon</option>
                                                    <option value="aux">PWT-Aux</option>     
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3 col-md-3">
                                                <label>Language</label>
                                                <select class="form-control" name="language1" id="language1" disabled >
                                                    <option value="0">---SELECT---</option>
                                                    <option>Tamil</option>
                                                    <option>English</option>
                                                    <option>Telugu</option>
                                                    <option>  Assamese</option>
                                                    <option>  Bengali</option>
                                                    <option>  Bhojpuri</option>
                                                    <option>  Boro</option>
                                                    <option>   Garo</option>
                                                    <option>   Gujarati</option>
                                                    <option>   Hindi</option>
                                                    <option> Kannada</option>
                                                    <option>  Khasi</option>
                                                    <option>  Kok Borok</option>
                                                    <option>  Konkani</option>
                                                    <option>   Malayalam</option>
                                                    <option> Manipuri</option>
                                                    <option>  Marathi</option>
                                                    <option>Nepali</option>
                                                    <option> Oriya </option>
                                                    <option>    Manipuri </option>
                                                    <option>  Mizo </option>
                                                    <option>  Punjabi </option> 
                                                    <option> Santali </option>
                                                    <option> Urdu </option> 
                                                    <option> Holy Bible </option>
                                                </select>  
                                            </div>   
                                            <div class="form-group col-md-3 col-md-3">
                                                <label>Color</label>
                                                <select class="form-control" name="color1" id="color1" disabled>
                                                    <option value="0">---SELECT---</option>
                                                    <option value="Blue">Blue</option>
                                                    <option value="brown"> Brown</option>
                                                    <option value="periwinkle">Periwinkle</option>   
                                                    <option value="White">White</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3 col-md-3" >
                                                <label>Camp stock</label>
                                                <input type="text" id="qty1" maxlength="6" class="form-control" placeholder="Enter the number of counts" name="qty1" disabled>
                                            </div>
                                            <div class="form-group col-md-3 col-md-3">
                                                <label>Place of distribution</label>
                                                <select class="form-control" id="place_dist1" name="place_dist1">
                                                    <option value="0">---SELECT---</option>
                                                    <option value="Jail">Jail</option>
                                                    <option value="School">School</option>
                                                    <option value="Hospital">Hospital</option>
                                                    <option value="College">College</option>
                                                </select> 
                                            </div>
                                            <div class="form-group col-md-3 col-md-3">
                                                <label>Date of dist</label>
                                                <div class='input-group date' id="event_date_cal4" >
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type="text" id="dist_date"  class="form-control"  name="dist_date" required>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-3 col-sm-3" >
                                                <label>Distributed quantity</label>
                                                <input type="text" id="dist_qty1" class="form-control"  name="dist_qty1">
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3" >
                                                <label>Balance quantity</label>
                                                <input type="text" id="bal_qty1" class="form-control" name="bal_qty1" readonly>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6" >
                                                <label>Distributed Remarks</label>
                                                <input type="text" id="pd_remarks1" class="form-control" name="pd_remarks1"> 
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6" >
                                                <label>Usage remarks (if any)</label>
                                                <input type="text" id="scrip_remarks1" class="form-control" name="scrip_remarks1"> 
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3" hidden >
                                                <label>RID</label>
                                                <input type="text" id="rid" class="form-control" name="rid" >
                                            </div>
                                        </div>
                                    </div>  

                                </div>                                                 
                            </div>

                            <button type="submit" data-dismiss="modal" class="btn btn-primary action_add pull-right" id="action_add">SUBMIT</button>   
                            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">CLOSE</button>
                            <br>
                        </form>  
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="action2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <b><span aria-hidden="true">&times;</span></b>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>    
                    <div id="snackbar1">  
                    </div>
                    <div class="modal-body" id="res">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center> <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Editing Details</b>
                                        </h3></center>
                                </div>
                                <div class="form-bottom">
                                    <div class="panel-body" style="padding-top: 20px;">
                                        <div class="row">
                                            <div class="form-group col-md-3 col-sm-3">                                   
                                                <label>Type</label>
                                                <select  id="type2" class="form-control"  name="type2"  >                                                 
                                                    <option  selected>New Testament</option>
                                                    <option >Holy Bible</option>
                                                </select>
                                            </div>  
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Language</label>
                                                <%  String name_sql2 = "";
                                                    String mname2 = "";
                                                    String mname_str2 = "";
                                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                    try {
                                                        con = ds.getConnection();
                                                        Statement statement = con.createStatement();
                                                        name_sql2 = "select distinct language from sd_wh order by language";

                                                        ResultSet resultSet = statement.executeQuery(name_sql2);
                                                %>
                                                <input name="language2" list="oLanguage2" class="form-control" id="language2" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
                                                <datalist id="oLanguage2">
                                                    <%
                                                        while (resultSet.next()) {
                                                            mname_str2 = resultSet.getString("language");
                                                    %>
                                                    <option value="<%=mname_str2%>"><%=mname_str2%></option>
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
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label>Color</label>
                                                <select class="form-control" name="color2" id="color2" required>
                                                    <option value="0">---SELECT---</option>
                                                    <option>Blue</option>
                                                    <option>White</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3 col-md-3">
                                                <label>Quantity</label>
                                                <input type="text" maxlength="6" id="qty2" class="form-control"  name="qty2" >
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3" hidden>
                                                <input type="text" id="rid" class="form-control"  name="rid" >
                                            </div>
                                            <div class="form-group col-md-6 col-md-6" >
                                                <label>Remarks</label>
                                                <input type="text"  autocomplete="off" id="scrip_remarks2" class="form-control"  placeholder="Remarks" name="scrip_remarks2">
                                            </div>
                                        </div>
                                    </div>    
                                    <div class='panel panel-default panel-accent-gold' hidden>
                                        <div class="panel-heading" style="background-color: #fff;">
                                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                                <i class="fa fa-fw fa-share"></i>&nbsp; D I S P A T C H &nbsp;&nbsp; S C R I P T U R E &nbsp; T O
                                            </h3>
                                        </div>
                                        <div class="panel-body" style="padding-top: 20px;"> 
                                            <div class="form-row">   
                                                <div class="form-group col-md-3 col-sm-3" hidden>
                                                    <label>Name</label>
                                                    <input type="text" id="name2" class="form-control"  placeholder="Name" name="name2">
                                                </div>
                                                <div class="form-group col-md-3 col-sm-3" >
                                                    <label>Mobile</label>
                                                    <input type="text" maxlength="10" id="mobile2" class="form-control"  placeholder="Mobile" name="mobile2">
                                                </div>
                                                <div class="form-group col-md-3 col-sm-3" >
                                                    <label>Address Line No 1</label>
                                                    <input type="text" id="addr12" autocomplete="off" class="form-control"  placeholder="Line Number 1" name="addr12">
                                                </div>
                                                <div class="form-group col-md-3 col-sm-3" >
                                                    <label>Address Line No 2</label>
                                                    <input type="text" id="addr22" autocomplete="off" class="form-control"  placeholder="Line Number 2" name="addr22">
                                                </div>
                                                <div class="form-group col-md-3 col-sm-3" >
                                                    <label>City</label>
                                                    <input type="text" id="city2" autocomplete="off" class="form-control"  placeholder="City" name="city2">
                                                </div>
                                                <div class="form-group col-md-3 col-sm-3" >
                                                    <label>State</label>                                             
                                                    <select  id="state2" class="form-control"  name="state2">
                                                        <option value="0">-- Select State --</option>                                        
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
                                                        <option value="West Bengal">West Bengal</option>     </select>
                                                </div>
                                                <div class="form-group col-md-3 col-sm-3" >
                                                    <label>Pincode</label>
                                                    <input type="text" maxlength="6" autocomplete="off" id="pincode2" class="form-control"  placeholder="Pincode" name="pincode2">
                                                </div>  

                                            </div>                                    
                                            <div id="snackbar"></div>
                                        </div>                               
                                    </div>   
                                </div>
                            </div>
                            <button type="submit" name="action2_add" data-dismiss="modal" id="action2_add" class="btn btn-primary action2_add pull-right">SUBMIT</button>   
                            <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">CLOSE</button>
                            <br>
                        </form>
                    </div> 
                </div>
            </div>
        </div>
        <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script>
                                                    $('#qty2,#tramount,#special_mobile,#special_pincode, #pincode2, #mobile2, #dist_qty1, #qty, #qtyspl, #qtypwt, #qty4, #qty_edit,#scrip_mobile,#scrip_pincode,#pwt_mobile,#pwt_pincode').keypress(function (e) {

                                                        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
                                                            return false;
                                                        }
                                                    });

        </script>

        <script>
            $(document).on('click', '.address_check', function () {
                //alert("Camp Name " + $('#camp').val());
                var hasError = false;
                var scrip_name = $("#scrip_name").val();
                var pwt_name = $("#pwt_name").val();
                var special_name = $("#special_name").val();

                var table;
                table = $('#checkall_table').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    lengthMenu: [
                        [10, 25, -1],
                        ['10 rows', '25 rows', 'Show all']
                    ],
                    ajax: {
                        method: "POST",
                        url: "SDo_checkall?camp=" + $('#camp').val() + "&username=" + $('#useraccessname').val(),
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "category"},
                        {"data": "type"},
                        {"data": "language"},
                        {"data": "color"},
                        {"data": "qty"},
                        {"data": "cost"},
                        {"data": "scrip_remarks"}
                    ], columnDefs: [
                        {className: 'text-right', targets: [4, 5]}
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
                        // Total over this page
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
                        // Update footer
                        $(api.column(4).footer()).html(
                                '' + pageTotal4 + '<br>(' + total4 + ')'
                                );
                        $(api.column(5).footer()).html(
                                '' + pageTotal5 + '<br>(' + total5 + ')'
                                );
                    }
                });

                if ((scrip_name !== null && scrip_name !== '' && scrip_name !== "") || (pwt_name !== null && pwt_name !== '' && pwt_name !== "") || (special_name !== null && special_name !== '' && special_name !== "")) {

                    if (scrip_name !== null && scrip_name !== '' && scrip_name !== "") {
                        var mob = /^[1-9]{1}[0-9]{9}$/;
                        var nameVal = $("#scrip_mobile").val();
                        if (nameVal === '') {
                            alert("Scripture : Please enter your  Mobile!!");
                            $("#scrip_mobile").focus();
                            hasError = true;
                        } else if (!mob.test(nameVal)) {
                            alert("Scripture : Please enter a valid Mobile!!");
                            $("#scrip_mobile").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#scrip_addr1").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("Scripture : Enter your address");
                            $("#scrip_addr1").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#scrip_city").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("Scripture : Enter city name");
                            $("#scrip_city").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#scrip_state").val();
                        if (nameVal === "" || nameVal === null || nameVal === "0") {
                            alert("Scripture : Please select the state");
                            $("#scrip_state").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#scrip_pincode").val();
                        if (nameVal === "" || nameVal === null || nameVal.length < 6) {
                            alert("Scripture : Enter your pincode");
                            $("#scrip_pincode").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#camp").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("Scripture : Select Camp Name");
                            $("#camp").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        alert("Your order details will be shown in a window; Kindly confirm the same before final submission!!");
                        $('#checkall').modal('show');
                    } else if (scrip_name == null && scrip_name == '' && scrip_name == "") {
                        alert("Sctipture : Enter Dispatch to Person Name");
                        $("#scrip_name").focus();
                        hasError = true;
                    }
                    if (hasError === true) {
                        return false;
                    }
                    if (pwt_name !== null && pwt_name !== '' && pwt_name !== "") {
                        var mob = /^[1-9]{1}[0-9]{9}$/;
                        var nameVal = $("#pwt_mobile").val();
                        if (nameVal === '') {
                            alert("PWT : Please enter your  Mobile!!");
                            $("#pwt_mobile").focus();
                            hasError = true;
                        } else if (!mob.test(nameVal)) {
                            alert("PWT : Please enter a valid Mobile!!");
                            $("#pwt_mobile").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#pwt_addr1").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("PWT : Enter your address");
                            $("#pwt_addr1").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#pwt_city").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("PWT : Enter city name");
                            $("#pwt_city").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#pwt_state").val();
                        if (nameVal === "" || nameVal === null || nameVal === "0") {
                            alert("PWT : Please select the state");
                            $("#pwt_state").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#pwt_pincode").val();
                        if (nameVal === "" || nameVal === null || nameVal.length < 6) {
                            alert("PWT : Enter your pincode");
                            $("#pwt_pincode").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }
                        alert("Your order details will be shown in a window; Kindly confirm the same before final submission!!");
                        $('#checkall').modal('show');
                    } else if (pwt_name == null && pwt_name == '' && pwt_name == "") {
                        alert("PWT : Enter Dispatch to Person Name");
                        $("#pwt_name").focus();
                        hasError = true;
                    }
                    if (hasError === true) {
                        return false;
                    }
                    if (special_name !== null && special_name !== '' && special_name !== "") {
                        var mob = /^[1-9]{1}[0-9]{9}$/;
                        var nameVal = $("#special_mobile").val();
                        if (nameVal === '') {
                            alert("Special Bible: Please enter your  Mobile!!");
                            $("#special_mobile").focus();
                            hasError = true;
                        } else if (!mob.test(nameVal)) {
                            alert("Special Bible : Please enter a valid Mobile!!");
                            $("#special_mobile").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#special_addr1").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("Special Bible : Enter your address");
                            $("#special_addr1").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#special_city").val();
                        if (nameVal === "" || nameVal === null) {
                            alert("Special Bible : Enter city name");
                            $("#special_city").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#special_state").val();
                        if (nameVal === "" || nameVal === null || nameVal === "0") {
                            alert("Special Bible : Please select the state");
                            $("#special_state").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }

                        var nameVal = $("#special_pincode").val();
                        if (nameVal === "" || nameVal === null || nameVal.length < 6) {
                            alert("Special Bible : Enter your pincode");
                            $("#special_pincode").focus();
                            hasError = true;
                        }
                        if (hasError === true) {
                            return false;
                        }
                        alert("Your order details will be shown in a window;\n\n Kindly confirm the same before final submission!!");
                        $('#checkall').modal('show');
                    } else if (special_name == null && special_name == '' && special_name == "") {
                        alert("Special Bible : Enter Dispatch to Person Name");
                        $("#special_name").focus();
                        hasError = true;
                    }
                    if (hasError === true) {
                        return false;
                    }

                } else {
                    alert("Please fill dispatch to information before clicking the submit button");
                    $("#scrip_name").focus();
                    $("#pwt_name").focus();
                    $("#special_name").focus();
                }
            });
        </script>
        <script>
            $(function () {
                $('.add').on('click', function (e) {
                    $('#res').show();
                    $('#snackbar1').html();
                    $('#snackbar1').hide();
                });
            });
        </script>      
        <script>
            $(document).on('click', '.createRow123', function () {
                var table;
                table = $('#requested').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength'
                    ],
                    lengthMenu: [
                        [10, 25, -1],
                        ['10 rows', '25 rows', 'Show all']
                    ],
                    ajax: {
                        method: "POST",
                        url: "SD_Demands_List?camp=" + $('#camp').val() + "&username=" + $('#useraccessname').val(),
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "type"},
                        {"data": "language"},
                        {"data": "color"},
                        {"data": "requested_qty"},
                        {"data": "rstatus"},
                        {"data": "requested_name"},
                        {"data": "mode"},
                        {"data": "requested_on"},
                        {"data": "sd_fwd_on"},
                        {"data": "approved_on"},
                        {"data": "release_processed_on"},
                        {"data": "cou_date_time"},
                        {"data": "lr_updated_on"},
                        {"data": "lrno"},
                        {"data": "transporter"},
                        {"data": "confirmed_on"},
                        {"data": "confirmed_by"}
                    ], columnDefs: [
                        {className: 'text-right', targets: [3]}
                    ],
                    "createdRow": function (row, data, dataIndex) {
                        $(row).css('background-color', '#EAFAF1');
                    },
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
                        var total4 = api
                                .column(3)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Total over this page
                        var pageTotal4 = api
                                .column(3, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Update footer
                        $(api.column(3).footer()).html(
                                '' + pageTotal4 + '<br>(' + total4 + ')'
                                );
                    }
                });
            });
        </script>   
        <script>
            function paymodechange() {
                var paymode = document.getElementById("pay_mode").value;
                if (paymode === "Direct Deposit") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else if (paymode === "NEFT") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else if (paymode === "RTGS") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else if (paymode === "Payment Gateway") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else if (paymode === "UPI") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else if (paymode === "EasyPay") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else if (paymode === "Cheque") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = false;
                    document.getElementById("vtrbranch").hidden = false;
                } else if (paymode === "DD") {
                    document.getElementById("vtrno").hidden = false;
                    document.getElementById("vtrdate").hidden = false;
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrbank").hidden = false;
                    document.getElementById("vtrbranch").hidden = false;
                } else if (paymode === "Cash") {
                    document.getElementById("vtramount").hidden = false;
                    document.getElementById("vtrno").hidden = true;
                    document.getElementById("vtrdate").hidden = true;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                } else {
                    document.getElementById("vtramount").hidden = true;
                    document.getElementById("vtrno").hidden = true;
                    document.getElementById("vtrdate").hidden = true;
                    document.getElementById("vtrbank").hidden = true;
                    document.getElementById("vtrbranch").hidden = true;
                }
            }
        </script>

        <script>
            $(document).on('click', '.final_submit', function () {
                var camp = $("#camp9").val();
                var name = $("#special_name").val();
                var mobile = $("#special_mobile").val();
                var addr1 = $("#special_addr1").val();
                var addr2 = $("#special_addr2").val();
                var city = $("#special_city").val();
                var state = $("#special_state").val();
                var pincode = $("#special_pincode").val();
                var pwt_name = $("#pwt_name").val();
                var pwt_mobile = $("#pwt_mobile").val();
                var pwt_addr1 = $("#pwt_addr1").val();
                var pwt_addr2 = $("#pwt_addr2").val();
                var pwt_city = $("#pwt_city").val();
                var pwt_state = $("#pwt_state").val();
                var pwt_pincode = $("#pwt_pincode").val();
                var scrip_name = $("#scrip_name").val();
                var scrip_mobile = $("#scrip_mobile").val();
                var scrip_addr1 = $("#scrip_addr1").val();
                var scrip_addr2 = $("#scrip_addr2").val();
                var scrip_city = $("#scrip_city").val();
                var scrip_state = $("#scrip_state").val();

                var scrip_pincode = $("#scrip_pincode").val();
                var requested_name = $("#requested_name").val();
                var requested_mobile = $("#requested_mobile").val();
                var requested_mid = $("#requested_mid").val();
                var pwt_requested_name = $("#pwt_requested_name").val();
                var pwt_requested_mobile = $("#pwt_requested_mobile").val();
                var pwt_requested_mid = $("#pwt_requested_mid").val();
                var spl_requested_name = $("#spl_requested_name").val();
                var spl_requested_mobile = $("#spl_requested_mobile").val();
                var spl_requested_mid = $("#spl_requested_mid").val();

                var scrip_remarks = $("#scrip_remarks").val();
                var contact_person = $("#contact_person").val();
                var useraccessname = $("#useraccessname").val();
                var requested_on = $("#requested_on").val();
                var pay_mode = $("#pay_mode").val();
                var trno = $("#trno").val();
                var trdate = $("#trdate").val();
                var tramount = $("#tramount").val();
                var bank = $("#bank").val();
                var trbranch = $("#trbranch").val();
                var trremarks = $("#trremarks").val();
                var r = confirm("Are you sure ? Do you want to submit this record ?\n");
                if (r === true) {
                    $.ajax({
                        type: "post",
                        url: "SD_finalinsert.jsp",
                        data: {"camp": camp, "name": name, "mobile": mobile, "addr1": addr1, "addr2": addr2, "city": city, "state": state, "pincode": pincode, "pwt_name": pwt_name, "pwt_mobile": pwt_mobile, "pwt_addr1": pwt_addr1, "pwt_addr2": pwt_addr2, "pwt_city": pwt_city, "pwt_state": pwt_state, "pwt_pincode": pwt_pincode, "scrip_name": scrip_name, "scrip_mobile": scrip_mobile, "scrip_addr1": scrip_addr1, "scrip_addr2": scrip_addr2, "scrip_city": scrip_city, "scrip_state": scrip_state, "scrip_pincode": scrip_pincode, "scrip_remarks": scrip_remarks, "contact_person": contact_person, "pay_mode": pay_mode, "trno": trno, "trdate": trdate, "tramount": tramount, "bank": bank, "trbranch": trbranch, "trremarks": trremarks, "requested_on": requested_on, "useraccessname": useraccessname, "requested_name": requested_name, "requested_mid": requested_mid, "pwt_requested_name": pwt_requested_name, "pwt_requested_mid": pwt_requested_mid, "spl_requested_name": spl_requested_name, "spl_requested_mid": spl_requested_mid, "requested_mobile": requested_mobile, "pwt_requested_mobile": pwt_requested_mobile, "spl_requested_mobile": spl_requested_mobile},
                        success: function (data) {
                            alert(data);
                            window.location.reload();
                        }
                    });
                } else {
                    $('#checkall').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.delete', function (e) {
                var rid = $(this).attr('rid');
                alert("delete SDl id " + rid);
                e.preventDefault();
                var r = confirm("Are you sure ? Do you want to Delete this record ?");
                if (r === true) {
                    $.ajax({
                        url: 'ProcessSDdelete.jsp',
                        type: "post",
                        data: {"rid": rid},
                        success: function (data) {
                            alert(data);
                            $('#requested').DataTable().ajax.reload();
                        }
                    });
                }
            });

            $(document).on('click', '.delete_pwt', function (e) {
                var pwt_rid = $(this).attr('rid');
                alert("delete request for PWT record id " + pwt_rid);
                e.preventDefault();
                var r = confirm("Are you sure ? Do you want to Delete this record ?");
                if (r === true) {
                    $.ajax({
                        url: 'ProcessSDdelete.jsp',
                        type: "post",
                        data: {"rid": pwt_rid},
                        success: function (data) {
                            alert(data);
                            $('#pwt_table').DataTable().ajax.reload();
                        }
                    });
                }
            });

            $(document).on('click', '.delete_special', function (e) {
                var spl_rid = $(this).attr('rid');
                alert("delete request for Special Bible record id " + spl_rid);
                e.preventDefault();
                var r = confirm("Are you sure ? Do you want to Delete this record ?");
                if (r === true) {
                    $.ajax({
                        url: 'ProcessSDdelete.jsp',
                        type: "post",
                        data: {"rid": spl_rid},
                        success: function (data) {
                            alert(data);
                            $('#special_table').DataTable().ajax.reload();
                        }
                    });
                }
            });
        </script>
        <script>
            $(document).on('click', '.special_add_new', function (e) {
                $('#snackbar1').show();
                e.preventDefault();
                $(".error").hide();
                var r = confirm("Are you sure ? Do you want to Submit this record ?\n");
                if (r === true) {
                    $.ajax({
                        type: "post",
                        url: "special_add.jsp",
                        data: $('.special_new').serialize(),
                        success: function (data) {
                            alert(data);
                            var table;
                            table = $('#special_table').DataTable({
                                destroy: true,
                                responsive: true,
                                stateSave: true,
                                "ordering": true,
                                'processing': true,
                                'language': {
                                    'loadingRecords': '&nbsp;',
                                    'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                                },
                                dom: 'Bfrtip',
                                buttons: [
                                    'pageLength'
                                ],
                                lengthMenu: [
                                    [10, 25, -1],
                                    ['10 rows', '25 rows', 'Show all']
                                ],
                                ajax: {
                                    method: "POST",
                                    url: 'SDo_table_of_special?camp=' + $('#camp').val() + "&username=" + $('#useraccessname').val(),
                                    dataSrc: "datas"
                                },
                                columns: [
                                    {"data": "type"},
                                    {"data": "qty"},
                                    {"data": "cost"},
                                    {"data": "edit"}
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
                                    var total1 = api
                                            .column(1)
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    var total2 = api
                                            .column(2)
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    // Total over this page
                                    var pageTotal1 = api
                                            .column(1, {page: 'current'})
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    var pageTotal2 = api
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
                            //$('#checkall_table').DataTable().ajax.reload();
                            $('#specialadd form')[0].reset();
                            $('#camp4').val($('#camp').val());
                            $('.modal-backdrop').remove();
                        }
                    });
                } else {
                    $('#specialadd').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.pwt_add', function (e) {
                $('#snackbar1').show();
                e.preventDefault();
                var r = confirm("Are you sure ? Do you want to Submit this record ?\n");
                if (r === true) {
                    $.ajax({
                        type: "post",
                        url: "pwt_add.jsp",
                        data: $('.pwt_new').serialize(),
                        success: function (data) {
                            alert(data);
                            var table;
                            table = $('#pwt_table').DataTable({
                                destroy: true,
                                responsive: true,
                                stateSave: true,
                                "ordering": true,
                                'processing': true,
                                'language': {
                                    'loadingRecords': '&nbsp;',
                                    'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                                },
                                dom: 'Bfrtip',
                                buttons: [
                                    'pageLength'
                                ],
                                lengthMenu: [
                                    [10, 25, -1],
                                    ['10 rows', '25 rows', 'Show all']
                                ],
                                ajax: {
                                    method: "POST",
                                    url: 'SDo_table_of_pwt?camp=' + $('#camp').val() + "&username=" + $('#useraccessname').val(),
                                    dataSrc: "datas"
                                },
                                columns: [
                                    {"data": "language"},
                                    {"data": "color"},
                                    {"data": "qty"},
                                    {"data": "cost"},
                                    {"data": "edit"}
                                ], columnDefs: [
                                    {className: 'text-right', targets: [2, 3]}
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
                                    var total2 = api
                                            .column(2)
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    var total3 = api
                                            .column(3)
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    // Total over this page
                                    var pageTotal2 = api
                                            .column(2, {page: 'current'})
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    var pageTotal3 = api
                                            .column(3, {page: 'current'})
                                            .data()
                                            .reduce(function (a, b) {
                                                return intVal(a) + intVal(b);
                                            }, 0);
                                    // Update footer
                                    $(api.column(2).footer()).html(
                                            '' + pageTotal2 + '<br>(' + total2 + ')'
                                            );
                                    $(api.column(3).footer()).html(
                                            '' + pageTotal3 + '<br>(' + total3 + ')'
                                            );
                                }
                            });
                            //$('#checkall_table').DataTable().ajax.reload();
                            $('#pwt form')[0].reset();
                            $('#camp6').val($('#camp').val());
                            $('.modal-backdrop').remove();
                        }
                    });
                } else {
                    $('#pwt').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.action_add', function (e) {
                $('#snackbar1').show();
                e.preventDefault();
                var rid = $("#rid").val();
                var bal_qty = $("#bal_qty1").val();
                var dist_qty = $("#dist_qty1").val();
                var place_dist = $("#place_dist1").val();
                var dist_date = $("#dist_date").val();
                var pd_remarks = $("#pd_remarks1").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'SDo_update?action=Update&bal_qty=' + bal_qty + '&dist_qty=' + dist_qty + '&place_dist=' + place_dist + '&pd_remarks=' + pd_remarks + '&dist_date=' + dist_date,
                        method: "POST",
                        data: {"action": "Update", "rid": rid},
                        success: function (data) {
                            alert("Updated Succesfully");
                            $('.modal-backdrop').remove();
                        }
                    });
                } else {
                    $('#action').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.special_edit_submit', function (e) {
                var rid = $(this).attr('rid');
                $('#snackbar1').show();
                e.preventDefault();
                var rid = $("#rid").val();
                var type = $("#type4").val();
                var qty = $("#qty4").val();
                var cost = $("#cost4").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'SDo_updatespecial?action=Update&type=' + type + '&qty=' + qty + '&cost=' + cost,
                        method: "POST",
                        data: {"action": "Update", "rid": rid},
                        success: function (data) {
                            alert("Special Bible Request Updated Successfully");
                            $('#special_edit_submit').show();
                            $('#special_table').DataTable().ajax.reload();
                            $('.modal-backdrop').remove();
                        }
                    });
                } else {
                    $('#editspecial').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.pwt_edit_submit', function (e) {
                var rid = $(this).attr('rid');
                //  alert(rid);
                $('#snackbar1').show();
                e.preventDefault();
                var rid = $("#rid").val();
                var language = $("#language_edit").val();
                var qty = $("#qty_edit").val();
                var color = $("#color_edit").val();
                var cost = $("#pwt_cost_edit").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'SDo_updatepwt?action=Update&language=' + language + '&qty=' + qty + '&color=' + color + '&cost=' + cost,
                        method: "POST",
                        data: {"action": "Update", "rid": rid},
                        success: function (data) {
                            alert(" PWT Request Updated Successfully");
                            $('#pwt_edit_submit').show();
                            $('#pwt_table').DataTable().ajax.reload();
                            $('.modal-backdrop').remove();

                        }
                    });
                } else {
                    $('#edit_pwt').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(document).on('click', '.action2_add', function (e) {
                var rid = $("#rid").val();
                $('#snackbar1').show();
                e.preventDefault();
                var rid = $("#rid").val();
                var type = $("#type2").val();
                var language = $("#language2").val();
                var color = $("#color2").val();
                var qty = $("#qty2").val();
                var name = $("#name2").val();
                var addr1 = $("#addr12").val();
                var addr2 = $("#addr22").val();
                var state = $("#state2").val();
                var mobile = $("#mobile2").val();
                var city = $("#city2").val();
                var pincode = $("#pincode2").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'SDo_update2?action=Update&language=' + language + '&type=' + type + '&qty=' + qty + '&color=' + color + '&name=' + name + '&addr1=' + addr1 + '&mobile=' + mobile + '&state=' + state + '&addr2=' + addr2 + '&city=' + city + '&pincode=' + pincode,
                        method: "POST",
                        data: {"action": "Update", "rid": rid},
                        success: function (data) {
                            alert("Updated Successfully");
                            $('#action2_add').show();
                            $('#requested').DataTable().ajax.reload();
                            //$('#checkall_table').DataTable().ajax.reload();
                            $('.modal-backdrop').remove();
                        }
                    });
                } else {
                    $('#action2').modal('show');
                    return false;
                }
            });
        </script>
        <script>
            $(function () {
                $("#qty1, #dist_qty1").on("keydown keyup", sum);
                function sum() {
                    $("#bal_qty1").val(Number($("#qty1").val()) - Number($("#dist_qty1").val()));
                }
            });
        </script>

        <script>
            $(function () {
                $('#camp77').change(function () {
                    $('#camp4').val($(this).val());
                    $('#camp5').val($(this).val());
                    $('#camp6').val($(this).val());
                    $('#camp9').val($(this).val());
                    $('#camp_head_cnt').html('');
                    $('#goal').html('');
                    $('#received').html('');
                    $('#used').html('');
                    $('#balance').html('');
                    $('#cp').html('');
                    $('#csdc').html('');
                    $('#sp').html('');
                    $('#spc').html('');
                    $('#rd').html('');
                    $('#ad').html('');
                    $('#selected_camp').html('');
                    var camp = $("#camp77").val();
                    $.ajax({
                        url: 'SDo_goalQuery?camp=' + camp,
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            $('#camp_head_cnt').html(data.camp_head_cnt);
                            $('#goal').html(data.goal);
                            $('#received').html(data.received);
                            $('#used').html(data.used);
                            $('#balance').html(data.camp_stock);
                            $('#cp').html(data.cp);
                            $('#csdc').html(data.csdc);
                            $('#sp').html(data.sp);
                            $('#spc').html(data.spc);
                            $('#rd').html(data.rd);
                            $('#selected_camp').html(camp);
                        }
                    });
                });
            });
        </script>
        <script>
            $(function () {
                $('#camp').change(function () {
                    $('#camp4').val($(this).val());
                    $('#camp5').val($(this).val());
                    $('#camp6').val($(this).val());
                    $('#camp9').val($(this).val());
                    $('#sa_no').html('');
                    $('#region').html('');
                    $('#sd_goal').html('');
                    $('#sd_actual').html('');
                    $('#sd_per').html('');
                    $('#Gideon_PWT_Goal').html('');
                    $('#Gideon_PWT_Actual').html('');
                    $('#PWT_Gideon_per').html('');
                    $('#Aux_SD_Goal').html('');
                    $('#Aux_SD_actual').html('');
                    $('#aux_sd_per').html('');
                    $('#Memberships_Gid_Op_Bal').html('');
                    $('#selected_camp').html('');
                    var camp = $("#camp").val();
                    $.ajax({
                        url: 'CampDashboard2023?camp=' + camp,
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            $('#sa_no').html(data.sa_no);
                            $('#region').html(data.region);
                            $('#area').html(data.area);

                            $('#Camp_President').html(data.Camp_President);
                            $('#Camp_Vice_President').html(data.Camp_Vice_President);
                            $('#Camp_Secretary').html(data.Camp_Secretary);
                            $('#Camp_Treasurer').html(data.Camp_Treasurer);
                            $('#Camp_Chaplain').html(data.Camp_Chaplain);
                            $('#Camp_Aux_President').html(data.Camp_Aux_President);
                            $('#Camp_Aux_Secretary').html(data.Camp_Aux_Secretary);
                            $('#Camp_Aux_Chaplain').html(data.Camp_Aux_Chaplain);

                            $('#sd_goal').html(data.sd_goal);
                            $('#sd_actual').html(data.sd_actual);
                            $('#sd_per').html(data.sd_per);

                            $('#Aux_SD_Goal').html(data.Aux_SD_Goal);
                            $('#Aux_SD_actual').html(data.Aux_SD_actual);
                            $('#aux_sd_per').html(data.aux_sd_per);

                            $('#Gideon_PWT_Goal').html(data.Gideon_PWT_Goal);
                            $('#Gideon_PWT_Actual').html(data.Gideon_PWT_Actual);
                            $('#PWT_Gideon_per').html(data.PWT_Gideon_per);

                            $('#aux_pwt_goal').html(data.aux_pwt_goal);
                            $('#aux_pwt_actual').html(data.aux_pwt_actual);
                            $('#aux_pwt_per').html(data.aux_pwt_per);

                            $('#Memberships_Gid_Op_Bal').html(data.Memberships_Gid_Op_Bal);
                            $('#Gideon_Renewed').html(data.Gideon_Renewed);
                            $('#Gideon_ytr').html(data.Gideon_ytr);
                            $('#gid_renewal_per').html(data.gid_renewal_per);

                            $('#Memberships_Aux_Op_Bal').html(data.Memberships_Aux_Op_Bal);
                            $('#Aux_Renewed').html(data.Aux_Renewed);
                            $('#Aux_ytr').html(data.Aux_ytr);
                            $('#Aux_Renewal_per').html(data.Aux_Renewal_per);

                            $('#renewal_goal_total').html(data.renewal_goal_total);
                            $('#renewal_achieved_total').html(data.renewal_achieved_total);
                            $('#renewal_total_ytr').html(data.renewal_total_ytr);

                            $('#gideon_life').html(data.gideon_life);
                            $('#gideon_annual').html(data.gideon_annual);
                            $('#Total_Gideon').html(data.Total_Gideon);
                            $('#total_life').html(data.total_life);

                            $('#aux_life').html(data.aux_life);
                            $('#aux_annual').html(data.aux_annual);
                            $('#Total_Auxiliary').html(data.Total_Auxiliary);
                            $('#total_annual').html(data.total_annual);

                            $('#total_memberships').html(data.total_memberships);

                            $('#g_nm_psu').html(data.g_nm_psu);
                            $('#g_nm_amd').html(data.g_nm_amd);
                            $('#g_nm_f').html(data.g_nm_f);
                            $('#g_nm').html(data.g_nm);

                            $('#a_nm_psu').html(data.a_nm_psu);
                            $('#a_nm_amd').html(data.a_nm_amd);
                            $('#a_nm_f').html(data.a_nm_f);
                            $('#a_nm').html(data.a_nm);

                            $('#selected_camp').html(camp);

                            $('#total_sf_goal').html(data.total_sf_goal);
                            $('#total_sf_actual').html(data.total_sf_actual);
                            $('#sf_per').html(data.sf_per);

                            $('#cp_goal').html(data.cp_goal);
                            $('#cp_actual').html(data.cp_actual);
                            $('#cp_per').html(data.cp_per);

                            $('#cro_goal').html(data.cro_goal);
                            $('#cro_actual').html(data.cro_actual);
                            $('#cro_per').html(data.cro_per);

                            $('#gcbp_goal').html(data.gcbp_goal);
                            $('#gcbp_actual').html(data.gcbp_actual);
                            $('#gcbp_per').html(data.gcbp_per);

                            $('#pab_goal').html(data.pab_goal);
                            $('#pab_actual').html(data.pab_actual);
                            $('#pab_per').html(data.pab_per);

                            $('#ffr_goal').html(data.ffr_goal);
                            $('#ffr_actual').html(data.ffr_actual);
                            $('#ffr_per').html(data.ffr_per);

                            $('#ffg_goal').html(data.ffg_goal);
                            $('#ffg_actual').html(data.ffg_actual);
                            $('#ffg_per').html(data.ffg_per);

                            $('#cd100_actual').html(data.cd100_actual);
                            $('#splo_actual').html(data.splo_actual);
                            $('#ffo_actual').html(data.ffo_actual);

                            $('#ncc_actual').html(data.ncc_actual);
                            $('#scc_actual').html(data.scc_actual);

                            $('#aux_sf_goal').html(data.aux_sf_goal);
                            $('#aux_sf_actual').html(data.aux_sf_actual);
                            $('#aux_sf_per').html(data.aux_sf_per);

                            $('#ffa_goal').html(data.ffa_goal);
                            $('#ffa_actual').html(data.ffa_actual);
                            $('#ffa_per').html(data.ffa_per);

                            $('#aux_luncheon').html(data.aux_luncheon);
                            $('#aux_heart_fund').html(data.aux_heart_fund);

//                            var table;
//                            table = $('#requested').DataTable({
//                                destroy: true,
//                                responsive: true,
//                                stateSave: true,
//                                "ordering": true,
//                                'processing': true,
//                                'language': {
//                                    'loadingRecords': '&nbsp;',
//                                    'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
//                                },
//                                dom: 'Bfrtip',
//                                buttons: [
//                                    'pageLength'
//                                ],
//                                lengthMenu: [
//                                    [10, 25, -1],
//                                    ['10 rows', '25 rows', 'Show all']
//                                ],
//                                ajax: {
//                                    method: "POST",
//                                    url: "SD_Demands_List_2022_23?camp=" + $('#camp').val() + "&username=" + $('#useraccessname').val(),
//                                    dataSrc: "datas"
//                                },
//                                columns: [
//                                    {"data": "type"},
//                                    {"data": "language"},
//                                    {"data": "color"},
//                                    {"data": "requested_qty"},
//                                    {"data": "rstatus"},
//                                    {"data": "requested_name"},
//                                    {"data": "mode"},
//                                    {"data": "requested_on"},
//                                    {"data": "sd_fwd_on"},
//                                    {"data": "approved_on"},
//                                    {"data": "release_processed_on"},
//                                    {"data": "cou_date_time"},
//                                    {"data": "lr_updated_on"},
//                                    {"data": "lrno"},
//                                    {"data": "transporter"},
//                                    {"data": "confirmed_on"},
//                                    {"data": "confirmed_by"}
//                                ], columnDefs: [
//                                    {className: 'text-right', targets: [3]}
//                                ],
//                                "createdRow": function (row, data, dataIndex) {
//                                    $(row).css('background-color', '#EAFAF1');
//                                },
//                                "footerCallback": function (row, data, start, end, display) {
//                                    var api = this.api(), data;
//                                    // Remove the formatting to get integer data for summation
//                                    var intVal = function (i) {
//                                        return typeof i === 'string' ?
//                                                i.replace(/[\$,]/g, '') * 1 :
//                                                typeof i === 'number' ?
//                                                i : 0;
//                                    };
//                                    // Total over all pages
//                                    total4 = api
//                                            .column(3)
//                                            .data()
//                                            .reduce(function (a, b) {
//                                                return intVal(a) + intVal(b);
//                                            }, 0);
//                                    // Total over this page
//                                    pageTotal4 = api
//                                            .column(3, {page: 'current'})
//                                            .data()
//                                            .reduce(function (a, b) {
//                                                return intVal(a) + intVal(b);
//                                            }, 0);
//                                    // Update footer
//                                    $(api.column(3).footer()).html(
//                                            '' + pageTotal4 + '<br>(' + total4 + ')'
//                                            );
//                                }
//                            });
                        }
                    });
                });
            });
        </script>

        <script>
            $(document).on('click', '.editrow_special', function () {
                var rid = $(this).attr('rid');
                $("#type4").val('');
                $("#rid").val('');
                $("#qty4").val('');
                $("#cost4").val('');
                $.ajax({
                    url: 'SDo_edit_special?action=Edit&rid=' + rid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#type4").val(data.type);
                        $("#qty4").val(data.qty);
                        $("#rid").val(data.rid);
                        $("#cost4").val(data.amount);
                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.editrow_pwt', function () {
                var rid = $(this).attr('rid');
                $("#res_pwt").show();
                $("#language_edit").val('');
                $("#rid").val('');
                $("#qty_edit").val('');
                $("#color_edit").val('');
                $("#pwt_cost_edit").val('');
                $.ajax({
                    url: 'SDo_edit_pwt?action=Edit&rid=' + rid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#snackbar1").hide();
                        $("#res1").show();
                        $("#language_edit").val(data.language);
                        $("#rid").val(data.rid);
                        $("#qty_edit").val(data.qty);
                        $("#color_edit").val(data.color);
                        $("#pwt_cost_edit").val(data.cost);

                    }

                });
            });
        </script>

        <script>
            $(document).on('click', '.editRow2', function () {
                var rid = $(this).attr('rid');
                $("#type2").val('');
                $("#language2").val('');
                $("#color2").val('');
                $("#qty2").val('');
                $("#name2").val('');
                $("#mobile2").val('');
                $("#addr12").val('');
                $("#addr22").val('');
                $("#city2").val('');
                $("#state2").val('');
                $("#pincode2").val('');
                $("#scrip_remarks2").val('');
                $("#res").hide();
                $("#snackbar1").show();
                $("#snackbar1").html('<p style="width:100%; padding-top:20px; padding-bottom:20px; font-size:14px; height:60px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                $.ajax({
                    url: 'SDo_editnew?action=Edit&rid=' + rid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $('#rid').val(data.rid);
                        $('#type2').val(data.type);
                        $("#language2").val(data.language);
                        $("#color2").val(data.color);
                        $("#qty2").val(data.qty);
                        $("#name2").val(data.name);
                        $("#mobile2").val(data.mobile);
                        $("#addr12").val(data.addr1);
                        $("#addr22").val(data.addr2);
                        $("#city2").val(data.city);
                        $("#state2").val(data.state);
                        $("#pincode2").val(data.pincode);
                        $("#scrip_remarks2").val(data.scrip_remarks);
                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.editRow1', function () {
                var rid = $(this).attr('rid');
                $("#rid").val('');
                $("#type1").val('');
                $("#language1").val('');
                $("#color1").val('');
                $("#qty1").val('');
                $("#dist_qty1").val('');
                $("#bal_qty1").val('');
                $("#dist_date").val('');
                $("#pd_remarks1").val('');
                $("#scrip_remarks1").val('');
                $("#place_dist1").val('');
                $("#res1").hide();
                $("#snackbar1").show();
                $("#snackbar1").html('<p style="width:100%; padding-top:20px; padding-bottom:20px; font-size:14px; height:60px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                $.ajax({
                    url: 'SDo_edit?action=Edit&rid=' + rid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#snackbar1").hide();
                        $("#res1").show();
                        $("#editRow1").show();
                        $('#type1').val(data.type);
                        $("#language1").val(data.language);
                        $("#color1").val(data.color);
                        $("#qty1").val(data.bal_qty);
                        $("#rid").val(data.rid);
                        $('#current_stock').DataTable().ajax.reload();
                    }
                });
            });
        </script>

        <script type="text/javascript">
            $(function () {
                $("#chkPassport").click(function () {
                    if ($(this).is(":checked")) {
                        document.getElementById("remittance1").hidden = false;
                        document.getElementById("pay").hidden = true;
                    } else {
                        document.getElementById("remittance1").hidden = true;
                        document.getElementById("pay").hidden = false;
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $("#fancy-checkbox-info").click(function () {
                    if ($(this).is(":checked")) {
                        document.getElementById("provide").hidden = false;
                        document.getElementById("openTabContainer").hidden = true;
                        document.getElementById("reason_table").hidden = true;
                    } else {
                        document.getElementById("reason").hidden = false;
                        document.getElementById("openTabContainer").hidden = true;
                        document.getElementById("reason_table").hidden = true;
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $("#fancy-checkbox-danger").click(function () {
                    if ($(this).is(":checked")) {
                        document.getElementById("openTabContainer").hidden = false;
                        document.getElementById("reason").hidden = true;
                        document.getElementById("fancy-checkbox-info").hidden = false;
                    } else {
                        document.getElementById("reason").hidden = false;
                        document.getElementById("openTabContainer").hidden = true;
                        document.getElementById("provide").hidden = true;
                    }
                });
            });
        </script>
        <script>
            $("#qtypwt").on("keydown keyup", function () {
                var pwt_cost = 0;
                var pwtfee = "15";
                var qty = document.getElementById("qtypwt").value;
                var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);
                pwt_cost = parseInt(Vqty) * parseInt(pwtfee);
                var v_pwt_cost = isNaN(parseInt(pwt_cost)) ? 0 : parseInt(pwt_cost);
                document.getElementById("pwt_cost").value = v_pwt_cost;
            });
        </script>
        <script>
            $("#language_edit").on("keydown keyup", function () {
                var pwt_cost_edit = 0;
                var pwtfee = "15";
                var qty = document.getElementById("qty_edit").value;
                var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);
                pwt_cost_edit = parseInt(Vqty) * parseInt(pwtfee);
                var v_pwt_cost = isNaN(parseInt(pwt_cost_edit)) ? 0 : parseInt(pwt_cost_edit);
                document.getElementById("pwt_cost_edit").value = v_pwt_cost;
            });
        </script>
        <script>
            $("#qty_edit").on("keydown keyup", function () {
                var pwt_cost_edit = 0;
                var pwtfee = "15";
                var qty = document.getElementById("qty_edit").value;
                var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);
                pwt_cost_edit = parseInt(Vqty) * parseInt(pwtfee);
                var v_pwt_cost = isNaN(parseInt(pwt_cost_edit)) ? 0 : parseInt(pwt_cost_edit);
                document.getElementById("pwt_cost_edit").value = v_pwt_cost;
            });
        </script>
        <script>
            $("#type4, #qty4").on("change", function () {
                var cost4 = 0;
                var ID = 600;
                var IntD = 1200;
                var LB = 50;
                var Slim = 250;
                var PWB = 100;
                var qty = document.getElementById("qty4").value;

                var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);

                if (document.getElementById("type4").value === "Indian Dignitary") {
                    cost4 = parseInt(Vqty) * parseInt(ID);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("cost4").value = v_special_cost;

                } else if (document.getElementById("type4").value === "International Dignitary") {
                    cost4 = parseInt(Vqty) * parseInt(IntD);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("cost4").value = v_special_cost;

                } else if (document.getElementById("type4").value === "Leather Bond PWT") {
                    cost4 = parseInt(Vqty) * parseInt(LB);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("cost4").value = v_special_cost;

                } else if (document.getElementById("type4").value === "PWB Holy Bible") {
                    cost4 = parseInt(Vqty) * parseInt(PWB);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("cost4").value = v_special_cost;

                } else {
                    cost4 = parseInt(Vqty) * parseInt(Slim);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("cost4").value = v_special_cost;
                }
            });
        </script>
        <script>
            $("#typespl, #qtyspl").on("change", function () {
                var cost4 = 0;
                var ID = 600;
                var IntD = 1200;
                var LB = 50;
                var Slim = 250;
                var PWB = 100;
                var qtyspl = document.getElementById("qtyspl").value;

                var Vqty = isNaN(parseInt(qtyspl)) ? 0 : parseInt(qtyspl);

                if (document.getElementById("typespl").value === "Indian Dignitary") {
                    cost4 = parseInt(Vqty) * parseInt(ID);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("special_cost").value = v_special_cost;

                } else if (document.getElementById("typespl").value === "International Dignitary") {
                    cost4 = parseInt(Vqty) * parseInt(IntD);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("special_cost").value = v_special_cost;

                } else if (document.getElementById("typespl").value === "Leather Bond PWT") {
                    cost4 = parseInt(Vqty) * parseInt(LB);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("special_cost").value = v_special_cost;

                } else if (document.getElementById("typespl").value === "PWB Holy Bible") {
                    cost4 = parseInt(Vqty) * parseInt(PWB);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("special_cost").value = v_special_cost;

                } else {
                    cost4 = parseInt(Vqty) * parseInt(Slim);
                    var v_special_cost = isNaN(parseInt(cost4)) ? 0 : parseInt(cost4);
                    document.getElementById("special_cost").value = v_special_cost;
                }
            });
        </script>
        <script>
            $('#event_date_cal4').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });

            $('#event_date_cal5').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });

            $('#requested_on').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
            $("#requested_on").datepicker().datepicker("setDate", new Date());
        </script>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script> 
        <script>
            function Education() {
                if (document.getElementById("education").value === "Yes") {
                    document.getElementById("edu").hidden = false;
                    $("#reason_table").show();
                } else if (document.getElementById("education").value === "Not Sure about past stock") {
                    $("#reason_table").show();
                    document.getElementById("edu").hidden = true;
                    document.getElementById("edu1").value = "";
                } else if (document.getElementById("education").value === "No idea of Distribution") {
                    $("#reason_table").show();
                    document.getElementById("edu").hidden = true;
                    document.getElementById("edu1").value = "";
                } else if (document.getElementById("education").value === "Need more for upcoming Event") {
                    $("#reason_table").show();
                    document.getElementById("edu").hidden = true;
                    document.getElementById("edu1").value = "";
                } else if (document.getElementById("education").value === 0) {
                    $("#reason_table").hide();
                    document.getElementById("edu").hidden = true;
                    document.getElementById("edu1").value = "";
                } else {
                    $("#reason_table").hide();
                    document.getElementById("edu").hidden = true;
                    document.getElementById("edu1").value = "";
                }
            }

            function address() {
                var v_camp = $("#camp").val();
                var username = $("#username").val();
                $.ajax({
                    url: 'SDo_address',
                    method: "POST",
                    data: {"username": username, "camp": v_camp},
                    success: function (data) {
                        if (data === "NA") {
                            $("#scrip_name").val('');
                            $("#scrip_mobile").val('');
                            $("#scrip_addr1").val('');
                            $("#scrip_addr2").val('');
                            $("#scrip_state").val('');
                            $("#scrip_city").val('');
                            $("#scrip_pincode").val('');
                            $('#reason_table').hide();
                            $('#scrip_address').hide();
                        } else if (data === "Available") {
                            $('#reason_table').show();
                            $('#scrip_address').show();
                        }
                    }
                });
            }

            function address_pwt() {
                var v_camp = $("#camp").val();
                var username = $("#username").val();
                $.ajax({
                    url: 'SDo_address_pwt',
                    method: "POST",
                    data: {"username": username, "camp": v_camp},
                    success: function (data) {
                        if (data === "NA") {
                            $("#pwt_name").val('');
                            $("#pwt_mobile").val('');
                            $("#pwt_addr1").val('');
                            $("#pwt_addr2").val('');
                            $("#pwt_state").val('');
                            $("#pwt_city").val('');
                            $("#pwt_pincode").val('');
                            $('#pwt_address').hide();
                        } else if (data === "Available") {
                            $('#pwt_address').show();
                        }
                    }
                });
            }

            function address_special() {
                var v_camp = $("#camp").val();
                var username = $("#username").val();
                $.ajax({
                    url: 'SDo_address_special',
                    method: "POST",
                    data: {"username": username, "camp": v_camp},
                    success: function (data) {
                        if (data === "NA") {
                            $("#special_name").val('');
                            $("#special_mobile").val('');
                            $("#special_addr1").val('');
                            $("#special_addr2").val('');
                            $("#special_state").val('');
                            $("#special_city").val('');
                            $("#special_pincode").val('');
                            $('#special_address').hide();
                        } else if (data === "Available") {
                            $('#special_address').show();
                        }
                    }
                });
            }

            $("#pwt_name, #pwt_addr1, #pwt_addr2, #pwt_city, #pwt_requested_name, #pwt_requested_mid, #scrip_name, #scrip_addr1, #scrip_addr2, #scrip_city, #requested_name, #requested_mid, #special_name, #special_addr1, #special_addr2, #special_city, #spl_requested_name, #spl_requested_mid, #camp, #language, #scrip_remarks, #pwtlanguage, #contact_person, #trremarks").keypress(function (event) {
                var character = String.fromCharCode(event.keyCode);
                return isValid(character);
            });

            function isValid(str) {
                return !/[~`!@#$%\^&*()+=\-\[\]\\';,/{}|\\":<>\?]/g.test(str);
            }

            $(document).on('click', '.createRow', function () {
                var v_camp = $("#camp").val();
                v_camp = v_camp.trim();
                if (v_camp === null || v_camp === "") {
                    $('#new').modal('hide');
                    alert("Please enter Camp name");
                    $("#camp").focus();
                    return false;
                } else {
                    $('#new').modal('show');
                }
            });

            $(document).on('click', '.request', function () {
                var v_camp = $("#camp").val();
                v_camp = v_camp.trim();
                if (v_camp === null || v_camp === "") {
                    $('#pwt').modal('hide');
                    alert("Please enter Camp name");
                    $("#camp").focus();
                    return false;
                } else {
                    $('#pwt').modal('show');
                }
            });

            $(document).on('click', '.addSpecialBible', function () {
                var v_camp = $("#camp").val();
                v_camp = v_camp.trim();
                if (v_camp === null || v_camp === "") {
                    $('#specialadd').modal('hide');
                    alert("Please enter Camp name");
                    $("#camp").focus();
                    return false;
                } else {
                    $('#specialadd').modal('show');
                }
            });
        </script>

        <script type="text/javascript">
            $(document).on('click', '.inwardsInfo', function () {
                $(document).ready(function () {
                    var table = $('#CompleteReport').DataTable({
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
                            var total3 = api
                                    .column(3)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total4 = api
                                    .column(4)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total5 = api
                                    .column(5)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total6 = api
                                    .column(6)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total7 = api
                                    .column(7)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total8 = api
                                    .column(8)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total9 = api
                                    .column(9)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var total10 = api
                                    .column(10)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            // Total over this page
                            var pageTotal3 = api
                                    .column(3, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal4 = api
                                    .column(4, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal5 = api
                                    .column(5, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal6 = api
                                    .column(6, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal7 = api
                                    .column(7, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal8 = api
                                    .column(8, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal9 = api
                                    .column(9, {page: 'current'})
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                            var pageTotal10 = api
                                    .column(10, {page: 'current'})
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
                        }
                    });
                });
            });
        </script>
    </body>
</html>