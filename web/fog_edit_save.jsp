<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String email2 = request.getParameter("email2");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String camp = request.getParameter("camp");
    String mobile = request.getParameter("mobile");
    String mobile2 = request.getParameter("mobile2");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String state = request.getParameter("state");
    String address2 = request.getParameter("address2");
    String address = request.getParameter("address");
    String v_action = request.getParameter("action");
    String rid = request.getParameter("rid");
    String church = request.getParameter("church");
    String fp = request.getParameter("d");
    String pp = request.getParameter("pp");
    String refer_gideon = request.getParameter("refer_gideon");
    String camount = request.getParameter("camount");
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
        String rows2 = "INSERT INTO fog_delete_log SELECT a.*,'" + username + "',sysdate FROM fog_form a where a.rid='" + rid + "'";
        String sql1 = "INSERT INTO fog_update_log SELECT a.*,'" + username + "',sysdate FROM fog_form a where a.rid='" + rid + "'";

        if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Update") && rid != null && !rid.isEmpty()) {
            int rows1 = st.executeUpdate(sql1);
            if (rows1 > 0) {
                sql = "Update fog_form set "
                        + "email2= '" + email2 + "', "
                        + "email = '" + email + "', "
                        + "name = '" + name + "', "
                        + "city = '" + city + "', "
                        + "pincode = '" + pincode + "', "
                        + "state = '" + state + "', "
                        + "mobile2 = '" + mobile2 + "', "
                        + "camp = '" + camp + "', "
                        + "address2= '" + address2 + "', "
                        + "address = '" + address + "', "
                        + "church = '" + church + "', "
                        + "fp = nvl('" + fp + "','0'), "
                        + "pp= nvl('" + pp + "','0'), "
                        + "refer_gideon = '" + refer_gideon + "', "
                        + "camount = '" + camount + "', "
                        + "mobile = '" + mobile + "' "
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
                sql = "delete from fog_form where rid = " + rid + " ";
                n = st.executeUpdate(sql);
                if (n > 0) {
                    out.print("Record ID - " + rid + " : " + v_action + " request processed successfuly");
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