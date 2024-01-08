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
import org.json.JSONObject;

/**
 *
 * @author Anbalagan
 */
public class event_edit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String v_action = request.getParameter("action");
        String rid = request.getParameter("rid");
        JSONObject json = new JSONObject();
        String query = "";
        ResultSet rs = null;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();

            if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Edit") && rid != null && !rid.isEmpty()) {
                query = "select rid,camp,etype,to_char(event_date,'dd/mm/yyyy') event_date,sf_goal,speakername,contact_person,contact_phone,modified_by from events where rid=" + rid + " ";
            }
            PreparedStatement pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();

            while (rs.next()) {
                json.put("rid", rs.getString("rid"));
                json.put("modified_by", rs.getString("modified_by"));
                json.put("camp", rs.getString("camp"));
                json.put("etype", rs.getString("etype"));
                json.put("event_date", rs.getString("event_date"));
                json.put("sf_goal", rs.getString("sf_goal"));
                json.put("speakername", rs.getString("speakername"));
                json.put("contact_person", rs.getString("contact_person"));
                json.put("contact_phone", rs.getString("contact_phone"));
            }
            out.print(json);
            rs.close();
            pstm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
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
