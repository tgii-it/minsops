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
    String camp = request.getParameter("camp");
    String orbitid = request.getParameter("orbitid");
    JSONObject json = new JSONObject();
    String query = "";
    ResultSet rs = null;

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement stmt = con.createStatement();

        query = "select a.*,to_char(start_date,'DD/MM/YYYY') start_date1 from camps_master a where upper(camp)=upper('" + camp + "') and orbitid = '" + orbitid + "' ";
        System.out.println("Query " + query);
        PreparedStatement pstm = con.prepareStatement(query);
        rs = pstm.executeQuery();

        while (rs.next()) {
            json.put("zone", rs.getString("zone"));
            json.put("sa_no", rs.getString("sa_no"));
            json.put("state_asso", rs.getString("state_asso"));
            json.put("region", rs.getString("region"));
            json.put("area", rs.getString("area"));
            json.put("camp", rs.getString("camp"));
            json.put("camp_no", rs.getString("camp_no"));
            json.put("status", rs.getString("status"));
            json.put("old_name", rs.getString("old_name"));
            json.put("start_date", rs.getString("start_date1"));
            json.put("remarks", rs.getString("remarks"));
            json.put("orbitid", rs.getString("orbitid"));
            json.put("type", rs.getString("type"));
            json.put("metrocity", rs.getString("metrocity"));
        }
        out.print(json);
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>