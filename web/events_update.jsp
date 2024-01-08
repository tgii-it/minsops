<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String v_action = request.getParameter("action");
    String rid = request.getParameter("rid");
    String sf_goal_new = request.getParameter("sf_goal");
    String speakername_new = request.getParameter("speakername");
    String contact_person_new = request.getParameter("contact_person");
    String event_date_new = request.getParameter("event_date");
    String contact_phone_new = request.getParameter("contact_phone");
    String username = request.getParameter("username");
    String sql = "";
    int n = 0;

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement st = null;
        st = con.createStatement();
        String rows2 = "INSERT INTO events_delete_log SELECT a.*,'" + username + "',sysdate FROM events a where a.rid='" + rid + "'";
        String sql1 = "INSERT INTO events_update_log SELECT a.*,'" + sf_goal_new + "','" + contact_person_new + "','" + contact_phone_new + "',to_date('" + event_date_new + "','dd/mm/yyyy'),'" + speakername_new + "','" + username + "',sysdate FROM events a where a.rid='" + rid + "'";

        if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Update") && rid != null && !rid.isEmpty()) {
            int rows1 = st.executeUpdate(sql1);
            if (rows1 > 0) {
                sql = "Update events set "
                        + "contact_person= '" + contact_person_new + "', "
                        + "sf_goal = '" + sf_goal_new + "', "
                        + "ff_goal = '" + sf_goal_new + "', "
                        + "speakername = '" + speakername_new + "', "
                        + "contact_phone = '" + contact_phone_new + "', "
                        + "event_date =to_date('" + event_date_new + "','dd/mm/yyyy'),"
                        + "edate =to_date('" + event_date_new + "','dd/mm/yyyy') "
                        + "where rid = " + rid + " ";
                n = st.executeUpdate(sql);

                if (n > 0) {
                    out.print("Record ID - " + rid + " : " + v_action + " request processed successfuly");
                } else {
                    out.print("Record not Processed..");
                }
            }

        } else if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("delete") && rid != null && !rid.isEmpty()) {
            int rows3 = st.executeUpdate(rows2);
            if (rows3 > 0) {
                sql = (new StringBuilder()).append("delete from events where rid = ").append(rid).append(" ").toString();
                // sql = "delete from events where rid = " + rid + " ";
                n = st.executeUpdate(sql);
                if (n > 0) {
                    out.print((new StringBuilder()).append("Record ID - ").append(rid).append("  deleted successfuly").toString());
                } else {
                    out.print("Record not Processed..");
                }
            }
        }

        st.close();
        con.close();
    } catch (Exception e) {
    }
%>   

