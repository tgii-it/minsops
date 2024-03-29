<%-- 
    Document   : DownloadStatePerformanceDetailedReport_2020_21
    Created on : 04-Nov-2020, 1:12:41 pm
    Author     : TGII_WORKSTATION
--%>

<%@page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String v_sa_no = request.getParameter("StateAsso");

    if (v_sa_no == null) {
        v_sa_no = "";
    }

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
            filename = "SA-" + v_sa_no + " In-Active Camps Report " + resultSet.getString("downloaded_on") + ".xls";
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
                <div class="table-responsive" style="vertical-align: middle; height: 480px; background-color: #fff;">
                    <table id="summary" class="table table-bordered table-responsive table-hover" border="1">
                        <thead style="background-color: #01354a; color: #ffe114;">   
                            <tr>
                                <th colspan="84" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>SA <%=v_sa_no%> - 2020-21 PERFORMANCE REPORT : IN-ACTIVE CAMPS</B></h3></th>
                            </tr>  
                            <tr>
                                <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                <th colspan="6"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon Net Memberships</th>

                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Total Scripture Fund</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold;   background-color: #e4eff1; border-color: #fff; color: #01354a;">&nbsp;</th>

                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                <th style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                <th colspan="6"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Net Memberships</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                <th colspan="2" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">&nbsp;</th>
                            </tr>                                                          
                            <tr>                                               
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>    

                                <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals (Shipped + In-Transit)</th>  
                                <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                <th style="text-align: right; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                <th style="text-align: center; text-align: center; vertical-align: middle; font-weight: bold;  background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance 2020</th> 
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>%</th>  
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Goal</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>PSU</th>     
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>                         
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>%</th> 
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
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" >Actual (Shipped + In-Transit)</th>  
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>                                    
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>White<br>Testament</th> 

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance 2020</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Goal</th>  
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>Actual</th>                        
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>%</th>
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
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Heart<br>Program</th>  
                            </tr>
                        </thead> 
                        <%
                            String display_camp = "";
                            String display_sa = "";
                            String sql = "";
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
                                        + "a.* from STATE_INACTIVE_REPORT_C a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";
                                ResultSet resultSet = stmt.executeQuery(sql);
                                while (resultSet.next()) {
                                    display_sa = resultSet.getString("sa_no");
                                    display_camp = resultSet.getString("camp");
                                    if (display_camp == null) {
                                        display_camp = "Area Total";
                                    }
                                    if (display_sa.equalsIgnoreCase("1")) {
                                        display_sa = "SA1 (Tamil Nadu)";
                                    } else if (display_sa.equalsIgnoreCase("2")) {
                                        display_sa = "SA2 (Kerala)";
                                    } else if (display_sa.equalsIgnoreCase("3")) {
                                        display_sa = "SA3 (Karnataka and Goa)";
                                    } else if (display_sa.equalsIgnoreCase("4")) {
                                        display_sa = "SA4 (Andhra Pradesh)";
                                    } else if (display_sa.equalsIgnoreCase("5")) {
                                        display_sa = "SA5 (Telangana)";
                                    } else if (display_sa.equalsIgnoreCase("6")) {
                                        display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                    } else if (display_sa.equalsIgnoreCase("7")) {
                                        display_sa = "SA7 (Maharashtra and Gujarat)";
                                    } else if (display_sa.equalsIgnoreCase("8")) {
                                        display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                    } else if (display_sa.equalsIgnoreCase("9")) {
                                        display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                    } else if (display_sa.equalsIgnoreCase("10")) {
                                        display_sa = "SA10 (Bihar and Jharkhand)";
                                    } else if (display_sa.equalsIgnoreCase("11")) {
                                        display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                    } else if (display_sa.equalsIgnoreCase("12")) {
                                        display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                    } else if (display_sa.equalsIgnoreCase("13")) {
                                        display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                    } else if (display_sa.equalsIgnoreCase("14")) {
                                        display_sa = "OS (Outreach States)";
                                    }

                                    if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                        %>
                        <tr style="background-color: #01354a; font-weight: bold;color: rgb(255, 225, 20);;">
                            <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                            %>
                        <tr style="background-color: #ffe8e7; font-weight: bold; color: navy;">
                            <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                            %>
                        <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">
                            <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold; color: navy;" hidden>
                            <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                            <%
                            } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold; color: navy;">
                            <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                            <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                            <%
                            } else if (display_camp.equalsIgnoreCase("Area Total")) {
                            %>
                        <tr style="background-color: #FFFFF0; font-weight: bold; color: navy;">
                            <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                            <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                            <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                            <%                    } else {
                            %>
                        <tr>
                            <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                            <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                            <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                            <td style="text-align: left;" nowrap><%=display_camp%></td>
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
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                            <td style="text-align: center;" nowrap>&nbsp;</td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>%</td>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
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
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>%</td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("SD_white_actual")%></td>  

                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>%</td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                            <td style="text-align: center;" nowrap>&nbsp;</td>  
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