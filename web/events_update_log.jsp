<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%
    String camp = request.getParameter("camp");
    String sql = "select updated_by,updated_on,sf_goal,etype,sf_goal_new,speakername,speakername_new,contact_person,contact_person_new,contact_phone,contact_phone_new,to_char(event_date,'dd/mm/yyyy') event_date,to_char(event_date_new,'dd/mm/yyyy') event_date_new from events_update_log where Upper(camp)=Upper('" + camp + "')";
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
            ja.addProperty("etype", rs.getString("etype"));
            ja.addProperty("speakername", rs.getString("speakername"));
            ja.addProperty("speakername_new", rs.getString("speakername_new"));
            ja.addProperty("contact_person", rs.getString("contact_person"));
            ja.addProperty("contact_person_new", rs.getString("contact_person_new"));
            ja.addProperty("contact_phone", rs.getString("contact_phone"));
            ja.addProperty("contact_phone_new", rs.getString("contact_phone_new"));
            ja.addProperty("sf_goal", rs.getString("sf_goal"));
            ja.addProperty("sf_goal_new", rs.getString("sf_goal_new"));
            ja.addProperty("event_date", rs.getString("event_date"));
            ja.addProperty("event_date_new", rs.getString("event_date_new"));
            ja.addProperty("updated_by", rs.getString("updated_by"));
            ja.addProperty("updated_on", rs.getString("updated_on"));
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