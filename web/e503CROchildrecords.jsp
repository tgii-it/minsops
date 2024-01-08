<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="loadbaseinfo.jsp" %>	
<%    if (fdate == null) {
        fdate = "";
    }
    if (todate == null) {
        todate = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>2023_24 | CRO Records</title>   
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>     
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
            <form name="frm2" id="frm2" method="post" action="e503CROchildrecords.jsp" >  
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                            <i class="fa fa-fw fa-share"></i>&nbsp;e503 : CRO Complete Information : PY 2023_24
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
                                    <th style="text-align: center;" nowrap>Rcord_ID</th> 
                                    <th  nowrap>Camp</th>   
                                    <th  nowrap>State Association</th>   
                                    <th style="text-align: center;" nowrap>CP_COUNT</th> 
                                    <th style="text-align: right;" nowrap>CRO_AMOUNT</th>
                                    <th style="text-align: center;" nowrap>CP_DATE</th>                                                   
                                    <th nowrap>CHURCH NAME</th> 
                                    <th nowrap>CHURCH ADDRESS</th>    
                                    <th nowrap>PASTOR NAME</th>                                              
                                    <th nowrap>SPEAKER NAME</th>
                                    <th nowrap>REMITTER</th>
                                    <th nowrap>SUBMITTED_ON</th>
                                    <th style="text-align: center;" nowrap>TALLY_NO</th>
                                    <th style="text-align: center;" nowrap>e503_ID</th> 
                                </tr>
                            </thead> 
                            <%

                                DataSource ds = null;
                                Connection con = null;
                                ResultSet rs = null;
                                Context context = new InitialContext();
                                Context envCtx = (Context) context.lookup("java:comp/env");
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                try {
                                    con = ds.getConnection();
                                    String sql = "";
                                    String cpdate = "";
                                    String vcamp = "";
                                    String churchname = "";
                                    String churchaddr = "";
                                    String pastor = "";
                                    String speaker = "";
                                    String tallyno = "";
                                    String cro_amount = "";
                                    String cp_amount = "";
                                    String state_asso = "";
                                    String sdate = "";
                                    String remarks1 = "";
                                    String remarks2 = "";
                                    String remitter = "";
                                    String status = "";
                                    String e503date = "";
                                    String tallydate = "";
                                    String cpcnt = "";

                                    Statement statement = con.createStatement();
                                    sql = "select * from v_e503_cro_child_records "
                                            + "WHERE to_date(e503date,'DD-MM-YY') between to_date('" + fdate + "','DD/MM/YYYY') and to_date('" + todate + "','DD/MM/YYYY') "
                                            + "order by mid desc,rid asc";
//                                    System.out.println("E503CRO CHILD QUERY : " + sql);
                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                        vcamp = resultSet.getString("camp");
                                        churchname = resultSet.getString("CHURCH_NAME");
                                        churchaddr = resultSet.getString("CHURCH_ADDRESS");
                                        pastor = resultSet.getString("PASTOR_NAME");
                                        speaker = resultSet.getString("SPEAKER_NAME");
                                        cpdate = resultSet.getString("CP_DATE");
                                        tallyno = resultSet.getString("tallyno");
                                        tallydate = resultSet.getString("tallydate");
                                        cro_amount = resultSet.getString("croamount");
                                        cp_amount = resultSet.getString("cp_amount");
                                        cpcnt = resultSet.getString("cpcnt");
                                        state_asso = resultSet.getString("state_asso");
                                        sdate = resultSet.getString("modified_on");
                                        remarks1 = resultSet.getString("sf1remarks");
                                        remarks2 = resultSet.getString("tallyremarks");
                                        remitter = resultSet.getString("remitter");
                                        status = resultSet.getString("rstatus");
                                        state_asso = resultSet.getString("state_asso");
                                        e503date = resultSet.getString("e503date");

                                        if (remarks2 == null || remarks2 == "null") {
                                            remarks2 = "--";
                                        }
                                        if (remarks1 == null || remarks1 == "null") {
                                            remarks1 = remarks2;
                                        }
                                        if (cpdate == null || cpdate == "null") {
                                            cpdate = "";
                                        }
                                        if (churchname == null || churchname == "null") {
                                            churchname = remarks1;
                                        }
                                        if (churchaddr == null || churchaddr == "null") {
                                            churchaddr = remarks2;
                                        }
                                        if (pastor == null || pastor == "null") {
                                            pastor = "";
                                        }
                                        if (speaker == null || speaker == "null") {
                                            speaker = "";
                                        }
                                        if (tallyno == null || tallyno == "null") {
                                            tallyno = "";
                                        }
                                        if (vcamp == null || vcamp == "null") {
                                            vcamp = "";
                                        }
                                        if (cp_amount == null || cp_amount == "null") {
                                            cp_amount = "";
                                        }
                                        if (state_asso == null || cp_amount == "null") {
                                            state_asso = "";
                                        }
                                        if (sdate == null || sdate == "null") {
                                            sdate = "";
                                        }
                            %>
                            <tr>    
                                <td nowrap><%=resultSet.getString("rid")%></td>   
                                <td nowrap><%=vcamp%></td>           
                                <td nowrap><%=state_asso%></td>
                                <td style="text-align: center;" nowrap><%=cpcnt%></td>
                                <td style="text-align: right; padding-right: 18px;" nowrap><%=cp_amount%></td>
                                <td nowrap><%=cpdate%></td>
                                <td nowrap><%=churchname%></td>
                                <td nowrap><%=churchaddr%></td>
                                <td nowrap><%=pastor%></td>
                                <td nowrap><%=speaker%></td>
                                <td nowrap><%=resultSet.getString("remitter")%></td>
                                <td nowrap><%=sdate%></td>
                                <td nowrap><%=tallyno%></td>  
                                <td nowrap><%=resultSet.getString("mid")%></td>     
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
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: right;" nowrap></th> 
                                    <th style="text-align: right;" nowrap></th> 
                                    <th style="text-align: right;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: center;" nowrap></th> 
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th>   
                                    <th style="text-align: right;" nowrap></th>   
                                    <th style="text-align: center;" nowrap></th> 
                                </tr>
                            </tfoot>
                        </table>                                     
                    </div>
                </div>
            </form>
        </section>        
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
                    lengthMenu: [
                        [10, 20, 50, -1],
                        ['10 rows', '20 rows', '50 rows', 'Show all']
                    ],
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
            $('#event_date_cal').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });

            $('#event_date_cal1').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
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