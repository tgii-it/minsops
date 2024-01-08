<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%
    String v_action = request.getParameter("action");
    String mid = request.getParameter("mid");
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

        if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Edit") && mid != null && !mid.isEmpty()) {
            query = "select cred_nfr_res_per_state,source_of_application,mid,name,mtype,deceased_date,camp,address2,state_association,area_name,region_name,status,mobile2,mobile3,to_char(dob,'dd/mm/yyyy') date_of_birth,to_char(life_start_date,'dd/mm/yyyy') life_start_date,to_char(annual_start_date,'dd/mm/yyyy') annual_start_date,to_char(annual_end_date,'dd/mm/yyyy') annual_end_date,address,wemail,wmobile,wname,street,city,state,pincode,phone,email,designation,church,caddress,cemail,cmobile,pastor_name,pastor_email,pastor_mobile "
                    + "from membership_weekly_raw where status in ('Current','Grace','Dropped','Deceased') and mid='" + mid + "'";
        }
        PreparedStatement pstm = con.prepareStatement(query);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            json.put("mid", rs.getString("mid"));
            json.put("name", rs.getString("name"));
            json.put("date_of_birth", rs.getString("date_of_birth"));
            json.put("deceased_date", rs.getString("deceased_date"));
            json.put("address", rs.getString("address"));
            json.put("address2", rs.getString("address2"));
            json.put("camp", rs.getString("camp"));
            json.put("street", rs.getString("street"));
            json.put("mobile3", rs.getString("mobile3"));
            json.put("mobile2", rs.getString("mobile2"));
            json.put("city", rs.getString("city"));
            json.put("state_association", rs.getString("state_association"));
            json.put("area_name", rs.getString("area_name"));
            json.put("region_name", rs.getString("region_name"));
            json.put("state", rs.getString("state"));
            json.put("pincode", rs.getString("pincode"));
            json.put("phone", rs.getString("phone"));
            json.put("email", rs.getString("email"));
            json.put("designation", rs.getString("designation"));
            json.put("church", rs.getString("church"));
            json.put("caddress", rs.getString("caddress"));
            json.put("cemail", rs.getString("cemail"));
            json.put("cmobile", rs.getString("cmobile"));
            json.put("pastor_name", rs.getString("pastor_name"));
            json.put("pastor_email", rs.getString("pastor_email"));
            json.put("pastor_mobile", rs.getString("pastor_mobile"));
            json.put("mtype", rs.getString("mtype"));
            json.put("life_start_date", rs.getString("life_start_date"));
            json.put("annual_start_date", rs.getString("annual_start_date"));
            json.put("annual_end_date", rs.getString("annual_end_date"));
            json.put("wname", rs.getString("wname"));
            json.put("wmobile", rs.getString("wmobile"));
            json.put("wemail", rs.getString("wemail"));
            json.put("status", rs.getString("status"));
            json.put("source_of_application", rs.getString("source_of_application"));
            json.put("cred_nfr_res_per_state", rs.getString("cred_nfr_res_per_state"));
        }
        out.print(json);
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>