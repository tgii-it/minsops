/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

/**
 *
 * @author Anbalagan
 */
public class Sd_Membership {

    private String extid;
    private String gideon_name;
    private String designation_sortid;
    private String phonenumber;
    private String email;
    private String designation;
    private String camp_name;
    private String orbitid;
    private String zone;
    private String sa;
    private String region;
    private String area;

    public String getextid() {
        return extid;
    }

    public void setextid(String extid) {
        this.extid = extid;
    }

    public String getgideon_name() {
        return gideon_name;
    }

    public void setgideon_name(String gideon_name) {
        this.gideon_name = gideon_name;
    }

    public String getphonenumber() {
        return phonenumber;
    }

    public void setphonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }

    public String getdesignation_sortid() {
        return designation_sortid;
    }

    public void setdesignation_sortid(String designation_sortid) {
        this.designation_sortid = designation_sortid;
    }

    public String getcamp_name() {
        return camp_name;
    }

    public void setcamp_name(String camp_name) {
        this.camp_name = camp_name;
    }

    public String getorbitid() {
        return orbitid;
    }

    public void setorbitid(String orbitid) {
        this.orbitid = orbitid;
    }

    public String getdesignation() {
        return designation;
    }

    public void setdesignation(String designation) {
        this.designation = designation;
    }

    public String getzone() {
        return zone;
    }

    public void setzone(String zone) {
        this.zone = zone;
    }

    public String getsa() {
        return sa;
    }

    public void setsa(String sa) {
        this.sa = sa;
    }

    public String getregion() {
        return region;
    }

    public void setregion(String region) {
        this.region = region;
    }

    public String getarea() {
        return area;
    }

    public void setarea(String area) {
        this.area = area;
    }

    public Sd_Membership(String extid, String gideon_name, String designation, String phonenumber, String email, String designation_sortid,
            String camp_name, String orbitid, String zone, String sa, String region, String area) {

        this.extid = extid;
        this.gideon_name = gideon_name;
        this.designation = designation;
        this.phonenumber = phonenumber;
        this.email = email;
        this.designation_sortid = designation_sortid;
        this.camp_name = camp_name;
        this.orbitid = orbitid;
        this.zone = zone;
        this.sa = sa;
        this.region = region;
        this.area = area;
    }

    public Sd_Membership() {
    }
}