<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.sql.Connection"%>
<%
    String camp = request.getParameter("camp");
    String username = request.getParameter("username");
    String sql = "select contact_person,contact_phone,speakername,sf_goal,deleted_by,to_char(event_date,'dd/mm/yyyy') event_date,to_char(deleted_on,'dd/mm/yyyy hh24:mi:ss') deleted_on from events_delete_log where Upper(camp)=Upper('" + camp + "')";
    JsonObject gson = new JsonObject();
    JsonArray array = new JsonArray();

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            JsonObject ja = new JsonObject();
            ja.addProperty("contact_person", rs.getString("contact_person"));
            ja.addProperty("contact_phone", rs.getString("contact_phone"));
            ja.addProperty("speakername", rs.getString("speakername"));
            ja.addProperty("sf_goal", rs.getString("sf_goal"));
            ja.addProperty("event_date", rs.getString("event_date"));
            ja.addProperty("deleted_by", rs.getString("deleted_by"));
            ja.addProperty("deleted_on", rs.getString("deleted_on"));

            array.add(ja);

        }
        gson.add("datas", array);
        out.print(gson.toString());

        rs.close();
        stmt.close();
        con.close();

    } catch (Exception e) {
    }
%>