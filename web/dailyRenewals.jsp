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
        <title>TGII | Renewals Dashboard</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
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
    </head>
    <body style="background-color: #fff; width: 100%;">
        <%@ include file="menu.jsp" %>
        <section id="main" class="container" style="padding: 60px 0px;">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#gideon" style="font-size: 12px; font-weight: bold;">Gideon</a></li>
                <li><a data-toggle="tab" href="#aux" style="font-size: 12px; font-weight: bold;">Auxiliary</a></li>
            </ul>
            <div class="tab-content">
                <div id="gideon" class="tab-pane fade in active"> 
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; GIDEON RENEWALS
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="sacnt" class="table table-bordered table-responsive table-hover table-striped" style="width: 100%;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden>Sl_No</th>
                                        <th nowrap>State Association</th>
                                        <th style="text-align: center;" nowrap>OP_BAL</th>
                                        <th style="text-align: center;" nowrap>RENEWED</th>
                                        <th style="text-align: center;" nowrap>PER_%</th>
                                        <th style="text-align: center;" nowrap>Y T R</th>
                                        <!--<th style="text-align: center;" nowrap>TODAY</th>
                                        <th style="text-align: center;" nowrap>Y_DAY</th>
                                        <th style="text-align: center;" nowrap>Y2_DAY</th>
                                        <th style="text-align: center;" nowrap>Y3_DAY</th>
                                        <th style="text-align: center;" nowrap>Y4_DAY</th>
                                        <th style="text-align: center;" nowrap>Y5_DAY</th>
                                        <th style="text-align: center;" nowrap>Y6_DAY</th>
                                        <th style="text-align: center;" nowrap>Y7_DAY</th>-->
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%                                        String state_association = "";
                                        int slno_sa_o = 0;

                                        DataSource ds = null;
                                        Connection con = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            String sql = "select ROUND((GIDEON_RENEWALS/OP_BAL_GIDEON)*100)||' %' per,(OP_BAL_GIDEON-GIDEON_RENEWALS) YTR, a.* from V_Renewals_Dashboard a order by to_number(decode(TRIM(substr(state_association, 3, 2)), 'er', '15','(', '14',TRIM(substr(state_association, 3, 2)))) ASC";
                                            ResultSet resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                                state_association = resultSet.getString("state_association");
                                                slno_sa_o = slno_sa_o + 1;
                                                if (state_association.equalsIgnoreCase("Overall Total")) {
                                    %>
                                    <tr style="background-color: yellow; color:navy; font-weight: bold;">                                                    
                                        <%
                                        } else {
                                        %>
                                    <tr>
                                        <%
                                            }
                                        %>
                                        <td style="text-align:center;" hidden><%= slno_sa_o%></td>
                                        <td style="font-weight: bold;" nowrap><%= resultSet.getString("state_association")%></td>
                                        <td style="text-align: center; font-weight: bold; color: black" nowrap><%= resultSet.getString("OP_BAL_GIDEON")%></td>
                                        <td style="text-align: center; font-weight: bold; color:navy;" nowrap><%=resultSet.getString("GIDEON_RENEWALS")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("PER")%></td>
                                        <td style="text-align: center; font-weight: bold; color: brown" nowrap><%=resultSet.getString("YTR")%></td>
                                        <!--<td style="text-align: center;" nowrap><%=resultSet.getString("TODAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("YESTERDAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y2_DAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y3_DAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y4_DAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y5_DAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y6_DAY_GIDEON")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y7_DAY_GIDEON")%></td>-->
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>  
                <div id="aux" class="tab-pane fade"> 
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; AUXILIARY RENEWALS
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="auxiliary" class="table table-bordered table-responsive table-hover table-striped" style="width: 100%;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden>Sl_No</th>
                                        <th nowrap>State Association</th>
                                        <th style="text-align: center;" nowrap>OP_BAL</th>
                                        <th style="text-align: center;" nowrap>RENEWED</th>
                                        <th style="text-align: center;" nowrap>PER_%</th>
                                        <th style="text-align: center;" nowrap>Y T R</th>
                                        <!--<th style="text-align: center;" nowrap>TODAY</th>
                                        <th style="text-align: center;" nowrap>Y_DAY</th>
                                        <th style="text-align: center;" nowrap>Y2_DAY</th>
                                        <th style="text-align: center;" nowrap>Y3_DAY</th>
                                        <th style="text-align: center;" nowrap>Y4_DAY</th>
                                        <th style="text-align: center;" nowrap>Y5_DAY</th>
                                        <th style="text-align: center;" nowrap>Y6_DAY</th>
                                        <th style="text-align: center;" nowrap>Y7_DAY</th>-->
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        state_association = "";
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            String sql = "select ROUND((AUXILIARY_RENEWALS/OP_BAL_AUXILIARY)*100)||' %' per,(OP_BAL_AUXILIARY-AUXILIARY_RENEWALS) YTR, a.* from V_Renewals_Dashboard a order by to_number(decode(TRIM(substr(state_association, 3, 2)), 'er', '15','(', '14',TRIM(substr(state_association, 3, 2)))) ASC";
                                            ResultSet resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                                state_association = resultSet.getString("state_association");
                                                slno_sa_o = slno_sa_o + 1;
                                                if (state_association.equalsIgnoreCase("Overall Total")) {
                                    %>
                                    <tr style="background-color: yellow; color:navy; font-weight: bold;">                                                    
                                        <%
                                        } else {
                                        %>
                                    <tr>
                                        <%
                                            }
                                        %>
                                        <td style="text-align:center;" hidden><%= slno_sa_o%></td>
                                        <td style="font-weight: bold;" nowrap><%= resultSet.getString("state_association")%></td>
                                        <td style="text-align: center; font-weight: bold; color:black;" nowrap><%= resultSet.getString("OP_BAL_AUXILIARY")%></td>
                                        <td style="text-align: center; font-weight: bold; color:navy;" nowrap><%=resultSet.getString("AUXILIARY_RENEWALS")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("PER")%></td>
                                        <td style="text-align: center; font-weight: bold; color: brown" nowrap><%=resultSet.getString("YTR")%></td>
                                        <!--<td style="text-align: center;" nowrap><%=resultSet.getString("TODAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("YESTERDAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y2_DAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y3_DAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y4_DAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y5_DAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y6_DAY_AUXILIARY")%></td>
                                        <td style="text-align: center;" nowrap><%=resultSet.getString("Y7_DAY_AUXILIARY")%></td>-->
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>  
            </div>
        </section>
        <br>
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
        <script type="text/javascript">
            $(document).ready(function () {
            var table = $('#gideon, #auxiliary).DataTable({
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    lengthMenu: [
                    [20, 50, - 1],
                    ['20 rows', '50 rows', 'Show all']
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
        </script> 
    </body>
</html>