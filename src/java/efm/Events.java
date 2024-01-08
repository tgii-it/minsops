/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.io.Serializable;

public class Events implements Serializable {

    String camp = "";
    String area = "";
    String region = "";
    String state = "";
    String eid = "";
    String etype = "";
    String edate = "";
    String rel_info = "";
    String phone = "";
    String camp_president = "";
    String event_planned = "";
    String event_done = "";
    String event_notes = "";
    String remarks = "";
    String contact_person = "";
    String contact_phone = "";
    String area_no = "";
    String region_no = "";

    public Events() {
    }

    public Events(String _camp, String _area, String _region, String _state, String _eid, String _etype, String _edate,
            String _rel_info, String _phone, String _camp_president, String _event_planned, String _event_done, String _event_notes, String _remarks,
            String _contact_person, String _contact_phone, String _area_no, String _region_no) {
        this.camp = _camp;
        this.area = _area;
        this.state = _state;
        this.eid = _eid;
        this.etype = _etype;
        this.edate = _edate;
        this.rel_info = _rel_info;
        this.phone = _phone;
        this.camp_president = _camp_president;
        this.event_planned = _event_planned;
        this.event_done = _event_done;
        this.event_notes = _event_notes;
        this.remarks = _remarks;
        this.contact_person = _contact_person;
        this.contact_phone = _contact_phone;
        this.area_no = _area_no;
        this.region_no = _region_no;
    }

    public String getcamp() {
        return camp;
    }

    public void setcamp(String camp) {
        this.camp = camp;
    }

    public String getarea() {
        return area;
    }

    public void setarea(String area) {
        this.area = area;
    }

    public String getregion() {
        return region;
    }

    public void setreegion(String region) {
        this.region = region;
    }

    public String getstate() {
        return state;
    }

    public void setstate(String state) {
        this.state = state;
    }

    public String geteid() {
        return eid;
    }

    public void seteid(String eid) {
        this.eid = eid;
    }

    public String getetype() {
        return etype;
    }

    public void setetype(String etype) {
        this.etype = etype;
    }

    public String getedate() {
        return edate;
    }

    public void setedate(String edate) {
        this.edate = edate;
    }

    public String getrel_info() {
        return rel_info;
    }

    public void setrel_info(String rel_info) {
        this.rel_info = rel_info;
    }

    public String getphone() {
        return phone;
    }

    public void setphone(String phone) {
        this.phone = phone;
    }

    public String getcamp_president() {
        return camp_president;
    }

    public void setcamp_president(String camp_president) {
        this.camp_president = camp_president;
    }

    public String getevent_planned() {
        return event_planned;
    }

    public void setevent_planned(String event_planned) {
        this.event_planned = event_planned;
    }

    public String getevent_done() {
        return event_done;
    }

    public void setevent_done(String event_done) {
        this.event_done = event_done;
    }

    public String getevent_notes() {
        return event_notes;
    }

    public void setevent_notes(String event_notes) {
        this.event_notes = event_notes;
    }

    public String getremarks() {
        return remarks;
    }

    public void setremarks(String remarks) {
        this.remarks = remarks;
    }

    public String getcontact_person() {
        return contact_person;
    }

    public void setcontact_person(String contact_person) {
        this.contact_person = contact_person;
    }

    public String getcontact_phone() {
        return contact_phone;
    }

    public void setcontact_phone(String contact_phone) {
        this.contact_phone = contact_phone;
    }

    public String getarea_no() {
        return area_no;
    }

    public void setarea_no(String area_no) {
        this.area_no = area_no;
    }

    public String getregion_no() {
        return region_no;
    }

    public void setregion_no(String region_no) {
        this.region_no = region_no;
    }

}
