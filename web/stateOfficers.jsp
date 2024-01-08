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
        <title>State Officers Master</title>
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
                                        <i class="fa fa-fw fa-share"></i>&nbsp; STATE OFFICERS LIST
                                    </h3>
                                </div>

                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;" nowrap>State_Asso</th>
                                                <th style="text-align: center;" nowrap>Region</th>
                                                <th style="text-align: center;" nowrap>Area</th>
                                                <th nowrap>Camp Name</th>
                                                <th style="text-align: center;" nowrap>Perf Year</th>
                                                <th nowrap>Designation</th>
                                                <th nowrap>Name</th>
                                                <th style="text-align: center;" nowrap>Member ID</th>
                                                <th nowrap>Membership Status</th>
                                                <th style="text-align: center;" nowrap>Term</th>
                                                <th nowrap>Election Date</th>
                                                <th nowrap>Membership Validity</th>
                                                <th nowrap>Membership Type</th>
                                                <th style="text-align: center;" nowrap>Mobile</th>
                                                <th nowrap>Email ID</th>
                                                <th nowrap>Modified On</th>
                                            </tr>
                                        </thead>

                                        <tbody id='mytab' class="table-search"> 
                                            <%  String mobile = "";
                                                String designation = "";
                                                String region = "";
                                                String area = "";
                                                String sa_no = "";
                                                String mid = "";
                                                String email = "";
                                                String name = "";
                                                String gid_aux = "";
                                                String uStatus = "";
                                                String rstat = "";
                                                String uMid = "";
                                                String uRid = "";
                                                String userName = "";
                                                String mtype = "";
                                                String mstatus = "";
                                                String mend_date = "";
                                                String phoneNo = "";
                                                String term = "";
                                                String perf_year = "";
                                                String eldate = "";
                                                String modified_on = "";

                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();

                                                    String query1 = "select case when a.phone is not null then a.phone else a.mobile end phoneNo,a.*,b.mtype,to_char(b.annual_end_date,'dd-mm-yy') mend_date,b.status mstatus,term,perf_year,to_char(elecdate,'dd-mm-yyyy') eldate from GMAP_ALL_OFFICERS a, Membership_weekly_raw b where upper(a.mid) = upper(b.mid) and UPPER(a.DESIGNATION) NOT LIKE '%CAMP%' and nvl(sa,'0')>0 and UPPER(a.DESIGNATION) LIKE '%STATE%' and upper(a.designation) not like '%SPECIAL%' order by a.gid_aux asc";

                                                    Statement st1 = con.createStatement();
                                                    ResultSet rs1 = st1.executeQuery(query1);
                                                    while (rs1.next()) {
                                                        sa_no = rs1.getString("sa");
                                                        region = rs1.getString("region");
                                                        area = rs1.getString("area");
                                                        camp = rs1.getString("camp");
                                                        designation = rs1.getString("designation");
                                                        name = rs1.getString("name");
                                                        mobile = rs1.getString("mobile");
                                                        phoneNo = rs1.getString("phoneNo");
                                                        email = rs1.getString("email");
                                                        mid = rs1.getString("mid");
                                                        mtype = rs1.getString("mtype");
                                                        mstatus = rs1.getString("mstatus");
                                                        mend_date = rs1.getString("mend_date");
                                                        gid_aux = rs1.getString("gid_aux");
                                                        term = rs1.getString("term");
                                                        perf_year = rs1.getString("perf_year");
                                                        eldate = rs1.getString("eldate");
                                                        modified_on = rs1.getString("modified_on");

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
                                                        if (email == null) {
                                                            email = "--";
                                                        }
                                                        if (mobile == null) {
                                                            mobile = "--";
                                                        }
                                                        if (mid == null) {
                                                            mid = "--";
                                                        }
                                                        if (mtype == null) {
                                                            mtype = "--";
                                                        }
                                                        if (mstatus == null) {
                                                            mstatus = "--";
                                                        }
                                                        if (mend_date == null) {
                                                            mend_date = "--";
                                                        }
                                                        if (term == null) {
                                                            term = "NA";
                                                        }
                                                        if (perf_year == null) {
                                                            perf_year = "NA";
                                                        }
                                                        if (eldate == null) {
                                                            eldate = "NA";
                                                        }
                                                        if (modified_on == null) {
                                                            modified_on = "NA";
                                                        }
                                            %> 
                                            <tr>
                                                <td style="text-align: center;" nowrap>-SA<%=sa_no%>-</td>  
                                                <td style="text-align: center;" nowrap>&nbsp;<%= region%></td>
                                                <td style="text-align: center;" nowrap><%= area%></td>
                                                <td nowrap><%= camp%></td>
                                                <td style="text-align: center;" nowrap><%= perf_year%></td>
                                                <td nowrap><%= designation%></td>
                                                <td nowrap><%= name%></td>
                                                <td style="text-align: center;" nowrap><%= mid%></td>
                                                <td nowrap><%= mstatus%></td>
                                                <td style="text-align: center;" nowrap><%= term%></td>
                                                <td nowrap><%= eldate%></td>
                                                <td nowrap><%= mend_date%></td>
                                                <td nowrap><%= mtype%></td>
                                                <td nowrap><%= phoneNo%></td>
                                                <td nowrap><%= email%></td>
                                                <td nowrap><%= modified_on%></td>
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
                                        <tfoot style="background-color: #01354a;">
                                            <tr>
                                                <th style="text-align: center;" nowrap>State_Asso</th>
                                                <th style="text-align: center;" nowrap>Region</th>
                                                <th style="text-align: center;" nowrap>Area</th>
                                                <th nowrap>Camp Name</th>
                                                <th style="text-align: center;" nowrap>Perf Year</th>
                                                <th nowrap>Designation</th>
                                                <th nowrap>Name</th>
                                                <th style="text-align: center;" nowrap>Member ID</th>
                                                <th nowrap>Membership Status</th>
                                                <th style="text-align: center;" nowrap>Term</th>
                                                <th nowrap>Election Date</th>
                                                <th nowrap>Membership Validity</th>
                                                <th nowrap>Membership Type</th>
                                                <th style="text-align: center;" nowrap>Mobile</th>
                                                <th nowrap>Email ID</th>
                                                <th nowrap>Modified On</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
        </section>       
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
                                // Setup - add a text input to each footer cell
                                $('#gideon tfoot th').each(function () {
                                    var title = $(this).text();
                                    $(this).html('<input type="text" placeholder="Search ' + title + '" />');
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
            $(function () {
                $('#elecdate').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    autoclose: true,
                    todayHighlight: true
                });
            });

            $('#elecdate').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
            $("#elecdate").datepicker().datepicker("setDate", new Date());
        </script>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }

            function update(mid, designation)
            {
                alert("The selected record is\n-----------------------\nMembership ID : " + mid + "\nDesignation : " + designation);
                $('#so_mid').val(mid);
                $('#oDesignation').val(designation);
                $("#zone").val('0');
                $("#sa").val('0');
                $("#state_asso").val('0');
                $("#region").val('0');
                $("#area").val('0');
                $("#camp").val('');
                $("#name").val('');
                $("#memid").val('');
                $("#mName").val('');
                $("#designation").val('');
                $("#mobile").val('');
                $("#email").val('');
                $("#remarks").val('');
                $("#term").val('0');
                $("#perf_year").val('2020_21');
                $("#elecdate").val('');

                $.ajax({
                    url: 'StateOfficersEditMIDjson.jsp?mid=' + mid + '&designation=' + designation,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#zone").val(data.zone);
                        $("#state_asso").val(data.state_asso);
                        $("#region").val(data.region);
                        $("#area").val(data.area);
                        $("#camp").val(data.camp);
                        $("#name").val(data.name);
                        $("#memid").val(data.memid);
                        $("#designation").val(data.designation);
                        $("#mobile").val(data.mobile);
                        $("#email").val(data.email);
                        $("#remarks").val(data.remarks);
                        $("#term").val(data.term);
                        $("#perf_year").val(data.perf_year);
                        $("#elecdate").val(data.elecdate);
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
                $("#elecdate").val('');
            }
        </script>

        <script>
            $(document).on('click', '.final-submit', function () {
                var mid = $("#so_mid").val();
                var name = $("#name").val();
                var memid = $("#memid").val();
                var mName = $("#mName").val();
                var designation = $("#designation").val();
                var oDesignation = $("#oDesignation").val();
                var zone = $("#zone").val();
                var state_asso = $("#state_asso").val();
                var region = $("#region").val();
                var area = $("#area").val();
                var camp = $("#camp").val();
                var mobile = $("#mobile").val();
                var email = $("#email").val();
                var remarks = $("#remarks").val();
                var term = $("#term").val();
                var perf_year = $("#perf_year").val();
                var elecdate = $("#elecdate").val();
                var result = "";
                if (mid === "--" || mid === "") {
                    var v_Url = 'StateOfficersInsertMIDsave.jsp?action=Insert&memid=' + memid + '&name=' + name + '&camp=' + camp + '&mobile=' + mobile + '&email=' + email + '&remarks=' + remarks + '&term=' + term + '&perf_year=' + perf_year + '&elecdate=' + elecdate + '&region=' + region + '&area=' + area + '&email=' + email + '&state_asso=' + state_asso + '&zone=' + zone + '&designation=' + designation
                } else {
                    var v_Url = 'StateOfficersEditMIDsave.jsp?action=Update&mid=' + mid + '&memid=' + memid + '&name=' + name + '&camp=' + camp + '&mobile=' + mobile + '&email=' + email + '&remarks=' + remarks + '&term=' + term + '&perf_year=' + perf_year + '&elecdate=' + elecdate + '&region=' + region + '&area=' + area + '&email=' + email + '&state_asso=' + state_asso + '&zone=' + zone + '&designation=' + designation + '&oDesignation=' + oDesignation
                }
                var r = confirm("Are you sure ? Do you want to Update this record ?");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: v_Url,
                        data: {"mid": mid},
                        success: function (data) {
                            result = $.trim(data);
                            if (result === "Success") {
                                alert(name + "'s new designation '" + designation + "' has been updated");
                            } else {
                                alert(data);
                            }
                            $.ajax({
                                url: 'StateOfficersEditMIDjson.jsp?mid=' + memid + '&designation=' + designation,
                                type: 'POST',
                                dataType: 'json',
                                success: function (data) {
                                    $("#final-submit").show();
                                    $("#zone").val(data.zone);
                                    $("#state_asso").val(data.state_asso);
                                    $("#region").val(data.region);
                                    $("#area").val(data.area);
                                    $("#camp").val(data.camp);
                                    $("#name").val(data.name);
                                    $("#memid").val(data.memid);
                                    $("#so_mid").val(data.memid);
                                    $("#designation").val(data.designation);
                                    $("#mobile").val(data.mobile);
                                    $("#email").val(data.email);
                                    $("#remarks").val(data.remarks);
                                    $("#term").val(data.term);
                                    $("#perf_year").val(data.perf_year);
                                    $("#elecdate").val(data.elecdate);
                                }
                            });
                        }
                    });
                }
            });
            $('#mobile').keypress(function (e) {
                if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $('#mName').keyup(function () {
                $.ajax({
                    url: 'StateOfficersGetValuesjson.jsp?name=' + $("#mName").val(),
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        $('#name').val(data.name);
                        $('#memid').val(data.memid);
                        $("#mobile").val(data.mobile);
                        $("#email").val(data.email);
                        $("#zone").val(data.zone);
                        $("#state_asso").val(data.state_asso);
                        $("#region").val(data.region);
                        $("#area").val(data.area);
                        $("#camp").val(data.camp);
                    }
                });
            });
        </script>
    </body>
</html>