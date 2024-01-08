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
    String mid = request.getParameter("mid");
    String designation = request.getParameter("designation");
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

        query = "select a.mid,a.name,a.phone,a.email,a.camp,a.designation,a.remarks,b.zone,b.sa_no,b.state_asso,b.region,b.area from gmap_all_officers a, camps_master b where upper(a.camp) = upper(b.camp) and Upper(a.mid)=Upper('" + mid + "') and Upper(a.designation)=Upper('" + designation + "') ";
        //System.out.println("Query " + query);
        PreparedStatement pstm = con.prepareStatement(query);
        rs = pstm.executeQuery();

        while (rs.next()) {
            json.put("zone", rs.getString("zone"));
            json.put("sa", rs.getString("sa_no"));
            json.put("state_asso", rs.getString("state_asso"));
            json.put("region", rs.getString("region"));
            json.put("area", rs.getString("area"));
            json.put("camp", rs.getString("camp"));
            json.put("designation", rs.getString("designation"));
            json.put("name", rs.getString("name"));
            json.put("memid", rs.getString("mid"));
            json.put("mobile", rs.getString("phone"));
            json.put("email", rs.getString("email"));
            json.put("remarks", rs.getString("remarks"));
        }
        out.print(json);
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>