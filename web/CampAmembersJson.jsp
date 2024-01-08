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
        camps = "SELECT MID,NAME,(ltrim(name)||' - '||mid||' - '||nvl(phone,'xxxxxxxxxx')||' - '||InitCap(camp)||' - '||email) name_str,CAMP,'2' sa_no FROM MEMBERSHIP_WEEKLY_RAW a WHERE mtype like '%Aux%Annual%' and  Upper(camp)=Upper('" + request.getParameter("camp") + "')  AND status in ('Current','Pending','Grace','Dropped') ORDER BY MID";
        PreparedStatement stmt = con.prepareStatement(camps);
        // System.out.println("members list " + camps);
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
