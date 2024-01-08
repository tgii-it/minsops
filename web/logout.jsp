<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.awt.*" %><%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.util.Date.*" %>
<!DOCTYPE html>
<%
    Object OBJ = session.getAttribute("efm_staff_role");
    if (OBJ == null) {
%>
<jsp:forward page="index.html"/>           
<%                  } else {
    String role = session.getAttribute("efm_staff_role").toString();

    if (!role.equalsIgnoreCase("yes")) {

%>
<jsp:forward page="index.html"/>           
<%        }
    }
%>
<html>
    <title>TGII | Accounts Module..</title>
    <script language="JavaScript">
        function Load() {
            self.close();
        }
    </script>
    <script>
        function noBack() {
            window.history.forward(1);
        }
    </script>
    <body onload="noBack();" onKeyDown="return false;">
        <%
            String v_userid = session.getAttribute("bca_userid").toString();
            int updateQuery = 0;

            DataSource ds = null;
            Connection con = null;
            Context context = new InitialContext();
            Context envCtx = (Context) context.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
            try {
                con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(" Update LOGIN_DETAILS set status=2, odatetime=to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM') where email=? and id in "
                        + "(select max(id) from login_details where email=?)");
                ps.setString(1, v_userid);
                ps.setString(2, v_userid);
                updateQuery = ps.executeUpdate();
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
            request.getSession(true).invalidate();
            response.sendRedirect("index.html");
        %>
    </body>

</html>
