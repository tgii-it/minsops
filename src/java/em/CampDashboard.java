/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package em;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import java.util.*;
import java.awt.*;
import static java.lang.System.out;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.JSONObject;

public class CampDashboard extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CampDashboard() {
        super();
        // TODO Auto-generated constructor stub  
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Statement stmt = null;
        ResultSet rs = null;
        String query = "";

        String camp = request.getParameter("camp");
        JSONObject json = new JSONObject();

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            stmt = con.createStatement();
            if (camp != null && camp != "" && !camp.isEmpty()) {
                query = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0)||'%' Memberships_Aux_per,"
                        + "round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/(nvl(Memberships_Aux_Op_Bal,'0') - nvl(Memberships_Aux_Deceased,'0'))),2) else 0 end,0)||'%' Aux_Renewal_per,"
                        + "round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0)||'%' aux_sd_per,"
                        + "round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0)||'%' Memberships_Gideon_per,"
                        + "round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/(nvl(Memberships_Gid_Op_Bal,'0') - nvl(Memberships_Gid_Deceased,'0'))),2) else 0 end,0)||'%' gid_renewal_per,"
                        + "round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0)||'%' sd_per,"
                        + "round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0)||'%' sf_per,"
                        + "round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0)||'%' cp_per,"
                        + "round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0)||'%' PWT_Gideon_per,"
                        + "round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0)||'%' cro_per,"
                        + "round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0)||'%' ffr_per,"
                        + "round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0)||'%' pab_per,"
                        + "round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0)||'%' gcbp_per,"
                        + "round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0)||'%' ffg_per,"
                        + "round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0)||'%' ffa_per,"
                        + "round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0)||'%' aux_sf_per,"
                        + "round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0)||'%' aux_pwt_per,"
                        + "(Memberships_Gid_Op_Bal + Memberships_Aux_Op_Bal) renewal_goal_total, (Gideon_Renewed + Aux_Renewed) renewal_achieved_total, (total_life+total_annual) total_memberships,  "
                        + "(nvl(Memberships_Gid_Op_Bal,'0') - (nvl(Gideon_Renewed,'0')+nvl(Memberships_Gid_Deceased,'0'))) Gideon_ytr, (nvl(Memberships_Aux_Op_Bal,'0') - (nvl(Aux_Renewed,'0')+nvl(Memberships_Aux_Deceased,'0'))) Aux_ytr,"
                        + "( (nvl(Memberships_Gid_Op_Bal,'0') - (nvl(Gideon_Renewed,'0')+nvl(Memberships_Gid_Deceased,'0'))) + (nvl(Memberships_Aux_Op_Bal,'0') - (nvl(Aux_Renewed,'0')+nvl(Memberships_Aux_Deceased,'0'))) ) renewal_total_ytr,"
                        + "'SA-'||sa_no||' / R-'||region||' / A-'||area sa_region_area,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP PRESIDENT') and rownum<2) Camp_President,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP VICE PRESIDENT') and rownum<2) Camp_Vice_President,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP SECRETARY') and rownum<2) Camp_Secretary,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP TREASURER') and rownum<2) Camp_Treasurer,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP CHAPLAIN') and rownum<2) Camp_Chaplain,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP AUX PRESIDENT') and rownum<2) Camp_Aux_President,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP AUX SECRETARY') and rownum<2) Camp_Aux_Secretary,"
                        + "(select name||'<br>Ph '||nvl(phone,'-') v_name from membership_weekly_raw where upper(camp) = Upper('" + camp + "') and status='Current' and mid in (select mid from gmap_all_officers where upper(designation)='CAMP AUX CHAPLAIN') and rownum<2) Camp_Aux_Chaplain,"
                        + "to_char(aux_luncheon,'99,99,999') aux_luncheon,"
                        + "to_char(aux_heart_fund,'99,99,999') aux_heart_fund,"
                        + "to_char(aux_heart_fund,'99,99,999') aux_heart_fund,"
                        + "to_char(ffa_actual,'99,99,999') ffa_actual,"
                        + "to_char(ffa_goal,'99,99,999') ffa_goal,"
                        + "to_char(aux_sf_goal,'99,99,999') aux_sf_goal,"
                        + "to_char(scc_actual,'99,99,999') scc_actual,"
                        + "to_char(ncc_actual,'99,99,999') ncc_actual,"
                        + "to_char(ffo_actual,'99,99,999') ffo_actual,"
                        + "to_char(splo_actual,'99,99,999') splo_actual,"
                        + "to_char(cd100_actual,'99,99,999') cd100_actual,"
                        + "to_char(ffg_goal,'99,99,999') ffg_goal,"
                        + "to_char(ffg_actual,'99,99,999') ffg_actual,"
                        + "to_char(ffr_actual,'99,99,999') ffr_actual,"
                        + "to_char(ffr_goal,'99,99,999') ffr_goal,"
                        + "to_char(pab_actual,'99,99,999') pab_actual,"
                        + "to_char(pab_goal,'99,99,999') pab_goal,"
                        + "to_char(gcbp_actual,'99,99,999') gcbp_actual,"
                        + "to_char(gcbp_goal,'99,99,999') gcbp_goal,"
                        + "to_char(cro_goal,'99,99,999') cro_goal,"
                        + "to_char(cro_actual,'99,99,999') cro_actual,"
                        + "to_char(cp_actual,'99,99,999') cp_actual,"
                        + "to_char(cp_goal,'99,99,999') cp_goal,"
                        + "to_char(total_sf_actual,'99,99,99,999') total_sf_actual,"
                        + "to_char(total_sf_goal,'99,99,99,999') total_sf_goal,"
                        + "to_char(Aux_SD_actual,'99,99,999') Aux_SD_actual,"
                        + "to_char(Aux_SD_Goal,'99,99,999') Aux_SD_Goal,"
                        + "to_char(sd_actual,'99,99,999') sd_actual,"
                        + "to_char(sd_goal,'99,99,999') sd_goal,"
                        + "to_char(Gideon_PWT_Goal,'99,99,999') Gideon_PWT_Goal,"
                        + "to_char(Gideon_PWT_Actual,'99,99,999') Gideon_PWT_Actual,"
                        + "to_char(aux_pwt_goal,'99,99,999') aux_pwt_goal,"
                        + "to_char(aux_pwt_actual,'99,99,999') aux_pwt_actual,"
                        + "a.* from STATE_Detailed_Report_20_21fa a "
                        + "where upper(camp)=upper('" + camp + "') and decode(a.region,'SA_Total','95','All_Above_Total','95','Inactive Camps','96','SA_Suspense','97','Total','98',a.region)>0 "
                        + "order by sa_no,a.region,area,camp";
            }
            PreparedStatement pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                json.put("sa_no", rs.getString("sa_region_area"));

                json.put("Camp_President", rs.getString("Camp_President"));
                json.put("Camp_Vice_President", rs.getString("Camp_Vice_President"));
                json.put("Camp_Secretary", rs.getString("Camp_Secretary"));
                json.put("Camp_Treasurer", rs.getString("Camp_Treasurer"));
                json.put("Camp_Chaplain", rs.getString("Camp_Chaplain"));
                json.put("Camp_Aux_President", rs.getString("Camp_Aux_President"));
                json.put("Camp_Aux_Secretary", rs.getString("Camp_Aux_Secretary"));
                json.put("Camp_Aux_Chaplain", rs.getString("Camp_Aux_Chaplain"));

                json.put("sd_goal", rs.getString("sd_goal"));
                json.put("sd_actual", rs.getString("sd_actual"));
                json.put("sd_per", rs.getString("sd_per"));

                json.put("Aux_SD_Goal", rs.getString("Aux_SD_Goal"));
                json.put("Aux_SD_actual", rs.getString("Aux_SD_actual"));
                json.put("aux_sd_per", rs.getString("aux_sd_per"));

                json.put("Gideon_PWT_Goal", rs.getString("Gideon_PWT_Goal"));
                json.put("Gideon_PWT_Actual", rs.getString("Gideon_PWT_Actual"));
                json.put("PWT_Gideon_per", rs.getString("PWT_Gideon_per"));

                json.put("aux_pwt_goal", rs.getString("aux_pwt_goal"));
                json.put("aux_pwt_actual", rs.getString("aux_pwt_actual"));
                json.put("aux_pwt_per", rs.getString("aux_pwt_per"));

                json.put("Memberships_Gid_Op_Bal", rs.getString("Memberships_Gid_Op_Bal"));
                json.put("Gideon_Renewed", rs.getString("Gideon_Renewed"));
                json.put("Gideon_ytr", rs.getString("Gideon_ytr"));
                json.put("gid_renewal_per", rs.getString("gid_renewal_per"));

                json.put("Memberships_Aux_Op_Bal", rs.getString("Memberships_Aux_Op_Bal"));
                json.put("Aux_Renewed", rs.getString("Aux_Renewed"));
                json.put("Aux_ytr", rs.getString("Aux_ytr"));
                json.put("Aux_Renewal_per", rs.getString("Aux_Renewal_per"));

                json.put("renewal_goal_total", rs.getString("renewal_goal_total"));
                json.put("renewal_achieved_total", rs.getString("renewal_achieved_total"));
                json.put("renewal_total_ytr", rs.getString("renewal_total_ytr"));

                json.put("gideon_life", rs.getString("gideon_life"));
                json.put("gideon_annual", rs.getString("gideon_annual"));
                json.put("Total_Gideon", rs.getString("Total_Gideon"));
                json.put("total_life", rs.getString("total_life"));

                json.put("aux_life", rs.getString("aux_life"));
                json.put("aux_annual", rs.getString("aux_annual"));
                json.put("Total_Auxiliary", rs.getString("Total_Auxiliary"));
                json.put("total_annual", rs.getString("total_annual"));

                json.put("total_memberships", rs.getString("total_memberships"));

                json.put("g_nm_psu", rs.getString("g_nm_psu"));
                json.put("g_nm_amd", rs.getString("g_nm_amd"));
                json.put("g_nm_f", rs.getString("g_nm_f"));
                json.put("g_nm", rs.getString("g_nm"));

                json.put("a_nm_psu", rs.getString("a_nm_psu"));
                json.put("a_nm_amd", rs.getString("a_nm_amd"));
                json.put("a_nm_f", rs.getString("a_nm_f"));
                json.put("a_nm", rs.getString("a_nm"));

                json.put("total_sf_goal", rs.getString("total_sf_goal"));
                json.put("total_sf_actual", rs.getString("total_sf_actual"));
                json.put("sf_per", rs.getString("sf_per"));

                json.put("cp_goal", rs.getString("cp_goal"));
                json.put("cp_actual", rs.getString("cp_actual"));
                json.put("cp_per", rs.getString("cp_per"));

                json.put("cro_goal", rs.getString("cro_goal"));
                json.put("cro_actual", rs.getString("cro_actual"));
                json.put("cro_per", rs.getString("cro_per"));

                json.put("gcbp_goal", rs.getString("gcbp_goal"));
                json.put("gcbp_actual", rs.getString("gcbp_actual"));
                json.put("gcbp_per", rs.getString("gcbp_per"));

                json.put("pab_goal", rs.getString("pab_goal"));
                json.put("pab_actual", rs.getString("pab_actual"));
                json.put("pab_per", rs.getString("pab_per"));

                json.put("ffr_goal", rs.getString("ffr_goal"));
                json.put("ffr_actual", rs.getString("ffr_actual"));
                json.put("ffr_per", rs.getString("ffr_per"));

                json.put("ffg_goal", rs.getString("ffg_goal"));
                json.put("ffg_actual", rs.getString("ffg_actual"));
                json.put("ffg_per", rs.getString("ffg_per"));

                json.put("cd100_actual", rs.getString("cd100_actual"));
                json.put("splo_actual", rs.getString("splo_actual"));
                json.put("ffo_actual", rs.getString("ffo_actual"));

                json.put("ncc_actual", rs.getString("ncc_actual"));
                json.put("scc_actual", rs.getString("scc_actual"));

                json.put("aux_sf_goal", rs.getString("aux_sf_goal"));
                json.put("aux_sf_actual", rs.getString("aux_sf_actual"));
                json.put("aux_sf_per", rs.getString("aux_sf_per"));

                json.put("ffa_goal", rs.getString("ffa_goal"));
                json.put("ffa_actual", rs.getString("ffa_actual"));
                json.put("ffa_per", rs.getString("ffa_per"));

                json.put("aux_luncheon", rs.getString("aux_luncheon"));
                json.put("aux_heart_fund", rs.getString("aux_heart_fund"));
            }
            out.print(json);
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
  * Method to create a datasource after the JNDI lookup
     */
    private DataSource getDataSource() throws NamingException {
        Context ctx;
        ctx = new InitialContext();
        Context envContext = (Context) ctx.lookup("java:/comp/env");
        // Look up a data source
        javax.sql.DataSource ds
                = (javax.sql.DataSource) envContext.lookup("tomcat/UCP_atp");
        return ds;
    }

}
