<%@page language="java" import="org.json.JSONObject" %>
<%@page language="java" import="com.google.gson.*" %>
<%@page language="java" import="com.google.gson.JsonArray" %>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%  JSONObject json = new JSONObject();
    String sql = "SELECT "
            + "nvl(E503_DailyTotal,'0') fd, "
            + "to_char(nvl(E503_MONTH_RECONCILED_AMOUNT,'0'),'99,99,99,999') RECONCILED,to_char(nvl(E503_MONTH_PENDING_AMOUNT,'0'),'99,99,99,999') PENDING,to_char(nvl(E503_MONTH_OVERALL_AMOUNT,'0'),'99,99,99,999') OVERALL, "
           // + "to_char(nvl(E503_MonthTotal,'0'),'99,99,99,999') mtd, to_char(nvl(E503_YearTotal,'0'),'99,99,99,999') ytd, "
            + "to_char(nvl(E503_YEAR_RECONCILED_AMOUNT,'0'),'99,99,99,999') YR_RECONCILED,to_char(nvl(E503_YEAR_PENDING_AMOUNT,'0'),'99,99,99,999') YR_PENDING,to_char(nvl(E503_YEAR_OVERALL_AMOUNT,'0'),'99,99,99,999') YR_OVERALL,"
            + "to_char(nvl(E503_LastYearMonth,'0'),'99,99,99,999') lytm, "
            + "to_char(nvl(E503_LastYearTotal,'0'),'99,99,99,999') lyt  FROM dual";

    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        PreparedStatement stmt = con.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
            json.put("fd", rs.getString("fd"));
            json.put("mtd", rs.getString("RECONCILED"));
            json.put("pending", rs.getString("PENDING"));
            json.put("overall", rs.getString("OVERALL"));
            json.put("ytd", rs.getString("YR_RECONCILED"));
            json.put("yr_pending", rs.getString("YR_PENDING"));
            json.put("yr_overall", rs.getString("YR_OVERALL"));
            json.put("lytm", rs.getString("lytm"));
            json.put("lyt", rs.getString("lyt"));
        }
        out.print(json);

        rs.close();
        stmt.close();
        con.close();

    } catch (Exception e) {

    }
%>