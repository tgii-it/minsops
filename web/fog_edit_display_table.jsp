<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();

        String sql = "select camp,name,email,email2,address,address2,mobile,mobile2,state,city,pincode,refer_gideon,church,camount,pp,fp,nvl(SUBMITTED_BY,'-')SUBMITTED_BY,nvl(SUBMITTED_ON,'-')SUBMITTED_ON,nvl(STREET_ADDR,'-')STREET_ADDR,nvl(CONTACT_ID,'0')CONTACT_ID,nvl(EXTERNAL_ID,'-')EXTERNAL_ID,nvl(DONOR_TYPE,'-')DONOR_TYPE, nvl(SUBJECT,'-')SUBJECT,nvl(DONATION_STATUS,'-')DONATION_STATUS,nvl(DONATION_TYPE,'-')DONATION_TYPE,nvl(SIGN_UP_FOR_FOG,'-')SIGN_UP_FOR_FOG,nvl(IF_YES_PLEASE_SELECT,'-')IF_YES_PLEASE_SELECT,nvl(rid,'0')rid from fog_form where name is not null order by name";
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();

        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            JsonObject ja = new JsonObject();
            ja.addProperty("rid", rs.getString("rid"));
            ja.addProperty("camp", rs.getString("camp"));
            ja.addProperty("name", rs.getString("name"));
            ja.addProperty("mobile", rs.getString("mobile"));
            ja.addProperty("email", rs.getString("email"));
            ja.addProperty("action", "<p style='text-align: left;'><button type='button' class='btn btn-success btn-xs editRow1' name='editRow1' rid='" + rs.getString("rid") + "' data-toggle='modal' data-target='#myModal' title='Edit this record' ><i class='fa fa-check-circle'></i></button>&nbsp;&nbsp;"
                    + "<button type='button' class='btn btn-danger btn-xs delete' name='delete' rid='" + rs.getString("rid") + "' title='Delete this record'><i class='fa fa-trash' aria-hidden='true'></i></button></p>");

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