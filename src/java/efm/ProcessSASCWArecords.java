/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

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
public class ProcessSASCWArecords extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String mid = request.getParameter("rid");
        String wa_remarks = request.getParameter("remarks");
        String wa_processed_by = request.getParameter("useraccessname");
        DataAccessLayer da = new DataAccessLayer();
        String chkbox[];
        chkbox = request.getParameterValues("chkApprove");
        String reply[] = new String[chkbox.length];

        try {
            String failure_list = "";

            for (int i = 0; i < chkbox.length; i++) {
                mid = chkbox[i];
                reply[i] = da.UpdateSASCWArecords(mid, wa_remarks, wa_processed_by);

                if (reply[i].equalsIgnoreCase("Failure")) {
                    failure_list = failure_list + " " + mid;
                }
            }

            if (failure_list.equals("")) {
                response.sendRedirect("stconvwagrp.jsp?msg=Success");
            }

        } catch (Exception e) {
            System.out.println("ProcessSASCWArecords/" + e.toString());
        } finally {
            out.close();
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
