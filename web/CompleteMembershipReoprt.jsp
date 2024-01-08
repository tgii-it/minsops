<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<%
    String camp = request.getParameter("camp");
    String useraccessname = "";

    if (camp == null || camp.isEmpty()) {
        camp = "";
    }

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
        <title>TGII | Complete Reports MIS</title>   
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
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

                background: #fdfdfd;
                line-height: 25px;
                border: 1px solid #ddd;
                border-top:5px solid #ffe114;
                border-bottom:5px solid #ffe114;
                padding:30px 25px;
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

        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="js/camps.js"></script>
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
            .navbar {
                margin-bottom: 0;
                background-color: #01354a;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;
            }
            .navbar-brand {
                margin-top: 0;
                margin-bottom: 0;
                background-color: #01354a;
                z-index: 9999;
                border: 0;
                font-size: 28px !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;  
                cursor:pointer; 
                vertical-align: middle;
            }
            .navbar li a, .navbar .navbar-brand {
                color: #ffe114 !important;
            }
            .navbar-nav li a:hover {
                color: #01354a !important;
                background-color: #ffe114 !important;
            }
            .navbar-nav li.active a {
                color: #01354a !important;
                background-color: #ffe114 !important;
            }
            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
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

        </style>

    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;">
        <%@ include file="menu.jsp" %>
        <section class="container-fluid" style="padding: 60px 0px;" > 
            <form name="frm2" id="frm2" method="post" action="CompleteMembershipReoprt.jsp" >                      
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                            <i class="fa fa-fw fa-share"></i>&nbsp; &nbsp&nbsp;&nbsp;&nbsp;S E L E C T &nbsp; C A M P &nbsp;
                        </h3>
                    </div>
                    <div class="panel-body" style="padding-top: 20px;"> 
                        <div class="form-row"> 
                            <div class="form-group col-md-3">
                                <label for="paymentdate">Camp</label>
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </span>
                                    <%  String name_sql = "";
                                        String mname = "";
                                        String mname_str = "";

                                        DataSource ds = null;
                                        Connection con = null;
                                        Context context = new InitialContext();
                                        Context envCtx = (Context) context.lookup("java:comp/env");
                                        ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                        try {
                                            con = ds.getConnection();
                                            Statement statement = con.createStatement();
                                            name_sql = "select camp from camps_master order by camp";

                                            ResultSet resultSet = statement.executeQuery(name_sql);
                                    %>
                                    <input name="camp" list="oName" class="form-control" id="camp" value="<%= camp%>" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
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
                            <div class="form-group col-md-3">
                                <label for="sub" hidden>Submit</label>
                                <div class='input-group' style="margin-top:30px;">
                                    <input type="submit" class="btn btn-primary submit-btn" id="submit-btn" value="Get Records">
                                </div>                                            
                            </div>                                            
                        </div>
                    </div>                                    
                    <div id="snackbar"></div>
                </div>
            </form>
            <form name="frm_apply" method="post" >
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                            <i class="fa fa-fw fa-share"></i>&nbsp; &nbsp&nbsp;&nbsp;&nbsp;D E T A I L S&nbsp;&nbsp;&nbsp;O F  &nbsp;&nbsp;&nbsp;M E M B E R S&nbsp;&nbsp;
                        </h3>
                    </div>
                    <div class="table-responsive" style="vertical-align: middle; width: 100%;  padding: 5px;">
                        <table id="comp_table" class="table table-bordered table-responsive table-hover" style="width:100%; font-size: 10px; color: navy; ">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr>  
                                    <th style="text-align: left;" nowrap>Camp Name</th>                                             
                                    <th style="text-align: left;" nowrap>Area Name</th>
                                    <th style="text-align: left;" nowrap>Region Name</th>
                                    <th style="text-align: left;" nowrap>State Association</th>
                                    <th style="text-align: right;" nowrap>External Identifier</th>
                                    <th style="text-align: left;" nowrap>Name</th>
                                    <th style="text-align: left;" nowrap>Membership Type</th>
                                    <th style="text-align: left;" nowrap>Membership Status</th>
                                    <th style="text-align: left;" nowrap>Member Since</th>
                                    <th style="text-align: left;" nowrap>Membership Start Date</th>
                                    <th style="text-align: left;" nowrap>Membership Expiration Date</th>
                                    <th style="text-align: left;" nowrap>Sign-up Type for TGII</th>
                                    <th style="text-align: left;" nowrap>Credited to NFR / Resource Person / STATE</th>
                                    <th style="text-align: left;" nowrap>Birth Date</th>
                                    <th style="text-align: left;" nowrap>Deceased Date</th>
                                    <th style="text-align: left;" nowrap>Address</th>
                                    <th style="text-align: left;" nowrap>Home-Phone-Mobile</th>
                                    <th style="text-align: left;" nowrap>Home-Phone-Mobile 2</th>
                                    <th style="text-align: left;" nowrap>Home-Phone-Phone</th>                                   
                                    <th style="text-align: left;" nowrap>Email</th>
                                </tr>
                            </thead> 
                            <%
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                try {
                                    con = ds.getConnection();
                                    String sql = "";
                                    String member_since = "";
                                    String dob = "";
                                    String deceased_date = "";
                                    String annual_end_date = "";
                                    String life_start_date = "";
                                    String annual_start_date = "";
                                    Statement statement = con.createStatement();
                                    sql = "select nvl(camp,'-') camp,nvl(address,'-') address,nvl(mobile3,'-') mobile3,nvl(email,'-') email,life_start_date,nvl(phone,'0') phone,nvl(mobile2,'0') mobile2,nvl(pincode,'-') pincode,nvl(state,'-') state,nvl(street,'-') street,nvl(city,'-') city,nvl(address2,'-') address2,mid,nvl(area_name,'-') area_name,to_char(deceased_date,'DD-MON-YY') deceased_date ,to_char(dob,'DD-MON-YY') dob ,nvl(cred_nfr_res_per_state,'-') cred_nfr_res_per_state,nvl(source_of_application,'-') source_of_application,to_char(member_since,'DD-MON-YY') member_since ,to_char(life_start_date,'DD-MON-YY') life_start_date ,to_char(annual_start_date,'DD-MON-YY') annual_start_date,to_char(annual_end_date,'DD-MON-YY') annual_end_date ,nvl(mtype,'-') mtype,nvl(status,'-') status,nvl(name,'-') name,nvl(region_name,'-') region_name,nvl(state_association,'-') state_association from membership_weekly_raw where upper(camp)='" + camp + "' and upper(status) in('CURRENT','GRACE','DECEASED')";
                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                        member_since = resultSet.getString("member_since");
                                        dob = resultSet.getString("dob");
                                        deceased_date = resultSet.getString("deceased_date");
                                        annual_end_date = resultSet.getString("annual_end_date");
                                        annual_start_date = resultSet.getString("annual_start_date");
                                        life_start_date = resultSet.getString("life_start_date");

                                        if (member_since == null) {
                                            member_since = "-";
                                        }
                                        if (dob == null) {
                                            dob = "-";
                                        }
                                        if (deceased_date == null) {
                                            deceased_date = "-";
                                        }
                                        if (annual_end_date == null) {
                                            annual_end_date = "-";
                                        }
                                        if (annual_start_date == null) {
                                            annual_start_date = "";
                                        }
                                        if (life_start_date == null) {
                                            life_start_date = "";
                                        }
                            %>
                            <tr>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("camp")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("area_name")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("region_name")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("state_association")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("mid")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("name")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mtype")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("status")%></td>
                                <td style="text-align: left;" nowrap><%=member_since%></td>
                                <td style="text-align: left;" nowrap><%=annual_start_date%>&nbsp;<%=life_start_date%></td>
                                <td style="text-align: left;" nowrap><%=annual_end_date%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("source_of_application")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("cred_nfr_res_per_state")%></td>
                                <td style="text-align: left;" nowrap><%=dob%></td>
                                <td style="text-align: left;" nowrap><%=deceased_date%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("address")%>&nbsp;,&nbsp;<%=resultSet.getString("address2")%>&nbsp;,&nbsp;<%=resultSet.getString("street")%>&nbsp;,&nbsp;<%=resultSet.getString("city")%>&nbsp;,&nbsp;<%=resultSet.getString("state")%>&nbsp;-&nbsp;<%=resultSet.getString("pincode")%>&nbsp;</td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mobile2")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mobile3")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("phone")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("email")%></td>
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

        <script type="text/javascript">
                    $(document).ready(function () {
                        var table = $('#comp_table').DataTable({
                            destroy: true,
                            responsive: true,
                            "ordering": true,
                            'processing': true,
                            'language': {
                                'loadingRecords': '&nbsp;',
                                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                            },
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