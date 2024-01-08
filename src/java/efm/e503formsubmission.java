/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

/**
 *
 * @author Anbalagan
 */
public class e503formsubmission extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String maxid = request.getParameter("masterid");
        String v_action = request.getParameter("action");
        String v_mid = request.getParameter("mid");
        String v_name = request.getParameter("name");
        String v_mobile = request.getParameter("mobile");
        String v_email = request.getParameter("email");
        String v_camp = request.getParameter("e503_camp");
        String v_status = request.getParameter("status");

        String program = request.getParameter("program");
        String agcnt = request.getParameter("agcnt");
        String aacnt = request.getParameter("aacnt");
        String lgcnt = request.getParameter("lgcnt");
        String lacnt = request.getParameter("lacnt");
        String agamount = request.getParameter("agamount");
        String aaamount = request.getParameter("aaamount");
        String lgamount = request.getParameter("lgamount");
        String laamount = request.getParameter("laamount");

        String nagcnt = request.getParameter("nagcnt");
        String naacnt = request.getParameter("naacnt");
        String nlgcnt = request.getParameter("nlgcnt");
        String nlacnt = request.getParameter("nlacnt");
        String nagamount = request.getParameter("nagamount");
        String naaamount = request.getParameter("naaamount");
        String nlgamount = request.getParameter("nlgamount");
        String nlaamount = request.getParameter("nlaamount");

        String mocnt = request.getParameter("mocnt");
        String moamount = request.getParameter("moamount");
        String mremarks = request.getParameter("mremarks");

        String pwtcnt = request.getParameter("pwtcnt");
        String pwtamount = request.getParameter("pwtamount");
        String pwtremarks = request.getParameter("pwtremarks");

        String cpcnt = request.getParameter("cpcnt");
        String croamount = request.getParameter("croamount");
        String pabcnt = request.getParameter("pabcnt");
        String pabamount = request.getParameter("pabamount");
        String ffrcnt = request.getParameter("ffrcnt");
        String fframount = request.getParameter("fframount");
        String gcbpcnt = request.getParameter("gcbpcnt");
        String gcbpamount = request.getParameter("gcbpamount");
        String ffgcnt = request.getParameter("ffgcnt");
        String ffgamount = request.getParameter("ffgamount");
        String ffacnt = request.getParameter("ffacnt");
        String ffaamount = request.getParameter("ffaamount");
        String ffocnt = request.getParameter("ffocnt");
        String ffoamount = request.getParameter("ffoamount");
        String ffbamount = request.getParameter("ffbamount");
        String splocnt = request.getParameter("splocnt");
        String sploamount = request.getParameter("sploamount");
        String ncogcnt = request.getParameter("ncogcnt");
        String ncogamount = request.getParameter("ncogamount");
        String ncoacnt = request.getParameter("ncoacnt");
        String ncoaamount = request.getParameter("ncoaamount");
        String scogcnt = request.getParameter("scogcnt");
        String scogamount = request.getParameter("scogamount");
        String scoacnt = request.getParameter("scoacnt");
        String scoaamount = request.getParameter("scoaamount");
        String sf1cnt = request.getParameter("sf1cnt");
        String sf1fee = request.getParameter("sf1fee");
        String sf1remarks = request.getParameter("sf1remarks");

        String ggbcnt = request.getParameter("ggbcnt");
        String ggbamount = request.getParameter("ggbamount");
        String agbcnt = request.getParameter("agbcnt");
        String agbamount = request.getParameter("agbamount");
        String gecnt = request.getParameter("gecnt");
        String geamount = request.getParameter("geamount");
        String aecnt = request.getParameter("aecnt");
        String aeamount = request.getParameter("aeamount");
        String tbcnt = request.getParameter("tbcnt");
        String tbamount = request.getParameter("tbamount");
        String sbcnt = request.getParameter("sbcnt");
        String sbamount = request.getParameter("sbamount");
        String pwcnt = request.getParameter("pwcnt");
        String pwamount = request.getParameter("pwamount");
        String stickerscnt = request.getParameter("stickerscnt");
        String stickersamount = request.getParameter("stickersamount");
        String sf2cnt = request.getParameter("sf2cnt");
        String sf2fee = request.getParameter("sf2fee");
        String miremarks = request.getParameter("miremarks");

        String paymode = request.getParameter("paymode");
        String trno = request.getParameter("trno");
        String trdate = request.getParameter("trdate");
        String tramount = request.getParameter("tramount");
        String trbank = request.getParameter("trbank");
        String trbranch = request.getParameter("trbranch");
        String trremarks = request.getParameter("trremarks");

        String total_amount = request.getParameter("total_amount");

        String modified_by = request.getParameter("modified_by");
        String contactperson = request.getParameter("contactperson");
        String designation = request.getParameter("designation");
        String e503month = request.getParameter("e503month");
        String e503year = request.getParameter("e503year");

        String ncpcnt = request.getParameter("ncpcnt");
        String scpcnt = request.getParameter("scpcnt");
        String ncroamount = request.getParameter("ncroamount");
        String scroamount = request.getParameter("scroamount");
        String ncpabamount = request.getParameter("ncpabamount");
        String scpabamount = request.getParameter("scpabamount");
        String pabconducted = request.getParameter("pabconducted");
        String ffrconducted = request.getParameter("ffrconducted");

        String pabdate = request.getParameter("pabdate");
        String ffrdate = request.getParameter("ffrdate");
        String nccamount = request.getParameter("nccamount");
        String sccamount = request.getParameter("sccamount");
        String cafamount = request.getParameter("cafamount");
        String afamount = request.getParameter("afamount");
        String pwtgcnt = request.getParameter("pwtgcnt");
        String pwtgamount = request.getParameter("pwtgamount");
        String pwtacnt = request.getParameter("pwtacnt");
        String pwtaamount = request.getParameter("pwtaamount");
        String pwthbcnt = request.getParameter("pwthbcnt");
        String pwthbamount = request.getParameter("pwthbamount");
        String pwtlbcnt = request.getParameter("pwtlbcnt");
        String pwtlbamount = request.getParameter("pwtlbamount");
        String slcnt = request.getParameter("slcnt");
        String slamount = request.getParameter("slamount");
        String dicnt = request.getParameter("dicnt");
        String diamount = request.getParameter("diamount");
        String diincnt = request.getParameter("diincnt");
        String diinamount = request.getParameter("diinamount");
        String splbcnt = request.getParameter("splbcnt");
        String splbamount = request.getParameter("splbamount");
        String type = request.getParameter("type");

        String sql = "";
        String sql_insert = "";
        events_DataAccessLayer da = new events_DataAccessLayer();
        String sId = request.getParameter("sId");
        int ragcnt_sp = 0;
        int ragcnt = 0;
        int rlgcnt_sp = 0;
        int rlgcnt = 0;
        String camp = "";
        ragcnt_sp = da.getRAGcnt(sId, type);
        ragcnt = da.getRAGValue(sId);
        rlgcnt_sp = da.getRLGcnt(sId, type);
        rlgcnt = da.getRLGValue(sId);
        camp = da.getCampe503sid(sId);
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement st = null;
            st = con.createStatement();

            if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Delete") && v_mid != null && !v_mid.isEmpty()) {
                sql = "Delete from membership_weekly_raw where status in ('Current','Pending','Grace') and Upper(mid) = Upper(trim('" + v_mid + "')) ";
                int n = st.executeUpdate(sql);

                if (n > 0) {
                    out.print(maxid);
                } else {
                    out.print("Failed");
                }
            } else if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Update") && v_mid != null && !v_mid.isEmpty() && type.equalsIgnoreCase("Annual Renewal")) {
                int n1 = 0;
                int n = 0;
                // System.out.println("RAGCNT " + ragcnt + " RAGCNT_SP " + ragcnt_sp);
                if (ragcnt > ragcnt_sp) {
                    sql_insert = "Insert into san_process1 select camp,e503_getMemName('" + v_mid + "'),e503_getMemNameStr('" + v_mid + "'),'" + v_mid + "','Annual Renewal',"
                            + "e503_getMemStatus('" + v_mid + "'),e503_getMemPhone('" + v_mid + "'),'',paymode,tramount,trno,trdate,'Pending',"
                            + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),remitter,mremarks,modified_by,"
                            + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-',"
                            + "'Offline',paymode,trdate,mremarks,'','','','" + sId + "',e503_getMemEmail('" + v_mid + "') "
                            + "from e503 where rid = trim('" + sId + "')";
                    sql = "Update e503 set renewal_annual_list='Update' where rid = trim('" + sId + "') ";

                    n1 = st.executeUpdate(sql_insert);
                    n = st.executeUpdate(sql);

                    if (n1 > 0 && n > 0) {
                        out.print(1);
                    } else {
                        out.print(0);
                    }
                } else {
                    out.print(999);
                }

            } else if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Update") && v_mid != null && !v_mid.isEmpty() && type.equalsIgnoreCase("Annual to Life Opting")) {
                int n1 = 0;
                int n = 0;
                // System.out.println("RAGCNT " + ragcnt + " RAGCNT_SP " + ragcnt_sp);
                if (rlgcnt > rlgcnt_sp) {
                    sql_insert = "Insert into san_process1 select camp,e503_getMemName('" + v_mid + "'),e503_getMemNameStr('" + v_mid + "'),'" + v_mid + "','Annual to Life Opting',"
                            + "e503_getMemStatus('" + v_mid + "'),e503_getMemPhone('" + v_mid + "'),'',paymode,tramount,trno,trdate,'Pending',"
                            + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),remitter,mremarks,modified_by,"
                            + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-',"
                            + "'Offline',paymode,trdate,mremarks,'','','','" + sId + "',e503_getMemEmail('" + v_mid + "') "
                            + "from e503 where rid = trim('" + sId + "')";
                    sql = "Update e503 set renewal_annual_list='Update' where rid = trim('" + sId + "') ";

                    n1 = st.executeUpdate(sql_insert);
                    n = st.executeUpdate(sql);

                    if (n1 > 0 && n > 0) {
                        out.print(1);
                    } else {
                        out.print(0);
                    }
                } else {
                    out.print(999);
                }

            } else if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Insert")) {
                //System.out.println(v_action);
                //maxid = da.getRandomNo();
                sql = "Insert into e503 values ('" + maxid + "','" + agcnt + "','" + aacnt + "','" + lgcnt + "','" + lacnt + "','" + agamount + "',"
                        + "'" + aaamount + "','" + lgamount + "','" + laamount + "','" + nagcnt + "','" + naacnt + "','" + nlgcnt + "','" + nlacnt + "','" + nagamount + "',"
                        + "'" + naaamount + "','" + nlgamount + "','" + nlaamount + "','" + mocnt + "','" + moamount + "','" + pwtgcnt + "','" + pwtgamount + "','" + pwtacnt + "',"
                        + "'" + pwtaamount + "','" + pwthbcnt + "','" + pwthbamount + "','" + pwtlbcnt + "','" + pwtlbamount + "','" + pwtcnt + "','" + pwtamount + "',"
                        + "'" + slcnt + "','" + slamount + "','" + dicnt + "','" + diamount + "','" + diincnt + "','" + diinamount + "','" + splbcnt + "','" + splbamount + "',"
                        + "'" + cpcnt + "','" + croamount + "','" + ncpcnt + "','" + ncroamount + "','" + scpcnt + "','" + scroamount + "','" + pabcnt + "','" + pabamount + "',"
                        + "'" + ncpabamount + "','" + scpabamount + "',to_date('" + pabdate + "','DD/MM/YYYY'),'" + ffrcnt + "','" + fframount + "',to_date('" + ffrdate + "','DD/MM/YYYY'),'" + gcbpcnt + "','" + gcbpamount + "',"
                        + "'" + ffgcnt + "','" + ffgamount + "','" + ffacnt + "','" + ffaamount + "','" + ffocnt + "','" + ffoamount + "','" + ffbamount + "','" + splocnt + "',"
                        + "'" + sploamount + "','" + ncogcnt + "','" + ncogamount + "','" + ncoacnt + "','" + ncoaamount + "','" + scogcnt + "','" + scogamount + "','" + scoacnt + "','" + scoaamount + "',"
                        + "'" + sf1cnt + "','" + sf1fee + "','" + nccamount + "','" + sccamount + "','" + cafamount + "','" + afamount + "','" + ggbcnt + "','" + ggbamount + "','" + agbcnt + "','" + agbamount + "','" + gecnt + "','" + geamount + "',"
                        + "'" + aecnt + "','" + aeamount + "','" + tbcnt + "','" + tbamount + "','" + sbcnt + "','" + sbamount + "','" + pwcnt + "','" + pwamount + "','" + stickerscnt + "','" + stickersamount + "',"
                        + "'" + sf2cnt + "','" + sf2fee + "','" + tramount + "','" + paymode + "','" + trno + "',to_date('" + trdate + "','DD/MM/YYYY'),'" + trbank + "','" + trbranch + "','" + total_amount + "','" + e503month + "','" + e503year + "',"
                        + "'" + v_camp + "','" + modified_by + "','" + contactperson + "','" + designation + "',to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),'" + mremarks + "',"
                        + "'" + pwtremarks + "','" + sf1remarks + "','" + miremarks + "','" + trremarks + "','" + ffrconducted + "','','" + pabconducted + "','','','')";
                //System.out.println("insert Q " + sql);
                int n = st.executeUpdate(sql);
                //   System.out.println("n "+n);
                if (n > 0) {
                    out.print(maxid);
                } else {
                    out.print("Failed");
                }
            } else if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Modify")) {
                //System.out.println(v_action);
                //maxid = da.getRandomNo();
                sql = "Update e503 set RAGCNT='" + agcnt + "',RAACNT='" + aacnt + "',RLGCNT='" + lgcnt + "',RLACNT='" + lacnt + "',RAGAMOUNT='" + agamount + "',"
                        + "RAAAMOUNT='" + aaamount + "',RLGAMOUNT='" + lgamount + "',RLAAMOUNT='" + laamount + "',NAGCNT='" + nagcnt + "',NAACNT='" + naacnt + "',NLGCNT='" + nlgcnt + "',NLACNT='" + nlacnt + "',NAGAMOUNT='" + nagamount + "',"
                        + "NAAAMOUNT='" + naaamount + "',NLGAMOUNT='" + nlgamount + "',NLAAMOUNT='" + nlaamount + "',MOCNT='" + mocnt + "',MOAMOUNT='" + moamount + "',PWTGCNT='" + pwtgcnt + "',PWTGAMOUNT='" + pwtgamount + "',PWTACNT='" + pwtacnt + "',"
                        + "PWTAAMOUNT='" + pwtaamount + "',PWTHBCNT='" + pwthbcnt + "',PWTHBAMOUNT='" + pwthbamount + "',PWTLBCNT='" + pwtlbcnt + "',PWTLBAMOUNT='" + pwtlbamount + "',PWTCNT='" + pwtcnt + "',PWTAMOUNT='" + pwtamount + "',"
                        + "SLCNT='" + slcnt + "',SLAMOUNT='" + slamount + "',DICNT='" + dicnt + "',DIAMOUNT='" + diamount + "',DIINCNT='" + diincnt + "',DIINAMOUNT='" + diinamount + "',SPLBCNT='" + splbcnt + "',SPLBAMOUNT='" + splbamount + "',"
                        + "CPCNT='" + cpcnt + "',CROAMOUNT='" + croamount + "',NCPCNT='" + ncpcnt + "',NCROAMOUNT='" + ncroamount + "',SCPCNT='" + scpcnt + "',SCROAMOUNT='" + scroamount + "',PABCNT='" + pabcnt + "',PABAMOUNT='" + pabamount + "',"
                        + "NCPABAMOUNT='" + ncpabamount + "',SCPABAMOUNT='" + scpabamount + "',PABDATE=to_date('" + pabdate + "','DD/MM/YYYY'),FFRCNT='" + ffrcnt + "',FFRAMOUNT='" + fframount + "',FFRDATE=to_date('" + ffrdate + "','DD/MM/YYYY'),GCBPCNT='" + gcbpcnt + "',GCBPAMOUNT='" + gcbpamount + "',"
                        + "FFGCNT='" + ffgcnt + "',FFGCNT='" + ffgamount + "',FFACNT='" + ffacnt + "',FFAAMOUNT='" + ffaamount + "',FFOCNT='" + ffocnt + "',FFOAMOUNT='" + ffoamount + "',FFBAMOUNT='" + ffbamount + "',SPLOCNT='" + splocnt + "',"
                        + "SPLOAMOUNT='" + sploamount + "',NCOGCNT='" + ncogcnt + "',NCOGAMOUNT='" + ncogamount + "',NCOACNT='" + ncoacnt + "',NCOAAMOUNT='" + ncoaamount + "',SCOGCNT='" + scogcnt + "',SCOGAMOUNT='" + scogamount + "',SCOACNT='" + scoacnt + "',SCOAAMOUNT='" + scoaamount + "',"
                        + "SF1CNT='" + sf1cnt + "',SF1FEE='" + sf1fee + "',NCCAMOUNT='" + nccamount + "',SCCAMOUNT='" + sccamount + "',CAFAMOUNT='" + cafamount + "',AFAMOUNT='" + afamount + "',GGBCNT='" + ggbcnt + "',GGBAMOUNT='" + ggbamount + "',AGBCNT='" + agbcnt + "',AGBAMOUNT='" + agbamount + "',GECNT='" + gecnt + "',GEAMOUNT='" + geamount + "',"
                        + "AECNT='" + aecnt + "',AEAMOUNT='" + aeamount + "',TBCNT='" + tbcnt + "',TBAMOUNT='" + tbamount + "',SBCNT='" + sbcnt + "',SBAMOUNT='" + sbamount + "',PWCNT='" + pwcnt + "',PWAMOUNT='" + pwamount + "',STICKERSCNT='" + stickerscnt + "',STICKERSAMOUNT='" + stickersamount + "',"
                        + "SF2CNT='" + sf2cnt + "',SF2FEE='" + sf2fee + "',TRAMOUNT='" + tramount + "',PAYMODE='" + paymode + "',TRNO='" + trno + "',TRDATE=to_date('" + trdate + "','DD/MM/YYYY'),TRDATE='" + trbank + "',TRBRANCH='" + trbranch + "',TOTAL_AMOUNT='" + total_amount + "',E503MONTH='" + e503month + "',E503YEAR='" + e503year + "',"
                        + "CAMP='" + v_camp + "',MODIFIED_BY='" + modified_by + "',REMITTER='" + contactperson + "',DESIGNATION='" + designation + "',MODIFIED_ON=to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),MREMARKS='" + mremarks + "',PWTREMARKS='" + pwtremarks + "',SF1REMARKS='" + sf1remarks + "',MIREMARKS='" + miremarks + "',TRREMARKS='" + trremarks + "',RENEWAL_ANNUAL_LIST='',LIFE_OPT_LIST='',CPLIST='',TALLYNO='',TALLYDATE='',TALLYREMARKS='')";
                //System.out.println("insert Q " + sql);
                int n = st.executeUpdate(sql);
                // System.out.println("n "+n);
                if (n > 0) {
                    out.print(maxid);
                } else {
                    out.print("Failed");
                }
            }
            
            st.close();
            con.close();

        } catch (Exception e) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

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
