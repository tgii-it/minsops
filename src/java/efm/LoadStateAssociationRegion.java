package efm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class LoadStateAssociationRegion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String data = request.getParameter("data");
        String type = request.getParameter("type");

        events_DataAccessLayer da = new events_DataAccessLayer();
        try {
            if (data == null && type == null) {
                String result = "1";
                ArrayList<String> events = new ArrayList<String>();
                events = da.LoadStateAsso();
                Iterator<String> it = events.iterator();
                String a = "";
                while (it.hasNext()) {
                    a = it.next();
                    result = result + "," + a;
                }
                out.print(result);

            } else if (data != null && type != null) {
                if (type.equalsIgnoreCase("region")) {
                    String result = "2";
                    ArrayList<String> branches = new ArrayList<String>();
                    branches = da.LoadRegions(data);
                    Iterator<String> it = branches.iterator();
                    String a = "";
                    while (it.hasNext()) {
                        a = it.next();
                        result = result + "," + a;
                    }
                    out.print(result);
                } else if (type.equalsIgnoreCase("area")) {
                    String result = "3";
                    ArrayList<String> branches = new ArrayList<String>();
                    branches = da.LoadAreas(data);
                    Iterator<String> it = branches.iterator();
                    String a = "";
                    while (it.hasNext()) {
                        a = it.next();
                        result = result + "," + a;
                    }
                    out.print(result);
                }
            }
        } catch (Exception e) {
            System.out.println("LoadStateAssociationRegion/" + e.toString());
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
