/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IT_DEPARTMENT
 */
public class ProcessCampRequest extends HttpServlet {

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
        String camp = request.getParameter("camp");
        String old_camp = request.getParameter("old_camp");
        String state_asso = request.getParameter("state_asso");
        String memid = request.getParameter("memid");
        String memname = request.getParameter("memname");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String memstatus = request.getParameter("memstatus");
        String memtype = request.getParameter("memtype");
        String call_status = request.getParameter("call_status");
        String remarks = request.getParameter("remarks");
        String designation = request.getParameter("designation");
        String old_designation = request.getParameter("old_designation");
        String new_designation = request.getParameter("new_designation");
        String submitted_on = request.getParameter("submitted_on");
        String submitted_by = request.getParameter("submitted_by");
        DataAccessLayer da = new DataAccessLayer();
        String chkbox[];
        chkbox = request.getParameterValues("chkApprove");
        String reply[] = new String[chkbox.length];

        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("designationupdate")) {
            try {
                String failure_list = "";

                for (int i = 0; i < chkbox.length; i++) {
                    memid = chkbox[i];
                    reply[i] = da.CallDesignationUpdate(new_designation, old_designation, state_asso, memid, memname, mobile, email, memstatus, memtype, call_status, camp, remarks, submitted_on, submitted_by);

                    if (reply[i].equalsIgnoreCase("Failure")) {
                        failure_list = failure_list + " " + memid;
                    }
                }

                if (failure_list.equals("")) {
                    response.sendRedirect("designationUpdate.jsp?msg=Success&camp=" + camp + "&memid=" + session.getId());
                }

            } catch (Exception e) {
                System.out.println("MembershipProcessRequest/" + e.toString());
            } finally {
                out.close();
            }
        } else if (action.equalsIgnoreCase("campchange")) {
            try {
                String failure_list = "";

                for (int i = 0; i < chkbox.length; i++) {
                    memid = chkbox[i];
                    reply[i] = da.CallStatusUpdate(camp, old_camp, state_asso, memid, memname, mobile, email, memstatus, memtype, call_status, designation, remarks, submitted_on, submitted_by);

                    if (reply[i].equalsIgnoreCase("Failure")) {
                        failure_list = failure_list + " " + memid;
                    }
                }

                if (failure_list.equals("")) {
                    response.sendRedirect("camp_transfer.jsp?msg=Success&camp=" + camp + "&memid=" + session.getId());
                }

            } catch (Exception e) {
                System.out.println("MembershipProcessRequest/" + e.toString());
            } finally {
                out.close();
            }
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
