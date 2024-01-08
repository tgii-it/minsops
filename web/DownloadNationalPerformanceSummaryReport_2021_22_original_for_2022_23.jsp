<%-- 
    Document   : DownloadNationalPerformanceSummaryReport_2020_21
    Created on : 04-Nov-2020, 6:20:34 am
    Author     : TGII_WORKSTATION
--%>

<%@page import="java.text.DecimalFormat"%>
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
                                <th colspan="101" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>NATIONAL PERFORMANCE REPORT</B></h3></th>
                            </tr>     
                            <tr>
                                <th style="background-color: #ededff; border-color: #fff; color: #01354a;" hidden>&nbsp;</th>
                                <th colspan="3" style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                <th colspan="8" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                <th colspan="8" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                <th style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                            </tr>                                                          
                            <tr>    
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" hidden>Sl_No</th>
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Zone</th>
                                <th style="text-align: right; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>State<br>Association</th> 
                                <th style="text-align: right; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>No of<br>Camps</th>  

                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped + In_Transit)</th>  
                                <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Actual</th>  
                                <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>%</th>

                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 Apr 2022</th> 
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
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Overall<br>Net<br>(A+B)</th> 
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th> 
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Current<br>Yet to Renew<br>[C-YTR]</th>           
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> 

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Goal</th> 
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Actual<br>(A)</th> 
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Suspense_Fund<br>(B)</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;">PWT<br>Scripture_Fund<br>(C)</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Total<br>Scripture_Fund<br>&nbsp;<br>( A + B + C )</th> 
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

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Total<br>Events</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>%</th>

                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Events</th>
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                    
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>%</th>
                                <th style="text-align: right; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Total<br>Friends</th> 

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
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped + In_Transit)</th>  
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th>

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual</th>
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>%</th>  

                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Goal</th>                                      
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Actual</th>                                      
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>%</th> 

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Opening<br>Balance as on<br>01 Apr 2022</th> 
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
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Overall<br>Net<br>(A+B)</th>                    
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>(A+B)<br>%</th>                                    

                                <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Current<br>Yet to Renew<br>[C-YTR]</th>           
                                <th style="text-align: right; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Actual<br>Net<br>[(A+B)-C]</th> 
                                <th style="text-align: center; background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>[(A+B)-C]<br>%</th> 

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
                        <tbody>
                            <%
                                String sql = "";
                                String display_sa = "";
                                String display_zone = "";
                                int slno = 0;
                                DecimalFormat f = new DecimalFormat("##");
                                try {
                                    conn = ds.getConnection();
                                    stmt = conn.createStatement();
                                    //    sql = "select rownum slno,nvl(pwt_sf,'0') pwt_sf,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                    //            + "nvl((select gid_ytr from v_renewal_dashboard_dynamic_values_nat_perf_report_values where zone=a.zone and sa_no=a.sa_no),'0') gid_ytr,"
                                    //            + "nvl((select aux_ytr from v_renewal_dashboard_dynamic_values_nat_perf_report_values where zone=a.zone and sa_no=a.sa_no),'0') aux_ytr,"
                                    //            + "nvl((select friends from Friends_NPR_03March2022 where zone=a.zone and sa_no=a.sa_no),'0') friends,"
                                    //            + "(SELECT EMI_GID FROM v_renewal_dashboard_dynamic_values_tbl_3 WHERE ZONE = A.ZONE AND SA_NO = A.SA_NO) EMI_GID,"
                                    //            + "(SELECT EMI_AUX FROM v_renewal_dashboard_dynamic_values_tbl_3 WHERE ZONE=A.ZONE AND SA_NO = A.SA_NO) EMI_AUX,"
                                    //            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                    //            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                    //            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                    //            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) a_nm_per,round(case when new_nm_goal_alex_02March2022>0 then round(100*(g_nm/new_nm_goal_alex_02March2022),2) else 0 end,0) g_nm_per,"
                                    //            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*((Aux_Renewed1)/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                    //            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                    //            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*((Gideon_Renewed1)/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                    //            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,nvl(overall_sf,'0') total_sf,round(case when total_sf_goal>0 then round(100*((nvl(overall_sf,'0'))/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                    //            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                    //            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,nvl(pwt_sf,'0') pwt_sf,"
                                    //            + "a.* from V_E503_NATIONAL_SUM_REPORT_B2 a order by zone,sa_no";

                                    sql = "select rownum slno,nvl(pwt_sf,'0') pwt_sf,(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
                                            + "nvl((select gid_ytr from V_RENEWAL_DASHBOARD_DYNAMIC_VALUES_NAT_PERF_REPORT_VALUES_1 where zone=a.zone and sa_no=decode(a.sa_no,'17','Zone_Total',a.sa_no)),'0') gid_ytr,"
                                            + "nvl((select aux_ytr from V_RENEWAL_DASHBOARD_DYNAMIC_VALUES_NAT_PERF_REPORT_VALUES_1 where zone=a.zone and sa_no=decode(a.sa_no,'17','Zone_Total',a.sa_no)),'0') aux_ytr,"
                                            + "nvl((select friends from Friends_NPR_06April2022 where zone=a.zone and sa_no=a.sa_no),'0') friends,"
                                            + "(SELECT EMI_GID FROM v_renewal_dashboard_dynamic_values_tbl_3 WHERE ZONE = A.ZONE AND SA_NO = A.SA_NO) EMI_GID,"
                                            + "(SELECT EMI_AUX FROM v_renewal_dashboard_dynamic_values_tbl_3 WHERE ZONE=A.ZONE AND SA_NO = A.SA_NO) EMI_AUX,"
                                            + "round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,"
                                            + "round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,"
                                            + "round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,"
                                            + "round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) a_nm_per,round(case when new_nm_goal_alex_02March2022>0 then round(100*(g_nm/new_nm_goal_alex_02March2022),2) else 0 end,0) g_nm_per,"
                                            + "round(case when Memberships_Aux_Op_Bal>0 then round(100*((Aux_Renewed1)/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,"
                                            + "round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,"
                                            + "round(case when (Gideon_Renewed1>0 and Memberships_Gid_Op_Bal>0) then round(100*((Gideon_Renewed1)/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,"
                                            + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,nvl(overall_sf,'0') total_sf,round(case when total_sf_goal>0 then round(100*((nvl(overall_sf,'0'))/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,"
                                            + "round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,"
                                            + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,nvl(pwt_sf,'0') pwt_sf,"
                                            + "a.* from V_E503_NATIONAL_SUM_REPORT_B2 a order by zone,sa_no";

                                    //   System.out.println("National Performance Report sql " + sql);
                                    ResultSet resultSet = stmt.executeQuery(sql);
                                    while (resultSet.next()) {
                                        display_sa = resultSet.getString("sa_no");
                                        slno = resultSet.getInt("slno");
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

                                        //   System.out.println("tgid_goal " + tgid_goal + " tgytr" + tgytr + " pgytr" + pgytr);
                                        //  System.out.println("taux_goal " + taux_goal + " taytr" + taytr + " paytr" + paytr);
                                        if (display_sa.equalsIgnoreCase("1")) {
                                            display_sa = "SA1";
                                        } else if (display_sa.equalsIgnoreCase("2")) {
                                            display_sa = "SA2";
                                        } else if (display_sa.equalsIgnoreCase("3")) {
                                            display_sa = "SA3";
                                        } else if (display_sa.equalsIgnoreCase("4")) {
                                            display_sa = "SA4";
                                        } else if (display_sa.equalsIgnoreCase("5")) {
                                            display_sa = "SA5";
                                        } else if (display_sa.equalsIgnoreCase("6")) {
                                            display_sa = "SA6";
                                        } else if (display_sa.equalsIgnoreCase("7")) {
                                            display_sa = "SA7";
                                        } else if (display_sa.equalsIgnoreCase("8")) {
                                            display_sa = "SA8";
                                        } else if (display_sa.equalsIgnoreCase("9")) {
                                            display_sa = "SA9";
                                        } else if (display_sa.equalsIgnoreCase("10")) {
                                            display_sa = "SA10";
                                        } else if (display_sa.equalsIgnoreCase("11")) {
                                            display_sa = "SA11";
                                        } else if (display_sa.equalsIgnoreCase("12")) {
                                            display_sa = "SA12";
                                        } else if (display_sa.equalsIgnoreCase("13")) {
                                            display_sa = "SA13";
                                        } else if (display_sa.equalsIgnoreCase("15")) {
                                            display_sa = "Other Contributions";
                                        }

                                        if (resultSet.getString("zone").equalsIgnoreCase("8")) {
                                            display_zone = "OC";
                                        } else {
                                            display_zone = "Zone" + resultSet.getString("zone");
                                        }

                                        if (resultSet.getString("zone").equalsIgnoreCase("National_Total")) {
                            %>
                            <tr style="background-color: #01354a; font-weight: bold; color: rgb(255, 225, 20);">
                                <td hidden><%=slno%></td>
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
                                <td style="text-align: right;" nowrap>Other Contributions</td>
                                <%
                                } else if (resultSet.getString("sa_no").equalsIgnoreCase("16")) {
                                %>
                            <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">
                                <td hidden><%=slno%></td>
                                <td></td>
                                <td style="text-align: right;" nowrap>National Suspense A/c</td>
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
                                <td style="text-align: right;" nowrap><%=resultSet.getString("no_of_camps")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>%</td>

                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gid_Op_Bal")%></td> 
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>%</td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("EMI_GID")%></td>  
                                  <!--  <td style="text-align: center;" nowrap><%=resultSet.getString("Gid_New_Member_goal")%></td>  -->
                                <td style="text-align: center;" nowrap><%=resultSet.getString("new_nm_goal_alex_02March2022")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_per")%>%</td> 
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                                <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>%</td> 
                                <td style="text-align: center;" nowrap><%=f.format(gytr)%></td>
                                <td style="text-align: center; background-color: khaki; color: #01354a;" nowrap><%=f.format(tgytr)%></td>
                                <td style="text-align: center; background-color: #ffffd4; color: #01354a;" nowrap><%=f.format(pgytr)%>%</td> 

                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sa_suspense")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pwt_sf")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sf_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cp_per")%>%</td> 

                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cro_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("donor_cnt")%></td>                               
                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_goal")%></td>                                 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_actual")%></td>      
                                <td style="text-align: right;" nowrap><%=resultSet.getString("gcbp_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_cnt")%></td> 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_goal")%></td>    
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_actual")%></td> 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("pab_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_cnt")%></td> 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_goal")%></td> 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_ffo")%></td> 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>   
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td> 
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_Goal")%></td>                       
                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_demand")%></td>                         
                                <td style="text-align: right;" nowrap><%=resultSet.getString("Aux_SD_actual")%></td>                                                     
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sd_per")%>%</td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>%</td>

                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("sd_white_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("white_per")%>%</td>

                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Op_Bal")%></td> 
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed1")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewal_per")%>%</td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("EMI_AUX")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_New_Member_goal")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                                <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_per")%>%</td>  

                                <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                                <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                                <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>%</td>
                                <td style="text-align: center;" nowrap><%=f.format(aytr)%></td>
                                <td style="text-align: center; background-color: lightpink; color: #01354a;" nowrap><%=f.format(taytr)%></td>
                                <td style="text-align: center; background-color: #ffe9ec; color: #01354a;" nowrap><%=f.format(paytr)%>%</td> 

                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_sf_per")%>%</td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("ffa_per")%>%</td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_heart_fund")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("hp_per")%>%</td>
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
                        </tbody>
                    </table>                                                    
                </div>
            </div>
        </div>
    </body>
</html>