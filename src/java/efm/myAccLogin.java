/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class myAccLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession(true);

            String userid = request.getParameter("txtUserName");
            String pwd = request.getParameter("password");
            String passId = request.getParameter("passId");
            // System.out.println("userid " + userid);
            String extid = request.getParameter("externalid");
            String orbitid = request.getParameter("orbitid");
            String mobile = request.getParameter("mobile");
            String name = request.getParameter("name");

            if (extid == null) {
                extid = userid;
            }
            if (orbitid == null) {
                orbitid = "";
            }
            if (mobile == null) {
                mobile = "0";
            }
            if (pwd == null || pwd == "") {
                pwd = "0";
            }
            if (name == null) {
                name = "";
            }

            String display_name = "";
            String useraccessname = "";
            String designation = "";
            String useraccessno = "";

            ArrayList<String> role = new ArrayList<String>();
            DataAccessLayer da = new DataAccessLayer();

            PasswordEncryptor pe = new PasswordEncryptor();
            String encrypt_pwd = "";
            encrypt_pwd = pe.encrypt(pwd);

            useraccessname = da.getName(userid);
            //  System.out.println("useraccessname " + useraccessname);
            useraccessno = da.getMno(userid);
            designation = da.getDesignation(userid);
            display_name = useraccessname;
            System.out.println("UserID " + da.getUserid(userid));
            System.out.println("encrypt_pwd " + encrypt_pwd);
            System.out.println("UserID " + da.getPasswd(userid));
            //  System.out.println("Passwd " + da.getPasswd(userid));

            if (userid.equalsIgnoreCase(da.getUserid(userid)) && encrypt_pwd.equalsIgnoreCase(da.getPasswd(userid)) && passId.equalsIgnoreCase("@cc0unts2o!9")) {
                session.setAttribute("bca_userid", display_name);
                session.setAttribute("pass_userid", userid);
                session.setAttribute("extid", userid);
                session.setAttribute("efm_staff_role", "yes");
                session.setAttribute("useraccessname", useraccessname);
                session.setAttribute("designation", designation);
                session.setAttribute("useraccessno", useraccessno);
                session.setAttribute("nc_home", "membership_reports.jsp");

                if (useraccessname.contains("Sam Varghese")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Anbalagan")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Mr  R.Vijai Ram")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Sandhana")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Alex")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Sucharitha")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Ravi")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Raj")) {
                    response.sendRedirect("membership_reports.jsp");
                } else if (useraccessname.contains("Derrick")) {
                    response.sendRedirect("membership_reports.jsp");
                } else {
                    response.sendRedirect("index.html");
                }
            } else {
                response.sendRedirect("index.html");
            }

        } catch (Exception e) {
            System.out.println("myAnalyticsLogin/" + new Date() + "/" + e.toString());
            response.sendRedirect("index.html");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception e) {
            System.out.println("Login Error:" + e.toString());
            response.sendRedirect("misLogin.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
