<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="efile_jstl.jsp" %>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%  String camps = "";
    String json = "";
    Gson gson = new Gson();
    ArrayList<String> al = new ArrayList<String>();

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@enciva-cluster.net:1521:belmont", "CONVENTION", "ThVc7eBeW3");
        camps = "SELECT MID,NAME,(ltrim(name)||' - '||mid||' - '||nvl(phone,'NA')||' - '||InitCap(camp)||' - '||nvl(email,'.')) name_str,CAMP,'2' sa_no FROM MEMBERSHIP_WEEKLY_RAW a Where UPPER(STATUS)='CURRENT' ORDER BY MID";
        PreparedStatement stmt = con.prepareStatement(camps);

        ResultSet rs = stmt.executeQuery();
        JsonArray jsonArray = new JsonArray();
        while (rs.next()) {
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("id", rs.getString("mid"));
            jsonObject.addProperty("name", rs.getString("name_str"));
            jsonObject.addProperty("camp", rs.getString("camp"));
            jsonObject.addProperty("parent_id", rs.getString("sa_no"));
            jsonArray.add(jsonObject);
        }
        json = gson.toJson(jsonArray).toString();
        response.setContentType("application/json");
        response.getWriter().print(json);

        stmt.close();
        rs.close();
        con.close();

    } catch (Exception e) {

    }
%>
