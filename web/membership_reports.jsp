<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String designation = session.getAttribute("designation").toString();
    String useraccessname = session.getAttribute("useraccessname").toString();
    String useraccessno = session.getAttribute("useraccessno").toString();
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGI India | Membership Reports</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
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
        <script>
            function show_confirm()
            {
                var r = confirm("Are you sure, Do you want to Submit ?");
                if (r == true)
                {
                    dis();
                    return true;
                } else
                {
                    return false;
                }
            }
            function validateCheckbox(f)
            {
                var checked = false, e, i = 0
                while (e = f.elements[i++]) {
                    if (e.type == 'checkbox' && e.checked)
                        checked = true
                }
                if (!checked) {
                    alert("Please Select a Record To Process!");
                } else {
                    checked = show_confirm();
                }
                return checked;


                if (theForm.dispatchstatus.value === "0")
                {
                    alert("Please Select Dispatch Status");
                    theForm.dispatchstatus.focus();
                    return (false);
                }
            }

            function selectToggle(toggle, form) {
                var myForm = document.forms[form];
                for (var i = 0; i < myForm.length; i++) {
                    if (toggle) {
                        myForm.elements[i].checked = "checked";
                    } else {
                        myForm.elements[i].checked = "";
                    }
                }
            }
            function genPDF() {
                document.frm1.btnSubmit.disabled = 'false';
            }
        </script>
    </head>
    <body style="background-color: #fff; width: 100%;"> 
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class='panel panel-default panel-accent-gold'>
                            <div class="panel-heading" style="background-color: #fff;">
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                    <i class="fa fa-fw fa-share"></i>&nbsp; Current Memberships</h3>
                            </div>
                            <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                <table id="report1" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                    <thead style="background-color: #01354a; color: #ffe114; font-size: 10px;">
                                        <tr style="background-color: yellow; color: black; border-color: black;">
                                            <th colspan="2">Membership Report</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">GIDEONS</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">AUXILIARY</th>
                                        </tr>
                                        <tr>
                                            <th hidden></th>
                                            <th style="text-align: center;" nowrap>S A</th> 
                                            <th style="text-align: right;" nowrap>Overall</th>
                                            <th style="text-align: right;" nowrap>Gideon Annual</th>     
                                            <th style="text-align: right;" nowrap>Gideon Life</th>    
                                            <th style="text-align: right;" nowrap>Gideon Total</th> 
                                            <th style="text-align: right;" nowrap>Auxiliary Annual</th>
                                            <th style="text-align: right;" nowrap>Auxiliary Life</th>
                                            <th style="text-align: right;" nowrap>Auxiliary Total</th> 
                                        </tr>
                                    </thead>

                                    <tbody id='mytab' class="table-search" style="font-size: 10px;"> 
                                        <%
                                            DataSource ds = null;
                                            Connection con = null;
                                            Context context = new InitialContext();
                                            Context envCtx = (Context) context.lookup("java:comp/env");
                                            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                            try {
                                                con = ds.getConnection();
                                                String Gideon_Cur = "";
                                                String Aux_Cur = "";
                                                String Total_curr = "";
                                                String Total_Deceased = "";
                                                String gideon_rejected = "";
                                                String aux_rejected = "";
                                                String total_rejected = "";
                                                String total_barred = "";
                                                String gideon_barred = "";
                                                String aux_barred = "";
                                                String overall_total = "";
                                                String no_status = "";
                                                String Gideon_Deceased = "";
                                                String Aux_Deceased = "";
                                                String total_cancelled = "";
                                                String aux_cancelled = "";
                                                String gideon_cancelled = "";
                                                String total_dropped = "";
                                                int sa_no = 0;
                                                String sa_no2 = "";
                                                String gideon_dropped = "";
                                                String sa_no1 = "";

                                                String query1 = "SELECT * FROM v_membership_pf1_current order by sa_no asc";
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery(query1);
                                                while (rs1.next()) {
                                                    sa_no = rs1.getInt("sa_no");
                                                    sa_no2 = rs1.getString("state_association");
                                                    Gideon_Cur = rs1.getString("Gideon_Cur_Annual");
                                                    Aux_Cur = rs1.getString("Gideon_Cur_Life");
                                                    Total_curr = rs1.getString("Gideon_Cur_Total");
                                                    Gideon_Deceased = rs1.getString("Aux_Cur_Annual");
                                                    Aux_Deceased = rs1.getString("Aux_Cur_Life");
                                                    Total_Deceased = rs1.getString("Aux_Cur_Total");
                                                    gideon_dropped = rs1.getString("Total_curr");
                                                    if (sa_no2 == null) {
                                                        sa_no2 = "";
                                                    }
                                                    if (sa_no == 14) {
                                                        sa_no1 = "OS";
                                                    } else if (sa_no == 15) {
                                                        sa_no1 = "";
                                                    } else {
                                                        sa_no1 = Integer.toString(sa_no);
                                                    }
                                        %> 
                                        <tr style="vertical-align: middle;">
                                            <td hidden><span class="hidden"><%= sa_no%></span></td>
                                            <td style="text-align: center;"><%= sa_no1%></td>
                                            <td style="text-align: right; font-weight: bold; background-color: #f2f7fd; color: navy;"><%= gideon_dropped%></td>
                                            <td style="text-align: right;"><%= Gideon_Cur%></td>                                              
                                            <td style="text-align: right;"><%= Aux_Cur%></td> 
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= Total_curr%></td> 
                                            <td style="text-align: right;"><%= Gideon_Deceased%></td>
                                            <td style="text-align: right;"><%= Aux_Deceased%></td>
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= Total_Deceased%></td>
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
                                    <tfoot>
                                        <tr style="text-align: right; font-size: 10px;">
                                            <th hidden></th>
                                            <th style="text-align: right;">Page<br>(Overall)</th>
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div> 
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class='panel panel-default panel-accent-gold'>
                            <div class="panel-heading" style="background-color: #fff;">
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                    <i class="fa fa-fw fa-share"></i>&nbsp; The Complete Report </h3>
                            </div>
                            <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 10px; height: auto;">
                                <table id="report2" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                    <thead style="background-color: #01354a; color: #ffe114; font-size: 10px;">
                                        <tr style="background-color: yellow; color: black; border-color: black;">
                                            <th colspan="2">Membership Report</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">CURRENT</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">DECEASED</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">DROPPED</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">CANCELED</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">REJECTED</th>
                                            <th colspan="3" style="text-align: center; letter-spacing: 3px;">BARRED</th>
                                        </tr>
                                        <tr>
                                            <th hidden></th>
                                            <th style="text-align: center;" nowrap>S A</th> 
                                            <th style="text-align: right;" nowrap>Overall</th>    
                                            <th style="text-align: right;" nowrap>Gideon</th>     
                                            <th style="text-align: right;" nowrap>Auxiliary</th>    
                                            <th style="text-align: right;" nowrap>Total</th>   

                                            <th style="text-align: right;" nowrap>Gideon</th>
                                            <th style="text-align: right;" nowrap>Auxiliary</th>
                                            <th style="text-align: right;" nowrap>Total</th>

                                            <th style="text-align: right;" nowrap>Gideon</th>    
                                            <th style="text-align: right;" nowrap>Auxiliary</th>    
                                            <th style="text-align: right;" nowrap>Total</th>  

                                            <th style="text-align: right;" nowrap>Gideon</th>
                                            <th style="text-align: right;" nowrap>Auxiliary</th>    
                                            <th style="text-align: right;" nowrap>Total</th> 

                                            <th style="text-align: right;" nowrap>Gideon</th>  
                                            <th style="text-align: right;" nowrap>Auxiliary</th>  
                                            <th style="text-align: right;" nowrap>Total</th> 

                                            <th style="text-align: right;" nowrap>Gideon</th> 
                                            <th style="text-align: right;" nowrap>Auxiliary</th>    
                                            <th style="text-align: right;" nowrap>Total</th> 
                                        </tr>
                                    </thead>

                                    <tbody id='mytab' class="table-search" style="font-size: 10px;"> 
                                        <%
                                            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                            try {
                                                con = ds.getConnection();
                                                String Gideon_Cur = "";
                                                String Aux_Cur = "";
                                                String Total_curr = "";
                                                String Total_Deceased = "";
                                                String gideon_rejected = "";
                                                String aux_rejected = "";
                                                String total_rejected = "";
                                                String total_barred = "";
                                                String gideon_barred = "";
                                                String aux_barred = "";
                                                String overall_total = "";
                                                String no_status = "";
                                                String Gideon_Deceased = "";
                                                String Aux_Deceased = "";
                                                String total_cancelled = "";
                                                String aux_cancelled = "";
                                                String gideon_cancelled = "";
                                                String total_dropped = "";
                                                int sa_no = 0;
                                                String aux_dropped = "";
                                                String gideon_dropped = "";
                                                String sa_no1 = "";

                                                String query1 = "SELECT * FROM V_MEMBERSHIP_PF1 order by sa_no asc";
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery(query1);
                                                while (rs1.next()) {
                                                    sa_no = rs1.getInt("sa_no");
                                                    Gideon_Cur = rs1.getString("Gideon_Cur");
                                                    Aux_Cur = rs1.getString("Aux_Cur");
                                                    Total_curr = rs1.getString("Total_curr");
                                                    Gideon_Deceased = rs1.getString("Gideon_Deceased");
                                                    Aux_Deceased = rs1.getString("Aux_Deceased");
                                                    Total_Deceased = rs1.getString("Total_Deceased");
                                                    gideon_dropped = rs1.getString("gideon_dropped");
                                                    aux_dropped = rs1.getString("aux_dropped");
                                                    total_dropped = rs1.getString("total_dropped");
                                                    gideon_cancelled = rs1.getString("gideon_cancelled");
                                                    aux_cancelled = rs1.getString("aux_cancelled");
                                                    total_cancelled = rs1.getString("total_cancelled");
                                                    gideon_rejected = rs1.getString("gideon_rejected");
                                                    aux_rejected = rs1.getString("aux_rejected");
                                                    total_rejected = rs1.getString("total_rejected");
                                                    gideon_barred = rs1.getString("gideon_barred");
                                                    aux_barred = rs1.getString("aux_barred");
                                                    total_barred = rs1.getString("total_barred");
                                                    no_status = rs1.getString("no_status");
                                                    overall_total = rs1.getString("overall_total");
                                                    if (sa_no == 14) {
                                                        sa_no1 = "OS";
                                                    } else if (sa_no == 15) {
                                                        sa_no1 = "";
                                                    } else {
                                                        sa_no1 = Integer.toString(sa_no);
                                                    }
                                        %> 
                                        <tr style="vertical-align: middle;">
                                            <td hidden><span class="hidden"><%= sa_no%></span></td>
                                            <td style="text-align: center;"><%= sa_no1%></td>
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy; font-weight: bold;"><%= overall_total%></td>
                                            <td style="text-align: right;"><%= Gideon_Cur%></td>                                              
                                            <td style="text-align: right;"><%= Aux_Cur%></td> 
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= Total_curr%></td> 
                                            <td style="text-align: right;"><%= Gideon_Deceased%></td>
                                            <td style="text-align: right;"><%= Aux_Deceased%></td>
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= Total_Deceased%></td>
                                            <td style="text-align: right;"><%= gideon_dropped%></td>
                                            <td style="text-align: right;"><%= aux_dropped%></td>  
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= total_dropped%></td>  
                                            <td style="text-align: right;"><%= gideon_cancelled%></td>
                                            <td style="text-align: right;"><%= aux_cancelled%></td>
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= total_cancelled%></td>  
                                            <td style="text-align: right;"><%= gideon_rejected%></td> 
                                            <td style="text-align: right;"><%= aux_rejected%></td> 
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= total_rejected%></td> 
                                            <td style="text-align: right;"><%= gideon_barred%></td>   
                                            <td style="text-align: right;"><%= aux_barred%></td> 
                                            <td style="text-align: right; background-color: #f2f7fd; color: navy;"><%= total_barred%></td> 
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
                                    <tfoot>
                                        <tr style="text-align: right; font-size: 10px;">
                                            <th hidden></th>
                                            <th>Page<br>(Overall)</th>
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right;"></th> 
                                            <th style="text-align: right; background-color: #f2f7fd; color: navy;"></th> 
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div> 
                </div>

            </div>
        </section>
        <br><br>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>

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

        <script type="text/javascript">
                    $(document).ready(function () {
                        var report1 = $('#report1').DataTable({
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
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
                                total2 = api
                                        .column(2)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
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
                                // Total over this page
                                pageTotal2 = api
                                        .column(2, {page: 'current'})
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
                                // Update footer
                                $(api.column(2).footer()).html(
                                        '' + pageTotal2 + '<br>(' + total2 + ')'
                                        );
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
                            }
                        });

                        var report2 = $('#report2').DataTable({
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
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
                                total2 = api
                                        .column(2)
                                        .data()
                                        .reduce(function (a, b) {
                                            return intVal(a) + intVal(b);
                                        }, 0);
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
                                // Total over this page
                                pageTotal2 = api
                                        .column(2, {page: 'current'})
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
                                // Update footer
                                $(api.column(2).footer()).html(
                                        '' + pageTotal2 + '<br>(' + total2 + ')'
                                        );
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