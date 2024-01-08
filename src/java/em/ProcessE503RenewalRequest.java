/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package em;

import efm.DataAccessLayer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TGII_WORKSTATION
 */
public class ProcessE503RenewalRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String camp = request.getParameter("camp1");
        String name = request.getParameter("name");
        String mid = request.getParameter("mid");
        String annual_start_date = request.getParameter("annual_start_date");
        String annual_end_date = request.getParameter("annual_end_date");
        String annual_end_date_from = request.getParameter("enddatefrom");
        String mtype = request.getParameter("mtype");
        String status = request.getParameter("status");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String renewalStatus = request.getParameter("renewalStatus");
        String memtype = request.getParameter("memtype");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String contactperson = request.getParameter("contactperson");
        String useraccessname = request.getParameter("useraccessname");
        String remarks = request.getParameter("remarks");
        String signup_type = request.getParameter("signup_type");
        String credited_to = request.getParameter("credited_to");
        String redirect = request.getParameter("redirect");
        DataAccessLayer da = new DataAccessLayer();
        String chkbox[];
        chkbox = request.getParameterValues("chkApprove");
        String reply[] = new String[chkbox.length];

        try {
            String failure_list = "";

            for (int i = 0; i < chkbox.length; i++) {
                mid = chkbox[i];
                reply[i] = da.CallStatusUpdate_e503(camp, name, mid, phone, email, mtype, status, annual_end_date, renewalStatus, memtype, startdate, enddate, contactperson, remarks, annual_start_date, mobile2, mobile3, useraccessname, signup_type, credited_to, annual_end_date_from);

                if (reply[i].equalsIgnoreCase("Failure")) {
                    failure_list = failure_list + " " + mid;
                }
            }

            if (failure_list.equals("")) {
                response.sendRedirect("PendingRenewalsCampWise.jsp?msg=Success&camp=" + camp + "&SessionIn=" + session.getId());
            }

        } catch (Exception e) {
            System.out.println("MembershipProcessRequest/" + e.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
