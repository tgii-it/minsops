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
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>National Officers List</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />

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
    <body class="container-fluid" style="background-color: #fff; width: 100%;" >  
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">
                        <form name="frm_apply" method="post" action="#" onsubmit="return validateCheckbox(this)">
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; NATIONAL OFFICERS LIST
                                        <a type='button' class="pull-right" href="#"  data-toggle="modal" onclick="showModal()" data-target="#myModal" title='Show Pending Records'><i class='fa fa-comments-o' aria-hidden='true'>&nbsp; <b>Create New</b></i></a>
                                    </h3>
                                </div>

                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;" nowrap>Zone</th>
                                                <th nowrap>State Association</th>
                                                <th style="text-align: center;" nowrap>SA_No</th>
                                                <th style="text-align: center;" nowrap>Region</th>
                                                <th style="text-align: center;" nowrap>Area</th>
                                                <th nowrap>Camp Name</th>
                                                <th style="text-align: center;" nowrap>Status</th>
                                                <th nowrap>Camp No</th>
                                                <th nowrap>Old Name</th>
                                                <th style="text-align: center;" nowrap>Start_Date</th>
                                                <th nowrap>Type</th>
                                                <th style="text-align: center;" nowrap>Metro_City</th>
                                                <th nowrap>Remarks</th>
                                            </tr>
                                        </thead>

                                        <tbody id='mytab' class="table-search"> 
                                            <%  String orbitid = "";
                                                String sa_no = "";
                                                String region = "";
                                                String area = "";
                                                String start_date = "";
                                                String metrocity = "";
                                                String type = "";
                                                String remarks = "";
                                                String old_name = "";
                                                String camp_no = "";
                                                String status = "";
                                                String state_asso = "";
                                                String zone = "";

                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();

                                                    String query1 = "select a.*,to_char(start_date,'DD-Mon-YYYY') start_date1 from camps_master a order by sa_no,region,area,camp";

                                                    Statement st1 = con.createStatement();
                                                    ResultSet rs1 = st1.executeQuery(query1);
                                                    while (rs1.next()) {
                                                        zone = rs1.getString("zone");
                                                        state_asso = rs1.getString("state_asso");
                                                        sa_no = rs1.getString("sa_no");
                                                        region = rs1.getString("region");
                                                        area = rs1.getString("area");
                                                        camp = rs1.getString("camp");
                                                        status = rs1.getString("status");
                                                        camp_no = rs1.getString("camp_no");
                                                        old_name = rs1.getString("old_name");
                                                        remarks = rs1.getString("remarks");
                                                        start_date = rs1.getString("start_date1");
                                                        type = rs1.getString("type");
                                                        metrocity = rs1.getString("metrocity");
                                                        orbitid = rs1.getString("orbitid");

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
                                                        if (start_date == null) {
                                                            start_date = "";
                                                        }
                                                        if (metrocity == null) {
                                                            metrocity = "";
                                                        }
                                                        if (type == null) {
                                                            type = "";
                                                        }
                                                        if (remarks == null) {
                                                            remarks = "";
                                                        }
                                                        if (old_name == null) {
                                                            old_name = "";
                                                        }
                                            %> 
                                            <tr style='cursor: pointer;' title='Click here to Update' data-toggle="modal" data-target="#myModal" onclick="update('<%out.print(camp);%>', '<%out.print(orbitid);%>')">  
                                                <td style="text-align: center;" nowrap><%= zone%></td>
                                                <td style="text-align: center;" nowrap><%=state_asso%></td> 
                                                <td style="text-align: center;" nowrap>-SA<%=sa_no%>-</td>
                                                <td style="text-align: center;" nowrap>&nbsp;<%= region%></td>
                                                <td style="text-align: center;" nowrap><%= area%></td>
                                                <td nowrap><%= camp%></td>
                                                <td style="text-align: center;" nowrap><%= status%></td>
                                                <td nowrap><%= camp_no%></td>
                                                <td nowrap><%= old_name%></td>
                                                <td style="text-align: center;" nowrap><%= start_date%></td>
                                                <td nowrap><%= type%></td>
                                                <td style="text-align: center;" nowrap><%= metrocity%></td>
                                                <td nowrap><%= remarks%></td>
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
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
        </section>

        <div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin: 0; padding: 0;">
                <div class="modal-content" style="height: auto; min-height: 100%;">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <div class='panel panel-default panel-accent-gold'>
                            <div class="panel-heading" style="background-color: #fff;">
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                    <i class="fa fa-fw fa-share"></i>&nbsp; DESIGNATION FORM
                                </h3>
                            </div>
                            <div class="panel-body" style="padding-top: 20px;"> 
                                <div class="form-row">       
                                    <div class="form-group col-md-1">
                                        <label for="contactperson">Zone</label>
                                        <div class='input-group'>
                                            <input type='text' class="form-control" name="zone" id="zone"/>
                                        </div>                                            
                                    </div>  
                                    <div class="form-group col-md-3">
                                        <label for="contactperson">State_Association</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-user"></span>
                                            </span>
                                            <input type='text' class="form-control" name="state_asso" id="state_asso"/>
                                        </div>                                            
                                    </div>  
                                    <div class="form-group col-md-1">
                                        <label for="contactperson">SA_No</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-phone"></span>
                                            </span>
                                            <input type='text' class="form-control" name="sa_no" id="sa_no"/>
                                        </div>                                            
                                    </div>                                         
                                    <div class="form-group col-md-1">
                                        <label for="contactperson">Region</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                            </span>
                                            <input type='text' class="form-control" name="region" id="region"/>
                                        </div>                                            
                                    </div>                                          
                                    <div class="form-group col-md-1">
                                        <label for="contactperson">Area</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                            </span>
                                            <input type='text' class="form-control" name="area" id="area"/>
                                        </div>                                            
                                    </div>    
                                    <div class="form-group col-md-3" >  
                                        <label for="contactperson">Camp</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                            </span>                                      
                                            <input name="camp" id="camp" class="form-control" placeholder=" Camp Name" autocomplete="off">
                                        </div>                                            
                                    </div>   
                                    <div class="form-group col-md-3" >  
                                        <label for="contactperson">Status</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                            </span>                                      
                                            <input name="status" id="status" class="form-control" autocomplete="off">
                                        </div>                                            
                                    </div>                                     
                                    <div class="form-group col-md-2">
                                        <label for="start_date">Start Date</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <input type='text' class="form-control" name="start_date" id="start_date" placeholder=" DD/MM/YYYY"/>
                                        </div>                                            
                                    </div>   
                                    <div class="form-group col-md-2">
                                        <label for="perf_year">Camp No</label>
                                        <div class='input-group'>
                                            <input name="camp_no" id="camp_no" class="form-control" placeholder=" Camp No" autocomplete="off">
                                        </div>
                                    </div>  
                                    <div class="form-group col-md-2">
                                        <label for="perf_year">Camp Old Name</label>
                                        <div class='input-group'>
                                            <input name="old_name" id="old_name" class="form-control" placeholder=" Camp Old Name" autocomplete="off">
                                        </div>
                                    </div>    
                                    <div class="form-group col-md-3">
                                        <label for="perf_year">Camp Type</label>
                                        <div class='input-group'>
                                            <input name="type" id="type" class="form-control" placeholder=" Camp Type" autocomplete="off">
                                        </div>
                                    </div>   
                                    <div class="form-group col-md-3">
                                        <label for="perf_year">Metro City</label>
                                        <div class='input-group'>
                                            <input name="metrocity" id="metrocity" class="form-control" placeholder=" Metro City Name" autocomplete="off">
                                        </div>
                                    </div>               
                                    <div class="form-group col-md-6">
                                        <label for="remarks">Remarks /comments</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </span>
                                            <input type='text' class="form-control" name="remarks" id="remarks" placeholder="Remarks, if any"/>
                                            <input type='hidden' class="form-control" name="useraccessname" id="useraccessname" value="<%=useraccessname%>" >
                                            <input type='hidden' name="so_mid" id="so_mid">
                                            <input type='hidden' class="form-control" name="orbitid" id="orbitid">
                                        </div>                                            
                                    </div> 
                                </div>
                                <div id="snackbar1"></div>
                            </div>
                        </div>  
                        <div class="modal-footer">
                            <button type="submit" name="final-submit" id="final-submit" class="btn btn-primary final-submit">Submit</button> 
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close window</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:location.reload();">Close & Reload</button>
                        </div> 
                    </div>   
                </div>
            </div>
        </div>        
        <br><br>
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
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript">
                                $(document).ready(function () {
                                    var printCounter = 0;
                                    // Append a caption to the table before the DataTables initialisation
                                    // $('#gideon').append('<caption style="caption-side: top">The Gideons International in India</caption>');
                                    // DataTable
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
            $(function () {
                $('#start_date').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    autoclose: true,
                    todayHighlight: true
                });
            });

            $('#start_date').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
            $("#start_date").datepicker().datepicker("setDate", new Date());
        </script>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }

            function update(camp, orbitid)
            {
                alert("selected record\n-----------------------\nCamp Name : " + camp + "\nRecord ID : " + orbitid);
                $("#zone").val('');
                $("#sa_no").val('');
                $("#state_asso").val('');
                $("#region").val('');
                $("#area").val('');
                $("#camp").val('');
                $("#camp_no").val('');
                $("#status").val('');
                $("#old_name").val('');
                $("#start_date").val('');
                $("#remarks").val('');
                $("#orbitid").val('');
                $("#type").val('');
                $("#metrocity").val('');

                $.ajax({
                    url: 'StateOfficersEditMIDjson_2.jsp?camp=' + camp + '&orbitid=' + orbitid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#zone").val(data.zone);
                        $("#sa_no").val(data.sa_no);
                        $("#state_asso").val(data.state_asso);
                        $("#region").val(data.region);
                        $("#area").val(data.area);
                        $("#camp").val(data.camp);
                        $("#camp_no").val(data.camp_no);
                        $("#status").val(data.status);
                        $("#old_name").val(data.old_name);
                        $("#start_date").val(data.start_date);
                        $("#remarks").val(data.remarks);
                        $("#orbitid").val(data.orbitid);
                        $("#type").val(data.type);
                        $("#metrocity").val(data.metrocity);
                    }
                });
            }

            function showModal()
            {
                $('#so_mid').val('');
                $("#zone").val('0');
                $("#sa").val('0');
                $("#state_asso").val('0');
                $("#region").val('0');
                $("#area").val('0');
                $("#camp").val('');
                $("#name").val('');
                $("#mid").val('');
                $("#mName").val('');
                $("#designation").val('');
                $("#mobile").val('');
                $("#email").val('');
                $("#remarks").val('');
                $("#term").val('0');
                $("#perf_year").val('0');
                $("#start_date").val('');
            }
        </script>

        <script>
            $(document).on('click', '.final-submit', function () {
                var zone = $("#zone").val();
                var state_asso = $("#state_asso").val();
                var sa_no = $("#sa_no").val();
                var region = $("#region").val();
                var area = $("#area").val();
                var camp = $("#camp").val();
                var status = $("#status").val();
                var camp_no = $("#camp_no").val();
                var start_date = $("#start_date").val();
                var old_name = $("#old_name").val();
                var remarks = $("#remarks").val();
                var type = $("#type").val();
                var metrocity = $("#metrocity").val();
                var orbitid = $("#orbitid").val();
                var result = "";
                // if (orbitid === "--" || orbitid === "") {
                //  var v_Url = 'StateOfficersInsertMIDsave_1.jsp?action=Insert&memid=' + memid + '&name=' + name + '&camp=' + camp + '&mobile=' + mobile + '&email=' + email + '&remarks=' + remarks + '&term=' + term + '&perf_year=' + perf_year + '&start_date=' + start_date + '&region=' + region + '&area=' + area + '&email=' + email + '&state_asso=' + state_asso + '&zone=' + zone + '&designation=' + designation
                //   } else {
                var v_Url = 'StateOfficersEditMIDsave_1.jsp?action=Update&orbitid=' + orbitid + '&camp=' + camp + '&zone=' + zone + '&state_asso=' + state_asso +
                        '&sa_no=' + sa_no + '&region=' + region + '&area=' + area + '&status=' + status + '&camp_no=' + camp_no + '&start_date=' + start_date +
                        '&old_name=' + old_name + '&remarks=' + remarks + '&type=' + type + '&metrocity=' + metrocity
                //  }
                var r = confirm("Are you sure ? Do you want to Update this record ?");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: v_Url,
                        data: {"orbitid": orbitid},
                        success: function (data) {
                            result = $.trim(data);
                            if (result === "Success") {
                                alert(camp + "'s information has been updated");
                            } else {
                                alert(data);
                            }
                            $.ajax({
                                url: 'StateOfficersEditMIDjson_2.jsp?orbitid=' + orbitid + '&camp=' + camp,
                                type: 'POST',
                                dataType: 'json',
                                success: function (data) {
                                    $("#final-submit").show();
                                    $("#zone").val(data.zone);
                                    $("#state_asso").val(data.state_asso);
                                    $("#region").val(data.region);
                                    $("#area").val(data.area);
                                    $("#camp").val(data.camp);
                                    $("#sa_no").val(data.sa_no);
                                    $("#camp_no").val(data.camp_no);
                                    $("#old_name").val(data.old_name);
                                    $("#status").val(data.status);
                                    $("#start_date").val(data.start_date);
                                    $("#type").val(data.type);
                                    $("#metrocity").val(data.metrocity);
                                    $("#remarks").val(data.remarks);
                                }
                            });
                        }
                    });
                }
            });
            $('#sa_no, #region, #area').keypress(function (e) {
                if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
        </script>
    </body>
</html>