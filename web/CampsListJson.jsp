<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%  String camps = "";
    String json = "";
    Gson gson = new Gson();
    ArrayList<String> al = new ArrayList<String>();

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        camps = "SELECT camp,sa_no FROM Camps_master a WHERE upper(state_asso)=upper('" + request.getParameter("state_association") + "') AND UPPER(STATUS)='ACTIVE' ORDER BY Camp";

        PreparedStatement stmt = con.prepareStatement(camps);

        ResultSet rs = stmt.executeQuery();
        JsonArray jsonArray = new JsonArray();
        while (rs.next()) {
            JsonObject jsonObject = new JsonObject();
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