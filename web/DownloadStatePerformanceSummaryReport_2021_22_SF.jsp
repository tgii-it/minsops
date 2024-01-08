<%-- 
    Document   : DownloadStatePerformanceSummaryReport_2020_21
    Created on : 04-Nov-2020, 1:10:41 pm
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
            filename = "SA-" + v_sa_no + "-SF Summary Report " + resultSet.getString("downloaded_on") + ".xls";
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
                        <thead style="background-color: #01354a; color: #ffe114;">   
                            <tr>
                                <th colspan="34" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>SA <%=v_sa_no%> - 2021-22 SF PERFORMANCE REPORT - SUMMARY</B></h3></th>
                            </tr>  
                            <tr style="background-color: #01354a; color: #ffe114;">
                                <th colspan="4">&nbsp;</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Total Scripture Fund</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Number of Church Presentations</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Church Retiring Offertory</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; ">GideonCard Bible Program</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Pastor's Appreciation Banquet</th>
                                <th colspan="5"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Faith Fund Rally</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Faith Fund Gideon</th>
                                <th colspan="5" style="text-align: center; vertical-align: middle; font-weight: bold; ">&nbsp;</th>
                            </tr>                                                            
                            <tr style="background-color: #fff6f6; font-weight: bold; color: navy;">                                               
                                <th style="text-align: left;" nowrap>SA No</th>
                                <th style="text-align: center;" nowrap>Region</th>                                        
                                <th style="text-align: center;" nowrap>Area</th>                                         
                                <th style="text-align: left;" nowrap>Area Director</th>

                                <th style="text-align: right;" >Goal</th> 
                                <th style="text-align: right;" >Actual</th> 
                                <th style="text-align: right;" nowrap>%</th> 

                                <th style="text-align: right;" nowrap>Goal</th>
                                <th style="text-align: right;" nowrap>Actual</th> 
                                <th style="text-align: right;" nowrap>%</th>

                                <th style="text-align: right;" nowrap>Goal</th>
                                <th style="text-align: right;" nowrap>Actual</th>
                                <th style="text-align: right;" nowrap>%</th>

                                <th style="text-align: right;" nowrap>Donor</th>
                                <th style="text-align: right;" nowrap>Goal</th>
                                <th style="text-align: right;" nowrap>Actual</th>
                                <th style="text-align: right;" nowrap>%</th>

                                <th style="text-align: right;" nowrap>Total Events</th>
                                <th style="text-align: right;" nowrap>Goal</th>
                                <th style="text-align: right; " nowrap>Actual</th>
                                <th style="text-align: right;" nowrap>%</th>

                                <th style="text-align: right;" nowrap>Total Events</th>
                                <th style="text-align: right;" nowrap>Goal</th>                                    
                                <th style="text-align: right;" nowrap>Actual</th>
                                <th style="text-align: center;" nowrap>%</th>
                                <th style="text-align: right;" nowrap>Total Friends</th>

                                <th style="text-align: right;" nowrap>Goal</th>
                                <th style="text-align: right;" nowrap>Actual</th>
                                <th style="text-align: right;" nowrap>%</th>

                                <th style="text-align: right;" nowrap>CD 100</th>
                                <th style="text-align: right;" nowrap>SPLO</th>
                                <th style="text-align: right;" nowrap>FFO</th>
                                <th style="text-align: right;" nowrap>NCC</th>
                                <th style="text-align: right;" nowrap>SCC</th>
                            </tr>
                        </thead> 
                        <%
                            String display_sa = "";
                            String sql = "";
                            Connection con = null;
                            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                            String Area_Director = "";
                            try {
                                con = ds.getConnection();
                                stmt = con.createStatement();
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
                                        + "a.* from STATE_SUMMARY_REPORT_C_2021_22 a where sa_no='" + v_sa_no + "' and "
                                        + "decode(region,'Inactive Camps','94','PWT SF','95','SA_Suspense','96','SA_Total','97','Total','98',region)>0 order by sa_no,region,area";
                                ResultSet resultSet = stmt.executeQuery(sql);
                                while (resultSet.next()) {
                                    display_sa = resultSet.getString("sa_no");
                                    Area_Director = resultSet.getString("Area_Director");

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

                                    if (Area_Director == null || Area_Director == "") {
                                        Area_Director = "NA";
                                    }

                                    if (resultSet.getString("region").equalsIgnoreCase("Total")) {
                        %>
                        <tr style="background-color: #01354a; font-weight: bold;  color: rgb(255, 225, 20);">
                            <td colspan="4" style="text-align: right;">State Overall Total&nbsp;(A+B+C)&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold;  color: navy;" hidden>
                            <td colspan="4" style="text-align: right;" nowrap>SA<%=resultSet.getString("sa_no")%> Total&nbsp(C)&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                            %>
                        <tr style="background-color: #ffe8e7; font-weight: bold;  color: navy;">
                            <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                            %>
                        <tr style="background-color: #fff6f6; font-weight: bold;  color: navy;">
                            <td colspan="4" style="text-align: right;">State Suspense&nbsp;(B)&nbsp;</td>
                            <%
                            } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                            %>
                        <tr style="background-color: #fff6f6; font-weight: bold;  color: navy;">
                            <td colspan="4" style="text-align: right;">State PWT SF&nbsp;(A)&nbsp;</td>
                            <%
                            } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                            %>
                        <tr style="background-color: #F0FFFF; font-weight: bold;  color: navy;">
                            <td style="text-align: center;" nowrap>SA<%=resultSet.getString("sa_no")%></td>
                            <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                            <%
                            } else {
                            %>
                        <tr>
                            <td style="text-align: center;" nowrap>SA<%=resultSet.getString("sa_no")%></td>
                            <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                            <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                            <td style="text-align: left;" nowrap><%=Area_Director%></td>
                            <%
                                }
                            %>
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
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_actual")%></td> 
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffr_per")%>%</td>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("friends")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_goal")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffg_per")%>%</td>

                            <td style="text-align: right;" nowrap><%=resultSet.getString("cd100_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("splo_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ffo_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("ncc_actual")%></td>
                            <td style="text-align: right;" nowrap><%=resultSet.getString("scc_actual")%></td>
                        </tr>
                        <%
                                }
                                resultSet.close();
                                stmt.close();
                                con.close();
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