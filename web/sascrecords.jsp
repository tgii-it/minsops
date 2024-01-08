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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | State Convention Registrations</title>
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
        <%@ include file="menu.jsp" %>
        <section id="main" class="container-fluid" style="padding: 60px 0px;">
            <ul class="nav nav-tabs">
                <li class="dropdown active"><a href="#" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">SC 2021</a></li> 
            </ul>
            <div class="tab-content">
                <div id="2021Rs_list" class="tab-pane fade in active"> 
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp;State Convention Registrations
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="2021" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: center;" hidden></th>
                                        <th style="text-align: center;" nowrap>RID</th>
                                        <th style="text-align: center;" nowrap>SA</th>
                                        <th nowrap>CAMP</th>
                                        <th nowrap>ATTENDING_PEOPLE</th>
                                        <th style="text-align: center;" nowrap>FAMILY_MEMBERS</th>
                                        <th style="text-align: center;" nowrap>PAB_GUEST</th>
                                        <th style="text-align: center;" nowrap>OUTING_HEAD_COUNT</th>
                                        <th style="text-align: center;" nowrap>HEAD_COUNT</th>
                                        <th style="text-align: center;" nowrap>REG_FEE</th>
                                        <th style="text-align: center;" nowrap>HOTEL_ADV</th> 
                                        <th style="text-align: center;" nowrap>OUTING_FEE</th>  
                                        <th style="text-align: center;" nowrap>OVERALL_AMOUNT</th>
                                        <th nowrap>CHURCH_AFFILIATION</th>
                                        <th nowrap>FOOD</th>
                                        <th nowrap>CHURCH_PRESENTATION</th>
                                        <th nowrap>ARRIVAL</th>
                                        <th nowrap>ACCOMMODATION</th>
                                        <th nowrap>PAYMENT_METHOD</th>  
                                        <th nowrap>TRANSACTION_DETAILS</th>
                                        <th nowrap>SUBMITTED_ON</th>
                                        <th nowrap>RECORD_STATUS</th>
                                        <th nowrap>REMARKS, IF ANY</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        String remarks = "";
                                        String status = "";
                                        String trinfo = "";

                                        String paymethod = "";
                                        String overall_amount = "";
                                        String outingfee = "";
                                        String hoteladvance = "";
                                        String total_amount = "";
                                        String total_count = "";
                                        String accommodation = "";
                                        String arrival = "";
                                        String cp = "";

                                        String food = "";
                                        String church_aff = "";
                                        String outingno = "";
                                        String outing = "";
                                        String pab = "";
                                        String fm = "";
                                        String attending_people = "";
                                        String camp = "";

                                        String sa = "";
                                        String rid = "";
                                        String submitted_on = "";

                                        DataSource ds = null;
                                        Connection con = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            String query1 = "select * from V_STATE_CONVENTIONS_2021_TR_INFO1 where length(rid) >6 order by rid";

                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery(query1);
                                            while (rs1.next()) {
                                                rid = rs1.getString("rid");
                                                sa = rs1.getString("sa");
                                                camp = rs1.getString("camp");
                                                attending_people = rs1.getString("attending_people");
                                                fm = rs1.getString("fm");
                                                pab = rs1.getString("pab");
                                                outing = rs1.getString("outing");
                                                outingno = rs1.getString("outingno");

                                                church_aff = rs1.getString("church_aff");
                                                food = rs1.getString("food");

                                                cp = rs1.getString("cp");
                                                arrival = rs1.getString("arrival");
                                                accommodation = rs1.getString("accommodation");
                                                total_count = rs1.getString("total_count");
                                                total_amount = rs1.getString("total_amount");
                                                hoteladvance = rs1.getString("hoteladvance");
                                                outingfee = rs1.getString("outingfee");
                                                outingno = rs1.getString("outingno");
                                                overall_amount = rs1.getString("overall_amount");
                                                paymethod = rs1.getString("paymethod");
                                                trinfo = rs1.getString("trinfo");

                                                submitted_on = rs1.getString("submitted_on");
                                                status = rs1.getString("status");
                                                remarks = rs1.getString("remarks");

                                                if (camp == null) {
                                                    camp = "";
                                                }
                                                if (total_amount == null) {
                                                    total_amount = "0";
                                                }
                                                if (trinfo == null || trinfo == "null") {
                                                    trinfo = "NA";
                                                }
                                                if (remarks == null || trinfo == "null") {
                                                    remarks = "--";
                                                }

                                                if (status.equalsIgnoreCase("Processed")) {
                                    %>
                                    <tr style="background-color: greenyellow;">
                                        <%
                                        } else {
                                        %>
                                    <tr>
                                        <%
                                            }
                                        %>
                                        <td  hidden>&nbsp;</td> 
                                        <td nowrap ><%= rid%></td> 
                                        <td style="text-align: center;" nowrap><%= sa%></td>                                         
                                        <td nowrap><%= camp%></td> 
                                        <td nowrap><%= attending_people%></td> 
                                        <td style="text-align: center;" nowrap><%= fm%></td> 
                                        <td style="text-align: center;" nowrap><%= pab%></td> 
                                        <td style="text-align: center;" nowrap><%= outingno%></td> 
                                        <td style="text-align: center;" nowrap><%= total_count%></td>
                                        <td style="text-align: center;" nowrap><%= total_amount%></td> 
                                        <td style="text-align: center;" nowrap><%= hoteladvance%></td> 
                                        <td style="text-align: center;" nowrap><%= outingfee%></td>
                                        <td style="text-align: center;" nowrap><%= overall_amount%></td> 
                                        <td nowrap><%= church_aff%></td> 
                                        <td nowrap><%= food%></td>
                                        <td nowrap><%= cp%></td>
                                        <td nowrap><%= arrival%></td> 
                                        <td nowrap><%= accommodation%></td> 
                                        <td nowrap><%= paymethod%></td> 
                                        <td nowrap><%= trinfo%></td>   
                                        <td nowrap><%= submitted_on%></td> 
                                        <td nowrap><%= status%></td> 
                                        <td nowrap><%= remarks%></td> 
                                    </tr>
                                    <%
                                            }
                                            rs1.close();
                                            st1.close();
                                            con.close();
                                        } catch (Exception e1) {
                                        }
                                    %>  
                                </tbody>
                            </table>
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
                var printCounter = 0;
                // Append a caption to the table before the DataTables initialisation
                // $('#gideon').append('<caption style="caption-side: top">The Gideons International in India</caption>');
                // DataTable
                $('#2021 thead tr').clone(true).appendTo('#2021 thead');
                $('#2021 thead tr:eq(1) th').each(function (i) {
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

                var table = $('#2021').DataTable({
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
        </script> 
    </body>
</html>