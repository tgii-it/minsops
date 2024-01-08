<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%
    String v_action = request.getParameter("action");
    String rid = request.getParameter("rid");
    JSONObject json = new JSONObject();
    String query = "";
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    //System.out.println("RID " + rid);
    String aplan = "0";
    String lplan = "0";

    DataSource ds = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        stmt = con.createStatement();

        // if (v_action != null && !v_action.isEmpty() && v_action.equalsIgnoreCase("Edit") && mid != null && !mid.isEmpty()) {
        query = "select * from v_MEMBERSHIP_EFORM_NEW where rid='" + rid + "'";
        // }
        //System.out.println("Edit Query " + query);
        PreparedStatement pstm = con.prepareStatement(query);
        rs = pstm.executeQuery();

        while (rs.next()) {
            json.put("gideonname", rs.getString("gideonname"));
            json.put("auxname", rs.getString("auxname"));
            json.put("MTYPE", rs.getString("MTYPE"));
            if (rs.getString("MPLAN").contains("Annual")) {
                json.put("APLAN", rs.getString("MPLAN"));
                json.put("LPLAN", lplan);
            } else {
                json.put("APLAN", aplan);
                json.put("LPLAN", rs.getString("MPLAN"));
            }
            json.put("GFEE", rs.getString("GFEE"));
            json.put("AFEE", rs.getString("AFEE"));
            json.put("MFEE", rs.getString("MFEE"));
            json.put("FATHERNAME", rs.getString("FATHERNAME"));
            json.put("GDOB", rs.getString("GDOB"));
            json.put("GMOBILE", rs.getString("GMOBILE"));
            json.put("GWMOBILE", rs.getString("GWMOBILE"));
            json.put("GEMAIL", rs.getString("GEMAIL"));
            json.put("ADOB", rs.getString("ADOB"));
            json.put("AMOBILE", rs.getString("AMOBILE"));
            json.put("AWMOBILE", rs.getString("AWMOBILE"));
            json.put("AEMAIL", rs.getString("AEMAIL"));
            json.put("GID", rs.getString("GID"));

            json.put("AUXPROFESSION", rs.getString("AUXPROFESSION"));
            json.put("ADDR1", rs.getString("ADDR1"));
            json.put("ADDR2", rs.getString("ADDR2"));
            json.put("CITY", rs.getString("CITY"));
            json.put("STATE", rs.getString("STATE"));
            json.put("PINCODE", rs.getString("PINCODE"));
            json.put("CHURCHNAME", rs.getString("CHURCHNAME"));
            json.put("CHURCHADDR", rs.getString("CHURCHADDR"));
            json.put("CHURCHCITY", rs.getString("CHURCHCITY"));

            json.put("CHURCHDENOINATION", rs.getString("CHURCHDENOINATION"));
            json.put("PASTORNAME", rs.getString("PASTORNAME"));
            json.put("PASTORMOBILE", rs.getString("PASTORMOBILE"));
            json.put("PASTOREMAIL", rs.getString("PASTOREMAIL"));
            json.put("FORMFILLEDBY", rs.getString("FORMFILLEDBY"));
            json.put("SOURCEOFAPPLN", rs.getString("SOURCEOFAPPLN"));
            json.put("FORMFILLEDBYFONAME", rs.getString("FORMFILLEDBYFONAME"));
            json.put("FORMFILLEDBYGIDEONNAME", rs.getString("FORMFILLEDBYGIDEONNAME"));
            json.put("FORMFILLEDBYMID", rs.getString("FORMFILLEDBYMID"));

            json.put("FORMFILLEDBYCAMP", rs.getString("FORMFILLEDBYCAMP"));
            json.put("REF1NAME", rs.getString("REF1NAME"));
            json.put("REF1PHONE", rs.getString("REF1PHONE"));
            json.put("REF1CAMP", rs.getString("REF1CAMP"));
            json.put("REF2NAME", rs.getString("REF2NAME"));
            json.put("REF2PHONE", rs.getString("REF2PHONE"));
            json.put("REF2CAMP", rs.getString("REF2CAMP"));
            json.put("PAYMETHOD", rs.getString("PAYMETHOD"));
            json.put("TRNO", rs.getString("TRNO"));
            json.put("TRDATE", rs.getString("TRDATE"));

            json.put("TRBANK", rs.getString("TRBANK"));
            json.put("REMARKS", rs.getString("REMARKS"));
            json.put("DECLARATIONCHECK", rs.getString("DECLARATIONCHECK"));
            json.put("MODE_OF_APPLICATION", rs.getString("MODE_OF_APPLICATION"));
            json.put("S2Q1", rs.getString("S2Q1"));
            json.put("S2Q2", rs.getString("S2Q2"));
            json.put("S2Q3", rs.getString("S2Q3"));
            json.put("S2Q4", rs.getString("S2Q4"));
            json.put("S2Q5", rs.getString("S2Q5"));
            json.put("S2Q6", rs.getString("S2Q6"));
            json.put("S2Q7", rs.getString("S2Q7"));
            json.put("S2Q8", rs.getString("S2Q8"));

            json.put("PREVIOUSMEMBERSHIP", rs.getString("PREVIOUSMEMBERSHIP"));
            json.put("SECV", rs.getString("SECV"));
            json.put("GIDEONPROFESSION", rs.getString("GIDEONPROFESSION"));
            json.put("EDUCATION", rs.getString("EDUCATION"));
            json.put("WORKNATURE", rs.getString("WORKNATURE"));
            json.put("WORKPLACE", rs.getString("WORKPLACE"));
            json.put("JOBTITLE", rs.getString("JOBTITLE"));
            json.put("BUSINESSMANQ1", rs.getString("BUSINESSMANQ1"));
            json.put("BUSINESSNAME", rs.getString("BUSINESSNAME"));
            json.put("BUSINESSNATURE", rs.getString("BUSINESSNATURE"));

            json.put("BUSINESSTITLE", rs.getString("BUSINESSTITLE"));

            if (rs.getString("MPLAN").contains("Both")) {
                json.put("MARITALSTATUS", "Married");
                json.put("SPOUSENAME", rs.getString("AUXNAME"));
            } else {
                json.put("MARITALSTATUS", "0");
                json.put("SPOUSENAME", rs.getString("SPOUSENAME"));
            }
        }
        out.print(json);
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>