<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%  String sa_no = request.getParameter("state_asso");
    String status = request.getParameter("status");
    String sql = "";

    if (sa_no.equalsIgnoreCase("AllRecords")) {
        sql = "select * from V_State_wise_renewals_report  ";
    } else if (sa_no == "0" || sa_no.equalsIgnoreCase("0")) {
        sql = "select * from V_State_wise_renewals_report where 1=2 ";
    } else {
        sql = "select * from V_State_wise_renewals_report where Upper(state_association) = Upper('" + sa_no + "') and Upper(status) = Upper('" + status + "') ";
    }

    JsonObject gson = new JsonObject();
    JsonArray array = new JsonArray();

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            JsonObject ja = new JsonObject();
            ja.addProperty("state_asso", rs.getString("state_association"));
            ja.addProperty("camp", rs.getString("camp"));
            ja.addProperty("mid", rs.getString("mid"));
            ja.addProperty("name", rs.getString("name"));
            ja.addProperty("mtype", rs.getString("mtype"));
            ja.addProperty("annual_end_date", rs.getString("annual_end_date"));
            ja.addProperty("status", rs.getString("status"));
            ja.addProperty("phone", rs.getString("phone"));
            ja.addProperty("designation", rs.getString("designation"));
            ja.addProperty("basket", rs.getString("basket"));
            array.add(ja);
        }
        gson.add("datas", array);
        out.print(gson.toString());

        rs.close();
        statement.close();
        con.close();
    } catch (Exception e) {
    }
%>