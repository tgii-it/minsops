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
public class Membership {

    private String extid;
    private String name;
    private String dob;
    private String mobile;
    private String email;
    private String type;
    private String camp;
    private String campid;
    private String address;

    public String getextid() {
        return extid;
    }

    public void setextid(String extid) {
        this.extid = extid;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    public String getmobile() {
        return mobile;
    }

    public void setmobile(String mobile) {
        this.mobile = mobile;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }

    public String gettype() {
        return type;
    }

    public void settype(String type) {
        this.type = type;
    }

    public String getcamp() {
        return camp;
    }

    public void setcamp(String camp) {
        this.camp = camp;
    }

    public String getcampid() {
        return campid;
    }

    public void setcampid(String campid) {
        this.campid = campid;
    }

    public String getdob() {
        return dob;
    }

    public void setdob(String dob) {
        this.dob = dob;
    }

    public String getaddress() {
        return address;
    }

    public void setaddress(String address) {
        this.address = address;
    }

    public Membership(String extid, String name, String dob, String mobile, String email, String type, String camp, String campid, String address) {

        this.extid = extid;
        this.name = name;
        this.dob = dob;
        this.mobile = mobile;
        this.email = email;
        this.type = type;
        this.camp = camp;
        this.campid = campid;
        this.address = address;
    }

    public Membership() {
    }

}
