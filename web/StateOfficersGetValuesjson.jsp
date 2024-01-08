<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%
    String name = request.getParameter("name");
    JSONObject json = new JSONObject();
    String query = "";

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement stmt = con.createStatement();

        query = "select a.mid,a.name,a.phone,a.email,b.zone,b.state_asso,b.region,b.area,b.camp from membership_weekly_raw a,camps_master b where upper(a.camp) = upper(b.camp) and a.name||' - '||a.mid||' - '||a.camp||' - '||a.phone||' - '||a.email||' - '||a.status = '" + name + "' ";
        PreparedStatement pstm = con.prepareStatement(query);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            json.put("name", rs.getString("name"));
            json.put("memid", rs.getString("mid"));
            json.put("mobile", rs.getString("phone"));
            json.put("email", rs.getString("email"));
            json.put("camp", rs.getString("camp"));
            json.put("zone", rs.getString("zone"));
            json.put("state_asso", rs.getString("state_asso"));
            json.put("region", rs.getString("region"));
            json.put("area", rs.getString("area"));
        }
        out.print(json);
        rs.close();
        pstm.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>