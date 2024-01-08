package em;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataAccessLayer_payment {

    public DataAccessLayer_payment() {
    }

    public String CallStatusUpdate(String rid, String tallyno, String tallydate, String voucher_type, String debit_ledger, String bank_voucher, String cheque_issued,
            String depositdate, String tallyremarks, String useraccessname) {
        String reply = "";
        int r = 0;
        String redirect = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            String query = "update e503_payment set tallyno ='" + tallyno + "', submitted_by ='" + useraccessname + "', submitted_on = sysdate, "
                    + "debit_ledger ='" + debit_ledger + "', voucher_type ='" + voucher_type + "', bank_voucher ='" + bank_voucher + "', cheque_issued ='" + cheque_issued + "', rstatus ='Processed', "
                    + "tallyremarks ='" + tallyremarks + "', depositdate =to_date('" + depositdate + "','mm/dd/yyyy'),tallydate =to_date('" + tallydate + "','mm/dd/yyyy') "
                    + "where rid='" + rid + "' ";
            // System.out.println("DataAccessLayer_payment/CallStatusUpdate " + query);
            PreparedStatement stmt = con.prepareStatement(query);
            r = stmt.executeUpdate(query);
            if (r > 0) {
                redirect = "paymentReconciliation.jsp";
            } else {
                reply = "Failure";
            }
            stmt.close();
            con.close();
        } catch (Exception exception) {
        }
        return reply;
    }

    /*
  * Method to create a datasource after the JNDI lookup
     */
    private DataSource getDataSource() throws NamingException {
        Context ctx;
        ctx = new InitialContext();
        Context envContext = (Context) ctx.lookup("java:/comp/env");
        // Look up a data source
        javax.sql.DataSource ds
                = (javax.sql.DataSource) envContext.lookup("tomcat/UCP_atp");
        return ds;
    }
}
