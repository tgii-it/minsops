<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String get_date = "";
    String filename = "";
    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement statement = con.createStatement();
        get_date = "select to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YY HH:MI:SS AM') downloaded_on from dual";
        ResultSet resultSet = statement.executeQuery(get_date);
        while (resultSet.next()) {
            filename = "Camp Officers List " + resultSet.getString("downloaded_on") + ".xls";
        }
        resultSet.close();
        statement.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    String exportToExcel = request.getParameter("exportToExcel");
    if (exportToExcel
            != null && exportToExcel.toString()
                    .equalsIgnoreCase("YES")) {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename=" + filename);
    }
%>
<html>
    <body>
        <div id="container">
            <div id="content">
                <div class="table-responsive" style="vertical-align: middle; background-color: #fff;">
                    <table id="summary" class="table table-bordered table-responsive table-hover" border="1">
                        <thead style="background-color: #01354a; color: #ffe114;">  
                            <tr>
                                <th colspan="13" style="background-color: yellow; border-color: #fff; color: #01354a; text-align: left;"><h3><B>CAMP OFFICERS ADDRESS LIST</B></h3></th>
                            </tr>                                                          
                            <tr>                                               
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>SA No</th>
                                <th style="text-align: left; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>State Association</th>  

                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #ededff; border-color: #fff; color: #01354a;" nowrap>Region</th> 
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #ededff; border-color: #fff; color: #01354a;" >Area</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #ededff; border-color: #fff; color: #01354a;" >Camp</th>  
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Designation</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Name</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Member ID</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Contact No</th>  
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Email Address</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Membership Type</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Present Status</th>
                                <th style="text-align: left; vertical-align: middle; font-weight: bold; background-color: #EDEEE8; border-color: #fff; color: #01354a;" nowrap>Address</th>
                            </tr>
                        </thead>
                        <%
                            String sql = "";
                            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                            try {
                                con = ds.getConnection();
                                Statement statement = con.createStatement();
                                sql = "select * from V_CAMP_OFFICERS_LIST order by sa_no,region,area,camp,gid_aux asc";
                                ResultSet resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("sa_no")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("state_asso")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("region")%></td>
                            <td style="text-align: center;" nowrap><%=resultSet.getString("area")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("camp")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("designation")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("name")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("mid")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("phone")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("email")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("mtype")%></td>
                            <td style="text-align: left;" nowrap><%=resultSet.getString("status")%></td> 
                            <td style="text-align: left;" nowrap><%=resultSet.getString("address")%></td> 
                        </tr>
                        <%
                                }
                                resultSet.close();
                                statement.close();
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>                                                    
                </div>
            </div>
        </div>
    </body>
</html>