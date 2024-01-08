<%-- 
    Document   : DownloadNationalPerformanceSummaryReport_2020_21
    Created on : 04-Nov-2020, 6:20:34 am
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
            filename = "Metro Performance Report " + resultSet.getString("downloaded_on") + ".xls";
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
                                <th colspan="88" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>METRO PERFORMANCE REPORT 2021-22</B></h3></th>
                            </tr>  <tr>
                                <th colspan="3"  style="background-color: #ededff; border-color: #fff; color: #01354a;">&nbsp;</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #F2FAD8; border-color: #fff; color: #01354a;">Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;">Gideon PWT (Brown)</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffffd4; border-color: #fff; color: #01354a;">Gideon New Memberships</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: khaki; border-color: #fff; color: #01354a;">Gideon Membership Report</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Scripture Funds</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Number of Church Presentations</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Church Retiring Offertory</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">GideonCard Bible Program</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Pastor's Appreciation Banquet</th>
                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #e4eff1; border-color: #fff; color: #01354a;">Faith Fund Rally</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #85dafd; border-color: #fff; color: #01354a;">Faith Fund Gideon</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #e4eff1; border-color: #fff; color: #01354a;">C D 100</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold;  background-color: #85dafd; border-color: #fff; color: #01354a;">Other Contributions</th>

                                <th colspan="4" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Distribution</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary PWT</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">White Testament</th>

                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Renewals</th>
                                <th colspan="6" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary New Memberships</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Auxiliary Membership Report</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Auxiliary Scripture Fund</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Faith Fund Auxiliary</th>
                                <th colspan="3" style="text-align: center; vertical-align: middle; font-weight: bold; background-color: #ffe9ec; border-color: #fff; color: #01354a;">Heart Program</th>
                                <th style="text-align: center; vertical-align: middle; font-weight: bold; background-color: lightpink; border-color: #fff; color: #01354a;">Luncheon</th>
                            </tr>                                                          
                            <tr>                                               
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Metrocity</th>                                   
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camps</th>  

                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" nowrap>SD<br>&nbsp;<br>Goal</th> 
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Demand<br>&nbsp;<br>Placed</th>
                                <th style="text-align: right; background-color: #F2FAD8; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
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
                                <th style="text-align: right;  background-color: lightpink; border-color: #fff; color: #01354a;" >Actual<br>(Shipped +<br>In-Transit)</th>  
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
                            String display_sa, sa = "";
                            String sql = "";
                            try {
                                conn = ds.getConnection();
                                stmt = conn.createStatement();

                                sql = "select rownum slno,(select count(*) from camps_master where upper(metrocity)=upper(a.metrocity)) no_of_camps, (nvl(ffr_actual,'0')+nvl(ffo_actual,'0')) ffr_ffo, round(case when cd100_goal>0 then round(100*(cd100_actual/cd100_goal),2) else 0 end,0) cd100_per,round(case when white_goal>0 then round(100*(sd_white_actual/white_goal),2) else 0 end,0) white_per,round(case when hp_goal>0 then round(100*(aux_heart_fund/hp_goal),2) else 0 end,0) hp_per,round(case when Aux_New_Member_goal>0 then round(100*(a_nm/Aux_New_Member_goal),2) else 0 end,0) NM_Aux_per,round(case when Gid_New_Member_goal>0 then round(100*(g_nm/Gid_New_Member_goal),2) else 0 end,0) NM_Gid_per,round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0'))),2) else 0 end,0) Aux_Renewal_per,round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0'))),2) else 0 end,0) gid_renewal_per,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*((nvl(ffr_actual,'0')+nvl(ffo_actual,'0'))/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,"
                                        + "a.* from Metro_Performance_Report_Tbl a order by zone,sa_no,slno";
                             //   System.out.println("Metro Performance Summary Report " + sql);
                                ResultSet resultSet = stmt.executeQuery(sql);
                                while (resultSet.next()) {
                                    display_sa = resultSet.getString("sa_no");
                                    if (display_sa == "" || display_sa == "null" || display_sa == null) {
                                        display_sa = "Zone";
                                        sa = "";
                                    } else {
                                        display_sa = "SA";
                                        sa = resultSet.getString("sa_no");
                                    }

                                    if (resultSet.getString("zone").equalsIgnoreCase("National_Total")) {
                        %>
                        <tr style="background-color: #01354a; font-weight: bold; color: rgb(255, 225, 20);">
                            <td colspan="3" style="text-align: right;">Overall Total&nbsp; </td>
                            <%
                            } else if (display_sa.equalsIgnoreCase("zone")) {
                            %>
                        <tr style="background-color: #ffffd4; font-weight: bold; color: navy;">
                            <td colspan="3" style="text-align: right;" nowrap><%= display_sa%> <%= sa%> Total</td>
                            <%
                            } else if (resultSet.getString("metrocity").equalsIgnoreCase("zz_SA_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold; color: navy;">
                            <td colspan="3" style="text-align: right;" nowrap><%= display_sa%> <%= sa%> Total</td>
                            <%
                            } else {
                            %>
                        <tr>
                            <td style="text-align: center;" nowrap>SA<%=resultSet.getString("sa_no")%></td>
                            <td nowrap><%=resultSet.getString("metrocity")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("no_of_camps")%></td>
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
                            <td style="text-align: center;" nowrap><%=resultSet.getString("Aux_Renewed")%></td>  
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
