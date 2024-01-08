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
    String sa_no = request.getParameter("sa_no");
    String orbitid = request.getParameter("orbitid");
    String camp_no = request.getParameter("camp_no");
    String start_date = request.getParameter("start_date");
    String old_name = request.getParameter("old_name");
    String type = request.getParameter("type");
    String remarks = request.getParameter("remarks");
    String metrocity = request.getParameter("metrocity");
    String status = request.getParameter("status");

    if (start_date == null) {
        start_date = "";
    }

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
        sql = "Update CAMPS_MASTER set "
                + "zone = '" + zone + "', "
                + "sa_no = '" + sa_no + "', "
                + "state_asso = trim('" + state_asso + "'), "
                + "region = '" + region + "', "
                + "area = '" + area + "', "
                + "camp = Upper('" + camp + "'), "
                + "camp_no = '" + camp_no + "', "
                + "status = '" + status + "', "
                + "start_date = to_date('" + start_date + "','DD/MM/YYYY'), "
                + "old_name = '" + old_name + "', "
                + "remarks = '" + remarks + "', "
                + "type = Upper('" + type + "'), "
                + "metrocity = '" + metrocity + "' "
                + "where orbitid = '" + orbitid + "' ";

        System.out.println("Camps Master Record Update : " + sql);

        int n = st.executeUpdate(sql);
        if (n == 1 ) {
            out.print("Success");
        } else {
            out.print("Record not Processed..");
        }

        st.close();
        con.close();
    } catch (Exception e) {
    }
%>
