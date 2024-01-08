package em;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class FinancePaymentView extends HttpServlet {

    public FinancePaymentView() {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        label0:
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String rid = request.getParameter("rid");
            String sql = "select * from e503_payment where mid='" + rid + "'";
            JsonObject gson = new JsonObject();
            JsonArray array = new JsonArray();
            String vrid = "";
            String rstatus = "";

            try {
                DataSource ds = getDataSource();
                Connection con = ds.getConnection();
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs;
                JsonObject ja;
                for (rs = stmt.executeQuery(); rs.next(); array.add(ja)) {
                    ja = new JsonObject();
                    vrid = rs.getString("rid");
                    rstatus = rs.getString("rstatus");
                    if (rstatus == null) {
                        ja.addProperty("rid", "<p style='text-align: left;'><input type='checkbox' name='chkApprove' id='chkApprove' value='" + vrid + "'></p>");
                    } else {
                        ja.addProperty("rid", rs.getString("rid"));
                    }
                    ja.addProperty("e503month", rs.getString("e503month"));
                    ja.addProperty("camp", rs.getString("camp"));
                    ja.addProperty("contactperson", rs.getString("contactperson"));
                    ja.addProperty("paymode", rs.getString("paymode"));
                    ja.addProperty("trno", rs.getString("trno"));
                    ja.addProperty("trdate", rs.getString("trdate"));
                    ja.addProperty("tramount", rs.getString("tramount"));
                    ja.addProperty("trbank", rs.getString("trbank"));
                    ja.addProperty("trbranch", rs.getString("trbranch"));
                    ja.addProperty("trremarks", rs.getString("trremarks"));
                }

                gson.add("datas", array);
                out.print(gson.toString());

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception exception) {
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
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
