<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<%  String username = "";
    String useraccessname = "";
    String useraccessno = "";
    String camp = request.getParameter("camp");
    if (camp == null) {
        camp = "";
    }
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
    }

    String v_camp = request.getParameter("camp");
    if (v_camp == null) {
        v_camp = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Members and Officer List</title>    
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
        <script>
            $(document).on('click', '.submit-btn', function (e) {

                if (frm2.sa_no.value === "" && frm2.sa_no.value === 0)
                {
                    alert("Please Select The State Association");
                    sa_no.fdate.focus();
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
            <form name="frm2" method="post" action="memList.jsp">                      
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                            <i class="fa fa-fw fa-share"></i>&nbsp; SELECT &nbsp; CAMP
                        </h3>
                    </div>
                    <div class="panel-body" style="padding-top: 20px;"> 
                        <div class="form-row">                                       
                            <div class="form-group col-md-3">
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
                                            name_sql = "select distinct camp from camps_master where status in ('Active','In-Active') order by camp";

                                            ResultSet resultSet = statement.executeQuery(name_sql);
                                    %>
                                    <input name="camp" list="oName" class="form-control" id="camp" value="<%= v_camp%>" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
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
                                <div class='input-group'>
                                    <input type="submit" class="btn btn-primary" id="submit-btn" value="Get Records">
                                </div>                                            
                            </div>                                         
                        </div>                                    
                        <div id="snackbar"></div>
                    </div>
                </div>
            </form>
            <form name="frm_apply" method="post" >
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; etter-spacing: 3px;">
                            <i class="fa fa-fw fa-share"></i>&nbsp; <%= camp%> &nbsp;Camp Officers
                        </h3>
                    </div>
                    <div class="table-responsive" style="vertical-align: middle; width: 100%;  padding: 5px;">
                        <table id="comp_table1" class="table table-bordered table-responsive table-hover" style="width:100%; font-size: 10px; color: navy; ">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr> 
                                    <th style="text-align: center;" nowrap>Zone</th> 
                                    <th style="text-align: left;" nowrap>State Association</th>                                         
                                    <th style="text-align: left;" nowrap>Geo State</th>          
                                    <th style="text-align: center;" nowrap>Region</th>   
                                    <th style="text-align: center;" nowrap>Area</th>   
                                    <th style="text-align: left;" nowrap>Designation</th>
                                    <th style="text-align: left;" nowrap>Name</th> 
                                    <th style="text-align: left;" nowrap>Status</th> 
                                    <th style="text-align: left;" nowrap>Phone</th>
                                    <th style="text-align: left;" nowrap> Mobile</th>
                                    <th style="text-align: left;" nowrap>Email</th>                                    
                                    <th style="text-align: left;" nowrap>Camp</th>
                                    <th style="text-align: left;" nowrap>MID</th>                                    
                                    <th style="text-align: left;" nowrap>Member Since</th>                                    
                                    <th style="text-align: left;" nowrap>Start Date</th>
                                    <th style="text-align: left;" nowrap>End Date</th>
                                    <th style="text-align: left;" nowrap>Address</th>
                                </tr>
                            </thead> 
                            <%
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                try {
                                    con = ds.getConnection();
                                    String sql = "";
                                    String member_since = "";
                                    String dob = "";
                                    String life_start_date = "";
                                    String annual_end_date = "";
                                    String annual_start_date = "";
                                    String deceased_date = "";
                                    Statement statement = con.createStatement();
                                    sql = "Select NAME,DESIGNATION,to_char(annual_end_date,'DD-MON-YY') annual_end_date,to_char(annual_start_date,'DD-MON-YY') annual_start_date, to_char(life_start_date,'DD-MON-YY') life_start_date,to_char(dob,'DD-MON-YY') dob,to_char(member_since,'DD-MON-YY') member_since,nvl(state,'0') state,nvl(phone,'0') phone,nvl(address,'NA') address,nvl(address2,'NA') address2,status,nvl(street,'NA') street,nvl(city,'NA') city,nvl(state,'NA') state,nvl(pincode,'0') pincode,nvl(mobile2,'0') mobile2,nvl(email,'NA') email,camp,mid,CARS_GET_STATEASSO(CAMP) state_asso,"
                                                                                        + "CARS_GET_ZONE(CAMP) zone,"
                                            + "CARS_GET_REGION(CAMP) region, CARS_GET_AREA(CAMP) area from membership_weekly_raw where Upper(designation) like 'CAMP%' and upper(camp)=upper('" + camp + "')";
                                    System.out.println(sql);
                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                        member_since = resultSet.getString("member_since");
                                        dob = resultSet.getString("dob");
                                        life_start_date = resultSet.getString("life_start_date");
                                        annual_end_date = resultSet.getString("annual_end_date");
                                        annual_start_date = resultSet.getString("annual_start_date");
                                        if (member_since == null) {
                                            member_since = "-";
                                        }
                                        if (dob == null) {
                                            dob = "-";
                                        }
                                        if (life_start_date == null) {
                                            life_start_date = "";
                                        }
                                        if (annual_end_date == null) {
                                            annual_end_date = "-";
                                        }
                                        if (annual_start_date == null) {
                                            annual_start_date = "";
                                        }
                                        if (deceased_date == null) {
                                            deceased_date = "-";
                                        }
                            %>
                            <tr>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("zone")%></td>        
                                <td style="text-align: left;" nowrap><%=resultSet.getString("state_asso")%></td>                                  
                                <td style="text-align: left;" nowrap><%=resultSet.getString("state")%></td>                            
                                <td style="text-align: center;" nowrap><%=resultSet.getString("region")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("area")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("designation")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("name")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("status")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("phone")%></td>       
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mobile2")%></td>  
                                <td style="text-align: left;" nowrap><%=resultSet.getString("email")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("camp")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mid")%></td>
                                <td style="text-align: left;" nowrap><%=member_since%></td>
                                <td style="text-align: left;" nowrap><%=life_start_date%>&nbsp; <%=annual_start_date%></td>
                                <td style="text-align: left;" nowrap><%=annual_end_date%></td>                                
                                <td style="text-align: left;" nowrap><%=resultSet.getString("address")%>&nbsp; &nbsp; <%=resultSet.getString("address2")%>&nbsp; &nbsp; <%=resultSet.getString("street")%>&nbsp; &nbsp; <%=resultSet.getString("city")%>&nbsp; &nbsp; <%=resultSet.getString("state")%>&nbsp; &nbsp; -&nbsp; &nbsp; <%=resultSet.getString("pincode")%></td>

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
            <form name="frm_apply" method="post" >
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                            <i class="fa fa-fw fa-share"></i>&nbsp;<%= camp%> &nbsp;Camp Members
                        </h3>
                    </div>
                    <div class="table-responsive" style="vertical-align: middle; width: 100%;  padding: 5px;">
                        <table id="comp_table" class="table table-bordered table-responsive table-hover" style="width:100%; font-size: 10px; color: navy; ">
                            <thead style="background-color: #01354a; color: #ffe114;">
                                <tr> 
                                    <th style="text-align: center;" nowrap>Zone</th>  
                                    <th style="text-align: left;" nowrap>State Association</th>                                         
                                    <th style="text-align: center;" nowrap>Region</th>                                       
                                    <th style="text-align: center;" nowrap>Area</th>  
                                    <th style="text-align: left;" nowrap>Camp</th>   
                                    <th style="text-align: center;" nowrap>MID</th>
                                    <th style="text-align: left;" nowrap>Name</th> 
                                    <th style="text-align: left;" nowrap> Member Type</th>
                                    <th style="text-align: left;" nowrap> Member Status</th>
                                    <th style="text-align: left;" nowrap>Member Since</th>                                    
                                    <th style="text-align: left;" nowrap>Start Date</th>
                                    <th style="text-align: left;" nowrap>End Date</th>
                                    <th style="text-align: left;" nowrap>Address</th>
                                    <th style="text-align: left;" nowrap>Mobile</th>
                                    <th style="text-align: left;" nowrap>Email</th>
                                    <th style="text-align: left;" nowrap>Designation</th>
                                    <th style="text-align: left;" nowrap>DOB</th>
                                    <th style="text-align: left;" nowrap>Deceased Date(If any)</th>
                                    <th style="text-align: left;" nowrap>Church</th>                                      
                                    <th style="text-align: left;" nowrap>Pastor</th>
                                    <th style="text-align: left;" nowrap>Qualification</th>
                                    <th style="text-align: left;" nowrap>Job Title</th>
                                    <th style="text-align: left;" nowrap>Source of Application</th>
                                    <th style="text-align: left;" nowrap>State / Field Officer Name</th>
                                </tr>
                            </thead> 
                            <%
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                try {
                                    con = ds.getConnection();
                                    String sql = "";
                                    String member_since = "";
                                    String dob = "";
                                    String life_start_date = "";
                                    String annual_end_date = "";
                                    String annual_start_date = "";
                                    String deceased_date = "";
                                    Statement statement = con.createStatement();
                                    sql = "select nvl(camp,'NA') camp,cars_get_Stateasso(CAMP) state_asso,nvl(status,'NA') status,"
                                            + "nvl(cred_nfr_res_per_state,'NA') cred_nfr_res_per_state, nvl(pastor_mobile,'0') pastor_mobile,"
                                            + "nvl(state_officer_name,'NA') state_officer_name,nvl(field_officer_name,'NA') field_officer_name,"
                                            + "nvl(source_of_application,'NA') source_of_application,nvl(job_title,'NA') job_title,nvl(qualification,'0') qualification,"
                                            + "nvl(pastor_remarks,'NA') pastor_remarks,nvl(pastor_name,'NA') pastor_name,nvl(pastor_email,'NA') pastor_email,"
                                            + "nvl(cmobile,'0') cmobile,nvl(cemail,'NA') cemail,nvl(church,'NA') church,nvl(caddress,'NA')caddress,  nvl(mid,'0') mid,"
                                            + "deceased_date,nvl(gender,'NA') gender,nvl(preferred_language,'NA') preferred_language,nvl(email,'NA') email, "
                                            + "nvl(mtype,'NA') mtype,to_char(annual_end_date,'DD-MON-YY') annual_end_date,to_char(annual_start_date,'DD-MON-YY') annual_start_date, "
                                            + "to_char(life_start_date,'DD-MON-YY') life_start_date,to_char(dob,'DD-MON-YY') dob,to_char(member_since,'DD-MON-YY') member_since, "
                                            + "nvl(designation,'NA') designation, nvl(phone,'0') phone, nvl(mobile2,'0') mobile2, nvl(mobile3,'0') mobile3,"
                                            + "nvl(address2,'NA') address2, nvl(street,'NA') street, "
                                                                                        + "cars_get_zone(CAMP) zone, "
                                            + "nvl(city,'NA') city, "
                                            + "CARS_GET_REGION(CAMP) region, CARS_GET_AREA(CAMP) area, nvl(name,'NA') name,nvl(address,'NA') address, nvl(state,'0') state, nvl(pincode,'0') pincode "
                                            + "from membership_weekly_raw where upper(camp) in (select upper(Camp) from camps_master where upper(camp)=upper('" + camp + "') and  status in ('Active','In-Active') )";
                                    System.out.println(sql);
                                    ResultSet resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                                        member_since = resultSet.getString("member_since");
                                        dob = resultSet.getString("dob");
                                        life_start_date = resultSet.getString("life_start_date");
                                        annual_end_date = resultSet.getString("annual_end_date");
                                        annual_start_date = resultSet.getString("annual_start_date");
                                        if (member_since == null) {
                                            member_since = "-";
                                        }
                                        if (dob == null) {
                                            dob = "-";
                                        }
                                        if (life_start_date == null) {
                                            life_start_date = "";
                                        }
                                        if (annual_end_date == null) {
                                            annual_end_date = "-";
                                        }
                                        if (annual_start_date == null) {
                                            annual_start_date = "";
                                        }
                                        if (deceased_date == null) {
                                            deceased_date = "NA";
                                        }

                            %>
                            <tr>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("zone")%></td>  
                                <td style="text-align: left;" nowrap><%=resultSet.getString("state_asso")%></td>                                  
                                <td style="text-align: left;" nowrap><%=resultSet.getString("region")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("area")%></td>                                
                                <td style="text-align: left;" nowrap><%=resultSet.getString("camp")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("mid")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("name")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("mtype")%></td>       
                                <td style="text-align: left;" nowrap><%=resultSet.getString("status")%></td>  
                                <td style="text-align: left;" nowrap><%=member_since%></td>
                                <td style="text-align: left;" nowrap><%=life_start_date%>&nbsp; <%=annual_start_date%></td>
                                <td style="text-align: left;" nowrap><%=annual_end_date%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("address")%>&nbsp; &nbsp; <%=resultSet.getString("address2")%>&nbsp; &nbsp; <%=resultSet.getString("street")%>&nbsp; &nbsp; <%=resultSet.getString("city")%>&nbsp; &nbsp; <%=resultSet.getString("state")%>&nbsp; &nbsp; -&nbsp; &nbsp; <%=resultSet.getString("pincode")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("phone")%>&nbsp; &nbsp; <%=resultSet.getString("mobile2")%>&nbsp; &nbsp; <%=resultSet.getString("mobile3")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("email")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("designation")%></td>
                                <td style="text-align: left;" nowrap><%=dob%></td>                                 
                                <td style="text-align: left;" nowrap><%=deceased_date%></td> 
                                <td style="text-align: left;" nowrap><%=resultSet.getString("church")%><%=resultSet.getString("caddress")%><%=resultSet.getString("cemail")%><%=resultSet.getString("cmobile")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("pastor_name")%><%=resultSet.getString("pastor_email")%><%=resultSet.getString("pastor_mobile")%><%=resultSet.getString("pastor_remarks")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("qualification")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("job_title")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("source_of_application")%></td>
                                <td style="text-align: left;" nowrap><%=resultSet.getString("cred_nfr_res_per_state")%></td>
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
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#comp_table1').DataTable({
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