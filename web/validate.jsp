<%-- 
    Document   : validate
    Created on : Jun 11, 2015, 10:57:46 AM
    Author     : ANBALAGAN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="efm.PasswordEncryptor"%>
<%@page import="java.util.*" %>
<%@page import="java.awt.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.util.Date.*" %>
<%@page contentType="text/html" import="java.util.*" %>
<!DOCTYPE html>
<%
    String useraccessname = "";
    String userName = "";
    String useraccessno = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
        userName = session.getAttribute("useraccessname").toString();
        useraccessno = session.getAttribute("useraccessno").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Password Reset online..</title>
        <link rel="stylesheet" href="css/bca_OneColumnTStyle.css" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <style>
            .high {
                background-color: greenyellow;
                color: black;
            }
            .low {
                background-color: #ffb3b3;
                color: black;
            }
            .loading{
                width:90%;
                margin:0 auto;
                height:8px;
                background-color:lightblue;
                position:relative;
                transition: all 300ms ease-in-out;
                z-index: 1;
            }
            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #ffe114 !important;
                overflow-x: hidden;
                transition: 0.1s;
                padding-top: 90px;
                z-index: 1000;
            }

            .sidenav a {
                padding: 5px 5px 5px 20px;
                text-decoration: none;
                font-size: 13px;
                font-weight: bold;
                color: #01354a;
                display: block;
                transition: 0.3s;
                z-index: 1;
            }

            .sidenav a:hover {
                background-color: #01354a !important; 
                color: #ffe114;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 7px;
                font-size: 25px;
                font-weight: bold;
                padding-top: 45px;
            }
            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #01354a !important;
                color: #ffe114;
                text-align: center;
                font-size: 10px;
            }


        </style>
        <style>
            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }

            .jumbotron {
                background-color: #428bca;
                color: #fff;
                padding: 15px 25px;
                font-family: Montserrat, sans-serif;
            }
            .container-fluid {
                height:100%;
                width:100%;
            }
            .bg-grey {
                background-color: #f6f6f6;
            }
            .bg-blue {
                background-color: #f2f7fd;
            }
            .logo-small {
                color: #428bca;
                font-size: 50px;
            }
            .logo {
                color: #428bca;
                font-size: 200px;
            }
            .thumbnail {
                padding: 0 0 15px 0;
                border: none;
                border-radius: 0;
            }
            .thumbnail img {
                width: 100%;
                height: 100%;
                margin-bottom: 10px;
            }
            .carousel-control.right, .carousel-control.left {
                background-image: none;
                color: #428bca;
            }
            .carousel-indicators li {
                border-color: #428bca;
            }
            .carousel-indicators li.active {
                background-color: #428bca;
            }
            .item h4 {
                font-size: 19px;
                line-height: 1.375em;
                font-weight: 400;
                font-style: italic;
                margin: 70px 0;
            }
            .item span {
                font-style: normal;
            }
            .panel {
                border: 1px solid #ffe114; 
                border-radius:3px !important;
                transition: box-shadow 0.3s;
            }
            .panel:hover {
                box-shadow: 5px 0px 30px rgba(0,0,0, .2);
            }
            .panel-footer .btn:hover {
                border: 1px solid #ffe114;
                background-color: #fff !important;
                color: #428bca;
            }
            .panel-heading {
                color: #fff !important;
                background-color: #ffe114 !important;
                padding: 15px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-sub-heading {
                color: #fff !important;
                background-color: #428bca !important;
                padding: 5px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-footer {
                background-color: white !important;
            }
            .panel-footer h3 {
                font-size: 32px;
            }
            .panel-footer h4 {
                color: #aaa;
                font-size: 14px;
            }
            .panel-footer h5 {
                font-size: 22px;
            }
            .panel-footer h6 {
                font-size: 13px;
            }
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #428bca;
                color: #fff;
            }

            .slideanim {visibility:hidden;}
            .slide {
                animation-name: slide;
                -webkit-animation-name: slide;
                animation-duration: 1s;
                -webkit-animation-duration: 1s;
                visibility: visible;
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    transform: translateY(0%);
                }
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
            }

        </style>
        <style>
            .dropbtn {
                background-color: #2185eb;
                color: white;
                padding: 0px 0px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                float:right;
                margin-right: 5px;
            }

            .dropdown {
                position: relative;
                display: inline-block;

            }

            .dropdown-content {            
                display: none;   
                margin-top: 31px;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 16px;
                font-size: 12px;
                right: 6px;
                z-index: 1;
                box-sizing: content-box;
                width: 120px;
                height: 110px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover { background-color: #ccc}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #2185eb;;
            }

            .dropdown:hover .dmenu {
                display: block;
            }
            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu>.dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -1px;
                -webkit-border-radius: 0 6px 6px 6px;
                -moz-border-radius: 0 6px 6px;
                border-radius: 0 6px 6px 6px;
            }

            .dropdown-submenu:hover>.dropdown-menu {
                display: block;
            }

            .dropdown-submenu>a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #ccc;
                margin-top: 5px;
                margin-right: -10px;
            }

            .dropdown-submenu:hover>a:after {
                border-left-color: #fff;
            }

            .dropdown-submenu.pull-left {
                float: none;
            }

            .dropdown-submenu.pull-left>.dropdown-menu {
                left: -100%;
                margin-left: 10px;
                -webkit-border-radius: 6px 0 6px 6px;
                -moz-border-radius: 6px 0 6px 6px;
                border-radius: 6px 0 6px 6px;
            }
            .navbar{
                top:0;
                width:100%; 
                z-index: 9999;
                position: fixed;
                background-color: #01354a;
            }

            .navbar-brand {
                margin-top: 0;
                margin-bottom: 0;
                background-color: #01354a;
                color: #ffe114 !important;
                z-index: 9999;
                border: 0;
                font-size: 28px !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;  
                cursor:pointer; 
                vertical-align: middle;
            }
        </style>
        <script>
            window.location.hash = "no-back-button";

            // Again because Google Chrome doesn't insert
            // the first hash into the history
            window.location.hash = "Again-No-back-button";

            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            }

            window.history.forward();
            function noBack() {
                window.history.forward();
            }
        </script>
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" style="background-color: #fff; width: 100%;">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div>    
                <span class="navbar-brand pull-left" onclick="openNav()">&nbsp;</span>                          
                <a href="index.html"><img alt="The Gideons International" src="./images/GideonsLogo2.png" align="left"  height="50" width="160"  style="padding: 5px;"/></a>
            </div>
        </nav>
        <div id="loader" class="se-pre-con"></div>
        <section id="main" style="padding: 65px 0px;">
            <div class="container">
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-heading" style="background-color: #fff;">
                        <h3 class="panel-title" style="vertical-align: middle; text-align: center; font-size: 12px; font-weight: bold; color: #14599f; letter-spacing: 3px;">ACKNOWLEDGEMENT</h3>
                    </div>
                    <div class="table-responsive" style="padding-top: 30px; padding-bottom: 25px;">

                        <%  String v_np = request.getParameter("np");
                            String v_rnp = request.getParameter("rnp");
                            String v_email = ""; //request.getParameter("iemail");

                            if (v_np.equals(v_rnp)) {
                                String encrypted_pwd = "";
                                int updateQuery = 0;

                                PasswordEncryptor pe = new PasswordEncryptor();
                                encrypted_pwd = pe.encrypt(v_rnp);

                                DataSource ds = null;
                                Connection con = null;
                                Context context = new InitialContext();
                                Context envCtx = (Context) context.lookup("java:comp/env");
                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                String sql = "update app_user set passwd='" + encrypted_pwd + "' where (upper(user_id)=upper('" + useraccessno + "') or upper(user_id)=upper('" + useraccessname + "') ) ";
                              //  System.out.println("update app_user set passwd='" + encrypted_pwd + "' where (upper(user_id)=upper('" + useraccessno + "') or upper(user_id)=upper('" + useraccessname + "') ) ");
                                try {
                                    con = ds.getConnection();

                                    PreparedStatement ps = con.prepareStatement(sql);

                                    // ps.setString(1, encrypted_pwd);
                                    // ps.setString(2, useraccessno);
                                    // ps.setString(3, useraccessname);
                                    updateQuery = ps.executeUpdate();
                                    con.close();

                                } catch (Exception e) {
                                    out.println(e);
                                }
                                if (updateQuery != 0) {%>
                        <table align="center" valign="middle">            
                            <tr>
                                <td align="center">
                                    <label>
                                        <font size="4" color="blue" face="Times New Roman">Password Reset Request has been processed Successfully!</font>
                                        <br>
                                        <font face="Times New Roman">You have to Login again to continue..</font>
                                    </label>
                                    <br><hr>
                                    <a href="index.html"><button class="btn btn-primary">Login</button></a>
                                </td>
                            </tr>
                        </table>
                        <%      // session.invalidate();
                        } else {
                        %>
                        <form action="changePasscode.jsp" name="validateForm">
                            <table align="center" valign="middle">            
                                <tr>
                                    <td align="center"><label><font size="4" color="blue" face="Times New Roman"> Request NOT processed! <br> Please contact the Administrator.</font></label><br><hr><br>
                                        <input type="submit" name="submit" value="Click here to Try Again" title="Click here">
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <%            }
                            }
                        %> 
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body> 
</html>