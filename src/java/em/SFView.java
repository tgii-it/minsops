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
public class SFView extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String rid = request.getParameter("rid");
        String sql = "select * from e503 where rid='" + rid + "'";
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                JsonObject ja = new JsonObject();
                ja.addProperty("cpcnt", rs.getString("cpcnt"));
                ja.addProperty("croamount", rs.getString("croamount"));
                ja.addProperty("ncpcnt", rs.getString("ncpcnt"));
                ja.addProperty("ncroamount", rs.getString("ncroamount"));
                ja.addProperty("scpcnt", rs.getString("scpcnt"));
                ja.addProperty("scroamount", rs.getString("scroamount"));
                ja.addProperty("gcbpcnt", rs.getString("gcbpcnt"));
                ja.addProperty("gcbpamount", rs.getString("gcbpamount"));
                ja.addProperty("pabamount", rs.getString("pabamount"));
                ja.addProperty("ncpabamount", rs.getString("ncpabamount"));
                ja.addProperty("scpabamount", rs.getString("scpabamount"));
                ja.addProperty("fframount", rs.getString("fframount"));
                ja.addProperty("ffgamount", rs.getString("ffgamount"));
                ja.addProperty("ffaamount", rs.getString("ffaamount"));
                ja.addProperty("ffoamount", rs.getString("ffoamount"));
                ja.addProperty("ffbamount", rs.getString("ffbamount"));
                ja.addProperty("sploamount", rs.getString("sploamount"));
                ja.addProperty("ncogamount", rs.getString("ncogamount"));
                ja.addProperty("ncoaamount", rs.getString("ncoaamount"));
                ja.addProperty("scogamount", rs.getString("scogamount"));
                ja.addProperty("scoaamount", rs.getString("scoaamount"));
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
