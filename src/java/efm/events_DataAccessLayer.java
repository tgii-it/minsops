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
import java.util.*;
import java.awt.*;
import efm.Membership;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class events_DataAccessLayer {

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

    public String formatIntToString(int i) {
        String str = "";
        try {
            str = new Integer(i).toString();
        } catch (Exception e) {
            System.out.println("###EFM_DataAccessLayer/formatIntToString()/" + new Date() + "/" + e.toString());
        }
        return str;
    }

    public int getRandomNo() {
        int maxid = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select e503_rid.nextval as maxid from dual ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getRandomNo()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getSanMaxId() {
        int maxid = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select san_process1_rid_seq.nextval as maxid from dual ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }

            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getSanMaxId()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public String getCampe503sid(String sId) {
        String camp = "";
        try {
            String query = "select upper(camp) passwd from e503 where rid=decode('" + sId + "','null','0') and rownum<2";
            // System.out.println("getPasswd " + query);
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                camp = rs.getString("passwd");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getPasswd()/" + new Date() + "/" + e.toString());
        }
        return camp;
    }

    public int getRLGcnt(String sId, String plan) {
        int maxid = 0;
        String query = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select nvl(count(*),'0') as maxid from san_process1 where renewal_contactperson=decode('" + sId + "','null','0') and upper(memplan)=upper('" + plan + "') ";
            //  System.out.println("getRLGcnt " + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###Sa1sc_DataAccessLayer/getRLGcnt()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getRLGValue(String sId) {
        int maxid = 0;
        String query = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select (nvl(rlgcnt,'0')+nvl(rlacnt,'0')) as maxid from e503 where rid=decode('" + sId + "','null','0') ";
            // System.out.println("getRLGValue " + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###Sa1sc_DataAccessLayer/getRLGValue()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getRAGcnt(String sId, String plan) {
        int maxid = 0;
        String query = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select count(*) as maxid from san_process1 where renewal_contactperson=decode('" + sId + "','null','0') and upper(memplan)=upper('" + plan + "') ";

            //  System.out.println("getRAGcnt " + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###Sa1sc_DataAccessLayer/getRAGcnt()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getRAGValue(String sId) {
        int maxid = 0;
        String query = "";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query = "select (nvl(ragcnt,'0')+nvl(raacnt,'0')) as maxid from e503 where rid=decode('" + sId + "','null','0') ";
            //  System.out.println("getRAGValue " + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###Sa1sc_DataAccessLayer/getRAGValue()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getMaxId() {
        int maxid = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select min(maxid) as maxid from events_rid where flag='O' ";
            //  System.out.println("getMaxId " + query);

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getMaxId()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public int getMeMaxId() {
        int maxid = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select min(maxid) as maxid from mini_events_rid where flag='O' ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getMeMaxId()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public void updateEventsTblforTravelPlan(String rid, String tno, String tname) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update events set name1=Upper('" + tname + "'), event_done='" + tno + "' where rid=" + rid;

            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/updateEventsTblforTravelPlan()/" + new Date() + "/" + e.toString());
        }

    }

    public String updateNewTravelPlan_1(Map<String, String> emp_details) {
        int reply = 0;
        String response = "";
        int status = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update TRAVEL_MATRIX_TBL set name=Upper('" + manageString(emp_details.get("tname")) + "') where erid=" + manageString(emp_details.get("rid"));
            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();

            if (status == 0) {
                updateEventsTblforTravelPlan(manageString(emp_details.get("rid")), manageString(emp_details.get("tno")), manageString(emp_details.get("tname")));
                response = "Success";
            } else {
                response = "Failure";
            }

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/updateNewTravelPlan_1()/" + new Date() + "/" + e.toString());
        }

        return response;
    }

    public void setMaxId(int maxid) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update events_rid set flag='A' where maxid=" + maxid;
            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/setMaxId()/" + new Date() + "/" + e.toString());
        }

    }

    public void setMeMaxId(int maxid) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update mini_events_rid set flag='A' where maxid=" + maxid;

            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/setMeMaxId()/" + new Date() + "/" + e.toString());
        }

    }

    public int getTmMaxId() {
        int maxid = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select min(maxid) as maxid from travel_matrix_rid where flag='O' ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getTmMaxId()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public void setTmMaxId(int maxid) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update travel_matrix_rid set flag='A' where maxid=" + maxid;

            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/setTmMaxId()/" + new Date() + "/" + e.toString());
        }

    }

    public int getTmMaxId_1() {
        int maxid = 0;

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select min(maxid) as maxid from travel_matrix_rid_1 where flag='O' ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                maxid = rs.getInt("maxid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getTmMaxId_1()/" + new Date() + "/" + e.toString());
        }
        return maxid;
    }

    public void setTmMaxId_1(int maxid) {
        int reply = 0;
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update travel_matrix_rid_1 set flag='A' where maxid=" + maxid;

            reply = stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/setTmMaxId_1()/" + new Date() + "/" + e.toString());
        }

    }

    public String getZoneNO(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct zone state_Asso_no from camps_master where Upper(camp)=Upper('" + camp + "') and Upper(status)='ACTIVE' order by zone";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getZoneNO()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getStateAssociationNO(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct sa_no state_Asso_no from camps_master where Upper(camp)=Upper('" + camp + "') and Upper(status)='ACTIVE' order by sa_no";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getStateAssociationNO()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getStateAssociationNO1(String sa) {
        String stateasso = "";
        try {
            String query = "select distinct sa_no state_Asso_no from camps_master where Upper(state_asso)=Upper('" + sa + "') and Upper(status)='ACTIVE' order by sa_no";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getStateAssociationNO1()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getZoneNO1(String sa) {
        String stateasso = "";
        try {
            String query = "select distinct zone zone_no from camps_master where Upper(state_asso)=Upper('" + sa + "') and Upper(status)='ACTIVE' order by zone";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("zone_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getZoneNO1()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getRegionNO(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct region state_Asso_no from camps_master where Upper(camp)=Upper('" + camp + "') and Upper(status)='ACTIVE' order by region";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getRegionNO()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getOrbitIdMid(String userid) {
        String pwd = "";
        try {
            String query = "select distinct upper(orbitid) passwd from membership_weekly_raw where upper(mid)=upper('" + userid + "')";
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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getOrbitIdMid()/" + new Date() + "/" + e.toString());
        }
        return pwd;
    }

    public String getAreaNO1(String camp) {
        String stateasso = "";
        try {
            String query = "select substr('" + camp + "',3,1) state_Asso_no from dual";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getAreaNO1()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getAreaNO2(String camp) {
        String stateasso = "";
        try {
            String query = "select substr('" + camp + "',12,1) state_Asso_no from dual";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getAreaNO2()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getRegionNO2(String camp) {
        String stateasso = "";
        try {
            String query = "select substr('" + camp + "',3,1) state_Asso_no from dual";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getRegionNO2()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getAreaNO(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct area state_Asso_no from camps_master where Upper(camp)=Upper('" + camp + "') and Upper(status)='ACTIVE' order by area";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getAreaNO()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getEid(String etype) {
        String stateasso = "";
        try {
            String query = "select distinct eid state_Asso_no from events_list where Upper(etype)=Upper('" + etype + "') order by eid";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getEid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getSCname(String sa) {
        String stateasso = "";
        try {
            String query = "select distinct initcap(gideon_name) state_Asso_no from camp_officers where sa=trim(substr('" + sa + "',3,2)) and designation like 'STATE PRESI%' ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getSCname()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getSCmobile(String sa) {
        String stateasso = "";
        try {
            String query = "select distinct phonenumber state_Asso_no from camp_officers where sa=trim(substr('" + sa + "',3,2)) and designation like 'STATE PRESI%' ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getSCmobile()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getADname(String sa, String region, String area) {
        String stateasso = "";
        try {
            String query = "select distinct initcap(gideon_name) state_Asso_no from camp_officers where sa=trim(substr('" + sa + "',3,2)) and region='" + region + "' and area='" + area + "' ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getADname()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getADmobile(String sa, String region, String area) {
        String stateasso = "";
        try {
            String query = "select distinct phonenumber state_Asso_no from camp_officers where sa=trim(substr('" + sa + "',3,2)) and region='" + region + "' and area='" + area + "' ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getADmobile()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getRDname(String sa, String region) {
        String stateasso = "";
        try {
            String query = "select distinct initcap(gideon_name) state_Asso_no from camp_officers where sa=trim(substr('" + sa + "',3,2)) and region='" + region + "' ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getRDname()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getRDmobile(String sa, String region) {
        String stateasso = "";
        try {
            String query = "select distinct phonenumber state_Asso_no from camp_officers where sa=trim(substr('" + sa + "',3,2)) and region='" + region + "' ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getRDmobile()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getCampPresident(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct initcap(gideon_name) state_Asso_no from camp_officers where Upper(camp_name)=Upper('" + camp + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getCampPresident()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getMemberCampFromMid(String mid) {
        String stateasso = "";
        try {
            String query = "select distinct camp camp from membership_weekly_raw where mid=Upper('" + mid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("camp");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getMemberCampFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getCampFromMid(String mid) {
        String stateasso = "";
        try {
            String query = "select distinct initcap(camp_name) camp from camp_officers where Upper(mid)=Upper('" + mid + "') ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("camp");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getCampFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getSAFromMid(String mid) {
        String stateasso = "";
        try {

            String query = "select distinct upper(state_asso) as name from camps_master where Upper(status)='ACTIVE' and sa_no in (select distinct sa from camp_officers where Upper(mid)=Upper('" + mid + "')) ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getSAFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getSAnoFromMid(String mid) {
        String stateasso = "";
        try {

            String query = "select distinct sa name from camp_officers where Upper(mid)=Upper('" + mid + "') ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getSAnoFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getRegionFromMid(String mid) {
        String stateasso = "";
        try {

            String query = "select distinct REGION as name from camp_officers where Upper(mid)=Upper('" + mid + "') ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getRegionFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getAreaFromMid(String mid) {
        String stateasso = "";
        try {

            String query = "select distinct AREA as name from camp_officers where Upper(mid)=Upper('" + mid + "') ";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getAreaFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getCampPresidentMobile(String camp) { // for sending sms when a event is created..
        String stateasso = "";
        try {
            String query = "select distinct phonenumber state_Asso_no from camp_officers where Upper(camp_name)=Upper('" + camp + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getCampPresidentMobile()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getMobileNoFromMid(String extid) { // for sending sms when a event is created..
        String stateasso = "";
        try {
            String query = "select distinct phonenumber mobile_no from camp_officers where Upper(extid)=Upper('" + extid + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("mobile_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getMobileNoFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getNameFromMid(String extid) { // for sending sms when a event is created..
        String stateasso = "";
        try {
            String query = "select distinct InitCap(gideon_name) name from camp_officers where Upper(extid)=Upper('" + extid + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getNameFromMid()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getCampPresidentEmail(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct lower(email) state_Asso_no from camp_officers where Upper(camp_name)=Upper('" + camp + "') ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso_no");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getCampPresidentEmail()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public String getStateAssociation(String camp) {
        String stateasso = "";
        try {
            String query = "select distinct state_asso from camps_master where Upper(camp)=Upper('" + camp + "') and Upper(status)='ACTIVE' order by to_number(substr(state_asso,3,2))";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                stateasso = rs.getString("state_Asso");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/getStateAssociation()/" + new Date() + "/" + e.toString());
        }
        return stateasso;
    }

    public ArrayList<String> LoadStateAsso() {
        ArrayList<String> events = new ArrayList<String>();
        try {
            String query = "select distinct state_asso as name,zone from camps_master where Upper(status)='ACTIVE' order by zone,name";
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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("### Event_DataAccessLayer/LoadStateAsso()/" + new Date() + "/" + e.toString());
        }
        return events;
    }

    public ArrayList<String> LoadCamps(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select Initcap(Camp) as name from Camps_master where upper(state_asso)=Upper('" + state_name + "') and Upper(status)='ACTIVE' order by Camp ";
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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/LoadCamps()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> LoadRegions(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select distinct region regn from Camps_master where upper(state_asso)=Upper('" + state_name + "') and Upper(status)='ACTIVE' order by region ";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("regn"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/LoadRegions()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> LoadAreas(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select distinct 'R-'||region||' / Area-'||area areas from Camps_master where upper(state_asso)=Upper('" + state_name + "') and Upper(status)='ACTIVE' group by 'R-'||region||' / Area-'||area order by 'R-'||region||' / Area-'||area";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("areas"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/LoadAreas()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> LoadiAreas(String state_name, String area) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select initcap(camp) camps from Camps_master where Upper(status)='ACTIVE' and upper(state_asso)=Upper('" + state_name + "') and region=substr(trim(substr('" + area + "', 1 ,INSTR('" + area + "', '/', 1, 1)-1)),3,1) and area=substr(trim(substr('" + area + "',Instr('" + area + "','/', -1, 1) + 1)),6,2) order by camp";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("camps"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/LoadiAreas()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> LoadiRegion(String state_name, String region) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select initcap(camp) camps from Camps_master where upper(state_asso)=Upper('" + state_name + "') and region='" + region + "' and Upper(status)='ACTIVE' order by camp";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("camps"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/LoadiRegion()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> LoadiSa(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select initcap(camp) camps from Camps_master where upper(state_asso)=Upper('" + state_name + "') and Upper(status)='ACTIVE' order by camp";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                branch.add(rs.getString("camps"));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/LoadiSa()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

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
            String query = "select emp_id,emp_name "
                    + " from employee "
                    + "where "
                    + "emp_id ='" + userid + "'";

            rs = stmt.executeQuery(query);

            while (rs.next()) {
                emp_details.put("empname", rs.getString("emp_name"));
                emp_details.put("empid", rs.getString("emp_id"));
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###EFM_DataAccessLayer/getEmployeeDetails/" + new Date() + "/" + e.toString());
        }
        return emp_details;
    }

    public ArrayList<String> ListofEvents() {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select distinct Upper(etype) as name,eid from events_list where etype is not null and Upper(cat)=Upper('CP') order by eid";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/ListofEvents()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public ArrayList<String> ListofEventsbasedonCat(String cat) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select distinct Upper(etype) as name,eid from events_list where etype is not null and Upper(cat)=Upper('" + cat + "') order by eid";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/ListofEventsbasedonCat()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    //Events List
    public ArrayList<Events> getEventsWiseList(String eventName) {
        ArrayList<Events> history = new ArrayList<Events>();
        Events events_table = new Events();
        try {

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select * from events where Upper(etype)=Upper('" + eventName + "') order by state,region_no,area_no,camp,eid,etype ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                events_table = new Events(
                        rs.getString("camp"),
                        rs.getString("area"),
                        rs.getString("region"),
                        rs.getString("state"),
                        rs.getString("eid"),
                        rs.getString("etype"),
                        rs.getString("edate"),
                        rs.getString("rel_info"),
                        rs.getString("phone"),
                        rs.getString("camp_president"),
                        rs.getString("event_planned"),
                        rs.getString("event_done"),
                        rs.getString("event_notes"),
                        rs.getString("remarks"),
                        rs.getString("contact_person"),
                        rs.getString("contact_phone"),
                        rs.getString("area_no"),
                        rs.getString("region_no"));
                history.add(events_table);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###EFM_DataAccessLayer/getEventsWiseList()/" + new Date() + "/" + e.toString());
        }
        return history;
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
            System.out.println("###EFM_DataAccessLayer/manageString()/" + new Date() + "/" + e.toString());
        }
        return output;
    }

    public String updateTravelMatrix(Map<String, String> emp_details, String rid, String username, String event) {
        int status = 0;
        String reply = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            query = "update travel_matrix_tbl set "
                    + "f_date=trim(to_date('" + emp_details.get("f_date") + "','DD/MM/YYYY')), t_date=trim(to_date('" + emp_details.get("t_date") + "','DD/MM/YYYY')), "
                    + "tmode_fdate=trim(to_date('" + emp_details.get("tmode_fdate") + "','DD/MM/YYYY')), tmode_tdate=trim(to_date('" + emp_details.get("tmode_tdate") + "','DD/MM/YYYY')), "
                    + "tmode_ftime='" + emp_details.get("tmode_ftime") + " hrs', tmode_ttime='" + emp_details.get("tmode_ttime") + " hrs',tmode_fno='" + emp_details.get("tmode_fno") + "', tmode_fname='" + emp_details.get("tmode_fname") + "', "
                    + "tmode_tno='" + emp_details.get("tmode_tno") + "', tmode_tname='" + emp_details.get("tmode_tname") + "',staying_at='" + emp_details.get("staying_at") + "', place='" + emp_details.get("place") + "', "
                    + "total_exp='" + emp_details.get("total_exp") + "', advance='" + emp_details.get("advance") + "', amount_received_from='" + emp_details.get("amount_received_from") + "',"
                    + "modified_by='" + emp_details.get("modified_by") + "', no_of_days=Nvl((to_date(f_date,'dd-MM-yyyy') - to_date(t_date,'dd-MM-yyyy')+1),0), event='" + emp_details.get("event") + "', status='" + emp_details.get("status") + "',"
                    + "contact_person='" + emp_details.get("contact_person") + "', contact_mobile='" + emp_details.get("contact_mobile") + "',address='" + emp_details.get("address") + "',"
                    + "t_fmode='" + emp_details.get("t_fmode") + "', t_tmode='" + emp_details.get("t_tmode") + "' "
                    + "where rid=" + rid;

            status = stmt.executeUpdate(query);
            if (status > 0) {
                reply = "Success";
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/updateTravelMatrix()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    public String updateEvent(Map<String, String> emp_details, String rid, String username, String event) {
        int status = 0;
        String reply = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "";
            if (event.equalsIgnoreCase("FFR")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), friends_expected_nos=trim('" + emp_details.get("friends_expected_nos") + "'), sf_goal=trim('" + emp_details.get("ff_goal") + "'), ff_goal=trim('" + emp_details.get("ff_goal") + "'), speakername='" + emp_details.get("speakername") + "', modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("PAB/APE/HYBRID")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), pastors_expected=trim('" + emp_details.get("pastors_expected") + "'), sf_goal=trim('" + emp_details.get("sf_goal") + "'), speakername='" + emp_details.get("speakername") + "', modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("NMP/AMD")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), prospects_expected=trim('" + emp_details.get("prospects_expected") + "'), sf_goal=trim('" + emp_details.get("new_members_goal") + "'), new_members_goal=trim('" + emp_details.get("new_members_goal") + "'), speakername='" + emp_details.get("speakername") + "', modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("SPEAKER DEVELOPMENT PROGRAM")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), members_expected=trim('" + emp_details.get("members_expected") + "'), sf_goal=trim('" + emp_details.get("members_expected") + "'), faculty_name='" + emp_details.get("faculty_name") + "', modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("WEEKLY PRAYER MEETING")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), members_expected=trim('" + emp_details.get("members_expected") + "'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("MINI BLITZ / DISTRIBUTION")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), team_nos=trim('" + emp_details.get("team_nos") + "'), institutions_no=trim('" + emp_details.get("institutions_no") + "'),sf_goal=trim('" + emp_details.get("scripture_qty") + "'), scripture_qty=trim('" + emp_details.get("scripture_qty") + "'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("MEMBERSHIP ENGAGEMENT SEMINAR")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), members_expected=trim('" + emp_details.get("members_expected") + "'),sf_goal=trim('" + emp_details.get("members_expected") + "'), faculty_name='" + emp_details.get("faculty_name") + "', modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("MEMBERSHIP ACTION DAY")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), sf_goal=trim('" + emp_details.get("members_expected") + "'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("CHURCH RALLY")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'),sf_goal=trim('" + emp_details.get("church_nos") + "'), church_nos=trim('" + emp_details.get("church_nos") + "'), speaker_nos=trim('" + emp_details.get("speaker_nos") + "'), prayerpartner_nos=trim('" + emp_details.get("prayerpartner_nos") + "'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("CHURCH ACTION DAY")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'),sf_goal=trim('" + emp_details.get("church_nos") + "'), church_nos=trim('" + emp_details.get("church_nos") + "'), speaker_nos=trim('" + emp_details.get("speaker_nos") + "'), prayerpartner_nos=trim('" + emp_details.get("prayerpartner_nos") + "'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("CAMP PRAYER MEETING")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), members_expected=trim('" + emp_details.get("members_expected") + "'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("CAMP ELECTION")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("CAMP CABINET MEETING")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("AUXILIARY EVENT")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), rel_info='" + emp_details.get("remarks") + "', contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "', members_expected=trim('" + emp_details.get("members_expected") + "'),sf_goal=trim('" + emp_details.get("members_expected") + "'), faculty_name='" + emp_details.get("faculty_name") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("FAIRS FESTIVALS")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "', team_nos=trim('" + emp_details.get("team_nos") + "'),sf_goal=trim('" + emp_details.get("scripture_qty") + "'), scripture_qty=trim('" + emp_details.get("scripture_qty") + "') where rid=" + rid;
            } else if (event.equalsIgnoreCase("ATM")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "', members_expected=trim('" + emp_details.get("members_expected") + "'),sf_goal=trim('" + emp_details.get("members_expected") + "'), speakername='" + emp_details.get("speakername") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("RTM")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "', members_expected=trim('" + emp_details.get("members_expected") + "'),sf_goal=trim('" + emp_details.get("members_expected") + "'), speakername='" + emp_details.get("speakername") + "' where rid=" + rid;
            } else if (event.equalsIgnoreCase("STATE CABINET")) {
                query = "update events set event_conducted_on=trim(to_date('" + emp_details.get("event_date1") + "','DD/MM/YYYY')), contact_person='" + emp_details.get("camp_president") + "', contact_phone='" + emp_details.get("camp_president_mobile") + "', camp_president='" + emp_details.get("camp_president") + "', camp_president_mobile='" + emp_details.get("camp_president_mobile") + "', venue='" + emp_details.get("venue") + "', event_date=trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')), edate=to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'), modified_by='" + emp_details.get("modified_by") + "',event_planned='" + emp_details.get("event_planned") + "', members_expected=trim('" + emp_details.get("members_expected") + "'),sf_goal=trim('" + emp_details.get("members_expected") + "') where rid=" + rid;
            }

            status = stmt.executeUpdate(query);
            if (status > 0) {
                reply = "Success";
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/updateEVent()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    public String insertNewEvent(Map<String, String> emp_details, String ip, String user, String extid, String user_mobile) {
        int status = 0;
        int maxid = 0;
        String reply = "";
        String query = "", query_g = "";
        String zone = ""; //getZoneNO(emp_details.get("camp"));
        String state_asso = ""; //getStateAssociation(emp_details.get("camp"));
        String sa = ""; //getStateAssociationNO(emp_details.get("camp"));
        String region = ""; //getRegionNO(emp_details.get("camp"));
        String area = "";

        String eid = getEid(emp_details.get("etype"));
        String camp_president_name = getCampPresident(emp_details.get("camp"));
        String camp_president_mobile = getCampPresidentMobile(emp_details.get("camp"));
        String camp_president_email = getCampPresidentEmail(emp_details.get("camp"));

//        System.out.println("event : " + emp_details.get("etype"));
//        System.out.println("event : " + emp_details.get("camp"));
//        System.out.println("event : " + emp_details.get("stateasso"));
//        System.out.println("event : " + emp_details.get("event_date"));
//        if (manageString(emp_details.get("camp")) == null || manageString(emp_details.get("camp")).isEmpty() || manageString(emp_details.get("camp")) == "" || manageString(emp_details.get("camp")).equalsIgnoreCase("0")) {
//                
//            System.out.println("comes here 1a");
//            System.out.println("la sa :"+emp_details.get("stateasso"));
//            
//            if (emp_details.get("stateasso").toString() != null) {
//                System.out.println("comes here 1b");
//                sa = getStateAssociationNO1(emp_details.get("stateasso").toString());
//                zone = getZoneNO1(emp_details.get("stateasso").toString());
//                state_asso = emp_details.get("stateasso").toString();
//                camp_president_name = getSCname(emp_details.get("stateasso").toString());
//                camp_president_mobile = getSCmobile(emp_details.get("stateasso").toString());                
//            }
//
//            if (manageString(emp_details.get("region")).toString() != null && !manageString(emp_details.get("region")).toString().isEmpty() && manageString(emp_details.get("region")).toString() != "" && manageString(emp_details.get("region")) != "0" && manageString(emp_details.get("region")).equalsIgnoreCase("0")) {
//                System.out.println("comes here 1c");
//                region = manageString(emp_details.get("region"));
//                camp_president_name = getRDname(manageString(emp_details.get("stateasso").toString()), manageString(emp_details.get("region").toString()));
//                camp_president_mobile = getRDmobile(manageString(emp_details.get("stateasso").toString()), manageString(emp_details.get("region").toString()));
//            }
//
//            if (manageString(emp_details.get("area")).toString() != null && !manageString(emp_details.get("area")).toString().isEmpty() && manageString(emp_details.get("area")).toString() != "" && manageString(emp_details.get("area")) != "0" && !manageString(emp_details.get("area")).equalsIgnoreCase("0")) {
//                System.out.println("comes here 1d");
//                area = getAreaNO2(manageString(emp_details.get("area").toString()));
//                region = getRegionNO2(manageString(emp_details.get("area").toString()));
//                camp_president_name = getADname(manageString(emp_details.get("stateasso").toString()), region, area);
//                camp_president_mobile = getADmobile(manageString(emp_details.get("stateasso").toString()), region, area);
//            }
//        } else {
//            System.out.println("comes here 1e");
//            sa = getStateAssociationNO(emp_details.get("camp").toString());
//            region = getRegionNO(emp_details.get("camp").toString());
//            area = getAreaNO(emp_details.get("camp").toString());
//            zone = getZoneNO(emp_details.get("camp").toString());
//            state_asso = getStateAssociation(emp_details.get("camp").toString());
//                
//                System.out.println(sa);
//                System.out.println(zone);
//                System.out.println(state_asso);
//                System.out.println(region);
//                System.out.println(area);
//                System.out.println(emp_details.get("camp").toString());
//                System.out.println(camp_president_name);
//                System.out.println(camp_president_mobile);
//        }
        String v_sf_goal = "";
        String event_planned_by = "";

        if (emp_details.get("etype").equalsIgnoreCase("ATM")) {
            event_planned_by = "SA" + sa + " (R " + region + " - A " + area + ")";
        } else if (emp_details.get("etype").equalsIgnoreCase("RTM")) {
            event_planned_by = "SA" + sa + " (R " + region + ")";
        } else if (emp_details.get("etype").equalsIgnoreCase("STATE CABINET")) {
            event_planned_by = "SA" + sa;
        }
        // System.out.println("comes here 1f");
        // System.out.println(event_planned_by);

        if (manageString(emp_details.get("members_expected")) != null && !manageString(emp_details.get("members_expected")).isEmpty() && manageString(emp_details.get("members_expected")) != "") {
            v_sf_goal = emp_details.get("members_expected");
        } else if (manageString(emp_details.get("scripture_qty")) != null && !manageString(emp_details.get("scripture_qty")).isEmpty() && manageString(emp_details.get("scripture_qty")) != "") {
            v_sf_goal = emp_details.get("scripture_qty");
        } else if (manageString(emp_details.get("ff_goal")) != null && !manageString(emp_details.get("ff_goal")).isEmpty() && manageString(emp_details.get("ff_goal")) != "") {
            v_sf_goal = emp_details.get("ff_goal");
        } else if (manageString(emp_details.get("new_members_goal")) != null && !manageString(emp_details.get("new_members_goal")).isEmpty() && manageString(emp_details.get("new_members_goal")) != "") {
            v_sf_goal = emp_details.get("new_members_goal");
        } else if (manageString(emp_details.get("church_nos")) != null && !manageString(emp_details.get("church_nos")).isEmpty() && manageString(emp_details.get("church_nos")) != "") {
            v_sf_goal = emp_details.get("church_nos");
        } else {
            v_sf_goal = emp_details.get("sf_goal");
        }

        maxid = getMaxId();
        String v_month_sort_order = "0";

        // System.out.println("sort order : "+emp_details.get("event_date").substring(4, 2));
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query_g = "insert into Events("
                    + "RID,"
                    + "CAMP,"
                    + "AREA,"
                    + "REGION,"
                    + "STATE,"
                    + "EID  ,"
                    + "ETYPE,"
                    + "EDATE,"
                    + "REL_INFO,"
                    + "PHONE,"
                    + "CAMP_PRESIDENT,"
                    + "EVENT_PLANNED,"
                    + "EVENT_DONE,"
                    + "REMARKS,"
                    + "CONTACT_PERSON,"
                    + "CONTACT_PHONE,"
                    + "AREA_NO,"
                    + "REGION_NO,"
                    + "SA,"
                    + "ZONE,"
                    + "EVENT_DATE,"
                    + "MONTH_NO,"
                    + "camp_president_mobile,"
                    + "camp_president_email,"
                    + "scripture_qty,"
                    + "institutions_no,"
                    + "faculty_name,"
                    + "members_expected,"
                    + "training_type,"
                    + "new_members_goal,"
                    + "ff_goal,"
                    + "prayer_partner_name,"
                    + "mega_church_name,"
                    + "prayerpartner_nos,"
                    + "speaker_nos,"
                    + "team_nos,"
                    + "church_nos,"
                    + "sf_goal,"
                    + "speakername,"
                    + "prospects_expected,"
                    + "friends_expected_nos,"
                    + "pastors_expected,"
                    + "venue,"
                    + "modified_by,"
                    + "month_sort_order,"
                    + "eyear,"
                    + "modified_date,"
                    + "event_notes "
                    + ") values("
                    + "'" + maxid + "',"
                    + "InitCap('" + manageString(emp_details.get("camp")) + "'),"
                    + "'Area " + manageString(area) + "',"
                    + "'Region " + manageString(region) + "',"
                    + "'" + manageString(state_asso) + "',"
                    + "'" + manageString(eid) + "',"
                    + "'" + manageString(emp_details.get("etype")) + "',"
                    + "to_char(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'DD/MM/YY'),"
                    + "'" + manageString(emp_details.get("remarks")) + "',"
                    + "'" + manageString(camp_president_mobile) + "',"
                    + "'" + manageString(camp_president_name) + "', "
                    + "initcap('" + manageString(emp_details.get("event_planned")) + "') ,"
                    + "'" + manageString(emp_details.get("event_done")) + "',"
                    + "'" + manageString(emp_details.get("remarks")) + "',"
                    + "'" + manageString(camp_president_name) + "',"
                    + "'" + manageString(camp_president_mobile) + "',"
                    + "'" + manageString(area) + "',"
                    + "'" + manageString(region) + "',"
                    + "'" + manageString(sa) + "',"
                    + "'" + manageString(zone) + "',"
                    + "trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')),"
                    //  (substr(to_char(event_date,'DD-MM-YYYY'),4,2))
                    + "substr('" + manageString(emp_details.get("event_date")) + "',4,2),"
                    + "'" + manageString(camp_president_mobile) + "',"
                    + "lower('" + manageString(camp_president_email) + "'),"
                    + "'" + manageString(emp_details.get("scripture_qty")) + "',"
                    + "'" + manageString(emp_details.get("institutions_no")) + "',"
                    + "'" + manageString(emp_details.get("faculty_name")) + "',"
                    + "'" + manageString(emp_details.get("members_expected")) + "',"
                    + "'" + manageString(emp_details.get("training_type")) + "',"
                    + "'" + manageString(emp_details.get("new_members_goal")) + "',"
                    + "'" + manageString(emp_details.get("ff_goal")) + "',"
                    + "'" + manageString(emp_details.get("prayer_partner_name")) + "',"
                    + "'" + manageString(emp_details.get("mega_church_name")) + "',"
                    + "'" + manageString(emp_details.get("prayerpartner_nos")) + "',"
                    + "'" + manageString(emp_details.get("speaker_nos")) + "',"
                    + "'" + manageString(emp_details.get("team_nos")) + "',"
                    + "'" + manageString(emp_details.get("church_nos")) + "',"
                    + "'" + manageString(v_sf_goal) + "',"
                    + "'" + manageString(emp_details.get("speakername")) + "',"
                    + "'" + manageString(emp_details.get("prospects_expected")) + "',"
                    + "'" + manageString(emp_details.get("friends_expected_nos")) + "',"
                    + "'" + manageString(emp_details.get("pastors_expected")) + "',"
                    + "'" + manageString(emp_details.get("venue")) + "',"
                    + "'" + manageString(user) + "',"
                    + "'" + v_month_sort_order + "',"
                    + "TRIM(TO_CHAR(TO_DATE('" + emp_details.get("event_date") + "','DD/MM/YYYY'),'YYYY')),"
                    + "sysdate, 'Current'"
                    + ")";

            status = stmt.executeUpdate(query_g);
            stmt.close();
            con.close();

            if (status > 0) {

                reply = formatIntToString(maxid);
                setMaxId(maxid);
                SendSMS sms = new SendSMS();

                if (manageString(emp_details.get("etype")).equalsIgnoreCase("STATE CABINET")) {
                    sms.sendSMS(manageString(user_mobile), "Pls be informed that a new event " + manageString(emp_details.get("etype")) + " is planned by " + manageString(event_planned_by) + "; Date " + emp_details.get("event_date") + ". Visit SPOT for full details", "1207160336030939761");
                } else if (manageString(emp_details.get("etype")).equalsIgnoreCase("RTM")) {
                    sms.sendSMS(manageString(user_mobile), "Pls be informed that a new event " + manageString(emp_details.get("etype")) + " is planned by " + manageString(event_planned_by) + "; Date " + emp_details.get("event_date") + ". Visit SPOT for full details", "1207160336030939761");
                } else if (manageString(emp_details.get("etype")).equalsIgnoreCase("ATM")) {
                    sms.sendSMS(manageString(user_mobile), "Pls be informed that a new event " + manageString(emp_details.get("etype")) + " is planned by " + manageString(event_planned_by) + "; Date " + emp_details.get("event_date") + ". Visit SPOT for full details", "1207160336030939761");
                } else {
                    sms.sendSMS(manageString(user_mobile), "New event " + manageString(emp_details.get("etype")) + " planned by " + emp_details.get("camp") + " Camp; Date " + emp_details.get("event_date") + ". Pls visit SPOT for full event details", "1207160336030939761");
                    sms.sendSMS(manageString(camp_president_mobile), "New event " + manageString(emp_details.get("etype")) + " planned by " + emp_details.get("camp") + " Camp; Date " + emp_details.get("event_date") + ". Pls visit SPOT for full event details", "1207160336030939761");
                }

            } else {
                reply = "Failure";
            }

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/insertNewEvent()/" + new Date() + "/" + e.toString());
        }

        return reply;
    }

    public String insertNewTravelPlan(Map<String, String> emp_details, String ip) {
        int status = 0;
        int maxid = 0;
        String reply = "";
        String query = "", query_g = "";
        String eid = getEid(emp_details.get("event"));
        maxid = getTmMaxId();

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query_g = "insert into travel_matrix_tbl("
                    + "RID,"
                    + "NAME,"
                    + "F_DATE,"
                    + "T_DATE,"
                    + "NO_OF_DAYS,"
                    + "PLACE,"
                    + "ADDRESS,"
                    + "T_FMODE,"
                    + "TOTAL_EXP,"
                    + "ADVANCE,"
                    + "AMOUNT_RECEIVED_ON,"
                    + "AMOUNT_RECEIVED_FROM,"
                    + "EVENT,"
                    + "EID,"
                    + "CONTACT_PERSON,"
                    + "CONTACT_MOBILE,"
                    + "MODIFIED_BY,"
                    + "MODIFIED_DATE,"
                    + "USERID,"
                    + "STATUS,"
                    + "STAYING_AT,"
                    + "TMODE_FNO,"
                    + "TMODE_FNAME,"
                    + "TMODE_FDATE,"
                    + "TMODE_FTIME,"
                    + "TMODE_TNO,"
                    + "TMODE_TNAME,"
                    + "TMODE_TDATE,"
                    + "TMODE_TTIME,"
                    + "T_TMODE"
                    + ") values("
                    + "'" + maxid + "',"
                    + "'" + manageString(emp_details.get("name")) + "',"
                    + "trim(to_date('" + emp_details.get("f_date") + "','DD/MM/YYYY')),"
                    + "trim(to_date('" + emp_details.get("t_date") + "','DD/MM/YYYY')),"
                    + "Nvl((to_date('" + emp_details.get("t_date") + "','DD/MM/YYYY') - to_date('" + emp_details.get("f_date") + "','DD/MM/YYYY')+1),0),"
                    + "'" + manageString(emp_details.get("place")) + "',"
                    + "'" + manageString(emp_details.get("address")) + "',"
                    + "'" + manageString(emp_details.get("t_fmode")) + "',"
                    + "'" + manageString(emp_details.get("total_exp")) + "',"
                    + "'" + manageString(emp_details.get("advance")) + "',"
                    + "trim(to_date('" + emp_details.get("amount_received_on") + "','DD/MM/YYYY')),"
                    + "'" + manageString(emp_details.get("amount_received_from")) + "',"
                    + "'" + manageString(emp_details.get("event")) + "',"
                    + "'" + manageString(eid) + "',"
                    + "'" + manageString(emp_details.get("contact_person")) + "',"
                    + "'" + manageString(emp_details.get("contact_mobile")) + "',"
                    + "'" + manageString(emp_details.get("modified_by")) + "',"
                    + "sysdate,"
                    + "'" + manageString(emp_details.get("modified_by")) + "',"
                    + "'" + manageString(emp_details.get("status")) + "',"
                    + "'" + manageString(emp_details.get("staying_at")) + "',"
                    + "'" + manageString(emp_details.get("tmode_fno")) + "',"
                    + "'" + manageString(emp_details.get("tmode_fname")) + "',"
                    + "trim(to_date('" + emp_details.get("tmode_fdate") + "','DD/MM/YYYY')),"
                    + "'" + manageString(emp_details.get("tmode_ftime")) + "',"
                    + "'" + manageString(emp_details.get("tmode_tno")) + "',"
                    + "'" + manageString(emp_details.get("tmode_tname")) + "',"
                    + "trim(to_date('" + emp_details.get("tmode_tdate") + "','DD/MM/YYYY')),"
                    + "'" + manageString(emp_details.get("tmode_ttime")) + "',"
                    + "'" + manageString(emp_details.get("t_tmode")) + "' "
                    + ")";

            status = stmt.executeUpdate(query_g);
            stmt.close();
            con.close();

            if (status > 0) {
                reply = formatIntToString(maxid);
                setTmMaxId(maxid);
            } else {
                reply = "Failure";
            }

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/insertNewTravelPlan()/" + new Date() + "/" + e.toString());
        }

        return reply;
    }

    public String insertNewTravelPlan_1(Map<String, String> emp_details, String ip) {
        int status = 0;
        int maxid = 0;
        String reply = "";
        String query = "", query_g = "";
        String eid = getEid(emp_details.get("etype"));
        maxid = getTmMaxId();

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            query_g = "insert into travel_matrix_tbl("
                    + "RID,"
                    + "NAME,"
                    + "F_DATE,"
                    + "T_DATE,"
                    + "NO_OF_DAYS,"
                    + "PLACE,"
                    + "EVENT,"
                    + "EID,"
                    + "CONTACT_PERSON,"
                    + "CONTACT_MOBILE,"
                    + "MODIFIED_BY,"
                    + "MODIFIED_DATE,"
                    + "USERID,"
                    + "STATUS,"
                    + "CAMP,"
                    + "SA,"
                    + "ERID"
                    + ") values("
                    + "'" + maxid + "',"
                    + "'" + manageString(emp_details.get("tname")) + "',"
                    + "trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')),"
                    + "trim(to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')),"
                    + "Nvl((to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY') - to_date('" + emp_details.get("event_date") + "','DD/MM/YYYY')+1),0),"
                    + "'" + manageString(emp_details.get("venue")) + "',"
                    + "'" + manageString(emp_details.get("etype")) + "',"
                    + "'" + manageString(eid) + "',"
                    + "'" + manageString(emp_details.get("camp_president")) + "',"
                    + "'" + manageString(emp_details.get("camp_president_mobile")) + "',"
                    + "'" + manageString(emp_details.get("modified_by")) + "',"
                    + "sysdate,"
                    + "'" + manageString(emp_details.get("mno")) + "',"
                    + "'" + manageString(emp_details.get("event_planned")) + "', "
                    + "'" + manageString(emp_details.get("camp")) + "', "
                    + "'" + manageString(emp_details.get("stateasso")) + "', "
                    + "'" + manageString(emp_details.get("rid")) + "' "
                    + ")";

            status = stmt.executeUpdate(query_g);
            stmt.close();
            con.close();

            if (status > 0) {
                reply = formatIntToString(maxid);
                setTmMaxId(maxid);
                updateEventsTblforTravelPlan(manageString(emp_details.get("rid")), manageString(emp_details.get("tno")), manageString(emp_details.get("tname")));
            } else {
                reply = "Failure";
            }

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###NC_DataAccessLayer/insertNewTravelPlan_1()/" + new Date() + "/" + e.toString());
        }

        return reply;
    }

    //Events List - Region wise
    public ArrayList<Events> getEventsRegionWiseList(String eventName) {
        ArrayList<Events> history = new ArrayList<Events>();
        Events events_table = new Events();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select * from events where Upper(region)=Upper('" + eventName + "') order by state,region_no,area_no,camp,eid,etype ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                events_table = new Events(
                        rs.getString("camp"),
                        rs.getString("area"),
                        rs.getString("region"),
                        rs.getString("state"),
                        rs.getString("eid"),
                        rs.getString("etype"),
                        rs.getString("edate"),
                        rs.getString("rel_info"),
                        rs.getString("phone"),
                        rs.getString("camp_president"),
                        rs.getString("event_planned"),
                        rs.getString("event_done"),
                        rs.getString("event_notes"),
                        rs.getString("remarks"),
                        rs.getString("contact_person"),
                        rs.getString("contact_phone"),
                        rs.getString("area_no"),
                        rs.getString("region_no"));
                history.add(events_table);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###EFM_DataAccessLayer/getEventsRegionWiseList()/" + new Date() + "/" + e.toString());
        }
        return history;
    }

    //Events List - Area wise
    public ArrayList<Events> getEventsAreaWiseList(String eventName) {
        ArrayList<Events> history = new ArrayList<Events>();
        Events events_table = new Events();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select * from events where Upper(area)=Upper('" + eventName + "') order by state,region_no,area_no,camp,eid,etype ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                events_table = new Events(
                        rs.getString("camp"),
                        rs.getString("area"),
                        rs.getString("region"),
                        rs.getString("state"),
                        rs.getString("eid"),
                        rs.getString("etype"),
                        rs.getString("edate"),
                        rs.getString("rel_info"),
                        rs.getString("phone"),
                        rs.getString("camp_president"),
                        rs.getString("event_planned"),
                        rs.getString("event_done"),
                        rs.getString("event_notes"),
                        rs.getString("remarks"),
                        rs.getString("contact_person"),
                        rs.getString("contact_phone"),
                        rs.getString("area_no"),
                        rs.getString("region_no"));
                history.add(events_table);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###EFM_DataAccessLayer/getEventsAreaWiseList()/" + new Date() + "/" + e.toString());
        }
        return history;
    }

    //Events List - Area wise
    public ArrayList<Events> getEventsStatewiseList(String eventName) {
        ArrayList<Events> history = new ArrayList<Events>();
        Events events_table = new Events();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select * from events where Upper(state)=Upper('" + eventName + "') order by state,region_no,area_no,camp,eid,etype ";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                events_table = new Events(
                        rs.getString("camp"),
                        rs.getString("area"),
                        rs.getString("region"),
                        rs.getString("state"),
                        rs.getString("eid"),
                        rs.getString("etype"),
                        rs.getString("edate"),
                        rs.getString("rel_info"),
                        rs.getString("phone"),
                        rs.getString("camp_president"),
                        rs.getString("event_planned"),
                        rs.getString("event_done"),
                        rs.getString("event_notes"),
                        rs.getString("remarks"),
                        rs.getString("contact_person"),
                        rs.getString("contact_phone"),
                        rs.getString("area_no"),
                        rs.getString("region_no"));
                history.add(events_table);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###EFM_DataAccessLayer/getEventsStatewiseList()/" + new Date() + "/" + e.toString());
        }
        return history;
    }

    public ArrayList<Events2> getSearch1(String query) {
        ArrayList<Events2> history = new ArrayList<Events2>();
        Events2 bca = new Events2();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery("SELECT * FROM EVENTS WHERE ETYPE='" + query + "' and event_date is not null ");
            while (rs.next()) {
                bca = new Events2(
                        rs.getString("eid"),
                        rs.getString("etype"),
                        rs.getString("state"),
                        rs.getString("region"),
                        rs.getString("area"),
                        rs.getString("camp"),
                        rs.getString("edate"),
                        rs.getString("event_planned"),
                        rs.getString("event_done"),
                        rs.getString("name"),
                        rs.getString("name0"),
                        rs.getString("name1"),
                        rs.getString("name2"),
                        rs.getString("name3"),
                        rs.getString("name4"),
                        rs.getString("name5"),
                        rs.getString("name6"),
                        rs.getString("name7"),
                        rs.getString("name8"),
                        rs.getString("name9"),
                        rs.getString("name10"),
                        rs.getString("name11"),
                        rs.getString("name12"),
                        rs.getString("name13"),
                        rs.getString("name14"),
                        rs.getString("name15"),
                        rs.getString("name16"),
                        rs.getString("name17"),
                        rs.getString("name18"),
                        rs.getString("name19"),
                        rs.getString("name20"),
                        rs.getString("event_date"),
                        rs.getString("camp_president"),
                        rs.getString("camp_president_mobile"),
                        rs.getString("speakername"),
                        rs.getString("venue"),
                        rs.getString("sf_goal"),
                        rs.getString("ff_goal"),
                        rs.getString("new_members_goal"),
                        rs.getString("pastors_expected"),
                        rs.getString("friends_expected_nos"),
                        rs.getString("prospects_expected"),
                        rs.getString("church_nos"),
                        rs.getString("team_nos"),
                        rs.getString("speaker_nos"),
                        rs.getString("prayerpartner_nos"),
                        rs.getString("mega_church_name"),
                        rs.getString("prayer_partner_name"),
                        rs.getString("training_type"),
                        rs.getString("members_expected"),
                        rs.getString("faculty_name"),
                        rs.getString("institutions_no"),
                        rs.getString("scripture_qty"),
                        rs.getString("remarks"),
                        rs.getString("modified_by"),
                        rs.getString("rid"),
                        rs.getString("tno"),
                        rs.getString("camp_president_email"),
                        rs.getString("month_no"),
                        rs.getString("area_no"),
                        rs.getString("region_no"),
                        rs.getString("sa"),
                        rs.getString("zone"),
                        rs.getString("event_notes"),
                        rs.getString("rel_info"),
                        rs.getString("phone"));
                history.add(bca);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getSearch1()/" + new Date() + "/" + e.toString());
        }
        return history;
    }

    public ArrayList<Events1> getSearch(String query) {
        ArrayList<Events1> history = new ArrayList<Events1>();
        Events1 bca = new Events1();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                bca = new Events1(
                        rs.getString("eid"),
                        rs.getString("etype"),
                        rs.getString("event_name"),
                        rs.getString("state"),
                        rs.getString("region"),
                        rs.getString("area"),
                        rs.getString("camp"),
                        rs.getString("edate"),
                        rs.getString("event_planned"),
                        rs.getString("event_done"),
                        rs.getString("name"),
                        rs.getString("name0"),
                        rs.getString("name1"),
                        rs.getString("name2"),
                        rs.getString("name3"),
                        rs.getString("name4"),
                        rs.getString("name5"),
                        rs.getString("name6"),
                        rs.getString("name7"),
                        rs.getString("name8"),
                        rs.getString("name9"),
                        rs.getString("name10"),
                        rs.getString("name11"),
                        rs.getString("name12"),
                        rs.getString("name13"),
                        rs.getString("name14"),
                        rs.getString("name15"),
                        rs.getString("name16"),
                        rs.getString("name17"),
                        rs.getString("name18"),
                        rs.getString("name19"),
                        rs.getString("name20"),
                        rs.getString("event_date"),
                        rs.getString("camp_president"),
                        rs.getString("camp_president_mobile"),
                        rs.getString("url"),
                        rs.getString("travelurl"),
                        rs.getString("travelurlself"),
                        rs.getString("speakername"),
                        rs.getString("venue"),
                        rs.getString("sf_goal"),
                        rs.getString("ff_goal"),
                        rs.getString("new_members_goal"),
                        rs.getString("pastors_expected"),
                        rs.getString("friends_expected_nos"),
                        rs.getString("prospects_expected"),
                        rs.getString("church_nos"),
                        rs.getString("team_nos"),
                        rs.getString("speaker_nos"),
                        rs.getString("prayerpartner_nos"),
                        rs.getString("mega_church_name"),
                        rs.getString("prayer_partner_name"),
                        rs.getString("training_type"),
                        rs.getString("members_expected"),
                        rs.getString("faculty_name"),
                        rs.getString("institutions_no"),
                        rs.getString("scripture_qty"),
                        rs.getString("remarks"));
                history.add(bca);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getSearch1()/" + new Date() + "/" + e.toString());
        }
        return history;
    }

    public ArrayList<Membership> getMemberDetatils(String query) {
        ArrayList<Membership> history = new ArrayList<Membership>();
        Membership bca = new Membership();
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                bca = new Membership(
                        rs.getString("extid"),
                        rs.getString("name"),
                        rs.getString("dob"),
                        rs.getString("mobile"),
                        rs.getString("email"),
                        rs.getString("type"),
                        rs.getString("camp"),
                        rs.getString("campid"),
                        rs.getString("address"));
                history.add(bca);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getMemberDetatils()/" + new Date() + "/" + e.toString());
        }
        return history;
    }

    public String getName(String refno) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(gideon_name) name from camp_officers where Upper(mid)=Upper('" + refno + "')";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("name");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getName()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getCamp(String refno) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select distinct Upper(camp) camp from events where rid='" + refno + "' and rownum<2";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("camp");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getCamp()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getSA(String refno) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(state_asso) sa from camps_master where (sa_no,region,area) in (select sa,region_no,area_no from events where rid='" + refno + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getSA()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getSA1_state_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(state_asso) sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getSA1_state_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getArea_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Substr(area_region,1,6) sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getArea_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getRegion_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Substr(area_region,8,8) sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getRegion_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getAreaNo_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Substr(area_region,6,1) sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getAreaNo_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getRegionNo_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Substr(area_region,15,1) sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getRegionNo_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getSANo_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select sa_no sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getSANo_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getZone_minievents(String camp) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select zone sa from camps_master where upper(camp)=upper('" + camp + "') and Upper(status)='ACTIVE' and rownum<2";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("sa");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getZone_minievents()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getMno(String refno) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(mid) extid from camp_officers where Upper(orbitid)=Upper('" + refno + "')";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("extid");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getMno()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String getDesignation(String refno) {
        String name = "";
        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            String query = "select Upper(DESIGNATION_SORTID) designation from camp_officers where Upper(mid)=Upper('" + refno + "')";

            rs = stmt.executeQuery(query);
            while (rs.next()) {
                name = rs.getString("designation");
            }
            rs.close();
            stmt.close();
            con.close();

        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/getDesignation()/" + new Date() + "/" + e.toString());
        }
        return name;
    }

    public String multipleTMupdate(String refno, int i, String tname, String event_date, String venue, String eventName, String camp_president, String camp_president_mobile, String modified_by, String mno, String event_planned, String camp, String stateasso, String rid, String tno) {
        String reply = "";
        int r = 0;
        int r1 = 0;
        int status = 0;
        int maxid = 0;
        String query = "";
        String eid = getEid(eventName);
        String gname = getName(tno);
        maxid = getTmMaxId();
        try {
            query = "insert into travel_matrix_tbl("
                    + "RID,"
                    + "NAME,"
                    + "F_DATE,"
                    + "T_DATE,"
                    + "NO_OF_DAYS,"
                    + "PLACE,"
                    + "EVENT,"
                    + "EID,"
                    + "CONTACT_PERSON,"
                    + "CONTACT_MOBILE,"
                    + "MODIFIED_BY,"
                    + "MODIFIED_DATE,"
                    + "USERID,"
                    + "STATUS,"
                    + "CAMP,"
                    + "SA,"
                    + "ERID"
                    + ") values("
                    + "'" + maxid + "',"
                    + "'" + gname + "',"
                    + "trim(to_date('" + event_date + "','DD/MM/YYYY')),"
                    + "trim(to_date('" + event_date + "','DD/MM/YYYY')),"
                    + "Nvl((to_date('" + event_date + "','DD/MM/YYYY') - to_date('" + event_date + "','DD/MM/YYYY')+1),0),"
                    + "'" + manageString(venue) + "',"
                    + "'" + manageString(eventName) + "',"
                    + "'" + manageString(eid) + "',"
                    + "'" + manageString(camp_president) + "',"
                    + "'" + manageString(camp_president_mobile) + "',"
                    + "'" + manageString(modified_by) + "',"
                    + "sysdate,"
                    + "'" + manageString(tno) + "',"
                    + "'" + manageString(event_planned) + "', "
                    + "'" + camp + "', "
                    + "'" + stateasso + "', "
                    + "'" + rid + "' "
                    + ")";

            String query1 = "update events set name" + i + "='" + gname + "' "
                    + "where rid='" + rid + "'";
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            r = stmt.executeUpdate(query);
            r1 = stmt.executeUpdate(query1);

            if (r1 > 0) {
                reply = "Success";
                //reply = formatIntToString(maxid);
                setTmMaxId(maxid);
            } else {
                reply = "Failure";
            }
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/multipleTMupdate()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // NC Payment Status Update..
    public String Insert_travel_matrix_tbl(String program, String camp, String event, String edate, String purpose, String remarks, String name, String tno, String officer) {
        String reply = "";
        int r1 = 0;
        int r2 = 0;
        int i = 1;
        String gname = getName(tno);
        int maxid = 0;
        maxid = getTmMaxId_1();

        if (!officer.isEmpty() || officer != null) {
            gname = officer;
        }

        String query1 = "0";
        String query2 = "0";
        try {
            if (edate != null && !edate.isEmpty() && edate != "") {
                query1 = "insert into travel_matrix_tbl (rid,name,program,camp,event,f_date,t_date,no_of_days,purpose,remarks,status,modified_date) "
                        + "values( "
                        + "'" + maxid + "',"
                        + "'" + gname + "',"
                        + "'" + program + "', "
                        + "'" + camp + "', "
                        + "'" + event + "',"
                        + "trim(to_date('" + edate + "','DD/MM/YYYY')),"
                        + "trim(to_date('" + edate + "','DD/MM/YYYY')),"
                        + "Nvl((to_date('" + edate + "','DD/MM/YYYY') - to_date('" + edate + "','DD/MM/YYYY')+1),0),"
                        + "'" + purpose + "', "
                        + "'" + remarks + "', "
                        + "'Planned', "
                        + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YYYY HH24:MI:SS'))";

                query2 = "insert into events (rid,name1,camp,etype,edate,event_date,purpose,remarks,event_planned,modified_date) "
                        + "values( "
                        + "'" + maxid + "',"
                        + "'" + gname + "',"
                        + "'" + camp + "', "
                        + "'" + event + "',"
                        + "trim(to_date('" + edate + "','DD/MM/YYYY')),"
                        + "trim(to_date('" + edate + "','DD/MM/YYYY')),"
                        + "'" + purpose + "', "
                        + "'" + remarks + "', "
                        + "'Planned', "
                        + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YYYY HH24:MI:SS'))";
            }
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            r1 = stmt.executeUpdate(query1);
            r2 = stmt.executeUpdate(query2);

            if (r2 > 0) {
                reply = "Success";
                //reply = formatIntToString(maxid);
                setTmMaxId(maxid);
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###SPOT_DataAccessLayer/Insert_travel_matrix_tbl()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    // NC Payment Status Update..
    public String InsertMiniEvents(String camp, String event, String edate, String goal, String remarks, int cnt, String Submitted_by, String mobile,
            String v_eid, String v_sa, String v_area, String v_region, String v_area_no, String v_region_no, String v_sa_no, String v_zone, String camp_president_name, String camp_president_mobile, String camp_president_email) {
        String reply = "";
        int r = 0;
        int r2 = 0;
        int maxid = 0;
        String query = "0";
        String query2 = "0";
        String speaker = "";
        maxid = getMeMaxId();

        query = "insert into minievents "
                + "values( "
                + "'" + camp + "', "
                + "'" + event + "', "
                + "to_date('" + edate + "','DD/MM/YYYY'),"
                + "'" + goal + "', "
                + "'" + cnt + "', "
                + "'" + Submitted_by + "', "
                + "to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YYYY HH24:MI:SS'),"
                + "'" + mobile + "',"
                + "'" + maxid + "',"
                + "'" + v_eid + "',"
                + "'" + v_zone + "',"
                + "'" + v_sa_no + "',"
                + "'" + v_region_no + "',"
                + "'" + v_area_no + "',"
                + "'" + v_sa + "',"
                + "'" + v_area + "',"
                + "'" + v_region + "',"
                + "'" + camp_president_name + "',"
                + "'" + camp_president_mobile + "',"
                + "'" + camp_president_email + "',"
                + "'" + remarks + "')";

        query2 = "insert into events (rid,camp,etype,edate,event_date,sf_goal,ff_goal,speakername,contact_person,contact_phone,modified_by,event_planned,phone,"
                + "camp_president,camp_president_mobile,camp_president_email,eid,zone,state,region,area,sa,region_no,area_no,event_notes,rel_info) "
                + "values( "
                + "'" + maxid + "',"
                + "'" + camp + "', "
                + "'" + event + "',"
                + "trim(to_date('" + edate + "','DD/MM/YYYY')),"
                + "trim(to_date('" + edate + "','DD/MM/YYYY')),"
                + "'" + goal + "', "
                + "'" + goal + "', "
                + "'" + speaker + "', "
                + "'" + Submitted_by + "', "
                + "'" + mobile + "',"
                + "'" + Submitted_by + "', "
                + "'Planned', "
                + "'" + camp_president_mobile + "',"
                + "'" + camp_president_name + "',"
                + "'" + camp_president_mobile + "',"
                + "'" + camp_president_email + "',"
                + "'" + v_eid + "', "
                + "'" + v_zone + "',"
                + "'" + v_sa + "',"
                + "'" + v_region + "',"
                + "'" + v_area + "',"
                + "'" + v_sa_no + "',"
                + "'" + v_region_no + "',"
                + "'" + v_area_no + "',"
                + "'Current',"
                + "'" + remarks + "')";

        try {
            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;

            r = stmt.executeUpdate(query);
            r2 = stmt.executeUpdate(query2);

            if (r > 0 && r2 > 0) {
                setMeMaxId(maxid);
                reply = "Success";
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###SPOT_DataAccessLayer/InsertMiniEvents()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }

    public ArrayList<String> getCamps(String state_name) {
        ArrayList<String> branch = new ArrayList<String>();
        try {
            String query = "select Initcap(Camp) as name from camps_master where upper(state_asso)=upper('" + state_name + "') and Upper(status)='ACTIVE' order by Camp";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getCamps()/" + new Date() + "/" + e.toString());
        }
        return branch;
    }

    public String getMemberCountforLogin(String userid) {
        String Uid_available = "0";
        try {
            String query = "select count(*) cnt from membership_weekly_raw where mid=Upper('" + userid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";
            // System.out.println(query);
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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemberCountforLogin()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

    public String getMemberNameforLogin(String userid) {
        String Uid_available = "";
        try {
            String query = "select name cnt from membership_weekly_raw where mid=Upper('" + userid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemberNameforLogin()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

    public String getMemberEmailforLogin(String userid) {
        String Uid_available = "";
        try {
            String query = "select nvl(email,'NA') cnt from membership_weekly_raw where upper(mid)=Upper('" + userid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemberEmailforLogin()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

    public String getMemberDesigLogin(String userid) {
        String Uid_available = "";
        try {
            String query = "select nvl(designation,'-NA-') designation from membership_weekly_raw where mid=Upper('" + userid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Uid_available = rs.getString("designation");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemberDesigLogin()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

    public String getMemberDesignationforLogin(String userid) {
        String Uid_available = "";
        try {
            String query = "select nvl(designation,'-NA-') designation from membership_weekly_raw where mid=Upper('" + userid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                Uid_available = rs.getString("designation");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemberDesignationforLogin()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

    public String getMemberMobileforLogin(String userid) {
        String Uid_available = "";
        try {
            String query = "select phone cnt from membership_weekly_raw where upper(mid)=Upper('" + userid + "') and Upper(status) in ('CURRENT','GRACE') and rownum<2";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getMemberMobileforLogin()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

    public String getOTP(String userid) {
        String Uid_available = "";
        try {
            String query = "SELECT to_char(EXP(TO_NUMBER(TO_CHAR(SYSDATE,'ss'))/59)*1000,'9999') cnt FROM dual";

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
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###DataAccessLayer/getOTP()/" + new Date() + "/" + e.toString());
        }
        return Uid_available;
    }

// e503 Payment Supporting Document Update..
    public String Accounts_Payments_SupDoc_Insert(String mid, String filename) {
        String reply = "";
        int r = 0;
        String query = "";

        query = "insert into e503_supdoc "
                + "values(accounts_payments_supdoc_rid.nextval,'" + mid + "','" + filename + "',to_char(SYS_EXTRACT_UTC(SYSTIMESTAMP)+(5.5/24),'DD-MON-YYYY HH24:MI:SS'))";

        try {

            DataSource ds = getDataSource();
            Connection con = ds.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            r = stmt.executeUpdate(query);

            if (r > 0) {
                reply = "Success";
            } else {
                reply = "Failure";
            }

            stmt.close();
            con.close();
        } catch (NamingException ex) {
            Logger.getLogger(events_DataAccessLayer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            System.out.println("###events_DataAccessLayer/Accounts_Payments_SupDoc_Insert()/" + new Date() + "/" + e.toString());
        }
        return reply;
    }
}
