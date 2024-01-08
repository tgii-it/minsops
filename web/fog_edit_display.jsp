<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="org.json.JSONObject"%>
<%
    String rid = request.getParameter("rid");
    JsonObject gson = new JsonObject();
    JSONObject json = new JSONObject();
    JsonArray array = new JsonArray();

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();

        String sql = "select camp,name,email,email2,address,address2,mobile,mobile2,state,city,pincode,refer_gideon,church,camount,nvl(pp,'0') pp,nvl(fp,'0') fp,nvl(SUBMITTED_BY,'-')SUBMITTED_BY,nvl(SUBMITTED_ON,'-')SUBMITTED_ON,nvl(STREET_ADDR,'-')STREET_ADDR,nvl(CONTACT_ID,'0')CONTACT_ID,nvl(EXTERNAL_ID,'-')EXTERNAL_ID,nvl(DONOR_TYPE,'-')DONOR_TYPE, nvl(SUBJECT,'-')SUBJECT,nvl(DONATION_STATUS,'-')DONATION_STATUS,nvl(DONATION_TYPE,'-')DONATION_TYPE,nvl(SIGN_UP_FOR_FOG,'-')SIGN_UP_FOR_FOG,nvl(IF_YES_PLEASE_SELECT,'-')IF_YES_PLEASE_SELECT,nvl(rid,'0')rid from fog_form where NAME IS NOT NULL AND rid='" + rid + "'";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            json.put("rid", rs.getString("rid"));
            json.put("name", rs.getString("name"));
            json.put("camp", rs.getString("camp"));
            json.put("email", rs.getString("email"));
            json.put("email2", rs.getString("email2"));
            json.put("address", rs.getString("address"));
            json.put("address2", rs.getString("address2"));
            json.put("mobile", rs.getString("mobile"));
            json.put("mobile2", rs.getString("mobile2"));
            json.put("state", rs.getString("state"));
            json.put("city", rs.getString("city"));
            json.put("pincode", rs.getString("pincode"));
            json.put("camount", rs.getString("camount"));
            json.put("address", rs.getString("address"));
            json.put("refer_gideon", rs.getString("refer_gideon"));
            json.put("church", rs.getString("church"));
            json.put("pp", rs.getString("pp"));
            json.put("fp", rs.getString("fp"));
        }
        out.print(json);
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>