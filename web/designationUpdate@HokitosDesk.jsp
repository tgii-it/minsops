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
        response.sendRedirect("/accLogin.jsp");
    } else {
        designation = session.getAttribute("designation").toString();
        useraccessname = session.getAttribute("useraccessname").toString();
        useraccessno = session.getAttribute("useraccessno").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Designation Update</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

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
            .select2-selection { height: 34px !important; overflow: hidden; font-size: 14px; padding: 3px;}
            .select2-selection__rendered { white-space: normal; word-break: break-all; }
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

        <script>
            function validateCheckbox(f)
            {
                var checked = false, e, i = 0
                while (e = f.elements[i++]) {
                    if (e.type == 'checkbox' && e.checked)
                        checked = true
                }
                if (!checked) {
                    $("#snackbar1").hide();
                    $("#final-submit").show();
                    alert("Please Select a Record To Process!");
                } else {
                    $(this).hide();
                    var r = confirm("Are you Sure? Do you want to Process request ?");
                    if (r === true) {
                        $(this).hide();
                        $("#snackbar1").show();
                        $("#snackbar1").html('<p style="width:100%; height: 50px; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                        $("#final-submit").hide();
                    }
                    checked = show_confirm();
                }
                return checked;
                if (theForm.designation.value === "0")
                {
                    alert("Please Select Designation");
                    theForm.call_status.focus();
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

        <script>
            $(document).ready(function () {
                var country_id = "";
                $('#camp').attr("hidden", true);
                $('#orgcampslist').attr("hidden", true);
                $('#dupcampslist').attr("hidden", false);

                load_json_data7('camp', country_id);

                function load_json_data7(id, parent_id)
                {
                    var html_code = '';
                    $.getJSON('/SAJson.jsp', function (data) {
                        html_code += '<option value="0">- Select Camp Name -</option>';
                        $.each(data, function (key, value) {
                            html_code += '<option value="' + value.name + '">' + value.name + '</option>';
                        });
                        $('#' + id).html(html_code);
                        $('#camp').attr("hidden", false);
                        $('#dupcampslist').attr("hidden", true);
                        $('#orgcampslist').attr("hidden", false);
                    });
                }

                load_json_data8('designation', country_id);

                function load_json_data8(id, parent_id)
                {
                    var html_code = '';
                    $.getJSON('/DesignationJson.jsp', function (data) {
                        html_code += '<option value="0">- Select Designation -</option>';
                        $.each(data, function (key, value) {
                            html_code += '<option value="' + value.name + '">' + value.name + '</option>';
                        });
                        $('#' + id).html(html_code);
                        $('#designation').attr("hidden", false);
                        $('#dupdesignationlist').attr("hidden", true);
                        $('#orgdesignationlist').attr("hidden", false);
                    });
                }
            });
        </script>

    </head>
    <body style="background-color: #fff; width: 100%;">
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn navbar-link" onclick="closeNav()"> &times;</a> 
            <a href="accHome.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-My_Details">
                <i class="glyphicon glyphicon-briefcase"></i>&nbsp; My Dashboard
            </a>
            <%
                if (useraccessname.contains("Tejaswi") || useraccessname.contains("Shruthi")) {
            %>
            <a href="paymentReconciliation.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Reconciliation Pending
            </a>
            <a href="e503PaymentProcessed.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Reconciliation processed
            </a> 
            <a href="e503formedit.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; e503form Edit
            </a>   
            <a href="e503CROrecords.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; CRO Details
            </a>   
            <a href="e503PWTrequest.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; PWT Details
            </a>                  
            <%
                }

                if (useraccessname.contains("Mercy")) {
            %>
            <a href="e503formedit.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; e503form Edit
            </a>               
            <%
                }

                if (useraccessname.contains("Hokit")) {
            %>
            <a href="PendingRenewals@HokitosDesk.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp;Zone 6 Renewals
            </a>  
            <a href="memEdit@HokitosDesk.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Member Profile
            </a>      
            <a href="designationUpdate@HokitosDesk.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp;Update Designation
            </a>                
            <%
                }
            %>
            <a href="Bifurcation.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Tally Upload
            </a>
            <a href="e503form.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; e503 Form
            </a>
            <a href="e503records.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-user"></i>&nbsp; e503 History
            </a>
            <a href="renewalRequestList.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-floppy-open"></i>&nbsp; Online Renewal Request
            </a>
            <a href="renewalRequestList_processed.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-floppy-open"></i>&nbsp; Online Renewal Processed
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Life - Instalment List
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Instant receipt to Donor
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; My Profile
            </a>
            <a href="#" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Reset Password
            </a>
            <a href="logout.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
                <i class="glyphicon glyphicon-globe"></i>&nbsp; Logout
            </a>
        </div>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div> 
                <span class="navbar-brand pull-left" onclick="openNav()">&#9776;</span>               
                <a href="#"><img alt="The Gideons International" src="./images/GideonsLogo2.png" align="left"  height="50" width="170"  style="padding: 5px;"/></a>
                <a class="btn btn-cust pull-right" href="/logout.jsp"><span title="Logout" class="glyphicon glyphicon-log-out" style="font-size: 15px; vertical-align: middle; color: #ffe114; padding-top: 8px;"></span></a>
            </div>
        </nav>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">   
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm2" method="post" action="designationUpdate@HokitosDesk.jsp">                      
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; S E L E C T &nbsp; C A M P
                                    </h3>
                                </div>

                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="form-row"> 
                                        <div class="form-group col-md-3" id="dupcampslist" hidden>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </span>
                                                <select id="txtcampslist" class="form-control">
                                                    <option value="0">Loading Camps.. Please wait..</option>
                                                </select>
                                            </div>                                             
                                        </div>
                                        <div class="form-group col-md-3" id="orgcampslist">
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </span>
                                                <select name="camp" id="camp" class="form-control">
                                                    <option value="">-- Camp --</option>
                                                </select>
                                            </div>                                             
                                        </div>                                        
                                        <div class="form-group col-md-3">
                                            <div class='input-group'>
                                                <input type="submit" class="btn btn-primary" id="submit-btn" value="Get Records">
                                            </div>                                            
                                        </div>                                         
                                    </div>                                    
                                    <div id="snackbar"></div>
                                </div>
                            </div>
                        </form>

                        <form name="frm_apply" method="post" action="ProcessCampRequest" onsubmit="return validateCheckbox(this)">

                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; C H O O S E &nbsp; R E C O R D 
                                    </h3>
                                </div>

                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="example" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;"><a href="javascript:selectToggle(true, 'frm1');" style="color: #fff;"><b>All</b></a> | <a href="javascript:selectToggle(false, 'frm1');" style="color: #fff;"><b>None</b></a></th><th style="text-align: left;" nowrap>Camp</th>
                                                <th style="text-align: left;" nowrap>State</th>
                                                <th style="text-align: center;" nowrap>ID</th>
                                                <th style="text-align: left;" nowrap>Name</th>
                                                <th style="text-align: left;" nowrap>Mobile</th>                                                
                                                <th style="text-align: left;" nowrap>Email</th>
                                                <th style="text-align: left;" nowrap>Type</th>
                                                <th style="text-align: left;" nowrap>Status</th>  
                                                <th style="text-align: left;" nowrap>Designation</th>  
                                            </tr>
                                        </thead>

                                        <tbody id='mytab' class="table-search"> 
                                            <%
                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();
                                                    Statement st = con.createStatement();
                                                    ResultSet rs = null;
                                                    String v_camp = request.getParameter("camp");
                                                    String sql = "select nvl(state,'NA') state,camp,mid,nvl(phone,'0') mobile,nvl(email,'NA') email,nvl(designation,'Member') designation,mtype,status,name from membership_weekly_raw where upper(camp) = upper('" + v_camp + "') and status in ('Current','Grace') and upper(camp) in (select upper(Camp) from camps_master where sa_no in (11,12,13)) order by mid";

                                                    rs = st.executeQuery(sql);
                                                    while (rs.next()) {

                                            %>
                                            <tr style="vertical-align: middle;">
                                                <td style="text-align: left;" nowrap><input type="checkbox" name="chkApprove" id="chkApprove" value="<%=rs.getString("mid")%>" />&nbsp;&nbsp;&nbsp;<%=rs.getString("mid")%></td>
                                                <td nowrap><input type="hidden" name="camp" id="camp" value="<%=rs.getString("camp")%>" /><%=rs.getString("camp")%></td>
                                                <td nowrap><input type="hidden" name="state_asso" id="state_asso" value="<%=rs.getString("state")%>" /><%=rs.getString("state")%></td>
                                                <td><input type="hidden" name="memid" id="memid" value="<%=rs.getString("mid")%>" /><%=rs.getString("mid")%></td>
                                                <td nowrap><input type="hidden" name="memname" id="memname" value="<%=rs.getString("name")%>" /><%=rs.getString("name")%></td>
                                                <td nowrap><input type="hidden" name="mobile" id="mobile" value="<%=rs.getString("mobile")%>" /><%=rs.getString("mobile")%></td>
                                                <td nowrap><input type="hidden" name="email" id="email" value="<%=rs.getString("email")%>" /><%=rs.getString("email")%></td>
                                                <td nowrap><input type="hidden" name="memtype" id="memtype" value="<%=rs.getString("mtype")%>" /><%=rs.getString("mtype")%></td>
                                                <td><input type="hidden" name="memstatus" id="memstatus" value="<%=rs.getString("status")%>" /><input type="hidden" name="action" id="action" value="designationupdate" /><%=rs.getString("status")%></td>       
                                                <td><input type="hidden" name="old_designation" id="old_designation" value="<%=rs.getString("designation")%>" /><%=rs.getString("designation")%></td>  
                                            </tr>
                                            <%
                                                    }
                                                    rs.close();
                                                    st.close();
                                                    con.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();

                                                }
                                            %>         
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; SELECT DESIGNATION 
                                    </h3>
                                </div>

                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="form-group col-lg-12">     
                                        <div class="form-row">  
                                            <div class="form-group col-md-3" id="dupdesignationlist" hidden>
                                                <label for="paymentdate"> Designation</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <select id="txtdesignatoinlist" class="form-control">
                                                        <option value="0">Loading Designations.. Please wait..</option>
                                                    </select>
                                                </div>                                             
                                            </div>
                                            <div class="form-group col-md-3" id="orgdesignationlist">
                                                <label for="paymentdate"> Designation</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <select name="designation" id="designation" class="form-control">
                                                        <option value="">-- Designation --</option>
                                                    </select>
                                                </div>                                             
                                            </div>   

                                            <div class="form-group col-md-3" hidden>
                                                <label for="paymentdate"> Modified On</label>
                                                <div class='input-group date' id='call_date'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="submitted_on" id="submitted_on" required/>
                                                </div>
                                            </div>  

                                            <div class="form-group col-md-6" hidden>
                                                <label for="paymentdate"> Modified by</label>
                                                <div class='input-group date' id='call_date'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-user"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="submitted_by" id="submitted_by" value="Hokito" required/>
                                                </div>
                                            </div>                                      

                                            <div class="form-group col-md-6">
                                                <label for="trno">Remarks, if any</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-paperclip"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="remarks" id="remarks"/>
                                                </div>                                            
                                            </div>                                       
                                            <div class="form-group col-md-12">
                                                <div id="snackbar1"></div>
                                                <div class='input-group pull-right'>
                                                    <input type="submit" class="btn btn-primary" id="final-submit" value="Submit Form">
                                                </div>                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </form>
                    </div>
                </div>
        </section>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000 !important;">
            <div class="modal-dialog" role="document" style="padding-top: 20px; width: 90%;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <center>
                            <h4 class="modal-title" id="myModalLabel" style="color: #fff;"></h4>
                        </center>
                    </div>  
                    <div class="modal-body" id="res">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                        <i class="glyphicon glyphicon-th"></i>&nbsp; Designation History
                                    </h3>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; font-size: 12px; text-align: left; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="examplei" class="table table-bordered table-responsive table-hover">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: left;" nowrap>Designation</th>
                                                <th style="text-align: left;" nowrap>Old Designation</th>
                                                <th style="text-align: center;" nowrap>Mem ID</th>
                                                <th style="text-align: left;" nowrap>Member Name</th>                                              
                                                <th style="text-align: left;" nowrap>Email Address</th>
                                                <th style="text-align: left;" nowrap>Mobile No</th> 
                                                <th style="text-align: left;" nowrap>Status</th>   
                                                <th style="text-align: left;" nowrap>Membership Type</th>
                                                <th style="text-align: left;" nowrap>Remarks</th> 
                                                <th style="text-align: left;" nowrap>Submitted on</th>  
                                                <th style="text-align: left;" nowrap>Submitted by</th>  
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <div id="snackbar2"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="js/jquery.progressTimer.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script >
                            $('#call_date').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                            $("#call_date").datepicker().datepicker("setDate", new Date());
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#example').DataTable({
                    responsive: true,
                    stateSave: true,
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
                        'pageLength'
                    ]
                });

            });
        </script>

        <script>
            $(document).on('click', '.editRow', function () {
                var memid = $(this).attr('value');

                table = $('#examplei').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 15px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'frtip',
                    ajax: {
                        method: "POST",
                        url: 'GetMembershipData?action=designationupdate&memid=' + memid,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "designation"},
                        {"data": "old_designation"},
                        {"data": "memid"},
                        {"data": "memname"},
                        {"data": "email"},
                        {"data": "mobile"},
                        {"data": "memtype"},
                        {"data": "memstatus"},
                        {"data": "remarks"},
                        {"data": "submitted_on"},
                        {"data": "submitted_by"}
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
        <script>
            $("#final-submit").click(function () {
                var camp = $("#camp").val();
                camp = camp.trim();
                var state_asso = $("#state_asso").val();
                state_asso = state_asso.trim();
                var memid = $("#memid").val();
                memid = memid.trim();
                var memname = $("#memname").val();
                memname = memname.trim();
                var memtype = $("#memtype").val();
                memtype = memtype.trim();
                var memstatus = $("#memstatus").val();
                memstatus = memstatus.trim();
                var email = $("#email").val();
                email = email.trim();
                var mobile = $("#mobile").val();
                mobile = mobile.trim();
                var submitted_on = $("#submitted_on").val();
                submitted_on = submitted_on.trim();
                var call_status = $("#call_status").val();
                call_status = call_status.trim();
                var remarks = $("#remarks").val();
                remarks = remarks.trim();
                var designation = $("#designation").val();
                designation = designation.trim();
            });
        </script> 
        <script type="text/javascript">
            $('#camp, #designation').select2({
                width: '100%'
            });
        </script>
    </body>
</html>


