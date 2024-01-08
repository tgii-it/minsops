/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataAccessLayer {

    public Map<String, String> getEmployeeDetails(String userid) {
        String code = "";
        String empname = "";
        String dob = "";
        String doj = "";
        String status = "";
        String department_id = "";
        String sex = "";
        String father_name = "";
        Map<String, String> emp_details = new HashMap<String, String>();

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select code,(salutation||' '||sur_name||' '||first_name) empname,to_char(dob,'DD-MM-YYYY') dob,to_char(doj,'DD-MM-YYYY') doj,sex,status,department_id,name_of_father "
                    + " from employee "
                    + "where "
                    + "code ='" + userid + "'";

            rs = stmt.executeQuery(query);

            while (rs.next()) {
                emp_details.put("empname", rs.getString("empname"));
                emp_details.put("empid", rs.getString("code"));
                emp_details.put("dob", rs.getString("dob"));
                emp_details.put("sex", rs.getString("sex"));
                emp_details.put("status", rs.getString("status"));
                emp_details.put("doj", rs.getString("doj"));
                emp_details.put("department_id", rs.getString("department_id"));
                emp_details.put("father_name", rs.getString("name_of_father"));
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getEmployeeDetails/" + new Date() + "/" + e.toString());
        } finally {
        }
        return emp_details;
    }

    public String getUserid(String userid) {
        String Uid_available = "";
        String cnt = "";
        try {
            String query = "select count(*) cnt from app_user where user_id='" + userid + "' ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Uid_available = rs.getString("cnt");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getUserid()/" + new Date() + "/" + e.toString());
        }
        if (!Uid_available.equals("0")) {
            return userid;
        } else {
            return Uid_available;
        }
    }

    public String getUsername(String userid) {
        String Uid_available = "";
        String cnt = "";
        try {
            String query = "select Initcap(First_name) name from app_user where user_id='" + userid + "' and rownum<2";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Uid_available = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getUsername()/" + new Date() + "/" + e.toString());
        }
        if (!Uid_available.equals("0")) {
            return userid;
        } else {
            return Uid_available;
        }
    }

    public String getPasswd(String userid) {
        String pwd = "";
        try {
            String query = "select passwd from app_user where user_id='" + userid + "' and rownum<2";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getPasswd()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String formatIntToString(int i) {
        String str = "";
        try {
            str = new Integer(i).toString();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/formatIntToString()/" + new Date() + "/" + e.toString());
        }
        return str;
    }

    public String formatLongToString(long i) {
        String str = "";
        try {
            str = new Long(i).toString();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/formatIntToString()/" + new Date() + "/" + e.toString());
        }
        return str;
    }

    public String formatDouble(double d) {
        String result = "";
        try {
            DecimalFormat df = new DecimalFormat("##.00");
            if (d > 0) {
                result = df.format(d);
            }
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/formatDouble()/" + new Date() + "/" + e.toString());
        }
        return result;
    }

    public String getName(String userid) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select gideon_name first_name from camp_officers where upper(mid)=upper('" + userid + "') and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("first_name");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getName()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

//    public String menuString(String logedInUser) {
//        String menu = "", ret;
//        String cnt = "";
//        try {
//            DataSource ds = getDataSource();
//            Connection con = ds.getConnection();
//            Statement stmt = con.createStatement();
//            ResultSet rs = null;
//
//            cal_stmt = con.prepareCall("{ ?  = call  tree_menu( ?)}");
//            cal_stmt.registerOutParameter(1, Types.VARCHAR);
//            cal_stmt.setString(2, logedInUser);
//            cal_stmt.execute();
//            ret = cal_stmt.getString(1);
//            menu = "<div><ul>" + ret + "</ul></div>";
//            menu += "<script type =\"text / javascript\">ddtreemenu.createTree(\"treemenu1\", true)</script >";
//            stmt.close();
//            con.close();
//        } catch (Exception e) {
//            System.out.println("###Sa1sc_DataAccessLayer/menuString()/" + new Date() + "/" + e.toString());
//        }
//        return menu;
//    }
    public String menuString1(String logedInUser, String cValue) {
        String menu = "", ret;
        String cnt = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query1 = "select * from tbl_category where category_id ='" + cValue + "' order by category_id";
            menu = "<div><ul>";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while (rs1.next()) {
                menu += "<li><a href='" + rs1.getString("page_name") + "'>" + rs1.getString("category_name") + "</a><ul>";
                String query2 = "select * from tbl_subcategory where category_id='" + rs1.getString("category_id") + "' order by subcategory_id";
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery(query2);
                while (rs2.next()) {
                    menu += "<li><a href='" + rs2.getString("sub_page_name") + "'>" + rs2.getString("subcategory_name") + "</a></li>";
                }
                menu += "</ul></li>";
            }
            menu += "</ul>";
            rs1.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###Sa1sc_DataAccessLayer/menuString1()/" + new Date() + "/" + e.toString());
        }
        return menu;
    }

    public ArrayList<String> getUserRole(String userid, String passwd) {
        ArrayList<String> role = new ArrayList<String>();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "SELECT * FROM ROLE WHERE ID IN "
                    + "(SELECT ROLE_ID FROM USER_ROLE WHERE APPUSR_ID IN "
                    + "(SELECT ID FROM APP_USER WHERE USER_ID='" + userid + "' and PASSWD='" + passwd + "')) and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                role.add(rs.getString("name"));

            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getUserRole()/" + new Date() + "/" + e.toString());
        }
        return role;
    }

    public ArrayList<String> getUserRole1(String userid) {
        ArrayList<String> role = new ArrayList<String>();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "SELECT * FROM ROLE WHERE ID IN "
                    + "(SELECT ROLE_ID FROM USER_ROLE WHERE APPUSR_ID IN "
                    + "(SELECT ID FROM APP_USER WHERE USER_ID='" + userid + "')) and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                role.add(rs.getString("name"));

            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getUserRole1()/" + new Date() + "/" + e.toString());
        }
        return role;
    }

    public ArrayList<String> getUserRoleByAppUserId(int app_userid) {
        ArrayList<String> role = new ArrayList<String>();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "SELECT * FROM ROLE WHERE ID IN "
                    + "(SELECT ROLE_ID FROM USER_ROLE WHERE APPUSR_ID = " + app_userid
                    + " and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                role.add(rs.getString("name"));

            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getUserRole()/" + new Date() + "/" + e.toString());
        }
        return role;
    }

    public int getMemPlan(String rid) {
        String query = "";
        int mPlan = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select decode(mplan,'Annual Gideon','1','Annual Auxiliary','2','Annual Both','3','Life Gideon','1','Life Auxiliary','2','Life Both','3') as plan from membership_eform_new where rid = '" + rid + "' and rownum<2 ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                mPlan = rs.getInt("plan");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemPlan()/" + new Date() + "/" + e.toString());
        }
        return mPlan;
    }

    public int getMaxId(String Rcode) {
        int maxid = 0;
        String query = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            if (Rcode.length() == 6) {
                query = "select to_char(min(maxid),'000') as maxid from nc_id_tbl where Upper(rcode)=rtrim(Upper(substr('" + Rcode + "',1,3))) and flag='O' ";
            } else if (Rcode.length() == 7) {
                query = "select to_char(min(maxid),'000') as maxid from nc_id_tbl where Upper(rcode)=rtrim(Upper(substr('" + Rcode + "',1,4))) and flag='O' ";
            }

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMaxId()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getEReceipt_id() {
        int maxid = 0;
        String query = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select e_receipt_rid.nextval as mid from dual ";
            System.out.println("getEReceipt_id " + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            // System.out.println("getEReceipt_id " + maxid);
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getEReceipt_id()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public void setMaxId(String Rcode, int maxid) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            if (Rcode.equalsIgnoreCase("N-HQ")) {
                query = "update nc_id_tbl set flag='A' where Upper(rcode)='N-' and maxid=" + maxid;
            } else {
                query = "update nc_id_tbl set flag='A' where Upper(rcode)=rtrim(Upper(substr('" + Rcode + "',1,4))) and maxid=" + maxid;
            }

            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/setMaxId()/" + new Date() + "/" + e.toString());
        }

    }

    public int getMaxIdforEappln(String rid) {
        int maxid = 0;
        String query = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select min(maxid) as maxid from MEMBERSHIP_EFORM_NEW_MID where flag='O' ";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMaxIdforEappln()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public void setMaxIdforEappln(int mid) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update MEMBERSHIP_EFORM_NEW_MID set flag='A' where maxid='" + mid + "' ";
            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/setMaxIdforEappln()/" + new Date() + "/" + e.toString());
        }
    }

    public String manageString(String str) {
        String output = "";
        try {
            if (str == null || str == "" || str == "null" || str == "NULL") {
                output = "";
            } else if (str != null && str != "") {
                output = ((str.replaceAll("'", "''")).toUpperCase()).trim();
            }

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/manageString()/" + new Date() + "/" + e.toString());
        }
        return output;
    }

    public ArrayList<String> getStateAssoCamps(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select Initcap(Camp) as name from Camps_master where upper(state_asso)=upper('" + state_name + "') order by Camp ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("name"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getStateAssoCamps()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> getCamps(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select Initcap(Camp) as name from camps_master where upper(state_asso)=upper('" + state_name + "') order by Camp";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("name"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getCamps()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> getStateAsso() {
        ArrayList<String> events = new ArrayList<String>();
        try {
            String query = "select distinct state_asso as name, zone, sa_no from camps_master where sa_no<>'14' order by zone,sa_no";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                events.add(rs.getString("name"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getStateAsso()/" + new Date() + "/" + e.toString());
        }
        return events;
    }

    // Membership module - Dispatch Status Update..
    public String DispatchStatusUpdate(String refno, String courier, String docketno, String dispatch_date, String dispatchstatus, String user_id, String remarks) {
        String reply = "";
        int r = 0;
        String query = "";
        String query1 = "";
        int res_insert = 0;
        int res_update = 0;

        try {
            query = "update membership_weekly_raw "
                    + "set "
                    + "courier ='" + courier + "', "
                    + "docketno ='" + docketno + "', "
                    + "dispatch_date =to_date('" + dispatch_date + "','dd/mm/yyyy'), "
                    + "dispatch_updated_by ='" + user_id + "', "
                    + "dispatch_updated_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                    + "record_status ='" + dispatchstatus + "', "
                    + "dispatch_remarks  ='" + remarks + "' "
                    + "where "
                    + "upper(mid)=upper('" + refno + "')";

            query1 = "update san_process1 "
                    + "set "
                    + "COURIER ='" + courier + "', "
                    + "DOCKET_NO ='" + docketno + "', "
                    + "DISPATCH_DATE =to_date('" + dispatch_date + "','dd/mm/yyyy'), "
                    + "DISPATCH_PROCESSED_BY ='" + user_id + "', "
                    + "DISPATCH_PROCESSED_ON = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                    + "RECORD_STATUS ='" + dispatchstatus + "', "
                    + "DISPATCH_REMARKS  ='" + remarks + "' "
                    + "where "
                    + "upper(mid)=upper('" + refno + "')";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            res_insert = stmt.executeUpdate(query);

            if (res_insert == 1) {
                res_update = stmt.executeUpdate(query1);
                if (res_update == 1) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/DispatchStatusUpdate()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // Membership module - Card Printing Status Update..
    public String PaymentValidation(String refno, String tallyno, String tallydate, String tallyremarks, String user_id) {
        String reply = "";
        String query = "";
        String query1 = "";
        int res_insert = 0;
        int res_update = 0;

        int r = 0;
        try {
            query = "update e503 "
                    + "set "
                    + "tallyno ='" + tallyno + "', "
                    + "tallydate =to_date('" + tallydate + "','dd/mm/yyyy'), "
                    + "tallyremarks ='" + tallyremarks + "' "
                    + "where "
                    + "upper(rid)=upper('" + refno + "')";

            query1 = "update san_process1 "
                    + "set "
                    + "TALLY_RECEIPT_NO ='" + tallyno + "', "
                    + "TRN_MODIFIED_ON =to_date('" + tallydate + "','dd/mm/yyyy'), "
                    + "TRN_MODIFIED_BY ='" + user_id + "', "
                    + "TRN_REMARKS ='" + tallyremarks + "' "
                    + "where "
                    + "RENEWAL_CONTACTPERSON='" + refno + "' ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            res_insert = stmt.executeUpdate(query);

            if (res_insert > 0) {
                res_update = stmt.executeUpdate(query1);
                if (res_update > 0) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/PaymentValidation()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // Membership module - Card Printing Status Update..
    public String CardPrintingStatusUpdate(String refno, String CardPrintingwithphoto, String CardPrintingdate, String CardPrintingstatus, String user_id, String remarks) {
        String reply = "";
        String query = "";
        String query1 = "";
        int res_insert = 0;
        int res_update = 0;

        int r = 0;
        try {
            query = "update membership_weekly_raw "
                    + "set "
                    + "cp ='" + CardPrintingwithphoto + "', "
                    + "cp_date =to_date('" + CardPrintingdate + "','dd/mm/yyyy'), "
                    + "cp_updated_by ='" + user_id + "', "
                    + "cp_updated_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                    + "record_status ='" + CardPrintingstatus + "', "
                    + "cp_remarks ='" + remarks + "' "
                    + "where "
                    + "upper(mid)=upper('" + refno + "')";

            query1 = "update san_process1 "
                    + "set "
                    + "ID_CARD_PHOTO ='" + CardPrintingwithphoto + "', "
                    + "ID_CARD_PROCESSED_BY ='" + user_id + "', "
                    + "ID_CARD_PROCESSED_ON = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                    + "RECORD_STATUS ='" + CardPrintingstatus + "', "
                    + "ID_CARD_REMARKS ='" + remarks + "' "
                    + "where "
                    + "upper(mid)=upper('" + refno + "')";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            res_insert = stmt.executeUpdate(query);

            if (res_insert == 1) {
                res_update = stmt.executeUpdate(query1);
                if (res_update == 1) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/CardPrintingStatusUpdate()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // Membership module - Renewal Update @ Accounts Section..
    public String OnlineRewalUpdateAccounts(String refno, String paytype, String paymode, String paymentdate, String user_id, String record_status, String remarks) {
        String reply = "";
        String update_query = "";
        String insert_query = "";
        int res_update = 0;
        int res_insert = 0;
        try {
            update_query = "update membership_weekly_raw "
                    + "set "
                    + "paytype ='" + paytype + "', "
                    + "paymode ='" + paymode + "', "
                    + "paydate =to_date('" + paymentdate + "','dd/mm/yyyy'), "
                    + "fin_updated_by ='" + user_id + "', "
                    + "fin_updated_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                    + "record_status ='" + record_status + "', "
                    + "fin_remarks ='" + remarks + "' "
                    + "where orbitid=('" + refno + "') and upper(status) in ('GRACE','CURRENT') ";

            insert_query = "insert into SAN_PROCESS1 "
                    + "select camp,name,name_str,mid,memplan,memstatus,phone,trstatus,trpaymode,tramount,trno,trpaydate,'" + record_status + "',"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),contactPerson,'" + remarks + "','" + user_id + "',"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),"
                    + "'-','-','-','-',"
                    + "'-','-','-',"
                    + "'-','-','-','-',"
                    + "'-','-','-','-','-','-',"
                    + "'" + paytype + "','" + paymode + "',to_date('" + paymentdate + "','dd/mm/yyyy'),remarks,'','','','',email "
                    + "from membership_renewals_online_rv "
                    + "where orbitid=upper('" + refno + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            res_insert = stmt.executeUpdate(insert_query);

            if (res_insert == 1) {
                res_update = stmt.executeUpdate(update_query);
                if (res_update == 1) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/OnlineRewalUpdateAccounts()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // Membership module - Renewal Update @ Accounts Section..
    public String StateConventionAccountTransfer(String refno, String user_id, String batch_date, String record_status, String remarks) {
        String reply = "";
        String update_query = "";
        String insert_query = "";
        int res_update = 0;
        int res_insert = 0;
        try {
            if (refno.contains("2019SA1-")) {
                update_query = "update SA1SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA2-")) {
                update_query = "update SA2SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA3-")) {
                update_query = "update SA3SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA4-")) {
                update_query = "update SA4SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA5-")) {
                update_query = "update SA5SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA6-")) {
                update_query = "update SA6SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA7-")) {
                update_query = "update SA7SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA8-")) {
                update_query = "update SA8SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA9-")) {
                update_query = "update SA9SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA10-")) {
                update_query = "update SA10SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA11-")) {
                update_query = "update SA11SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA12-")) {
                update_query = "update SA12SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("2019SA13-")) {
                update_query = "update SA13SC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("NC2019")) {
                update_query = "update NC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to NCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            } else if (refno.contains("NG2019")) {
                update_query = "update NC_TABLE set "
                        + "Insert_Record_Ip ='ICICI PG Amount Transferred to NCA on " + batch_date + "', "
                        + "HQ_DWLD_S1_DATE =to_date('" + batch_date + "','dd/mm/yyyy') "
                        + "where upper(Refno)=upper('" + refno + "') ";
            }

            insert_query = "Insert into pgmis_conventions_tbl "
                    + "select refno,state_asso,camp,name,mid,head_count,reg_fee,status,mobile,trstatus,trpaymode,ICICI_Paid_Amount,trno,trpaydate, 'ICICI PG Amount Transferred to SCA on " + batch_date + "', "
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), '" + remarks + "', to_date('" + batch_date + "','dd/mm/yyyy'),"
                    + "'" + user_id + "' "
                    + "from pgmis_conventions "
                    + "where upper(Refno)=upper('" + refno + "') ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            res_insert = stmt.executeUpdate(insert_query);

            if (res_insert == 1) {
                res_update = stmt.executeUpdate(update_query);
                if (res_update == 1) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/StateConventionAccountTransfer()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // Membership module - Renewal Update @ Accounts Section..
    public String RewalUpdateAccounts(String refno, String memtype, String memplan, String memfee, String gfee, String afee, String gamount, String aux_amount, String paytype, String paymode, String amount, String trno, String paymentdate, String bank, String user_id, String record_status, String contactPerson, String remarks) {
        String reply = "";
        String update_query = "";
        String insert_query = "";
        int res_update = 0;
        int res_insert = 0;
        String insert_query1 = "";
        int res_update1 = 0;

        try {
            update_query = "update membership_weekly_raw "
                    + "set "
                    + "memtype ='" + memtype + "', "
                    + "memplan ='" + memplan + "', "
                    + "memfee =nvl('" + memfee + "','0'), "
                    + "gfee =nvl('" + gfee + "','0'), "
                    + "afee =nvl('" + afee + "','0'), "
                    + "gamount =nvl('" + gamount + "','0'), "
                    + "aamount =nvl('" + aux_amount + "','0'), "
                    + "paytype ='" + paytype + "', "
                    + "paymode ='" + paymode + "', "
                    + "amount ='" + amount + "', "
                    + "trno ='" + trno + "', "
                    + "paydate =to_date('" + paymentdate + "','dd/mm/yyyy'), "
                    + "bank ='" + bank + "', "
                    + "contactPerson ='" + contactPerson + "', "
                    + "fin_updated_by ='" + user_id + "', "
                    + "fin_updated_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                    + "record_status ='" + record_status + "', "
                    + "fin_remarks ='" + remarks + "' "
                    + "where "
                    + "upper(mid)=upper('" + refno + "') and upper(status) in ('CURRENT','GRACE')";

            insert_query = "insert into san_process1 "
                    + "select camp,name,upper(ltrim(name)||' - '||mid||' - '||substr(phone,1,4)||'xx'||substr(phone,7,20)||' - '||InitCap(camp)),mid,"
                    + "mtype,status,phone,'Offline','" + paymode + "','" + amount + "','" + trno + "',to_date('" + paymentdate + "','dd/mm/yyyy'),'Pending',"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),'" + contactPerson + "','','',"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),"
                    + "'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','" + paytype + "','" + paymode + "',to_date('" + paymentdate + "',"
                    + "'dd/mm/yyyy'),'" + remarks + "','','','','',email "
                    + "from MEMBERSHIP_WEEKLY_RAW_MASTER where upper(mid)=upper('" + refno + "') and upper(status) in ('CURRENT','GRACE') ";

            insert_query1 = "insert into san_process1 "
                    + "select camp,name,upper(ltrim(name)||' - '||mid||' - '||substr(phone,1,4)||'xx'||substr(phone,7,20)||' - '||InitCap(camp)),mid,"
                    + "mtype,status,phone,'Offline','" + paymode + "','" + amount + "','" + trno + "',to_date('" + paymentdate + "','dd/mm/yyyy'),'Pending',"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),'" + contactPerson + "','','',"
                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'),"
                    + "'-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','" + paytype + "','" + paymode + "',to_date('" + paymentdate + "',"
                    + "'dd/mm/yyyy'),'" + remarks + "','','','','',email "
                    + "from MEMBERSHIP_WEEKLY_RAW_MASTER where upper(mid)=upper('" + refno + "') and upper(status) in ('DROPPED') ";

//            insert_query = "insert into first_entry_membership_log "
//                    + "values ( "
//                    + "'" + refno + "', "
//                    + "'" + memtype + "', "
//                    + "'" + memplan + "', "
//                    + "nvl('" + memfee + "','0'), "
//                    + "nvl('" + gfee + "','0'), "
//                    + "nvl('" + afee + "','0'), "
//                    + "'" + amount + "', "
//                    + "nvl('" + gamount + "','0'), "
//                    + "nvl('" + aux_amount + "','0'), "
//                    + "'" + paytype + "', "
//                    + "'" + paymode + "', "
//                    + "'" + trno + "', "
//                    + "to_date('" + paymentdate + "','dd/mm/yyyy'), "
//                    + "'" + bank + "', "
//                    + "'" + contactPerson + "', "
//                    + "'" + remarks + "', "
//                    + "'" + record_status + "', "
//                    + "'" + user_id + "', "
//                    + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM') ) ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            res_insert = stmt.executeUpdate(update_query);

            if (res_insert == 1) {
                res_update = stmt.executeUpdate(insert_query);
                // System.out.println("insert q " + insert_query);
                if (res_update == 1) {
                    reply = "Success";
                } else {
                    res_update1 = stmt.executeUpdate(insert_query1);
                    // System.out.println("insert q1 " + insert_query1);
                    if (res_update1 == 1) {
                        reply = "Success";
                    } else {
                        reply = "Failure";
                    }
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/RewalUpdateAccounts()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }
    // Membership module - Renewal Update @ Membership Section..

    public String RewalUpdateMemberships(String refno, String record_status, String memType, String startDate, String endDate, String contactPerson, String remarks, String user_id) {
        String reply = "";
        String update_query = "";
        String update_query1 = "";
        String insert_query = "";
        int res_update = 0;
        int res_update1 = 0;
        int res_insert = 0;

        update_query = "update membership_weekly_raw "
                + "set "
                + "mtype ='" + memType + "', "
                + "mstartdate =to_date('" + startDate + "','dd/mm/yyyy'), "
                + "menddate =to_date('" + endDate + "','dd/mm/yyyy'), "
                + "contactPerson ='" + contactPerson + "', "
                + "re_updated_by ='" + user_id + "', "
                + "re_updated_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                + "status ='Current', "
                + "record_status ='" + record_status + "', "
                + "re_remarks ='" + remarks + "' "
                + "where "
                + "upper(mid)=upper('" + refno + "') and Upper(status) in ('CURRENT','GRACE')";

        update_query1 = "update membership_weekly_raw "
                + "set "
                + "mtype ='" + memType + "', "
                + "mstartdate =to_date('" + startDate + "','dd/mm/yyyy'), "
                + "menddate =to_date('" + endDate + "','dd/mm/yyyy'), "
                + "contactPerson ='" + contactPerson + "', "
                + "re_updated_by ='" + user_id + "', "
                + "re_updated_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                + "status ='Current', "
                + "record_status ='" + record_status + "', "
                + "re_remarks ='" + remarks + "' "
                + "where "
                + "upper(mid)=upper('" + refno + "') and Upper(status) in ('DROPPED')";

        insert_query = "update san_process1 "
                + "set "
                + "mtype ='" + memType + "', "
                + "mstartdate =to_date('" + startDate + "','dd/mm/yyyy'), "
                + "menddate =to_date('" + endDate + "','dd/mm/yyyy'), "
                + "renewal_contactPerson ='" + contactPerson + "', "
                + "renewal_processed_by ='" + user_id + "', "
                + "renewal_processed_on = to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.7/24),'DD-MON-YY HH:MI:SS AM'), "
                + "memstatus ='Current', "
                + "record_status ='" + record_status + "', "
                + "renewal_remarks ='" + remarks + "' "
                + "where "
                + "upper(mid)=upper('" + refno + "')";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            res_insert = stmt.executeUpdate(insert_query);

            if (res_insert > 0) {
                res_update = stmt.executeUpdate(update_query);
                //System.out.println(" Update q " + update_query);
                if (res_update > 0) {
                    reply = "Success";
                } else {
                    res_update1 = stmt.executeUpdate(update_query1);
                    //System.out.println("Update q1 " + update_query1);
                    if (res_update1 > 0) {
                        reply = "Success";
                    } else {
                        reply = "Failure";
                    }
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###Membership - DataAccessLayer/RewalUpdateMemberships()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    public String getoUserid(String extid, String orbitid) {
        String Uid_available = "";
        String cnt = "";
        try {
            String query = "select count(*) cnt from camp_officers where upper(mid)=upper('" + extid + "') and orbitid='" + orbitid + "'";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Uid_available = rs.getString("cnt");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getoUserid()/" + new Date() + "/" + e.toString());
        }
        if (!Uid_available.equals("0")) {
            return extid;
        } else {
            return Uid_available;
        }
    }

    public String getPasscode(String userid) {
        String pwd = "";
        try {
            String query = "select upper(pcode) passwd from camp_officers where upper(mid)=upper('" + userid + "')";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getPasscode()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getExtId(String o_Auth) {
        String pwd = "";
        try {
            String query = "select trim(substr(SUBSTR('" + o_Auth + "',1,instr('" + o_Auth + "','-',1,1)-1),11,15)) AS s1 from dual";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("s1");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getExtId()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getOrbitId(String o_Auth) {
        String pwd = "";
        try {
            String query = "select substr(trim(SUBSTR(SUBSTR('" + o_Auth + "',instr('" + o_Auth + "','-',-1,1)+1), 1 ,INSTR(SUBSTR('" + o_Auth + "',instr('" + o_Auth + "','-',-1,1)+1), ',', 1, 1)-1)),11,15) AS s1 from dual";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("s1");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getOrbitId()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getRid(String o_Auth) {
        String pwd = "";
        try {
            String query = "select trim(SUBSTR('" + o_Auth + "',instr('" + o_Auth + "',',', -1, 1)+1)) AS s1 from dual";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("s1");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getOrbitId()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String geteName(String o_Auth) {
        String pwd = "";
        try {
            String query = "select trim(SUBSTR('" + o_Auth + "', INSTR('" + o_Auth + "',',', 1, 1)+1,INSTR('" + o_Auth + "',',',1,2)-INSTR('" + o_Auth + "',',',1,1)-1)) AS s1 from dual";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("s1");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/geteName()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getAuth(String o_Auth) {
        String Uid_available = "";
        String cnt = "";
        String msg = "";
        try {
            String query = "select count(*) cnt from camp_officers where upper(mid)=Upper(trim(substr(SUBSTR('" + o_Auth + "',1,instr('" + o_Auth + "','-',1,1)-1),11,15))) and orbitid=substr(trim(SUBSTR(SUBSTR('" + o_Auth + "',instr('" + o_Auth + "','-',-1,1)+1), 1 ,INSTR(SUBSTR('" + o_Auth + "',instr('" + o_Auth + "','-',-1,1)+1), ',', 1, 1)-1)),11,15) ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Uid_available = rs.getString("cnt");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getAuth()/" + new Date() + "/" + e.toString());
        }
        if (!Uid_available.equals("0")) {
            msg = "proceedplease";
        } else {
            msg = "proceedplease";
        }
        return msg;
    }

    public String getCampfromMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct upper(camp_name) passwd from camp_officers where upper(mid)=upper('" + userid + "')";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getCampfromMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getSAfromMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct state_asso passwd from camps_master where Upper(camp) in (select distinct upper(camp_name) from camp_officers where upper(mid)=upper('" + userid + "') )";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getSAfromMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getSANofromMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct sa_no passwd from camps_master where Upper(camp) in (select distinct upper(camp_name) from camp_officers where upper(mid)=upper('" + userid + "') )";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getSANofromMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getAreafromMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct 'R-'||region||' / Area-'||area areas from Camps_master where Upper(camp) in (select distinct upper(camp_name) from camp_officers where upper(mid)=upper('" + userid + "')) group by 'R-'||region||' / Area-'||area order by 'R-'||region||' / Area-'||area";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("areas");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getAreafromMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getRegionfromMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct region regn from Camps_master where Upper(camp) in (select distinct upper(camp_name) from camp_officers where upper(mid)=upper('" + userid + "')) order by region";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("regn");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getRegionfromMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    //select distinct 'R-'||region||' / Area-'||area areas from Camps_master where upper(state_asso)=Upper('" + state_name + "') group by 'R-'||region||' / Area-'||area order by 'R-'||region||' / Area-'||area
    public String getZNofromMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct zone passwd from camps_master where Upper(camp) in (select distinct upper(camp_name) from camp_officers where upper(mid)=upper('" + userid + "') )";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                pwd = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getZNofromMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getMno(String userid) {
        String name = "";
        try {

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(mid) extid from camp_officers where Upper(mid)=Upper('" + userid + "') and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("extid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMno()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getDesignation(String userid) {
        String name = "";
        try {

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(DESIGNATION_SORTID) designation from camp_officers where Upper(mid)=Upper('" + userid + "') and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("designation");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getDesignation()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getMobilenoByuserid(String userid) {
        String mobile = "";
        try {
            String query = "select mobile as c from app_user where lower(user_id)=lower('" + userid + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                mobile = rs.getString("c");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMobilenoByuserid()/" + new Date() + "/" + e.toString());
        }
        return mobile;
    }

    public String getNameByuserid(String userid) {
        String mobile = "";
        try {
            String query = "select Substr(Initcap(first_name),4,100) as c from app_user where lower(user_id)=lower('" + userid + "') ";
            //  System.out.println("getName "+query);
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                mobile = rs.getString("c");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getNameByuserid()/" + new Date() + "/" + e.toString());
        }
        return mobile;
    }

    public String menuString3(String logedInUser) {
        String menu = "", ret;
        String cnt = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            menu = "<div><ul>";
            String query0 = "select * from user_role_mapping where userid='" + logedInUser + "' order by userid,menuid,submenuid,id";
            Statement st0 = con.createStatement();
            ResultSet rs0 = st0.executeQuery(query0);
            while (rs0.next()) {
                String query1 = "select a.page_name a_page_name,a.category_name,b.sub_page_name,b.subcategory_name from tbl_category a, tbl_subcategory b where a.category_id=b.category_id and a.category_id='" + rs0.getString("menuid") + "' and b.subcategory_id='" + rs0.getString("submenuid") + "' order by a.category_id";

                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery(query1);
                while (rs1.next()) {

                    menu += "<li><a href='" + rs1.getString("a_page_name") + "'>" + rs1.getString("category_name") + "</a><ul><li><a href='" + rs1.getString("sub_page_name") + "'>" + rs1.getString("subcategory_name") + "</a></li>";
                }
            }
            menu += "</ul>";
            rs0.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/menuString3()/" + new Date() + "/" + e.toString());
        }
        return menu;
    }

    public String menuString2(String logedInUser, String cValue) {
        String menu = "", ret;
        String cnt = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query1 = "select * from tbl_category where category_id ='" + logedInUser + "' order by category_id";
            menu = "<div><ul>";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while (rs1.next()) {
                menu += "<li><a href='" + rs1.getString("page_name") + "'>" + rs1.getString("category_name") + "</a><ul>";
                String query2 = "select * from tbl_subcategory where category_id='" + rs1.getString("category_id") + "' order by subcategory_id";
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery(query2);
                while (rs2.next()) {
                    menu += "<li><a href='" + rs2.getString("sub_page_name") + "'>" + rs2.getString("subcategory_name") + "</a></li>";
                }
                menu += "</ul></li>";
            }
            menu += "</ul>";
            rs1.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/menuString1()/" + new Date() + "/" + e.toString());
        }
        return menu;
    }

    public String CallStatusUpdate(String camp, String old_camp, String state_asso, String memid, String memname, String mobile, String email, String memtype, String memstatus, String call_status, String designation, String remarks, String submitted_on, String submitted_by) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        String res_update = "";
        String res_insert = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            res_update = "update membership_weekly_raw "
                    + "set "
                    + "camp ='" + camp + "', "
                    + "state_association = (select distinct state_asso from camps_master where upper(camp) = upper('" + camp + "')), "
                    + "region_name = (select distinct area_region from camps_master where upper(camp) = upper('" + camp + "')), "
                    + "area_name = (select distinct area_region from camps_master where upper(camp) = upper('" + camp + "')), "
                    + "camp_change_remarks ='" + remarks + "', "
                    + "camp_changed_on =to_date('" + submitted_on + "','dd/mm/yyyy')"
                    + "where "
                    + "upper(mid)=upper('" + memid + "')";

            res_insert = "INSERT INTO CALL_CENTRE_RECORD values ('" + camp + "', '" + old_camp + "', '" + state_asso + "', '" + memid + "', '" + memname + "','" + mobile + "', '" + email + "', '" + memtype + "', '" + memstatus + "', '" + call_status + "', '" + remarks + "', to_date('" + submitted_on + "','dd/mm/yyyy'), '" + submitted_by + "' )";
            /// System.out.println("Camp Transfer Update " + res_update);
            // System.out.println("Camp Transfer Log " + res_insert);
            r = stmt.executeUpdate(res_insert);

            if (r > 0) {
                r1 = stmt.executeUpdate(res_update);
                if (r1 > 0) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();

        } catch (Exception e) {

        }
        return reply;
    }

    public String CallDesignationUpdate(String camp, String old_camp, String state_asso, String memid, String memname, String mobile, String email, String memtype, String memstatus, String call_status, String designation, String remarks, String submitted_on, String submitted_by) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        String res_update = "";
        String res_insert = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            res_update = "update membership_weekly_raw "
                    + "set "
                    + "designation ='" + camp + "', "
                    + "designation_change_remarks ='" + remarks + "', "
                    + "designation_changed_on =to_date('" + submitted_on + "','dd/mm/yyyy')"
                    + "where "
                    + "upper(mid)=upper('" + memid + "') and status in ('Current','Grace')";

            res_insert = "INSERT INTO DESIGNATION_LOG_RECORD values ('" + camp + "', '" + old_camp + "', '" + state_asso + "', '" + memid + "', '" + memname + "','" + mobile + "', '" + email + "', '" + memtype + "', '" + memstatus + "', '" + call_status + "', '" + remarks + "', to_date('" + submitted_on + "','dd/mm/yyyy'), '" + submitted_by + "' )";

            r = stmt.executeUpdate(res_insert);

            if (r > 0) {
                r1 = stmt.executeUpdate(res_update);
                if (r1 > 0) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();

        } catch (Exception e) {

        }
        return reply;
    }

    public String CallStatusUpdate_Camp(String camp, String name, String mid, String phone, String email, String mtype, String status, String annual_end_date, String renewalStatus, String memtype, String startdate, String enddate, String contactperson, String remarks, String orbitid) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            String query = "";
            String query1 = "";
            if (memtype.contains("Life")) {
                if (mid.contains("A")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "mtype ='Auxiliary(TGII) Life Member', "
                            + "life_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date ='' "
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "mtype ='Gideon(TGII) Life Member', "
                            + "life_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date ='' "
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                }
            } else {
                if (renewalStatus.equalsIgnoreCase("Renewed")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy')"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else if (renewalStatus.equalsIgnoreCase("Reinstated")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "annual_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy')"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                }
            }
            if (r > 0) {
                reply = "Success";
                query1 = "insert into san_process1(camp,name,mid,phone,email,record_status,mtype,contactperson,san_remarks,renewal_contactperson,mstartdate,menddate) select camp,name,mid,phone,email,'" + renewalStatus + "','" + memtype + "','" + contactperson + "','" + remarks + "',orbitid,to_date('" + startdate + "','dd/mm/yyyy'),to_date('" + enddate + "','dd/mm/yyyy') from membership_weekly_raw where mid='" + mid + "' ";
                stmt = con.prepareStatement(query1);
                r1 = stmt.executeUpdate(query1);
                if (r1 > 0) {
                    reply = "Success";
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }
            stmt.close();
            con.close();

        } catch (Exception e) {

        }
        return reply;

    }

    public String CallStatusUpdate_e503(String camp, String name, String mid, String phone, String email, String mtype, String status, String annual_end_date, String renewalStatus, String memtype, String startdate, String enddate, String contactperson, String remarks, String annual_start_date, String mobile2, String mobile3, String useraccessname, String signup_type, String credited_to, String annual_end_date_from) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            String query = "";
            String query1 = "";
            String msg = "";
            String Status_SMS = "";
            String sms_to_phone = "";
            String sms_to_name = "";
            if (memtype.contains("Life")) {
                if (mid.contains("A")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "source_of_application ='" + signup_type + "', "
                            + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "mtype ='Auxiliary(TGII) Life Member', "
                            + "life_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date ='' "
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "source_of_application ='" + signup_type + "', "
                            + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "mtype ='Gideon(TGII) Life Member', "
                            + "life_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date ='' "
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                }
            } else {
                if (renewalStatus.equalsIgnoreCase("Renewed")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            // + "source_of_application ='" + signup_type + "', "
                            // + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy')"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else if (renewalStatus.equalsIgnoreCase("Reinstated")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "source_of_application ='" + signup_type + "', "
                            + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "annual_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy')"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                }
            }
            if (r > 0) {
                reply = "Success";
                if (renewalStatus.equalsIgnoreCase("Renewed")) {
                    query1 = "Insert into membership_renewal_sunitha_nov values ('" + camp + "', (select mtype from membership_weekly_raw where mid = '" + mid + "'),'" + mid + "',(select orbitid from membership_weekly_raw where mid = '" + mid + "'), to_date('" + annual_end_date_from + "','dd/mm/yyyy'), to_date('" + enddate + "','dd/mm/yyyy'),to_char(sysdate,'Month'),sysdate ) ";

                } else if (renewalStatus.equalsIgnoreCase("Reinstated")) {
                    query1 = "Insert into membership_reinst_sunitha_nov values ('" + camp + "', '" + mid + "',(select mtype from membership_weekly_raw where mid = '" + mid + "'),(select member_since from membership_weekly_raw where mid = '" + mid + "'),to_date('" + startdate + "','dd/mm/yyyy'),to_date('" + enddate + "','dd/mm/yyyy'), '" + signup_type + "','" + credited_to + "',sysdate ) ";

                }
                // System.out.println("membership_renewal_sunitha_nov " + query1);
                stmt = con.prepareStatement(query1);
                r1 = stmt.executeUpdate(query1);
                if (r1 > 0) {
                    reply = "Success";
                    try {
                        DataSource ds1 = getDataSource();
                        Connection con1 = ds1.getConnection();
                        Statement stmt1 = con1.createStatement();
                        ResultSet rs1 = null;
                        String sql = "select name,phone from membership_weekly_raw where mid = '" + mid + "' and rownum<2";
                        rs1 = stmt1.executeQuery(sql);
                        while (rs1.next()) {
                            sms_to_name = rs1.getString("name");
                            sms_to_phone = rs1.getString("phone");
                        }
                        rs1.close();
                        stmt1.close();
                        con1.close();
                    } catch (Exception e) {
                    }
                    SendSMS s = new SendSMS();
                    //Status_SMS = s.sendSMS(sms_to_phone, "Dear Member, your membership renewal is updated.  Thank you for your commitment. -Membership Department, TGII");
                    Status_SMS = s.sendSMS(sms_to_phone, "Dear Member, Please be informed that your membership has been renewed; valid till '" + enddate + "'. Thank you for your commitment - regards, TGII", "1207160336030939761");
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String CallMemStatusUpdate_e503(String camp, String name, String mid, String phone, String email, String mtype, String status, String annual_end_date, String renewalStatus, String memtype, String startdate, String enddate, String contactperson, String remarks, String annual_start_date, String mobile2, String mobile3, String useraccessname, String signup_type, String credited_to) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        String msg1 = "";
        String Status_SMS1 = "";
        String sms_to_phone1 = "";
        String sms_to_name1 = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            String query = "";
            String query1 = "";
            if (memtype.contains("Life")) {
                if (mid.contains("A")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "source_of_application ='" + signup_type + "', "
                            + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "mtype ='Auxiliary(TGII) Life Member', "
                            + "life_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date ='', "
                            + "COMMITTEE_REMARKS ='" + remarks + "-'||'" + useraccessname + "'"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "source_of_application ='" + signup_type + "', "
                            + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "mtype ='Gideon(TGII) Life Member', "
                            + "life_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date ='', "
                            + "COMMITTEE_REMARKS ='" + remarks + "-'||'" + useraccessname + "'"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                }
            } else {
                if (renewalStatus.equalsIgnoreCase("Renewed")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy'),"
                            + "COMMITTEE_REMARKS ='" + remarks + "-'||'" + useraccessname + "'"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else if (renewalStatus.equalsIgnoreCase("Renewed_PTP_Confirmed")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy'),"
                            + "COMMITTEE_REMARKS ='" + remarks + "-'||'" + useraccessname + "'"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else if (renewalStatus.equalsIgnoreCase("Renewed_WTR_Confirmed")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy'),"
                            + "COMMITTEE_REMARKS ='" + remarks + "-'||'" + useraccessname + "'"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                } else if (renewalStatus.equalsIgnoreCase("Reinstated")) {
                    query = "update membership_weekly_raw "
                            + "set "
                            + "status ='Current', "
                            + "source_of_application ='" + signup_type + "', "
                            + "cred_nfr_res_per_state ='" + credited_to + "', "
                            + "annual_start_date =to_date('" + startdate + "','dd/mm/yyyy'),"
                            + "annual_end_date =to_date('" + enddate + "','dd/mm/yyyy')"
                            + "where "
                            + "mid='" + mid + "'";
                    stmt = con.prepareStatement(query);
                    r = stmt.executeUpdate(query);
                }
            }
            if (r > 0) {
                reply = "Success";
                query1 = "update san_process1 "
                        + "set "
                        + "record_status ='" + renewalStatus + "', "
                        + "renewal_processed_by ='" + useraccessname + "', "
                        + "renewal_processed_on =to_char(sysdate,'DD-MON-YY'), "
                        + "renewal_remarks ='" + remarks + "'"
                        + "where "
                        + "mid='" + mid + "'";
                stmt = con.prepareStatement(query1);
                r1 = stmt.executeUpdate(query1);
                if (r1 > 0) {
                    reply = "Success";
                    try {
                        DataSource ds1 = getDataSource();
                        Connection con1 = ds1.getConnection();
                        Statement stmt1 = con1.createStatement();
                        ResultSet rs1 = null;
                        String sql = "select name,phone from membership_weekly_raw where mid = '" + mid + "' and rownum<2";
                        rs1 = stmt1.executeQuery(sql);
                        while (rs1.next()) {
                            sms_to_name1 = rs1.getString("name");
                            sms_to_phone1 = rs1.getString("phone");
                        }
                        rs1.close();
                        stmt1.close();
                        con1.close();
                    } catch (Exception e) {
                    }
                    SendSMS s1 = new SendSMS();
                    //Status_SMS1 = s1.sendSMS(sms_to_phone1, "Dear Member, your membership renewal is updated.  Thank you for your commitment. -Membership Department, TGII");
                    Status_SMS1 = s1.sendSMS(sms_to_phone1, "Dear Member, Please be informed that your membership has been renewed; valid till '" + enddate + "'. Thank you for your commitment - regards, TGII", "1207160336030939761");
                } else {
                    reply = "Failure";
                }
            } else {
                reply = "Failure";
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String SendforCommitteeApprovals(String rid) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        String msg1 = "";
        String Status_SMS1 = "";
        String sms_to_phone1 = "";
        String sms_to_name1 = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            String query = "";
            String query1 = "";
            query = "update MEMBERSHIP_EFORM_NEW set status ='SentforCommitteeApprovals' where rid='" + rid + "'";
            stmt = con.prepareStatement(query);
            r = stmt.executeUpdate(query);
            if (r > 0) {
                reply = "Success";
                // SendSMS s1 = new SendSMS();
                //Status_SMS1 = s1.sendSMS(sms_to_phone1, "Dear Member, your membership renewal is updated.  Thank you for your commitment. -Membership Department, TGII");
                // Status_SMS1 = s1.sendSMS(sms_to_phone1, "Dear Member, Please be informed that your membership has been renewed; valid till '" + enddate + "'. Thank you for your commitment - regards, TGII");
            } else {
                reply = "Failure";
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String NewApplnCommitteeApproved(String rid) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        String msg1 = "";
        String Status_SMS1 = "";
        String sms_to_phone1 = "";
        String sms_to_name1 = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            String query = "";
            String query1 = "";
            query = "update MEMBERSHIP_EFORM_NEW set status ='Approved' where rid='" + rid + "'";
            stmt = con.prepareStatement(query);
            r = stmt.executeUpdate(query);
            if (r > 0) {
                reply = "Success";
                // SendSMS s1 = new SendSMS();
                //Status_SMS1 = s1.sendSMS(sms_to_phone1, "Dear Member, your membership renewal is updated.  Thank you for your commitment. -Membership Department, TGII");
                // Status_SMS1 = s1.sendSMS(sms_to_phone1, "Dear Member, Please be informed that your membership has been renewed; valid till '" + enddate + "'. Thank you for your commitment - regards, TGII");
            } else {
                reply = "Failure";
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String NewApplnMovetoTrash(String rid) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            PreparedStatement stmt1 = null;
            String query = "";
            String query1 = "";
            query = "insert into MEMBERSHIP_EFORM_NEW_deleted select * from MEMBERSHIP_EFORM_NEW where rid='" + rid + "'";
            query1 = "delete from MEMBERSHIP_EFORM_NEW where rid='" + rid + "'";
            stmt = con.prepareStatement(query);
            r = stmt.executeUpdate(query);
            if (r > 0) {
                stmt1 = con.prepareStatement(query1);
                r1 = stmt1.executeUpdate(query1);
                if (r1 > 0) {
                    reply = "Success";
                } else {
                    reply = "Failure(R1)";
                }
            } else {
                reply = "Failure(R)";
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String NewApplnMovetoInbox(String rid) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            PreparedStatement stmt1 = null;
            String query = "";
            String query1 = "";
            query = "insert into MEMBERSHIP_EFORM_NEW select * from MEMBERSHIP_EFORM_NEW_deleted where rid='" + rid + "'";
            query1 = "delete from MEMBERSHIP_EFORM_NEW_deleted where rid='" + rid + "'";
            stmt = con.prepareStatement(query);
            r = stmt.executeUpdate(query);
            if (r > 0) {
                stmt1 = con.prepareStatement(query1);
                r1 = stmt1.executeUpdate(query1);
                if (r1 > 0) {
                    reply = "Success";
                } else {
                    reply = "Failure(R1)";
                }
            } else {
                reply = "Failure(R)";
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String UpdateSASCWArecords(String mid, String wa_remarks, String wa_processed_by) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            ResultSet rs = null;
            PreparedStatement stmt = null;
            String query = "";
            query = "update T_STATE_CONVENTIONS_2021_4_WHATSAPP_GROUP set wa_status ='Processed',wa_remarks=wa_remarks||'.." + wa_remarks + "',wa_processed_on=sysdate,wa_processed_by='" + wa_processed_by + "' where rid='" + mid + "'";
            //System.out.println("SA1SC 2021 " + query);
            stmt = con.prepareStatement(query);
            r = stmt.executeUpdate(query);
            if (r > 0) {
                reply = "Success";
            } else {
                reply = "Failed";
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
        }
        return reply;
    }

    public String NewApplnMovetoMembershipMaster(String rid) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        int ur = 0;
        int mem_plan_id = 0;
        int mid = 0;
        String msg1 = "";
        String Status_SMS1 = "";
        String sms_to_phone1 = "";
        String sms_to_name1 = "";
        mem_plan_id = getMemPlan(rid);
        mid = getMaxIdforEappln(rid);
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            PreparedStatement stmt = null;
            PreparedStatement stmt1 = null;
            PreparedStatement stmt2 = null;
            String query = "";
            String query1 = "";
            String Uquery = "";
            if (mem_plan_id == 1) {
                //query = "insert into Membership_Weekly_Raw (mid,orbitid,status) values ('G'||'" + rid + "','" + rid + "','Current')";
                query = "INSERT INTO MEMBERSHIP_WEEKLY_RAW (CAMP,ORBITID,MID,NAME,MTYPE,STATUS,MEMBER_SINCE,ANNUAL_START_DATE,ANNUAL_END_DATE,SOURCE_OF_APPLICATION,CRED_NFR_RES_PER_STATE,JOB_TITLE,GENDER,"
                        + "DOB,IS_DECEASED,DECEASED_DATE,ADDRESS,STREET,ADDRESS2,CITY,PINCODE,PHONE,MOBILE2,STATE,EMAIL,RECEIPT_NO,QUALIFICATION,WORKPLACE,CHURCH,caddress,PASTOR_NAME,PASTOR_MOBILE) "
                        + "SELECT formfilledbyCAMP,rid,'" + mid + "',GIDEONNAME,decode(MPLAN,'Annual Gideon','Gideon(TGII) Annual Member','Life Gideon','Gideon(TGII) Life Member','Annual Both','Gideon(TGII) Annual Member','Life Both','Gideon(TGII) Life Member'),"
                        + "'Current',SYSDATE,SYSDATE,sysdate,(case when formfilledby='Field Staff' then decode(sourceofappln,'Annual Membership Dinner','Field - New Member Plan (F-NMP)','Personal Sign-up','Field - Personal Sign-up (F-PSU)','New Member Plan','Field - New Member Plan (F-NMP)') else decode(sourceofappln,'Annual Membership Dinner','Annual Membership Dinner','Personal Sign-up','Personal Sign-up (PSU)','New Member Plan','Personal Sign-up (PSU)') end),"
                        + "(case when formfilledby='Field Staff' then formfilledbyfoname else (select distinct state_asso from camps_master where upper(camp)=upper(a.formfilledbycamp)) end),JOBTITLE,'Male',SYSDATE,'NO','',ADDR1,ADDR2,'',CITY,PINCODE,GMOBILE,"
                        + "GWMOBILE,STATE,GEMAIL,PAYMETHOD||' '||TRNO||' '||TRDATE,EDUCATION,WORKPLACE,CHURCHNAME,CHURCHADDR,PASTORNAME,PASTORMOBILE FROM membership_eform_new a where rid = '" + rid + "' ";
                // System.out.println("Comes here 1 " + query);

                stmt = con.prepareStatement(query);
                r = stmt.executeUpdate(query);
                if (r > 0) {
                    reply = "Success";
                    Uquery = "update MEMBERSHIP_EFORM_NEW set status ='Current', mid='" + mid + "' where rid='" + rid + "'";
                    stmt2 = con.prepareStatement(Uquery);
                    ur = stmt2.executeUpdate(Uquery);
                    setMaxIdforEappln(mid);
                    //   System.out.println("Finish here 1 " + Uquery + " Result " + ur);
                } else {
                    reply = "Failure";
                    Uquery = "update MEMBERSHIP_EFORM_NEW set status ='Not Processed' where rid='" + rid + "'";
                    stmt2 = con.prepareStatement(Uquery);
                    ur = stmt2.executeUpdate(Uquery);
                    //  System.out.println("Finish here 1 " + Uquery + " Result " + ur);
                }
            } else if (mem_plan_id == 2) {
                query = "INSERT INTO MEMBERSHIP_WEEKLY_RAW (CAMP,ORBITID,MID,NAME,MTYPE,STATUS,MEMBER_SINCE,ANNUAL_START_DATE,ANNUAL_END_DATE,SOURCE_OF_APPLICATION,CRED_NFR_RES_PER_STATE,JOB_TITLE,GENDER,"
                        + "DOB,IS_DECEASED,DECEASED_DATE,ADDRESS,STREET,ADDRESS2,CITY,PINCODE,PHONE,MOBILE2,STATE,EMAIL,RECEIPT_NO,QUALIFICATION,WORKPLACE,CHURCH,caddress,PASTOR_NAME,PASTOR_MOBILE) "
                        + "SELECT formfilledbyCAMP,rid,gid||'A',AUXNAME,decode(MPLAN,'Annual Auxiliary','Auxiliary(TGII) Annual Member','Life Auxiliary','Auxiliary(TGII) Life Member','Annual Both','Auxiliary(TGII) Annual Member','Life Both','Auxiliary(TGII) Life Member'),"
                        + "'Current',SYSDATE,SYSDATE,sysdate,(case when formfilledby='Field Staff' then decode(sourceofappln,'Annual Membership Dinner','Field - New Member Plan (F-NMP)','Personal Sign-up','Field - Personal Sign-up (F-PSU)','New Member Plan','Field - New Member Plan (F-NMP)') else decode(sourceofappln,'Annual Membership Dinner','Annual Membership Dinner','Personal Sign-up','Personal Sign-up (PSU)','New Member Plan','Personal Sign-up (PSU)') end),"
                        + "(case when formfilledby='Field Staff' then formfilledbyfoname else (select distinct state_asso from camps_master where upper(camp)=upper(a.formfilledbycamp)) end),JOBTITLE,'Female',SYSDATE,'NO','',ADDR1,ADDR2,'',CITY,PINCODE,AMOBILE,"
                        + "AWMOBILE,STATE,AEMAIL,PAYMETHOD||' '||TRNO||' '||TRDATE,EDUCATION,WORKPLACE,CHURCHNAME,CHURCHADDR,PASTORNAME,PASTORMOBILE FROM membership_eform_new a where rid = '" + rid + "' ";
                // System.out.println("Comes here 2 " + query);

                stmt = con.prepareStatement(query);
                r = stmt.executeUpdate(query);
                if (r > 0) {
                    reply = "Success";
                    Uquery = "update MEMBERSHIP_EFORM_NEW set status ='Current', mid=gid||'A' where rid='" + rid + "'";
                    stmt2 = con.prepareStatement(Uquery);
                    ur = stmt2.executeUpdate(Uquery);
                    //  System.out.println("Finish here 2 " + Uquery + " Result " + ur);
                } else {
                    reply = "Failure";
                    Uquery = "update MEMBERSHIP_EFORM_NEW set status ='Not Processed' where rid='" + rid + "'";
                    stmt2 = con.prepareStatement(Uquery);
                    ur = stmt2.executeUpdate(Uquery);
                    //  System.out.println("Finish here 2 " + Uquery + " Result " + ur);
                }
            } else if (mem_plan_id == 3) {
                query = "INSERT INTO MEMBERSHIP_WEEKLY_RAW (CAMP,ORBITID,MID,NAME,MTYPE,STATUS,MEMBER_SINCE,ANNUAL_START_DATE,ANNUAL_END_DATE,SOURCE_OF_APPLICATION,CRED_NFR_RES_PER_STATE,JOB_TITLE,GENDER,"
                        + "DOB,IS_DECEASED,DECEASED_DATE,ADDRESS,STREET,ADDRESS2,CITY,PINCODE,PHONE,MOBILE2,STATE,EMAIL,RECEIPT_NO,QUALIFICATION,WORKPLACE,CHURCH,caddress,PASTOR_NAME,PASTOR_MOBILE) "
                        + "SELECT formfilledbyCAMP,rid,'" + mid + "',GIDEONNAME,decode(MPLAN,'Annual Gideon','Gideon(TGII) Annual Member','Life Gideon','Gideon(TGII) Life Member','Annual Both','Gideon(TGII) Annual Member','Life Both','Gideon(TGII) Life Member'),"
                        + "'Current',SYSDATE,SYSDATE,sysdate,(case when formfilledby='Field Staff' then decode(sourceofappln,'Annual Membership Dinner','Field - New Member Plan (F-NMP)','Personal Sign-up','Field - Personal Sign-up (F-PSU)','New Member Plan','Field - New Member Plan (F-NMP)') else decode(sourceofappln,'Annual Membership Dinner','Annual Membership Dinner','Personal Sign-up','Personal Sign-up (PSU)','New Member Plan','Personal Sign-up (PSU)') end),"
                        + "(case when formfilledby='Field Staff' then formfilledbyfoname else (select distinct state_asso from camps_master where upper(camp)=upper(a.formfilledbycamp)) end),JOBTITLE,'Male',SYSDATE,'NO','',ADDR1,ADDR2,'',CITY,PINCODE,GMOBILE,"
                        + "GWMOBILE,STATE,GEMAIL,PAYMETHOD||' '||TRNO||' '||TRDATE,EDUCATION,WORKPLACE,CHURCHNAME,CHURCHADDR,PASTORNAME,PASTORMOBILE FROM membership_eform_new a where rid = '" + rid + "' ";

                query1 = "INSERT INTO MEMBERSHIP_WEEKLY_RAW (CAMP,ORBITID,MID,NAME,MTYPE,STATUS,MEMBER_SINCE,ANNUAL_START_DATE,ANNUAL_END_DATE,SOURCE_OF_APPLICATION,CRED_NFR_RES_PER_STATE,JOB_TITLE,GENDER,"
                        + "DOB,IS_DECEASED,DECEASED_DATE,ADDRESS,STREET,ADDRESS2,CITY,PINCODE,PHONE,MOBILE2,STATE,EMAIL,RECEIPT_NO,QUALIFICATION,WORKPLACE,CHURCH,caddress,PASTOR_NAME,PASTOR_MOBILE) "
                        + "SELECT formfilledbyCAMP,rid,'" + mid + "'||'A',AUXNAME,decode(MPLAN,'Annual Auxiliary','Auxiliary(TGII) Annual Member','Life Auxiliary','Auxiliary(TGII) Life Member','Annual Both','Auxiliary(TGII) Annual Member','Life Both','Auxiliary(TGII) Life Member'),"
                        + "'Current',SYSDATE,SYSDATE,sysdate,(case when formfilledby='Field Staff' then decode(sourceofappln,'Annual Membership Dinner','Field - New Member Plan (F-NMP)','Personal Sign-up','Field - Personal Sign-up (F-PSU)','New Member Plan','Field - New Member Plan (F-NMP)') else decode(sourceofappln,'Annual Membership Dinner','Annual Membership Dinner','Personal Sign-up','Personal Sign-up (PSU)','New Member Plan','Personal Sign-up (PSU)') end),"
                        + "(case when formfilledby='Field Staff' then formfilledbyfoname else (select distinct state_asso from camps_master where upper(camp)=upper(a.formfilledbycamp)) end),JOBTITLE,'Female',SYSDATE,'NO','',ADDR1,ADDR2,'',CITY,PINCODE,AMOBILE,"
                        + "AWMOBILE,STATE,AEMAIL,PAYMETHOD||' '||TRNO||' '||TRDATE,EDUCATION,WORKPLACE,CHURCHNAME,CHURCHADDR,PASTORNAME,PASTORMOBILE FROM membership_eform_new a where rid = '" + rid + "' ";
                // System.out.println("Comes here 3 " + query);

                stmt = con.prepareStatement(query);
                stmt1 = con.prepareStatement(query1);
                r = stmt.executeUpdate(query);
                r1 = stmt1.executeUpdate(query1);
                if (r > 0 && r1 > 0) {
                    reply = "Success";
                    Uquery = "update MEMBERSHIP_EFORM_NEW set status ='Current', mid='" + mid + "' where rid='" + rid + "'";
                    stmt2 = con.prepareStatement(Uquery);
                    ur = stmt2.executeUpdate();
                    setMaxIdforEappln(mid);
                    //  System.out.println("Finish here 3 " + Uquery + " Result " + ur);
                } else {
                    reply = "Failure";
                    Uquery = "update MEMBERSHIP_EFORM_NEW set status ='Not Processed' where rid='" + rid + "'";
                    stmt2 = con.prepareStatement(Uquery);
                    ur = stmt2.executeUpdate();
                    // System.out.println("Finish here 3 " + Uquery + " Result " + ur);
                }
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
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
