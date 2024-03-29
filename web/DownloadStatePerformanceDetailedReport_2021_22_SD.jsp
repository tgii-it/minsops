<%-- 
    Document   : DownloadStatePerformanceSummaryReport_2020_21
    Created on : 04-Nov-2020, 1:10:41 pm
    Author     : TGII_WORKSTATION
--%>

<%@page import="java.text.DecimalFormat"%>
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
    Connection con = null;
    ResultSet result = null;
    Statement stmt = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        stmt = con.createStatement();
        get_date = "select to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YY HH:MI:SS AM') downloaded_on from dual";
        ResultSet resultSet = stmt.executeQuery(get_date);
        while (resultSet.next()) {
            filename = "SA-" + v_sa_no + "-SD Detailed Report " + resultSet.getString("downloaded_on") + ".xls";
        }
        resultSet.close();
        stmt.close();
        con.close();
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
                                <th colspan="14" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>SA <%=v_sa_no%> - 2021-22 SD PERFORMANCE REPORT - DETAILED</B></h3></th>
                            </tr>  
                            <tr>
                                <th colspan="4">&nbsp;</th>
                                <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Total Scripture Distribution</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Gideon PWT</th>
                                <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; ">Auxiliary PWT</th>
                            </tr>                                                            
                            <tr>                                               
                                <th style="background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th>                                        
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Area</th>  
                                <th style="text-align: center; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Camp Name</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" nowrap>Goal</th> 
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >Demand Placed</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >Actual<br>(Shipped + In-Transit)</th>  
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >%</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >Goal</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >Actual</th>  
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >%</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >Goal</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >Actual</th>
                                <th style="text-align: right; background-color: #ffffd4; border-color: #fff; color: #01354a;" >%</th> 
                            </tr>
                        </thead> 
                        <tbody>
                            <%
                                String display_camp = "";
                                String display_sa = "";
                                String sql = "";
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                DecimalFormat f = new DecimalFormat("##");
                                try {
                                    con = ds.getConnection();
                                    stmt = con.createStatement();
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
                                    System.out.println("State Detailed Report " + sql);
                                    ResultSet resultSet = stmt.executeQuery(sql);
                                    while (resultSet.next()) {
                                        display_sa = resultSet.getString("sa_no");
                                        display_camp = resultSet.getString("camp");
                                        String camp_status = resultSet.getString("camp_status");
                                        String camp_type = resultSet.getString("camp_type");

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
                            <tr style="background-color: #01354a; font-weight: bold;  color: rgb(255, 225, 20);">
                                <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                <%
                                } else if (resultSet.getString("region").equalsIgnoreCase("Inactive Camps")) {
                                %>
                            <tr style="background-color: #ffe8e7; font-weight: bold;  color: navy;">
                                <td colspan="4" style="text-align: right;">In-Active Camps&nbsp; </td>
                                <%
                                } else if (resultSet.getString("region").equalsIgnoreCase("SA_Suspense")) {
                                %>
                            <tr style="background-color: #fff6f6; font-weight: bold;  color: navy;" hidden>
                                <td colspan="4" style="text-align: right;">State Suspense&nbsp; </td>
                                <%
                                } else if (resultSet.getString("region").equalsIgnoreCase("PWT SF")) {
                                %>
                            <tr style="background-color: #fff6f6; font-weight: bold;  color: navy;" hidden>
                                <td colspan="4" style="text-align: right;">State PWT SF&nbsp;</td>
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
                                <td  nowrap><%=display_camp%></td>
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

                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>%</td>
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
                        </tbody>
                    </table>                                          
                </div>
            </div>
        </div>
    </body>
</html>