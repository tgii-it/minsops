<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%  String sa_no = request.getParameter("state_asso");
    String status = request.getParameter("status");
    String sql = "";

    if (status == "0" || status.equalsIgnoreCase("0")) {
        sql = "select nvl(camp,'-') camp,nvl(designation,'Member') designation,CARS_GET_STATEASSO(CAMP) state_asso,CARS_GET_ZONE(CAMP) zone,CARS_GET_REGION(CAMP) region, CARS_GET_AREA(CAMP) area,nvl(state_association,'0') state_association,nvl(status,'0') status,nvl(cred_nfr_res_per_state,'-') cred_nfr_res_per_state, nvl(pastor_mobile,'0') pastor_mobile,nvl(state_officer_name,'-') state_officer_name,nvl(field_officer_name,'-') field_officer_name,nvl(source_of_application,'-') source_of_application,nvl(job_title,'-') job_title,nvl(qualification,'0') qualification,nvl(pastor_remarks,'-') pastor_remarks,nvl(pastor_name,'-') pastor_name,nvl(pastor_email,'-') pastor_email,nvl(cmobile,'0') cmobile,nvl(cemail,'-') cemail,nvl(church,'-') church,nvl(caddress,'-')caddress,  nvl(mid,'0') mid,deceased_date ,nvl(gender,'-') gender,nvl(preferred_language,'-') preferred_language,nvl(email,'-') email, nvl(mtype,'-') mtype,to_char(annual_end_date,'DD-MON-YY') annual_end_date,to_char(annual_start_date,'DD-MON-YY') annual_start_date, to_char(life_start_date,'DD-MON-YY') life_start_date,to_char(dob,'DD-MON-YY') dob,to_char(member_since,'DD-MON-YY') member_since, nvl(designation,'-') designation, nvl(phone,'0') phone, nvl(mobile2,'0') mobile2, nvl(mobile3,'0') mobile3,nvl(address2,'-') address2, nvl(street,'-') street, nvl(area_name,'-') area_name, nvl(city,'-') city, nvl(region_name,'-') region_name, nvl(name,'-') name,nvl(address,'-') address, nvl(state,'0') state, nvl(pincode,'0') pincode from membership_weekly_raw where Upper(state_association) = Upper('" + sa_no + "')  ";
    } else if (status == "1" || status.equalsIgnoreCase("1")) {
        sql = "select nvl(camp,'-') camp,nvl(designation,'Member') designation,CARS_GET_STATEASSO(CAMP) state_asso,CARS_GET_ZONE(CAMP) zone,CARS_GET_REGION(CAMP) region, CARS_GET_AREA(CAMP) area,nvl(state_association,'0') state_association,nvl(status,'0') status,nvl(cred_nfr_res_per_state,'-') cred_nfr_res_per_state, nvl(pastor_mobile,'0') pastor_mobile,nvl(state_officer_name,'-') state_officer_name,nvl(field_officer_name,'-') field_officer_name,nvl(source_of_application,'-') source_of_application,nvl(job_title,'-') job_title,nvl(qualification,'0') qualification,nvl(pastor_remarks,'-') pastor_remarks,nvl(pastor_name,'-') pastor_name,nvl(pastor_email,'-') pastor_email,nvl(cmobile,'0') cmobile,nvl(cemail,'-') cemail,nvl(church,'-') church,nvl(caddress,'-')caddress,  nvl(mid,'0') mid,deceased_date ,nvl(gender,'-') gender,nvl(preferred_language,'-') preferred_language,nvl(email,'-') email, nvl(mtype,'-') mtype,to_char(annual_end_date,'DD-MON-YY') annual_end_date,to_char(annual_start_date,'DD-MON-YY') annual_start_date, to_char(life_start_date,'DD-MON-YY') life_start_date,to_char(dob,'DD-MON-YY') dob,to_char(member_since,'DD-MON-YY') member_since, nvl(designation,'-') designation, nvl(phone,'0') phone, nvl(mobile2,'0') mobile2, nvl(mobile3,'0') mobile3,nvl(address2,'-') address2, nvl(street,'-') street, nvl(area_name,'-') area_name, nvl(city,'-') city, nvl(region_name,'-') region_name, nvl(name,'-') name,nvl(address,'-') address, nvl(state,'0') state, nvl(pincode,'0') pincode from membership_weekly_raw where Upper(state_association) = Upper('" + sa_no + "')  ";
    } else {
        sql = "select nvl(camp,'-') camp,nvl(designation,'Member') designation,CARS_GET_STATEASSO(CAMP) state_asso,CARS_GET_ZONE(CAMP) zone,CARS_GET_REGION(CAMP) region, CARS_GET_AREA(CAMP) area,nvl(state_association,'0') state_association,nvl(status,'0') status,nvl(cred_nfr_res_per_state,'-') cred_nfr_res_per_state, nvl(pastor_mobile,'0') pastor_mobile,nvl(state_officer_name,'-') state_officer_name,nvl(field_officer_name,'-') field_officer_name,nvl(source_of_application,'-') source_of_application,nvl(job_title,'-') job_title,nvl(qualification,'0') qualification,nvl(pastor_remarks,'-') pastor_remarks,nvl(pastor_name,'-') pastor_name,nvl(pastor_email,'-') pastor_email,nvl(cmobile,'0') cmobile,nvl(cemail,'-') cemail,nvl(church,'-') church,nvl(caddress,'-')caddress,  nvl(mid,'0') mid,deceased_date ,nvl(gender,'-') gender,nvl(preferred_language,'-') preferred_language,nvl(email,'-') email, nvl(mtype,'-') mtype,to_char(annual_end_date,'DD-MON-YY') annual_end_date,to_char(annual_start_date,'DD-MON-YY') annual_start_date, to_char(life_start_date,'DD-MON-YY') life_start_date,to_char(dob,'DD-MON-YY') dob,to_char(member_since,'DD-MON-YY') member_since, nvl(designation,'-') designation, nvl(phone,'0') phone, nvl(mobile2,'0') mobile2, nvl(mobile3,'0') mobile3,nvl(address2,'-') address2, nvl(street,'-') street, nvl(area_name,'-') area_name, nvl(city,'-') city, nvl(region_name,'-') region_name, nvl(name,'-') name,nvl(address,'-') address, nvl(state,'0') state, nvl(pincode,'0') pincode from membership_weekly_raw where Upper(state_association) = Upper('" + sa_no + "') and Upper(status) = Upper('" + status + "') ";
    }

    JsonObject gson = new JsonObject();
    JsonArray array = new JsonArray();

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            JsonObject ja = new JsonObject();
            ja.addProperty("zone", rs.getString("zone"));
            ja.addProperty("state_asso", rs.getString("state_asso"));
            ja.addProperty("region", rs.getString("region"));
            ja.addProperty("area", rs.getString("area"));
            ja.addProperty("camp", rs.getString("camp"));
            ja.addProperty("mid", rs.getString("mid"));
            ja.addProperty("name", rs.getString("name"));
            ja.addProperty("dob", rs.getString("dob"));
            ja.addProperty("mtype", rs.getString("mtype"));
            ja.addProperty("member_since", rs.getString("member_since"));
            ja.addProperty("life_start_date", rs.getString("life_start_date"));
            ja.addProperty("annual_start_date", rs.getString("annual_start_date"));
            ja.addProperty("annual_end_date", rs.getString("annual_end_date"));
            ja.addProperty("status", rs.getString("status"));
            ja.addProperty("street", rs.getString("street"));
            ja.addProperty("address", rs.getString("address"));
            ja.addProperty("address2", rs.getString("address2"));
            ja.addProperty("city", rs.getString("city"));
            ja.addProperty("state", rs.getString("state"));
            ja.addProperty("pincode", rs.getString("pincode"));
            ja.addProperty("phone", rs.getString("phone"));
            ja.addProperty("email", rs.getString("email"));
            ja.addProperty("designation", rs.getString("designation"));
            array.add(ja);
        }
        gson.add("datas", array);
        out.print(gson.toString());
        rs.close();
        statement.close();
        con.close();
    } catch (Exception e) {
    }
%>