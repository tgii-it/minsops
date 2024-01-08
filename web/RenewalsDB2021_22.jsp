<%@page import="java.util.Date"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String useraccessname = "";
    String camp = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else if (OBJ.equals("Deepika") || OBJ.equals("Anbalagan") || OBJ.equals("Mr Sam Varghese") || OBJ.equals("Sunitha")) {
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
    } else if (OBJ.equals("Benjamin")) {
        response.sendRedirect("PendingRenewals.jsp");
    } else if (OBJ.equals("Ann")) {
        response.sendRedirect("je.jsp");
    } else if (OBJ.equals("Sucharitha")) {
        response.sendRedirect("designationUpdate.jsp");
    } else if (OBJ.equals("Ambica")) {
        response.sendRedirect("designationUpdate.jsp");
    } else {
        System.out.println(session.getAttribute("useraccessname").toString() + " tried to login in YTR Report");
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | RENEWALS DASHBOARD</title>
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
        <section id="main" class="container-fluid" style="padding: 60px 0px;">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#sa_wise_cnt" style="font-size: 12px; font-weight: bold;">SA wise Count</a></li>
                <li><a data-toggle="tab" href="#gid_list" style="font-size: 12px; font-weight: bold;">Gideon List</a></li>
                <li><a data-toggle="tab" href="#aux_list" style="font-size: 12px; font-weight: bold;">Auxiliary List</a></li>
            </ul>
            <div class="tab-content">
                <div id="sa_wise_cnt" class="tab-pane fade in active"> 
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <%  Date dNow = new Date();
                                    SimpleDateFormat ft
                                            = new SimpleDateFormat("dd/MM/yyyy");%>
                                <i class="fa fa-fw fa-share"></i>&nbsp; 2021_22 RENEWALS DASHBOARD (INCLUDING DEFERRED PAYMENTS)
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="sacnt" class="table table-bordered table-responsive table-hover table-striped" style="width: 100%;">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th colspan="9" style="background-color:#F2FAD8; color: navy; font-weight: bold; text-align: center; letter-spacing: 2px;">GIDEON RENEWALS</th>
                                        <th colspan="9" style="background-color:#ffe9ec; color: navy; font-weight: bold; text-align: center; letter-spacing: 2px;">AUXILIARY RENEWALS</th>
                                    </tr>
                                    <tr>
                                        <th hidden>Sl_No</th>
                                        <th nowrap>STATES</th>
                                        <th nowrap>Op_Bal</th>
                                        <th nowrap>Inwards</th>
                                        <th nowrap>Instant</th>
                                        <th nowrap>Direct</th>
                                        <th nowrap>EMI</th>
                                        <th nowrap>Renewed</th>
                                        <th nowrap>%</th>
                                        <th nowrap>YTR</th>
                                        <th nowrap>STATES</th>
                                        <th nowrap>Op_Bal</th>
                                        <th nowrap>Inwards</th>
                                        <th nowrap>Instant</th>
                                        <th nowrap>Direct</th>
                                        <th nowrap>EMI</th>
                                        <th nowrap>Renewed</th>
                                        <th nowrap>%</th>
                                        <th nowrap>YTR</th>
                                    </tr>
                                </thead>
                                <tbody id='mytab' class="table-search"> 
                                    <%
                                        String total = "";
                                        String auxiliary = "";
                                        String gideon = "";
                                        String state_association = "";
                                        String sa_no = "";
                                        int slno_sa_o = 0;

                                        DataSource ds = null;
                                        Connection con = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();

                                            //  String strQuery = "{call ADMIN.PROC_RENEWAL_BASKET_OCT2021}";
                                            //  CallableStatement cstmt = con.prepareCall(strQuery);
                                            //  cstmt.execute();
                                            String sql = "select a.*,"
                                                    + "(ir_gideon+ins_gideon+dr_gideon+emi_gid) Gideon_renewed,"
                                                    + "(ir_auxiliary+ins_auxiliary+dr_auxiliary+emi_aux) Aux_renewed, "
                                                    + "round(((ir_gideon+ins_gideon+dr_gideon+emi_gid)/total_gideon)*100) gid_per, "
                                                    + "round(((ir_auxiliary+ins_auxiliary+dr_auxiliary+emi_aux)/total_auxiliary)*100) aux_per,"
                                                    + "(total_gideon - (ir_gideon+ins_gideon+dr_gideon+emi_gid)) GID_YTR,"
                                                    + "(total_auxiliary - (ir_auxiliary+ins_auxiliary+dr_auxiliary+emi_aux)) AUX_YTR "
                                                    + "from v_renewal_dashboard_dynamic_values_09June2022_final_2021_22 a order by to_number(sa_no) asc";
                                        //    System.out.println("RenewalDB " + sql);
                                            ResultSet resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                                state_association = resultSet.getString("state_association");
                                                sa_no = resultSet.getString("sa_no");
                                                slno_sa_o = slno_sa_o + 1;
                                                if (sa_no.equalsIgnoreCase("14")) {
                                    %>
                                    <tr style="background-color: yellow; color: navy; font-weight: bold;">
                                        <td  hidden><%= resultSet.getString("sa_no")%></td>
                                        <td style="font-weight: bold; text-align: center;" nowrap>Total</td>
                                        <td style="text-align: center; background-color: #F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("total_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("ir_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("ins_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("dr_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("emi_gid")%></td>
                                        <td style="text-align: center; background-color: #F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("Gideon_renewed")%></td>
                                        <td style="text-align: center; font-weight: bold;" nowrap><%=resultSet.getString("gid_per")%>%</td>
                                        <td style="text-align: center; background-color: #F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("gid_ytr")%></td>
                                        <td style="font-weight: bold; text-align: center;" nowrap>Total</td>
                                        <td style="text-align: center; background-color: #ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("total_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("ir_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("ins_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("dr_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("emi_aux")%></td>
                                        <td style="text-align: center; background-color: #ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("Aux_renewed")%></td>
                                        <td style="text-align: center; font-weight: bold;" nowrap><%=resultSet.getString("aux_per")%>%</td>
                                        <td style="text-align: center; background-color: #ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("aux_ytr")%></td>
                                    </tr>
                                    <%
                                    } else {
                                    %>
                                    <tr>
                                        <td hidden><%= resultSet.getString("sa_no")%></td>
                                        <td style="font-weight: bold; text-align: center;" nowrap>SA <%= resultSet.getString("sa_no")%></td>
                                        <td style="text-align: center; background-color:#F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("total_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("ir_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("ins_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("dr_gideon")%></td>
                                        <td nowrap><%=resultSet.getString("emi_gid")%></td>
                                        <td style="text-align: center; background-color:#F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("Gideon_renewed")%></td>
                                        <td style="text-align: center; font-weight: bold;" nowrap><%=resultSet.getString("gid_per")%>%</td>
                                        <td style="text-align: center; background-color:#F2FAD8; font-weight: bold;" nowrap><%=resultSet.getString("gid_ytr")%></td>
                                        <td style="font-weight: bold; text-align: center;" nowrap>SA <%= resultSet.getString("sa_no")%></td>
                                        <td style="text-align: center; background-color:#ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("total_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("ir_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("ins_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("dr_auxiliary")%></td>
                                        <td nowrap><%=resultSet.getString("emi_aux")%></td>
                                        <td style="text-align: center; background-color:#ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("Aux_renewed")%></td>
                                        <td style="text-align: center; font-weight: bold;" nowrap><%=resultSet.getString("aux_per")%>%</td>
                                        <td style="text-align: center; background-color:#ffe9ec; font-weight: bold;" nowrap><%=resultSet.getString("aux_ytr")%></td>
                                    </tr>
                                    <%
                                                }
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
                <div id="gid_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; GIDEON RENEWALS (INCLUDING DEFERRED PAYMENTS)
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="gideons" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th  nowrap>MID</th>  
                                        <th  nowrap>NAME</th> 
                                        <th  nowrap>MTYPE</th>
                                        <th  nowrap>GENDER</th>
                                        <th nowrap>STATUS</th>  
                                        <th nowrap>ANNUAL_END_DATE</th> 
                                        <th  nowrap>ANNUAL_START_DATE</th>   
                                        <th nowrap>PHONE</th>   
                                        <th nowrap>MOBILE2</th>    
                                        <th nowrap>MOBILE3</th>    
                                        <th nowrap>EMAIL</th>    
                                        <th nowrap>CAMP</th>    
                                        <th nowrap>STATE_ASSOCIATION</th>   
                                        <th nowrap>REMITTER</th> 
                                        <th  nowrap>ADDRESS_LINE_1</th>   
                                        <th nowrap>ADDRESS_LINE_2</th>   
                                        <th nowrap>ADDRESS_LINE_3</th> 
                                        <th nowrap>CITY</th>    
                                        <th nowrap>STATE</th>    
                                        <th nowrap>PINCODE</th>    
                                        <th nowrap>BASKET</th>     
                                        <th nowrap>STATE_ASSOCIATION</th>     
                                        <th nowrap>REGION</th>     
                                        <th nowrap>AREA</th>                              
                                    </tr>
                                </thead> 
                                <tfoot style="background-color: #01354a;">
                                    <tr>
                                        <th  nowrap>MID</th>  
                                        <th  nowrap>NAME</th> 
                                        <th  nowrap>MTYPE</th>
                                        <th  nowrap>GENDER</th>
                                        <th nowrap>STATUS</th>  
                                        <th nowrap>ANNUAL_END_DATE</th> 
                                        <th  nowrap>ANNUAL_START_DATE</th>   
                                        <th nowrap>PHONE</th>   
                                        <th nowrap>MOBILE2</th>    
                                        <th nowrap>MOBILE3</th>    
                                        <th nowrap>EMAIL</th>    
                                        <th nowrap>CAMP</th>    
                                        <th nowrap>STATE_ASSOCIATION</th>   
                                        <th nowrap>REMITTER</th> 
                                        <th  nowrap>ADDRESS_LINE_1</th>   
                                        <th nowrap>ADDRESS_LINE_2</th>   
                                        <th nowrap>ADDRESS_LINE_3</th>  
                                        <th nowrap>CITY</th>    
                                        <th nowrap>STATE</th>    
                                        <th nowrap>PINCODE</th>    
                                        <th nowrap>BASKET</th>    
                                        <th nowrap>STATE_ASSOCIATION</th>     
                                        <th nowrap>REGION</th>     
                                        <th nowrap>AREA</th>     
                                    </tr>
                                </tfoot>
                            </table> 
                        </div>
                    </div>
                </div>
                <div id="aux_list" class="tab-pane fade">   
                    <div class='panel panel-default panel-accent-gold' style="padding: 10px;">
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; AUXILIARY RENEWALS (INCLUDING DEFERRED PAYMENTS)
                            </h3>
                        </div>
                        <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                            <table id="auxiliary" style="float: left; width: 100%" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th  nowrap>MID</th>  
                                        <th  nowrap>NAME</th> 
                                        <th  nowrap>MEMBERSHIP TYPE</th>
                                        <th  nowrap>GENDER</th>
                                        <th nowrap>STATUS</th>  
                                        <th nowrap>ANNUAL_END_DATE</th> 
                                        <th  nowrap>ANNUAL_START_DATE</th>   
                                        <th nowrap>PHONE</th>   
                                        <th nowrap>MOBILE2</th>    
                                        <th nowrap>MOBILE3</th>    
                                        <th nowrap>EMAIL</th>    
                                        <th nowrap>CAMP</th>    
                                        <th nowrap>STATE_ASSOCIATION</th>   
                                        <th nowrap>REMITTER</th> 
                                        <th  nowrap>ADDRESS_LINE_1</th>   
                                        <th nowrap>ADDRESS_LINE_2</th>   
                                        <th nowrap>ADDRESS_LINE_3</th>  
                                        <th nowrap>CITY</th>    
                                        <th nowrap>STATE</th>    
                                        <th nowrap>PINCODE</th>    
                                        <th nowrap>BASKET</th>     
                                        <th nowrap>STATE_ASSOCIATION</th>     
                                        <th nowrap>REGION</th>     
                                        <th nowrap>AREA</th>                       
                                    </tr>
                                </thead> 
                                <tfoot style="background-color: #01354a;">
                                    <tr>
                                        <th  nowrap>MID</th>  
                                        <th  nowrap>NAME</th> 
                                        <th  nowrap>MEMBERSHIP TYPE</th>
                                        <th  nowrap>GENDER</th>
                                        <th nowrap>STATUS</th>  
                                        <th nowrap>ANNUAL_END_DATE</th> 
                                        <th  nowrap>ANNUAL_START_DATE</th>   
                                        <th nowrap>PHONE</th>   
                                        <th nowrap>MOBILE2</th>    
                                        <th nowrap>MOBILE3</th>    
                                        <th nowrap>EMAIL</th>    
                                        <th nowrap>CAMP</th>    
                                        <th nowrap>STATE_ASSOCIATION</th>   
                                        <th nowrap>REMITTER</th> 
                                        <th  nowrap>ADDRESS_LINE_1</th>   
                                        <th nowrap>ADDRESS_LINE_2</th>   
                                        <th nowrap>ADDRESS_LINE_3</th>  
                                        <th nowrap>CITY</th>    
                                        <th nowrap>STATE</th>    
                                        <th nowrap>PINCODE</th>    
                                        <th nowrap>BASKET</th>    
                                        <th nowrap>STATE_ASSOCIATION</th>     
                                        <th nowrap>REGION</th>     
                                        <th nowrap>AREA</th>     
                                    </tr>
                                </tfoot>
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
                var table = $('#sacnt').DataTable({
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    lengthMenu: [
                        [20, 50, -1],
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
            $(document).ready(function () {
                var gideons;
                // Setup - add a text input to each footer cell
                $('#gideons tfoot th').each(function () {
                    var title = $(this).text();
                    $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                });
                gideons = $('#gideons').DataTable({
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
                        'pageLength',
                        {
                            extend: 'excel',
                            footer: true
                        },
                        {
                            text: 'Reload Table',
                            action: function () {
                                gideons.ajax.reload();
                            }
                        }
                    ],
                    lengthMenu: [
                        [10, 25, -1],
                        ['10 rows', '25 rows', 'Show all']
                    ],
                    ajax: {
                        method: "GET",
                        url: "https://lxxncu6awrxkpqa-db202010270820.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1gre2021_22/gidRenewalsNew1Json202122/",
                        dataSrc: "items"
                    },
                    columns: [
                        {"data": "mid"},
                        {"data": "name"},
                        {"data": "mtype"},
                        {"data": "gender1"},
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
                        {"data": "basket"},
                        {"data": "state_asso"},
                        {"data": "region"},
                        {"data": "area"}
                    ], columnDefs: [
                        {className: 'text-nowrap', targets: [1, 2, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23]},
                        {className: 'text-center', targets: [22, 23]}
                    ],
                    initComplete: function () {
                        // Apply the search
                        this.api().columns().every(function () {
                            var that = this;

                            $('input', this.footer()).on('keyup change clear', function () {
                                if (that.search() !== this.value) {
                                    that
                                            .search(this.value)
                                            .draw();
                                }
                            });
                        });
                    }
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                var auxiliary;
                // Setup - add a text input to each footer cell
                $('#auxiliary tfoot th').each(function () {
                    var title = $(this).text();
                    $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                });
                auxiliary = $('#auxiliary').DataTable({
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
                        'pageLength',
                        {
                            extend: 'excel',
                            footer: true
                        },
                        {
                            text: 'Reload Table',
                            action: function () {
                                auxiliary.ajax.reload();
                            }
                        }
                    ],
                    lengthMenu: [
                        [10, 25, -1],
                        ['10 rows', '25 rows', 'Show all']
                    ],
                    ajax: {
                        method: "GET",
                        url: "https://lxxncu6awrxkpqa-db202010270820.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1auxe2021_22/auxRenewalsNew1Json202122/",
                        dataSrc: "items"
                    },
                    columns: [
                        {"data": "mid"},
                        {"data": "name"},
                        {"data": "mtype"},
                        {"data": "gender1"},
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
                        {"data": "basket"},
                        {"data": "state_asso"},
                        {"data": "region"},
                        {"data": "area"}
                    ], columnDefs: [
                        {className: 'text-nowrap', targets: [1, 2, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23]},
                        {className: 'text-center', targets: [22, 23]}
                    ],
                    initComplete: function () {
                        // Apply the search
                        this.api().columns().every(function () {
                            var that = this;

                            $('input', this.footer()).on('keyup change clear', function () {
                                if (that.search() !== this.value) {
                                    that
                                            .search(this.value)
                                            .draw();
                                }
                            });
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