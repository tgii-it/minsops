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
    System.out.println("Comes here ");
    String camp = request.getParameter("camp");
    System.out.println("Comes here Camp " + camp);
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

        query = "select TO_CHAR(START_DATE,'DD/MM/YYYY') START_DATE,A.* from camps_master A where upper(camp)=upper('" + camp + "') ";
        System.out.println("Query " + query);
        PreparedStatement pstm = con.prepareStatement(query);
        rs = pstm.executeQuery();

        while (rs.next()) {
            json.put("CAMP", rs.getString("CAMP"));
            json.put("ORBITID", rs.getString("ORBITID"));
            json.put("ORBITID", rs.getString("ORBITID"));
            json.put("AREA_REGION", rs.getString("AREA_REGION"));
            json.put("ZONE", rs.getString("ZONE"));
            json.put("SA_NO", rs.getString("SA_NO"));
            json.put("REGION", rs.getString("REGION"));
            json.put("AREA", rs.getString("AREA"));
            json.put("SA", rs.getString("SA"));
            json.put("STATUS", rs.getString("STATUS"));
            json.put("CAMP_NO", rs.getString("CAMP_NO"));
            json.put("OLD_NAME", rs.getString("OLD_NAME"));
            json.put("REMARKS", rs.getString("REMARKS"));
            json.put("START_DATE", rs.getString("START_DATE"));
            json.put("CATEGORY", rs.getString("CATEGORY"));
        }
        out.print(json);
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>