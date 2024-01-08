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
            filename = "SA-" + v_sa_no + " In-Active Camps Report 2021-22 " + resultSet.getString("downloaded_on") + ".xls";
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
                                <th colspan="89" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>SA <%=v_sa_no%> - PERFORMANCE REPORT 2021 - 22 : IN-ACTIVE CAMPS</B></h3></th>
                            </tr>  
                            <tr>
                                <th colspan="4"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #F2FAD8; border-color: #fff; color: #01354a;">Total Scripture Distribution</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;   background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;   background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                <th style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                            </tr>
                            <tr>                                               
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>                                          
                                <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp</th>   

                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>SD<br>&nbsp;<br>Goal</th> 
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actuals<br>(Shipped +<br>In-Transit)</th>  
                                <th style="text-align: center; text-align: center;background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>SD<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Gideon<br>PWT<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Gideon<br>PWT<br>&nbsp;<br>Actual</th>  
                                <th style="text-align: center; text-align: center;background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Gideon<br>PWT<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Gideon<br>Opening<br>Balance as on<br>01 Feb 2022</th> 
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>   
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Renewals<br>&nbsp;<br>Per %</th> 

                                <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>&nbsp;<br>Goal</th>   
                                <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>PSU</th>    
                                <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>AMD</th>   
                                <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>Field</th>    
                                <th style="text-align: right; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>&nbsp;<br>Actual</th>   
                                <th style="text-align: center; background-color: khaki; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>&nbsp;<br>Per %</th>  

                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>&nbsp;<br>Goal</th>  
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>&nbsp;<br>Life A</th>                              
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>&nbsp;<br>Annual B</th>           
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>&nbsp;<br>( A + B )</th> 
                                <th style="text-align: center; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Net<br>Gideons<br>&nbsp;<br>Per %</th> 

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Scripture<br>Fund<br>&nbsp;<br>Goal</th> 
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" >Scripture<br>Fund<br>Actual</th> 
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Scripture<br>Fund<br>&nbsp;<br>Per %</th> 

                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>NoC<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>NoC<br>&nbsp;<br>Actual</th>  
                                <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>NoC<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CRO<br>&nbsp;<br>Goal</th>                                    
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CRO<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>CRO<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Donor</th>
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>GCBP<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>GCBP<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>GCBP<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB<br>&nbsp;<br>Actual</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>PAB<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>Events<br>#</th>
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>FFR<br>&nbsp;<br>Goal</th>                                    
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>FFR<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>FFR<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFG<br>&nbsp;<br>Goal</th>                                    
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFG<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>FFG<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>C D 100<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>C D 100<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center; background-color: #85dafd; border-color: #fff; color: #01354a;" nowrap>CD 100<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S P L O</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>N C C</th>
                                <th style="text-align: right;  background-color: #e4eff1; border-color: #fff; color: #01354a;" nowrap>S C C</th> 

                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SD<br>&nbsp;<br>Goal</th> 
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Demand<br>Placed</th>
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actuals<br>(Shipped +<br>In-Transit)</th>  
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SD<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>PWT<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>PWT<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>PWT<br>&nbsp;<br>Per%</th>  

                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>White<br>Testament<br>&nbsp;<br>Goal</th>                                      
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>White<br>Testament<br>&nbsp;<br>Actual</th>                                      
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>White<br>Testament<br>&nbsp;<br>Per %</th> 

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Opening<br>Balance as on<br>01 Feb 2022</th> 
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Renewals<br>Received</th>     
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>Renewals<br>&nbsp;<br>%</th> 

                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>&nbsp;<br>Goal</th> 
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>PSU</th> 
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>AMD</th> 
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Field</th> 
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>&nbsp;<br>Actual</th> 
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>New<br>Members<br>&nbsp;<br>Per %</th> 

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>&nbsp;<br>Goal</th>        
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>&nbsp;<br>Life A</th>                              
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>&nbsp;<br>Annual B</th>           
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>&nbsp;<br>( A + B )</th>                    
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Net<br>Auxiliary<br>&nbsp;<br>Per %</th>                                    

                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SF<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SF<br>&nbsp;<br>Actual</th> 
                                <th style="text-align: center;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>SF<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>FFA<br>&nbsp;<br>Goal</th>
                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>FFA<br>&nbsp;<br>Actual</th>
                                <th style="text-align: center;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>FFA<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Heart<br>Program<br>&nbsp;<br>Goal</th>  
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Heart<br>Program<br>&nbsp;<br>Actual</th>  
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" nowrap>Heart<br>Program<br>&nbsp;<br>Per %</th>

                                <th style="text-align: right;  background-color: #ffe9ec; border-color: #fff; color: #01354a;" nowrap>Auxiliary<br>&nbsp;<br>Luncheon</th>  
                            </tr>
                        </thead> 
                        <%
                            String display_camp = "";
                            String display_sa = "";
                            String sql = "";
                            try {
                                conn = ds.getConnection();
                                stmt = conn.createStatement();
                                sql = "select(nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo,"
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
                                        + "a.* from STATE_INACTIVE_REPORT_C_2021_22 a where sa_no='" + v_sa_no + "' and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 AND REGION<>'SA_Total' order by sa_no,a.region,area,camp";
                            //    System.out.println(sql);
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
                                    }

                                    if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                        %>
                        <tr style="background-color: #01354a; font-weight: bold; color: rgb(255, 225, 20);">
                            <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                            %>
                        <tr style="background-color: #ffe8e7; font-weight: bold;  color: navy;">
                            <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                            %>
                        <tr style="background-color: #fff6f6; font-weight: bold;  color: navy;">
                            <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold;  color: navy;" hidden>
                            <td colspan="4" style="text-align: right;" hidden>State Suspense&nbsp; </td>
                            <%
                            } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold;  color: navy;">
                            <td style="text-align: center;" nowrap>SA<%=resultSet.getString("sa_no")%></td>
                            <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                            <%
                            } else if (display_camp.equalsIgnoreCase("Area Total")) {
                            %>
                        <tr style="background-color: #FFFFF0; font-weight: bold;  color: navy;">
                            <td style="text-align: center;" nowrap>SA<%=resultSet.getString("sa_no")%></td>
                            <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                            <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                            <%                    } else {
                            %>
                        <tr>
                            <td style="text-align: center;" nowrap>SA<%=resultSet.getString("sa_no")%></td>
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
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Gideon_Renewed1")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gid_renewal_per")%>%</td>

                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_goals")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_psu")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_amd")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm_f")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("g_nm")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Gid_per")%>%</td>

                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_Goal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_life")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("gideon_annual")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Gideon")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Gideon_per")%>%</td>


                            <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("total_sf_actual")%></td>
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

                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_goals")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_psu")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_amd")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm_f")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("a_nm")%></td>  
                            <td style="text-align: center;" nowrap><%=resultSet.getString("NM_Aux_per")%>%</td>                                                

                            <td style="text-align: center;" nowrap><%=resultSet.getString("Memberships_Aux_Goal")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("aux_life")%></td> 
                            <td style="text-align: center;" nowrap><%=resultSet.getString("aux_annual")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Total_Auxiliary")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("Memberships_Aux_per")%>%</td>

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
                    </table>                                                                            
                </div>
            </div>
        </div>
    </body>
</html>