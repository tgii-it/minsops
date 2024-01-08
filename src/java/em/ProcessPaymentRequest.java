package em;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

// Referenced classes of package em:
//            DataAccessLayer_payment
public class ProcessPaymentRequest extends HttpServlet {

    public ProcessPaymentRequest() {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out;
        String useraccessname;
        String tallyno;
        String tallydate;
        String voucher_type;
        String debit_ledger;
        String bank_voucher;
        String cheque_issued;
        String depositdate;
        String tallyremarks;
        DataAccessLayer_payment da;
        String chkbox[];
        String reply[];
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        HttpSession session = request.getSession();
        // String rid = request.getParameter("rid");
        useraccessname = request.getParameter("useraccessname");
        tallyno = request.getParameter("tallyno");
        tallydate = request.getParameter("tallydate");
        voucher_type = request.getParameter("voucher_type");
        debit_ledger = request.getParameter("debit_ledger");
        bank_voucher = request.getParameter("bank_voucher");
        cheque_issued = request.getParameter("cheque_issued");
        depositdate = request.getParameter("depositdate");
        tallyremarks = request.getParameter("tallyremarks");
        da = new DataAccessLayer_payment();
        chkbox = request.getParameterValues("chkApprove");
        reply = new String[chkbox.length];
        String failure_list = "";
        for (int i = 0; i < chkbox.length; i++) {
            String rid = chkbox[i];
            reply[i] = da.CallStatusUpdate(rid, tallyno, tallydate, voucher_type, debit_ledger, bank_voucher, cheque_issued, depositdate, tallyremarks, useraccessname);
            if (reply[i].equalsIgnoreCase("Failure")) {
                failure_list = (new StringBuilder()).append(failure_list).append(" ").append(rid).toString();
            }
        }

        if (failure_list.equals("")) {
            response.sendRedirect("paymentReconciliation.jsp");
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }
}
