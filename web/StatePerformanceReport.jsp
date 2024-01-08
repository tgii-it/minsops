<%@page import="java.text.DecimalFormat"%>
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
    String v_sa_no = request.getParameter("StateAsso");
    String v_sa_display = "SA " + request.getParameter("StateAsso");
    if (v_sa_no
            == null) {
        v_sa_no = "";
    }
    String sql1 = "";
    String report_as_on = "";
    DataSource ds = null;
    Connection conn = null;
    Statement stmt = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        conn = ds.getConnection();
        stmt = conn.createStatement();
        sql1 = "SELECT date_time FROM REPORT_GENERATED_LOG WHERE id in (select max(id) from REPORT_GENERATED_LOG) ORDER BY ID DESC";
        ResultSet resultSet = stmt.executeQuery(sql1);
        while (resultSet.next()) {
            report_as_on = resultSet.getString("date_time");
            if (report_as_on == null) {
                report_as_on = "Area Total";
            }
        }
        resultSet.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGI India | State Performance Reports</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.3.1/css/fixedColumns.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"> 
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">        
        <link href="css/styleAddl.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;" > 
        <%@ include file="menu.jsp" %>
        <section class="container-fluid" style="padding: 60px 2px;" >
            <div class='panel panel-default panel-accent-gold'>
                <div class="panel-heading" style="background-color: #fff;">
                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                        <i class="fa fa-fw fa-share"></i>&nbsp; <%=v_sa_display%> Performance Report
                    </h3>
                </div>
                <div class="panel-body" style="padding-top: 10px; width: 100%"> 
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2022-23">2022 - 23</a></li>
                        <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2021-22">2021 - 22</a></li>
                        <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2020-21">2020 - 21</a></li>
                        <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#PY2019-20">2019 - 20</a></li>
                        <li class="dropdown"><a href="#detailed_tab" style="font-size: 12px; font-weight: bold;" class="dropdown-toggle" data-toggle="tab dropdown">Download &nbsp; <span class="caret"></span></a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="DownloadStatePerformanceSummaryReport_2022_23.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2022-23 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2022_23.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2022-23 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2022_23.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2022-23 In-Active Camps Report</a></li>
                                <li class="divider"></li>
                                <li><a href="DownloadStatePerformanceSummaryReport_2021_22.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2021-22 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2021_22.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2021-22 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2021_22.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2021-22 In-Active Camps Report</a></li>
                                <li class="divider"></li>
                                <li><a href="DownloadStatePerformanceSummaryReport_2020_21.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2020-21 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2020_21.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2020-21 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2020_21.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2020-21 In-Active Camps Report</a></li>
                                <li class="divider"></li>
                                <li><a href="DownloadStatePerformanceSummaryReport_2019_20.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2019-20 Summary Report</a></li>
                                <li><a href="DownloadStatePerformanceDetailedReport_2019_20.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2019-20 Detailed Report</a></li>
                                <li><a href="DownloadStatePerformanceInactiveDetailedReport_2019_20.jsp?StateAsso=<%=v_sa_no%>&exportToExcel=YES">2019-20 In-Active Camps Report</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="PY2022-23" class="tab-pane fade in active">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2022-23">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2022-23">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2022-23">In-Active</a></li>
                            </ul>
                            <!--<p style="padding-left: 10px; font-size: 18px; margin-top:30px; margin-bottom: 30px; color: red;"><b>Note : PY 2021-22 closing in progress.</b><br><br><font style="color: #01354a; font-size: 14px;">New (PY 2022-23) reports may be available from 06<sup>th</sup> June 2022.</font><br><br><font style="color: blue; font-weight: bold; font-size: 14px;">Click 2021-22 to view Current Performance Year Reports</font></p>-->
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: blue;"><b>Note :</b> This report is as on <%= report_as_on%></p>
                            <div class="tab-content">
                                <div id="s2022-23" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="5"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>                                      
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camps</th>  

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Received</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>EMI</th>   

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AME+Field)</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--  <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                      <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>  -->

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                                    <th style="text-align: left;  background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Auxiliary Area Director</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Received</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>      
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>EMI</th>     

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AMD+Field)</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>                                  

                                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--  <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                      <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>   -->                                   

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead>
                                            <%
                                                String display_sa = "";
                                                String sql = "";
                                                String Area_Director = "";
                                                String Aux_Area_Director = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    DecimalFormat f = new DecimalFormat("##");
                                                    sql = "select no_of_camps,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo, "
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            // + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed1/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            //  + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Area_Director,"
                                                            + "Get_Aux_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Aux_Area_Director,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_SUMMARY_REPORT_C_2022_23 a where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";
                                                    //    System.out.println("State Performance Summary Report " + sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");
                                                        Aux_Area_Director = resultSet.getString("Aux_Area_Director");
                                                        double gytr = resultSet.getInt("gid_ytr");
                                                        double aytr = resultSet.getInt("aux_ytr");
                                                        double tgideon = resultSet.getInt("Total_Gideon");
                                                        double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                                        double tgytr = (tgideon - gytr);
                                                        double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                                        double taux = resultSet.getInt("Total_Auxiliary");
                                                        double taytr = (taux - aytr);
                                                        double pgytr = 0;
                                                        double paytr = 0;

                                                        if (tgid_goal != 0) {
                                                            pgytr = 100 * (tgytr / tgid_goal);
                                                        }
                                                        if (taux_goal != 0) {
                                                            paytr = 100 * (taytr / taux_goal);
                                                        }
                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }
                                                        if (Aux_Area_Director == null || Aux_Area_Director == "") {
                                                            Aux_Area_Director = "-";
                                                        }
                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp;(C)&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_emi")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                              <!--  <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> -->
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>
                                                <td  nowrap><%=Aux_Area_Director%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_emi")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                            <!--    <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> -->
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%   }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                                              
                                    </div>
                                </div>
                                <div id="d2022-23" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="6"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>                                                         
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp_Name</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Status</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Metro</th> 

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Received</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>EMI</th> 
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AME+Field)</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--   <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                       <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> --> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Received</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>      
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>EMI</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AMD+Field)</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>
                                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--   <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                       <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>     --> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead> 
                                            <%
                                                String display_camp = "";
                                                display_sa = "";
                                                String camp_status = "";
                                                String camp_type = "";
                                                sql = "";
                                                DecimalFormat f = new DecimalFormat("##");
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select (select status from camps_master where upper(camp)=upper(a.camp)) camp_status,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                                            + "(select decode(type,'EM','Emerging Metro','RG','ReGrow Metro','RV','Revive Metro','METRO','Metro','','--') from camps_master where upper(camp)=upper(a.camp)) camp_type,"
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            //  + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when (Aux_Renewed1>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed1/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            // + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_Detailed_Report_22_23fa a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',a.region)>0 order by sa_no,a.region,area,camp";
                                                    //     System.out.println("State Detailed Report " + sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        camp_status = resultSet.getString("camp_status");
                                                        camp_type = resultSet.getString("camp_type");
                                                        double gytr = resultSet.getInt("gid_ytr");
                                                        double aytr = resultSet.getInt("aux_ytr");
                                                        double tgideon = resultSet.getInt("Total_Gideon");
                                                        double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                                        double tgytr = (tgideon - gytr);
                                                        double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                                        double taux = resultSet.getInt("Total_Auxiliary");
                                                        double taytr = (taux - aytr);
                                                        double pgytr = 0;
                                                        double paytr = 0;
                                                        if (tgid_goal != 0) {
                                                            pgytr = 100 * (tgytr / tgid_goal);
                                                        }
                                                        if (taux_goal != 0) {
                                                            paytr = 100 * (taytr / taux_goal);
                                                        }

                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (camp_status == null) {
                                                            camp_status = "--";
                                                        }
                                                        if (camp_type == null) {
                                                            camp_type = "--";
                                                        }
                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td  nowrap><%=camp_status%></td>
                                                <td  nowrap><%=camp_type%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                              <!--  <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> -->
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_emi")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                             <!--   <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> -->
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2022-23" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>   

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>( A + B )</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>     
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>( A + B )</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>                                    

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Per %</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select (nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed1/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,"
                                                            + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,"
                                                            + "round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,"
                                                            + "round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,"
                                                            + "round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,"
                                                            + "round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_INACTIVE_REPORT_C_2022_23 a where 1=2 and sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";
                                                    //    System.out.println(sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>


                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>                                                

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%   }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>                                        
                            </div>
                        </div>
                        <!-- 2021 - 22 Performance year report -->
                        <div id="PY2021-22" class="tab-pane fade">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2021-22">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2021-22">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2021-22">In-Active</a></li>
                            </ul>
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: blue;"><b>Note :</b> This report is as on <%= report_as_on%></p>
                            <div class="tab-content">
                                <div id="s2021-22" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="5"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>                                      
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camps</th>  

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance
                                                    </th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Received</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>EMI</th>   

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AME+Field)</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--  <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                      <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>  -->

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                                    <th style="text-align: left;  background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Auxiliary Area Director</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Received</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>      
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>EMI</th>     

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AMD+Field)</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>                                  

                                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--  <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                      <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>   -->                                   

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead>
                                            <%

                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();

                                                    sql = "select no_of_camps,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo, "
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            // + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed1/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            //  + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Area_Director,"
                                                            + "Get_Aux_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Aux_Area_Director,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_SUMMARY_REPORT_C_2021_22  a where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";
                                                    //    System.out.println("State Performance Summary Report " + sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");
                                                        Aux_Area_Director = resultSet.getString("Aux_Area_Director");

                                                        double gytr = resultSet.getInt("gid_ytr");
                                                        double aytr = resultSet.getInt("aux_ytr");
                                                        double tgideon = resultSet.getInt("Total_Gideon");
                                                        double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                                        double tgytr = (tgideon - gytr);
                                                        double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                                        double taux = resultSet.getInt("Total_Auxiliary");
                                                        double taytr = (taux - aytr);

                                                        double pgytr = 0;
                                                        double paytr = 0;

                                                        if (tgid_goal != 0) {
                                                            pgytr = 100 * (tgytr / tgid_goal);
                                                        }
                                                        if (taux_goal != 0) {
                                                            paytr = 100 * (taytr / taux_goal);
                                                        }

                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }

                                                        if (Aux_Area_Director == null || Aux_Area_Director == "") {
                                                            Aux_Area_Director = "-";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp;(C)&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_emi")%></td>                                 

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                              <!--  <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td  nowrap><%=Aux_Area_Director%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_emi")%></td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                            <!--    <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                                              
                                    </div>
                                </div>

                                <div id="d2021-22" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="6"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>                                                         
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp_Name</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Status</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Metro</th> 

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Received</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>EMI</th>   

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AME+Field)</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--   <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                       <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> --> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total Events</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Received</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>      
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>EMI</th>     

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual<br>(PSU+AMD+Field)</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>(A)</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>(B)</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>(A+B)</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>                                  

                                                    <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Dropped</th>           
                                                    <!--   <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                                       <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th>     -->                                 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead> 
                                            <%
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select (select status from camps_master where upper(camp)=upper(a.camp)) camp_status,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                                            + "(select decode(type,'EM','Emerging Metro','RG','ReGrow Metro','RV','Revive Metro','METRO','Metro','','--') from camps_master where upper(camp)=upper(a.camp)) camp_type,"
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            //  + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when (Aux_Renewed1>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed1/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            // + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_Detailed_Report_21_22fa a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',a.region)>0 order by sa_no,a.region,area,camp";
                                                    //     System.out.println("State Detailed Report " + sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        camp_status = resultSet.getString("camp_status");
                                                        camp_type = resultSet.getString("camp_type");

                                                        double gytr = resultSet.getInt("gid_ytr");
                                                        double aytr = resultSet.getInt("aux_ytr");
                                                        double tgideon = resultSet.getInt("Total_Gideon");
                                                        double tgid_goal = resultSet.getInt("Memberships_Gideon_Goal");
                                                        double tgytr = (tgideon - gytr);
                                                        double taux_goal = resultSet.getInt("Memberships_Aux_Goal");
                                                        double taux = resultSet.getInt("Total_Auxiliary");
                                                        double taytr = (taux - aytr);

                                                        double pgytr = 0;
                                                        double paytr = 0;

                                                        if (tgid_goal != 0) {
                                                            pgytr = 100 * (tgytr / tgid_goal);
                                                        }
                                                        if (taux_goal != 0) {
                                                            paytr = 100 * (taytr / taux_goal);
                                                        }

                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }
                                                        if (camp_status == null) {
                                                            camp_status = "--";
                                                        }
                                                        if (camp_type == null) {
                                                            camp_type = "--";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td  nowrap><%=camp_status%></td>
                                                <td  nowrap><%=camp_type%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_emi")%></td>                                 

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                              <!--  <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_emi")%></td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>  

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                             <!--   <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>&nbsp;%</td> -->

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2021-22" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                                    <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                                    <th style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                                                </tr>
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                                    <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>   

                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                                    <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Goal</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Actual</th>   
                                                    <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>( A + B )</th> 
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-transit)</th>  
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>     
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>( A + B )</th>                    
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>                                    

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th> 
                                                    <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Per %</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select (nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed1/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,"
                                                            + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed1/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,"
                                                            + "round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,"
                                                            + "round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,"
                                                            + "round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,"
                                                            + "round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_INACTIVE_REPORT_C_2021_22_09June2022_final_2021_22 a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";
                                                    System.out.println(sql);
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>


                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>                                    
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>&nbsp;%</td>                                                

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 2020 - 21 Performance year report -->
                        <div id="PY2020-21" class="tab-pane fade">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2020-21">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2020-21">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2020-21">In-Active</a></li>
                            </ul>
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: #337ab7;"><b>Note :</b> Final report of PY 2020-21</p>
                            <div class="tab-content">
                                <div id="s2020-21" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead>
                                            <%
                                                display_sa = "";
                                                sql = "";
                                                Area_Director = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select no_of_camps,"
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            // + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            //  + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Area_Director,"
                                                            + "Get_Aux_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0','Inactive Camps','0','PWT SF','0','SA_Suspense','0','Total','0',region)),to_number(decode(area,'Region_Total','0','-','0','-','0',area))) Aux_Area_Director,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_SUMMARY_REPORT_C_2020_21_FINAL  a where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");

                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp(C)&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="d2020-21" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: scenter; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select "
                                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,"
                                                            + "round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,"
                                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            //  + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when (Aux_Renewed>0 and Memberships_Aux_Op_Bal>0) then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            // + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_DETAILED_REPORT_20_21FA_FINAL a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',a.region)>0 order by sa_no,a.region,area,camp";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2020-21" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();

                                                    sql = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,"
                                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,"
                                                            + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                                            + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                                            + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,"
                                                            + "round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,"
                                                            + "round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,"
                                                            + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,"
                                                            + "round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,"
                                                            + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,"
                                                            + "round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                                            + "a.* from STATE_INACTIVE_REPORT_C_2020_21_FINAL a "
                                                            + "where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 2019 - 20 Performance year report -->
                        <div id="PY2019-20" class="tab-pane fade">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#s2019-20">Summary</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#d2019-20">Detailed</a></li>
                                <li><a data-toggle="tab" style="font-size: 12px; font-weight: bold;" href="#i2019-20">In-Active</a></li>
                            </ul>
                            <p style="padding-left: 10px; font-size: 12px; margin-top:10px; color: #337ab7;"><b>Note :</b> Final report of PY 2019-20</p>
                            <div class="tab-content">
                                <div id="s2019-20" class="tab-pane fade in active">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="summary" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area Director</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead>
                                            <%
                                                display_sa = "";
                                                sql = "";
                                                Area_Director = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select * from State_Performance_Report_S_19 where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area";
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        Area_Director = resultSet.getString("Area_Director");

                                                        if (Area_Director == null || Area_Director == "") {
                                                            Area_Director = "NA";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp(C)&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=Area_Director%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="d2019-20" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="detailed" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select * from State_Performance_Report_D_19 "
                                                            + "where sa_no='" + v_sa_no + "' and decode(region,'SA_Total','94','Inactive Camps','95','PWT SF','96','SA_Suspense','97','Total','98',region)>0 order by sa_no,region,area,camp";

                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                                <div id="i2019-20" class="tab-pane fade">
                                    <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 600px; background-color: #fff; overflow-y: scroll;">
                                        <table id="inactive" class="table table-bordered table-responsive table-hover">
                                            <thead style="background-color: #01354a; color: #ffe114;">   
                                                <tr>
                                                    <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                                    <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                                    <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                                    <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                                    <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                                    <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                                    <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                                </tr>                                                          
                                                <tr>                                               
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                                    <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                        
                                                    <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>  

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                                    <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>  
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net Gideons</th>                   
                                                    <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>              
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Event</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CD 100</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SPLO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFO</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NCC</th>
                                                    <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SCC</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Life<br>A</th>                              
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Annual<br>B</th>           
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net Auxiliary</th>                   
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>

                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>SF Actual</th> 
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Aux Luncheon</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart Fund</th>  
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                                    <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                                    <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                                </tr>
                                            </thead> 
                                            <%
                                                display_camp = "";
                                                display_sa = "";
                                                sql = "";
                                                try {
                                                    conn = ds.getConnection();
                                                    stmt = conn.createStatement();
                                                    sql = "select * from State_Performance_Report_IA_19 a where sa_no='" + v_sa_no + "' order by sa_no,a.region,area,camp";
                                                    ResultSet resultSet = stmt.executeQuery(sql);
                                                    while (resultSet.next()) {
                                                        display_sa = resultSet.getString("sa_no");
                                                        display_camp = resultSet.getString("camp");
                                                        if (display_camp == null) {
                                                            display_camp = "Area Total";
                                                        }

                                                        if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                                            %>
                                            <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                                %>
                                            <tr style="background-color: #ffe8e7; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                                %>
                                            <tr style="background-color: #fff6f6; font-weight: bold; font-size: 12px; color: navy;">
                                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 12px; color: navy;" hidden>
                                                <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                                                <%
                                                } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                                %>
                                            <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                                <%
                                                } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                                %>
                                            <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                                <%                    } else {
                                                %>
                                            <tr>
                                                <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                                <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                                <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                                <td  nowrap><%=display_camp%></td>
                                                <%
                                                    }
                                                %>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>&nbsp;%</td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>&nbsp;%</td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>&nbsp;%</td>

                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>&nbsp;%</td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                                <td style="text-align: center;" nowrap>&nbsp;</td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>&nbsp;%</td>

                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>&nbsp;%</td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                            </tr>
                                            <%
                                                    }
                                                    resultSet.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </table>                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <!--<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>-->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#summary,#detailed').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
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