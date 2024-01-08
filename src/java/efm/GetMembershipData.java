package efm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.apache.log4j.Logger;
import org.json.JSONArray;

/**
 *
 * @author Anbalagan
 */
public class GetMembershipData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String memid = request.getParameter("memid");
        String action = request.getParameter("action");
        String sql = "";
        // System.out.println("SQL " + sql);
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();
        if (action.equalsIgnoreCase("designationupdate")) {
            sql = "select designation,old_designation,memid,nvl(mobile,'0') mobile,nvl(email,'NA') email,memtype,memstatus,mename,remarks,submitted_on,submitted_by from DESIGNATION_LOG_RECORD where upper(memid) = upper('" + memid + "')";

            try {
                DataSource ds = getDataSource();
                Connection con = ds.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    JsonObject ja = new JsonObject();

                    ja.addProperty("designation", rs.getString("designation"));
                    ja.addProperty("old_designation", rs.getString("old_designation"));
                    ja.addProperty("memid", rs.getString("memid"));
                    ja.addProperty("memname", rs.getString("mename"));
                    ja.addProperty("email", rs.getString("email"));
                    ja.addProperty("mobile", rs.getString("mobile"));
                    ja.addProperty("memtype", rs.getString("memtype"));
                    ja.addProperty("memstatus", rs.getString("memstatus"));
                    ja.addProperty("remarks", rs.getString("remarks"));
                    ja.addProperty("submitted_on", rs.getString("submitted_on"));
                    ja.addProperty("submitted_by", rs.getString("submitted_by"));
                    array.add(ja);
                }
                gson.add("datas", array);
                out.print(gson.toString());

                rs.close();
                stmt.close();
                con.close();

            } catch (Exception e) {

            }
        } else if (action.equalsIgnoreCase("campchange")) {
            sql = "select nvl(state_asso,'NA') state,camp,old_camp,memid,nvl(mobile,'0') mobile,nvl(email,'NA') email,memtype,memstatus,memname,remarks,submitted_on,submitted_by from CALL_CENTRE_RECORD where upper(memid) = upper('" + memid + "')";
            try {
                DataSource ds = getDataSource();
                Connection con = ds.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    JsonObject ja = new JsonObject();

                    ja.addProperty("designation", rs.getString("designation"));
                    ja.addProperty("old_designation", rs.getString("old_designation"));
                    ja.addProperty("memid", rs.getString("memid"));
                    ja.addProperty("memname", rs.getString("mename"));
                    ja.addProperty("email", rs.getString("email"));
                    ja.addProperty("mobile", rs.getString("mobile"));
                    ja.addProperty("memtype", rs.getString("memtype"));
                    ja.addProperty("memstatus", rs.getString("memstatus"));
                    ja.addProperty("remarks", rs.getString("remarks"));
                    ja.addProperty("submitted_on", rs.getString("submitted_on"));
                    ja.addProperty("submitted_by", rs.getString("submitted_by"));
                    array.add(ja);
                }
                gson.add("datas", array);
                out.print(gson.toString());

                rs.close();
                stmt.close();
                con.close();

            } catch (Exception e) {

            }
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
