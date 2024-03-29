<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="loadbaseinfo.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>NM 2020_21</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
    <body style="background-color: #fff; width: 100%;">
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">
                        <form name="frm_apply" method="post" action="#" onsubmit="return validateCheckbox(this)">
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; New Members - PY 2020-21
                                    </h3>
                                </div>
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th hidden>SA_No</th>
                                                <th nowrap>State_Asso</th>
                                                <th nowrap>Region</th>
                                                <th nowrap>Area</th>
                                                <th nowrap>Camp</th>
                                                <th nowrap>MID</th>
                                                <th nowrap>Name</th>
                                                <th nowrap>Mem_Type</th>
                                                <th nowrap>Status</th>
                                                <th nowrap> Member_since</th>
                                                <th nowrap> Mem_start_date</th> 
                                                <th nowrap> Mem_exp_date</th> 
                                                <th nowrap> Birth_date</th>  
                                                <th nowrap>Signup_type</th>
                                                <th nowrap>Credited_to</th>                                              
                                                <th nowrap>Is_deceased</th>
                                                <th nowrap>Deceased_date </th>
                                                <th nowrap> City</th>
                                                <th nowrap> State</th>
                                                <th nowrap> Pincode</th>
                                                <th nowrap> Phone</th>
                                                <th nowrap> Mobile</th> 
                                                <th nowrap> Email</th> 
                                                <th nowrap> Receipt_no</th>
                                                <th nowrap>Edu_qua</th>
                                                <th nowrap>Workplace</th>
                                                <th nowrap> Church_name</th>
                                                <th nowrap> Church_addr</th>
                                                <th nowrap> Pincode</th>
                                                <th nowrap> Pastor_name</th>
                                                <th nowrap> Pastor_mobile</th> 
                                            </tr>
                                        </thead>
                                        <tbody id='mytab' class="table-search"> 
                                            <%  String camp = "";
                                                String mid = "";
                                                String name = "";
                                                String member_since = "";
                                                String mtype = "";
                                                String mem_start_date = "";
                                                String mem_exp_date = "";
                                                String status = "";
                                                String signup_type = "";
                                                String credited_to = "";
                                                String job_title = "";
                                                String gender = "";
                                                String birth_date = "";
                                                String is_deceased = "";
                                                String deceased_date = "";
                                                String street = "";
                                                String addr1 = "";
                                                String addr2 = "";
                                                String city = "";
                                                String state = "";
                                                String pincode = "";
                                                String phone = "";
                                                String mobile = "";
                                                String email = "";
                                                String receipt_no = "";
                                                String edu_qua = "";
                                                String workplace = "";
                                                String church_name = "";
                                                String church_addr = "";
                                                String pastor_name = "";
                                                String pastor_mobile = "";
                                                String state_asso = "";
                                                String region = "";
                                                String area = "";
                                                sa_no = "";

                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();
                                                    String query1 = "select nvl(to_char(member_since,'DD/MM/YYYY'),'NA') member_since1,"
                                                            + "nvl(to_char(mem_start_date,'DD/MM/YYYY'),'NA') mem_start_date1,"
                                                            + "nvl(to_char(mem_exp_date,'DD/MM/YYYY'),'NA') mem_exp_date1,"
                                                            + "nvl(to_char(birth_date,'DD/MM/YYYY'),'NA') birth_date1,"
                                                            + "nvl(to_char(deceased_date,'DD/MM/YYYY'),'--') deceased_date1,"
                                                            + "(select state_asso from camps_master where upper(camp)=upper(a.camp)) state_asso,"
                                                            + "(select region from camps_master where upper(camp)=upper(a.camp)) region,"
                                                            + "(select area from camps_master where upper(camp)=upper(a.camp)) area,"
                                                            + "(select sa_no from camps_master where upper(camp)=upper(a.camp)) sa_no,"
                                                            + "nvl(is_deceased,'--') is_deceased1,nvl(pastor_mobile,'--') pastor_mobile1,"
                                                            + "nvl(edu_qua,'--') edu_qua1,nvl(receipt_no,'--') receipt_no1,"
                                                            + "nvl(workplace,'--') workplace1,nvl(church_name,'--') church_name1,"
                                                            + "nvl(pastor_name,'--') pastor_name1,nvl(church_addr,'--') church_addr1,"
                                                            + "nvl(signup_type,'--') signup_type,nvl(credited_to,'--') credited_to,"
                                                            + "nvl(mobile,'--') mobile1,nvl(email,'--') email1,"
                                                            + "nvl(phone,'--') phone1,nvl(state,'--') state1,"
                                                            + "nvl(city,'--') city1,nvl(street,'--') street1,nvl(addr1,'--') addr11,nvl(addr2,'--') addr21,"
                                                            + "a.* from membership_nm_sunitha_nov_07june2021_year_end_final a order by sa_no,region,area,camp,mid";
//                                                    System.out.println("New Memberss List " + query1);
                                                    Statement st1 = con.createStatement();
                                                    ResultSet rs1 = st1.executeQuery(query1);
                                                    while (rs1.next()) {
                                                        sa_no = rs1.getString("sa_no");
                                                        state_asso = rs1.getString("state_asso");
                                                        region = rs1.getString("region");
                                                        area = rs1.getString("area");
                                                        camp = rs1.getString("camp");
                                                        mid = rs1.getString("mid");
                                                        name = rs1.getString("name");
                                                        mtype = rs1.getString("mtype");
                                                        status = rs1.getString("status");
                                                        member_since = rs1.getString("member_since1");
                                                        mem_start_date = rs1.getString("mem_start_date1");
                                                        mem_exp_date = rs1.getString("mem_exp_date1");
                                                        birth_date = rs1.getString("birth_date1");
                                                        is_deceased = rs1.getString("is_deceased1");
                                                        deceased_date = rs1.getString("deceased_date1");
                                                        street = rs1.getString("street1");
                                                        addr1 = rs1.getString("addr11");
                                                        addr2 = rs1.getString("addr21");
                                                        city = rs1.getString("city1");
                                                        state = rs1.getString("state1");
                                                        pincode = rs1.getString("pincode");
                                                        phone = rs1.getString("phone1");
                                                        mobile = rs1.getString("mobile1");
                                                        email = rs1.getString("email1");
                                                        receipt_no = rs1.getString("receipt_no1");
                                                        edu_qua = rs1.getString("edu_qua1");
                                                        workplace = rs1.getString("workplace1");
                                                        church_name = rs1.getString("church_name1");
                                                        church_addr = rs1.getString("church_addr1");
                                                        pastor_name = rs1.getString("pastor_name1");
                                                        pastor_mobile = rs1.getString("pastor_mobile1");
                                                        signup_type = rs1.getString("signup_type");
                                                        credited_to = rs1.getString("credited_to");
                                            %> 
                                            <tr>
                                                <td hidden><%=sa_no%></td>
                                                <td nowrap><%=state_asso%></td>
                                                <td nowrap><%=region%></td>
                                                <td nowrap><%=area%></td>
                                                <td nowrap><%=camp%></td>
                                                <td nowrap>&nbsp;<%= mid%></td>
                                                <td nowrap><%= name%></td>
                                                <td nowrap><%= mtype%></td>
                                                <td nowrap><%= status%></td>
                                                <td nowrap><%= member_since%></td>
                                                <td nowrap><%= mem_start_date%></td> 
                                                <td nowrap><%= mem_exp_date%></td> 
                                                <td nowrap><%= birth_date%></td>   
                                                <td nowrap><%= signup_type%></td>   
                                                <td nowrap><%= credited_to%></td>                                                
                                                <td nowrap><%=is_deceased%></td>
                                                <td nowrap>&nbsp;<%= deceased_date%></td>
                                                <td nowrap><%= city%></td>
                                                <td nowrap><%= state%></td>
                                                <td nowrap><%= pincode%></td>
                                                <td nowrap><%= phone%></td>
                                                <td nowrap><%= mobile%></td> 
                                                <td nowrap><%= email%></td> 
                                                <td nowrap><%= receipt_no%></td>

                                                <td nowrap><%=edu_qua%></td>
                                                <td nowrap>&nbsp;<%= workplace%></td>
                                                <td nowrap><%= church_name%></td>
                                                <td nowrap><%= church_addr%></td>
                                                <td nowrap><%= pincode%></td>
                                                <td nowrap><%= pastor_name%></td>
                                                <td nowrap><%= pastor_mobile%></td> 
                                                <%
                                                        }
                                                        st1.close();
                                                        rs1.close();
                                                        con.close();
                                                    } catch (Exception e) {
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
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script> 
    </body>
</html>