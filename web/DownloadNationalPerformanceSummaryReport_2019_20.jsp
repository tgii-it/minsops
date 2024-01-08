<%-- 
    Document   : DownloadNationalPerformanceSummaryReport_2019_20
    Created on : 04-Nov-2020, 6:20:17 am
    Author     : TGII_WORKSTATION
--%>

<%@page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String get_date = "";
    String filename = "";
    DataSource ds = null;
    Connection conn = null;
    ResultSet result = null;
    Statement stmt = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        conn = ds.getConnection();
        stmt = conn.createStatement();
        get_date = "select to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YY HH:MI:SS AM') downloaded_on from dual";
        ResultSet resultSet = stmt.executeQuery(get_date);
        while (resultSet.next()) {
            filename = "National Performance Report " + resultSet.getString("downloaded_on") + ".xls";
        }
        resultSet.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    String exportToExcel = request.getParameter("exportToExcel");
    if (exportToExcel
            != null && exportToExcel.toString()
                    .equalsIgnoreCase("YES")) {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename=" + filename);
    }
%>
<html>
    <body>
        <div id="container">
            <div id="content">
                <div class="table-responsive" style="vertical-align: middle; background-color: #fff;">
                    <table id="summary" class="table table-bordered table-responsive table-hover" border="1">
                        <thead style="background-color: #01354a; color: #ffe114;">  
                            <tr>
                                <th colspan="85" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>2019-20 : NATIONAL PERFORMANCE REPORT</B></h3></th>
                            </tr>  
                            <tr>
                                <th style="background-color: #ededff; border-color: #fff; color: #01354a;" hidden>&nbsp;</th>
                                <th colspan="2" style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Scripture Fund</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                            </tr>                                                          
                            <tr>    
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" hidden>Sl_No</th>
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Zone</th>
                                <th style="text-align: right; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>State<br>Association</th>  

                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>SD Goal</th> 
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals<br>(Shipped +<br>In-Transit)</th>  
                                <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>SD<br>%</th>

                                <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Gideon<br>PWT<br>Goal</th>
                                <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Gideon<br>PWT<br>Actual</th>  
                                <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Gideon<br>PWT<br>%</th>

                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2019</th> 
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>    
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Goal</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Life<br><br>A</th>                              
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Annual<br><br>B</th>           
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>( A + B )</th>                   
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>%</th> 

                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Scripture_Fund<br>Actual<br>A</th> 
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Scripture_Fund<br>Suspense<br>B</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;">PWT<br>Scripture_Fund<br>C</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Total<br>Scripture_Fund<br>( A + B + C )</th> 
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Scripture_Fund<br>Goal</th> 
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>SF %</th> 
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NoC_Actual</th>              
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NoC_Goal</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>NoC %</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CRO_Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CRO_Goal</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CRO %</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>GCBP_Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>GCBP_Goal</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>GCBP %</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Events #</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB_Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB_Goal</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB %</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Events #</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFR_Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFR_Goal</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFR %</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFG_Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFG_Goal</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFG %</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>C D 100</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>F F O</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SD<br>Goal</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actuals<br>(Shipped +<br>In-Transit)</th>  
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SD %</th>

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2019</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>     
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Renewals<br>%</th>  
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Goal</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>%</th> 
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Life<br>A</th>                              
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Annual<br>B</th>           
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>( A + B )</th>                   
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>                        
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>%</th>

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SF<br>Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SF<br>Actual</th> 
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SF %</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>FFA_Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>FFA_Actual</th>
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>FFA %</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Luncheon</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart_Fund</th>  
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>PWT<br>Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>PWT<br>Actual</th>
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>PWT%</th> 
                            </tr>
                        </thead>
                        <%
                            String sql = "";
                            String display_sa = "";
                            String display_zone = "";
                            int slno = 0;
                            try {
                                conn = ds.getConnection();
                                stmt = conn.createStatement();
                                sql = "select * from National_Performance_Report_19 order by zone,sa_no";
                                ResultSet resultSet = stmt.executeQuery(sql);
                                while (resultSet.next()) {
                                    display_sa = resultSet.getString("sa_no");
                                    slno = resultSet.getInt("slno");

                                    if (display_sa.equalsIgnoreCase("1")) {
                                        display_sa = "S A - 1";
                                    } else if (display_sa.equalsIgnoreCase("2")) {
                                        display_sa = "S A - 2";
                                    } else if (display_sa.equalsIgnoreCase("3")) {
                                        display_sa = "S A - 3";
                                    } else if (display_sa.equalsIgnoreCase("4")) {
                                        display_sa = "S A - 4";
                                    } else if (display_sa.equalsIgnoreCase("5")) {
                                        display_sa = "S A - 5";
                                    } else if (display_sa.equalsIgnoreCase("6")) {
                                        display_sa = "S A - 6";
                                    } else if (display_sa.equalsIgnoreCase("7")) {
                                        display_sa = "S A - 7";
                                    } else if (display_sa.equalsIgnoreCase("8")) {
                                        display_sa = "S A - 8";
                                    } else if (display_sa.equalsIgnoreCase("9")) {
                                        display_sa = "S A - 9";
                                    } else if (display_sa.equalsIgnoreCase("10")) {
                                        display_sa = "S A - 10";
                                    } else if (display_sa.equalsIgnoreCase("11")) {
                                        display_sa = "S A - 11";
                                    } else if (display_sa.equalsIgnoreCase("12")) {
                                        display_sa = "S A - 12";
                                    } else if (display_sa.equalsIgnoreCase("13")) {
                                        display_sa = "S A - 13";
                                    } else if (display_sa.equalsIgnoreCase("14")) {
                                        display_sa = "O S";
                                    } else if (display_sa.equalsIgnoreCase("15")) {
                                        display_sa = "Other Contributions";
                                    }

                                    if (resultSet.getString("zone").equalsIgnoreCase("7")) {
                                        display_zone = "OS";
                                    } else if (resultSet.getString("zone").equalsIgnoreCase("8")) {
                                        display_zone = "OC";
                                    } else {
                                        display_zone = "Zone " + resultSet.getString("zone");
                                    }

                                    if (resultSet.getString("zone").equalsIgnoreCase("National_Total")) {
                        %>
                        <tr style="background-color: #01354a; font-weight: bold; color: rgb(255, 225, 20);">
                            <td style="text-align: center;" hidden><%=slno%></td>
                            <td></td>
                            <td style="text-align: right;">National Total&nbsp; </td>
                            <%
                            } else if (resultSet.getString("sa_no").equalsIgnoreCase("Zone_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold; color: navy;">
                            <td hidden><%=slno%></td>
                            <td></td>
                            <td style="text-align: right;" nowrap><%=display_zone%>&nbsp; Total&nbsp;</td>
                            <%
                            } else if (resultSet.getString("sa_no").equalsIgnoreCase("15")) {
                            %>
                        <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">
                            <td hidden><%=slno%></td>
                            <td></td>
                            <td style="text-align: right;" nowrap>Other<br>Contributions</td>
                                <%
                                } else if (resultSet.getString("sa_no").equalsIgnoreCase("16")) {
                                %>
                        <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">
                            <td hidden><%=slno%></td>
                            <td></td>
                            <td style="text-align: right;" nowrap>PWT Amount</td>
                            <%
                            } else {
                            %>
                        <tr style="color: navy;">
                            <td hidden><%=slno%></td>
                            <td style="text-align: center;" nowrap><%=display_zone%></td>
                            <td style="text-align: right;" nowrap><%=display_sa%></td>
                            <%
                                }
                            %>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>%</td>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>%</td>

                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>%</td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Gid_New_Member_goal")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_per")%>%</td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>%</td> 

                            <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("sa_suspense")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("pwt_sf")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>%</td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>%</td>                         
                            <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                              
                            <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>                                
                            <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>        
                            <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td>   
                            <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>  
                            <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                            <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                            <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>%</td>

                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>%</td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_New_Member_goal")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_per")%>%</td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>%</td>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>%</td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_luncheon")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>%</td>
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
    </body>
</html>
