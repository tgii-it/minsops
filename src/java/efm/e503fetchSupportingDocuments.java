
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
import java.sql.Statement;
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
public class e503fetchSupportingDocuments extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String sId = request.getParameter("sId");

        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();
        String sql = "select sid,rid,filename,uploaded_on from e503_supdoc where sid='" + sId + "' order by sid,rid";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                JsonObject ja = new JsonObject();
                ja.addProperty("sid", rs.getString("sid"));
                ja.addProperty("rid", rs.getString("rid"));
                ja.addProperty("filename", rs.getString("filename"));
                ja.addProperty("uploaded_on", rs.getString("uploaded_on"));
                ja.addProperty("view", "<p style='text-align: center;'><a target='_blank' href='https://accounts.gideons.org.in/SupDoc/" + rs.getString("filename") + "' title='click here to view'><i class=\"fa fa-file\" aria-hidden=\"true\">&nbsp; View</i></a></p>");
                ja.addProperty("action", "<button type='button' class='btn btn-danger btn-xs deleteSupDocRow' name='deleteSupDocRow' id='" + rs.getString("rid") + "' title='Delete this record'><i class='fa fa-trash' aria-hidden='true'></i></button>");
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

    private void DataAccessLayer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
