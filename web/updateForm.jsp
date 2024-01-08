<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%

    DataSource ds = null;
    Connection conn = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        conn = ds.getConnection();
        Statement st = conn.createStatement();
        String sql = "update membership_eform_new set gideonname='" + request.getParameter("gideonname") + "' ";

        int i = st.executeUpdate(sql);
        if (i > 0) {
            out.println("Membership eApplication form Updated Successfully!");
        } else {
            out.println("Not Processed");
        }
        
        st.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
