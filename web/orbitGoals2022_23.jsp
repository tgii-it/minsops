<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="loadbaseinfo.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>2022_23 Orbit Goals..</title> 
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
    <body style="background-color: #fff; width: 100%;" >  
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 65px 0px;">
            <div class="container-fluid">
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                            <i class="fa fa-fw fa-share"></i>&nbsp; ORBIT GOALS : PY 2022 - 23
                        </h3>
                    </div>
                    <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                        <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%; font-size: 11px;">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr>
                                    <th style="text-align: center;" nowrap>Zone</th>
                                    <th nowrap>State_Association</th>
                                    <th style="text-align: center;" nowrap>Region</th>
                                    <th style="text-align: center;" nowrap>Area</th>
                                    <th style="text-align: left;" nowrap>Camp Name</th>
                                    <th style="text-align: left;" nowrap>Status</th>

                                    <th style="text-align: right;" nowrap>SD Goal</th>
                                    <th style="text-align: right;" nowrap>Aux SD Goal</th>
                                    <th style="text-align: right;" nowrap>Gideon PWT Goal</th>
                                    <th style="text-align: right;" nowrap>Aux PWT Goal</th>

                                    <th style="text-align: right;" nowrap>Gideon NM Goal</th>
                                    <th style="text-align: right;" nowrap>Aux NM Goal</th>
                                    <th style="text-align: right;" nowrap>Gideon Goal</th>
                                    <th style="text-align: right;" nowrap>Aux Goal</th>

                                    <th style="text-align: right;" nowrap>Total SF Goal</th>
                                    <th style="text-align: right;" nowrap>CRO NoC Goal</th>
                                    <th style="text-align: right;" nowrap>CRO Goal</th>
                                    <th style="text-align: right;" nowrap>FFR Goal</th>
                                    <th style="text-align: right;" nowrap>PAB Goal</th>
                                    <th style="text-align: right;" nowrap>GCBP Goal</th>
                                    <th style="text-align: right;" nowrap>FFG Goal</th>
                                    <th style="text-align: right;" nowrap>Aux SF Goal</th>
                                    <th style="text-align: right;" nowrap>FFA Goal</th>
                                </tr>
                            </thead>
                            <tbody id='mytab' class="table-search"> 
                                <%  String camp = "";
                                    String gideon_goal = "";
                                    String sd_goal = "";
                                    String region = "";
                                    String area = "";
                                    String zone = "";
                                    String total_sf_goal = "";
                                    String ffr_goal = "";
                                    String gideon_nm_goal = "";
                                    String pab_goal = "";
                                    String uStatus = "";
                                    String rstat = "";
                                    String uMid = "";
                                    String uRid = "";
                                    String cronoc_goal = "";
                                    String cro_goal = "";
                                    String gcbp_goal = "";
                                    String ffg_goal = "";
                                    String aux_sd_goal = "";
                                    String pwt_goal = "";
                                    String aux_nm_goal = "";
                                    String gideon_pwt_goal = "";
                                    String auxmember_goal = "";
                                    String ffa_goal = "";
                                    String auxiliary_sf_goal = "";
                                    String status = "";
                                    String query1 = "";
                                    sa_no = "";

                                    DataSource ds = null;
                                    Connection con = null;
                                    Context context = new InitialContext();
                                    Context envCtx = (Context) context.lookup("java:comp/env");
                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                    try {
                                        con = ds.getConnection();

                                        query1 = "select * from Goals_May31_Year_End_2022_23 order by zone,sa,region,area,camp";

                                        Statement st1 = con.createStatement();
                                        ResultSet rs1 = st1.executeQuery(query1);
                                        while (rs1.next()) {
                                            zone = rs1.getString("zone");
                                            sa_no = rs1.getString("state_asso");
                                            region = rs1.getString("region");
                                            area = rs1.getString("area");
                                            camp = rs1.getString("camp");
                                            status = rs1.getString("status");
                                            sd_goal = rs1.getString("sd_goal");
                                            aux_sd_goal = rs1.getString("aux_sd_goal");
                                            gideon_pwt_goal = rs1.getString("gideon_pwt_goal");
                                            pwt_goal = rs1.getString("pwt_goal");

                                            gideon_nm_goal = rs1.getString("gideon_nm_goal");
                                            aux_nm_goal = rs1.getString("aux_nm_goal");
                                            gideon_goal = rs1.getString("gideon_goal");
                                            auxmember_goal = rs1.getString("auxmember_goal");

                                            total_sf_goal = rs1.getString("total_sf_goal");
                                            cronoc_goal = rs1.getString("cronoc_goal");
                                            cro_goal = rs1.getString("cro_goal");
                                            ffr_goal = rs1.getString("ffr_goal");
                                            pab_goal = rs1.getString("pab_goal");
                                            gcbp_goal = rs1.getString("gcbp_goal");
                                            ffg_goal = rs1.getString("ffg_goal");
                                            auxiliary_sf_goal = rs1.getString("auxiliary_sf_goal");
                                            ffa_goal = rs1.getString("ffa_goal");

                                            if (sa_no == null) {
                                                sa_no = "";
                                            }

                                            if (region == null) {
                                                region = "";
                                            }

                                            if (area == null) {
                                                area = "";
                                            }

                                            if (camp == null) {
                                                camp = "";
                                            }

                                %> 
                                <!--<tr style='cursor: pointer;' title='Click here to Update' data-toggle="modal" data-target="#myModal" onclick="update('<%out.print(camp);%>', '<%out.print(camp);%>')">  -->
                                <tr>
                                    <td style="text-align: center;"><%=zone%></td>  
                                    <td nowrap><%=sa_no%></td>
                                    <td style="text-align: center;" nowrap>&nbsp;<%= region%></td>
                                    <td style="text-align: center;" nowrap><%= area%></td>
                                    <td nowrap><%= camp%></td>
                                    <td nowrap><%= status%></td>

                                    <td style="text-align: right; padding-right: 15px;"><%= sd_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= aux_sd_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= gideon_pwt_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= pwt_goal%></td>

                                    <td style="text-align: right; padding-right: 15px;"><%= gideon_nm_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= aux_nm_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= gideon_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= auxmember_goal%></td>

                                    <td style="text-align: right; padding-right: 15px;"><%= total_sf_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= cronoc_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= cro_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= ffr_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= pab_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= gcbp_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= ffg_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= auxiliary_sf_goal%></td>
                                    <td style="text-align: right; padding-right: 15px;"><%= ffa_goal%></td>
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
                            <tfoot style="background-color: #ffe114; color: #01354a; font-size: 11px; ">
                                <tr>
                                    <th colspan="6" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                    <th style="text-align: right;"></th>
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th>
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                    <th style="text-align: right;"></th> 
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </section>
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
                        // Total over this page
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
                        // Update footer
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