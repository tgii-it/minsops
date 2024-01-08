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
    String v_action = request.getParameter("action");
    String zone = request.getParameter("zone");
    String state_asso = request.getParameter("state_asso");
    String region = request.getParameter("region");
    String area = request.getParameter("area");
    String camp = request.getParameter("camp");
    String mid = request.getParameter("mid");
    String memid = request.getParameter("memid");
    String name = request.getParameter("name");
    String designation = request.getParameter("designation");
    String oDesignation = request.getParameter("oDesignation");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String remarks = request.getParameter("remarks");

    String sql = "";
    String sql1 = "";

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
            sql = "Update gmap_all_officers set "
                    + "mid = ('" + memid + "'), "
                    + "name = ('" + name + "'), "
                    + "designation = ('" + designation + "'), "
                    + "zone = ('" + zone + "'), "
                    + "sa = trim(substr('" + state_asso + "',3,2)), "
                    + "region = ('" + region + "'), "
                    + "area = ('" + area + "'), "
                    + "camp = ('" + camp + "'), "
                    + "phone = ('" + mobile + "'), "
                    + "mobile = ('" + mobile + "'), "
                    + "email = ('" + email + "'), "
                    + "gid_aux = (select distinct gid_aux from gmap_all_officers where upper(designation) = upper('" + designation + "') and rownum<2), "
                    + "remarks= ('" + remarks + "') "
                    + "where upper(mid) = upper('" + mid + "') and upper(designation) = upper('" + oDesignation + "')";

        } else {
            sql = "Update gmap_all_officers set "
                    + "mid = ('" + memid + "'), "
                    + "name = ('" + name + "'), "
                    + "designation = ('" + designation + "'), "
                    + "zone = ('" + zone + "'), "
                    + "sa = trim(substr('" + state_asso + "',3,2)), "
                    + "region = ('" + region + "'), "
                    + "area = ('" + area + "'), "
                    + "camp = ('" + camp + "'), "
                    + "phone = ('" + mobile + "'), "
                    + "mobile = ('" + mobile + "'), "
                    + "email = ('" + email + "'), "
                    + "gid_aux = nvl((select distinct gid_aux from gmap_all_officers where upper(designation) = upper('" + designation + "') and rownum<2),'0'), "
                    + "remarks= ('" + remarks + "') "
                    + "where upper(mid) = upper('" + mid + "') and upper(designation) = upper('" + oDesignation + "')";
        }

        sql1 = "Update MEMBERSHIP_WEEKLY_RAW set "
                + "name = '" + name + "', "
                + "designation = '" + designation + "', "
                + "phone = '" + mobile + "', "
                + "email = '" + email + "' "
                + "where upper(mid) = upper('" + memid + "') ";
        
        int n = st.executeUpdate(sql);
        int n1 = st.executeUpdate(sql1);
        if (n == 1 && n1 == 1) {
            out.print("Success");
        } else {
            out.print("Record not Processed..");
        }

        st.close();
        con.close();
    } catch (Exception e) {
    }
%>
