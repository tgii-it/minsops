<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
    String dataPoints = null;

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement statement = con.createStatement();
        String xVal, yVal;

        ResultSet resultSet = statement.executeQuery("select * from datapoints");

        while (resultSet.next()) {
            xVal = resultSet.getString("x");
            yVal = resultSet.getString("y");
            map = new HashMap<Object, Object>();
            map.put("x", Double.parseDouble(xVal));
            map.put("y", Double.parseDouble(yVal));
            list.add(map);
            dataPoints = gsonObj.toJson(list);
        }
        con.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
        dataPoints = null;
    }
%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            window.onload = function () {

            <% if (dataPoints != null) { %>
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    exportEnabled: false,
                    title: {
                        text: "JSP Column Chart from Database"
                    },
                    data: [{
                            type: "column", //change type to bar, line, area, pie, et        c
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();
                var chart1 = new CanvasJS.Chart("chartContainer1", {
                    animationEnabled: true,
                    exportEnabled: false,
                    title: {
                        text: "JSP Column Chart from Database"
                    },
                    data: [{
                            type: "spline", //change type to bar, line, area, pie, et        c
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart1.render();
            <% }%>

            }
        </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <br><br>
        <div id="chartContainer1" style="height: 370px; width: 100%;"></div>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
</html> 