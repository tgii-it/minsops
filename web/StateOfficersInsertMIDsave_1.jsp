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
    String elecdate = request.getParameter("elecdate");
    String perf_year = request.getParameter("perf_year");
    String term = request.getParameter("term");

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
                    + "'" + perf_year + "', "
                    + "'" + remarks + "',"
                    + "(select mtype from membership_weekly_raw where mid='" + mid + "' and status='Current'),"
                    + "(select to_char(annual_end_date,'DD/MM/YYYY') from membership_weekly_raw where mid='" + mid + "' and status='Current'),"
                    + "(select status from membership_weekly_raw where mid='" + mid + "' and status='Current'), '" + term + "', to_date('" + elecdate + "','DD/MM/YYYY'),"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM')) ";
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
                    + "'" + perf_year + "', "
                    + "'" + remarks + "',"
                    + "(select mtype from membership_weekly_raw where mid='" + mid + "' and status='Current'),"
                    + "(select to_char(annual_end_date,'DD/MM/YYYY') from membership_weekly_raw where mid='" + mid + "' and status='Current'),"
                    + "(select status from membership_weekly_raw where mid='" + mid + "' and status='Current'), '" + term + "', to_date('" + elecdate + "','DD/MM/YYYY'),"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM')) ";
        }
        //  System.out.println("Designations Insert " + sql);

        String sql1 = "Update MEMBERSHIP_WEEKLY_RAW set "
                + "name = '" + name + "', "
                + "designation = '" + designation + "', "
                + "state_association = trim('" + state_asso + "'), "
                + "region_name = '" + region + "', "
                + "area_name = '" + area + "', "
                + "phone = '" + mobile + "', "
                + "email = '" + email + "' "
                + "where upper(mid) = upper('" + mid + "') ";

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
