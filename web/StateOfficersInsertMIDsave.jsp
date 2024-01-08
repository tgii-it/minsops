<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%  JSONObject json = new JSONObject();
    String zone = request.getParameter("zone");
    String state_asso = request.getParameter("state_asso");
    String region = request.getParameter("region");
    String area = request.getParameter("area");
    String camp = request.getParameter("camp");
    String mid = request.getParameter("memid");
    String name = request.getParameter("name");
    String designation = request.getParameter("designation");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String remarks = request.getParameter("remarks");

    String sql = "";

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement st = null;
        st = con.createStatement();
        if (designation.contains("National")) {
            sql = "insert into gmap_all_officers values ("
                    + "'" + zone + "', "
                    + "trim(substr('" + state_asso + "',3,2)), "
                    + "'" + region + "', "
                    + "'" + area + "', "
                    + "'" + designation + "', "
                    + "'" + name + "', "
                    + "'" + mobile + "', "
                    + "'" + mobile + "', "
                    + "'" + email + "', "
                    + "'" + camp + "', "
                    + "'" + mid + "', "
                    + "(select distinct gid_aux from gmap_all_officers where upper(designation) = upper('" + designation + "') and rownum<2), "
                    + "'Active', "
                    + "(select py from perf_year where status='Active'), "
                    + "'" + remarks + "') ";
        } else {
            sql = "insert into gmap_all_officers values ("
                    + "'" + zone + "', "
                    + "trim(substr('" + state_asso + "',3,2)), "
                    + "'" + region + "', "
                    + "'" + area + "', "
                    + "'" + designation + "', "
                    + "'" + name + "', "
                    + "'" + mobile + "', "
                    + "'" + mobile + "', "
                    + "'" + email + "', "
                    + "'" + camp + "', "
                    + "'" + mid + "', "
                    + "(select distinct gid_aux from gmap_all_officers where upper(designation) = upper('" + designation + "') and rownum<2), "
                    + "'Active', "
                    + "(select py from perf_year where status='Active'), "
                    + "'" + remarks + "') ";
        }
        
        int n = st.executeUpdate(sql);
        if (n == 1) {
            out.print("Success");
        } else {
            out.print("Record not Processed..");
        }

        st.close();
        con.close();
    } catch (Exception e) {
    }
%>
