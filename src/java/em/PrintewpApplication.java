/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package em;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Ms. Rose Rani John
 */
public class PrintewpApplication extends HttpServlet {

    public String manageString(String str) {
        try {
            if (str == null) {
                str = "";
            } else {
                str = str.trim();
            }
        } catch (Exception e) {
        }
        return str;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        try {
            // Variable Declaration
            String name = "";
            String parent = "";
            String addr1 = "";
            String addr2 = "";
            String addr3 = "";
            String city = "";
            String state = "";
            String pincode = "";
            String mobile = "";
            String email = "";
            String appno = "";
            String regno = "";
            String examDate = "";
            String MemPlan = "\tType & Fee\n\n\tPlan\n\n\tMarital status\n\n\tCamp\n";
            String MemType = "\tAnnual 1800\n\n\tGideon & Auxiliary\n\n\tMarried\n\n\tCoimbatore West\n";
            String examCenter = "Exam Center";
            String examCenterAddr1 = "Address Line 1,";
            String examCenterAddr2 = "Address Line 2,";
            String examCenterAddr3 = "Address Line 3";
            String Tr_header = "\tPay mode\n\n\tTr No\n\n\tDate\n\n\tBank\n";
            String Tr_details = "\tTGII Payment Gateway\n\n\t1234567890\n\n\t05 September 2020\n\n\tState Bank of India\n";

            Statement stmt = null;
            ResultSet rs = null;
            String no = "";

            String previousmembership = "";
            String mtype = "";
            String mplan = "";
            String maritalstatus = "";
            String formfilledbycamp = "";
            String paymethod = "";
            String trno = "";
            String trdate = "";
            String trbank = "";
            String gmobile = "";
            String gwmobile = "";
            String gemail = "";
            String gdob = "";
            String s2q1 = "";
            String s2q2 = "";
            String s2q3 = "";
            String s2q4 = "";
            String s2q5 = "";
            String s2q6 = "";
            String s2q7 = "";
            String s2q8 = "";
            String churchname = "";
            String churchaddr = "";
            String churchcity = "";
            String churchdenoination = "";
            String pastorname = "";
            String pastormobile = "";
            String pastoremail = "";
            String businessmanq1 = "";
            String businessname = "";
            String businessnature = "";
            String businesstitle = "";
            String spousename = "";
            String education = "";
            String worknature = "";
            String workplace = "";
            String jobtitle = "";

            String secv = "";
            String ref1name = "";
            String ref1phone = "";
            String ref1camp = "";
            String ref2name = "";
            String ref2phone = "";
            String ref2camp = "";

            String sourceofappln = "";
            String formfilledbyfoname = "";
            String mfee = "";
            String auxname = "";
            String icici_paymode = "";
            String icici_trno = "";
            String icici_trdate = "";
            String amobile = "";
            String aemail = "";
            String adob = "";
            String awmobile = "";
            String gid = "";

            // get the input from page
            no = request.getParameter("refno");
            // Connect to DB
            String db_k12 = "jdbc:oracle:thin:@enciva-cluster.net:1521:belmont";
            String un_k12 = "CONVENTION";
            String pwd_k12 = "ThVc7eBeW3";
            File fSign = new File("F:\\mis_images\\" + no + ".jpg");
            File f = new File("F:\\mis_images\\" + no + ".jpg");
            //  File f = new File("/home/gideons1/appservers/apache-tomcat-8x/webapps/ROOT/pg/images/54450.jpg");
            //  File fSign = new File("/home/gideons1/appservers/apache-tomcat-8x/webapps/ROOT/pg/images/54450.jpg");
            //  System.out.println("Photo Path - " + f);

            String query = "select decode(trbank,'','NA',trbank) trbank,decode(to_char(trdate,'dd/mm/yyyy'),'','NA',to_char(trdate,'dd/mm/yyyy')) trdate,decode(trno,'','NA',trno) trno,to_char(gdob,'dd/mm/yyyy') gdob,to_char(adob,'dd/mm/yyyy') adob,"
                    + "PG_GET_DMF_REFNO(rid,mfee) icici_trno,PG_GET_DMF_TRDATE(rid,mfee) icici_trdate,PG_GET_DMF_PAYMODE(rid,mfee) icici_paymode,a.* from membership_eform_new a where a.rid='" + no + "' and rownum<2";
            
            System.out.println("wp " + query);

            try {
                DataSource ds = getDataSource();
                Connection con = ds.getConnection();
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    appno = rs.getString("rid");
                    appno = manageString(appno);
                    regno = rs.getString("rid");
                    regno = manageString(regno);
                    name = rs.getString("gideonname");
                    name = manageString(name);
                    parent = rs.getString("mtype");
                    parent = manageString(parent);
                    addr1 = rs.getString("addr1");
                    addr1 = manageString(addr1);
                    addr2 = rs.getString("addr2");
                    addr2 = manageString(addr2);
                    city = rs.getString("city");
                    city = manageString(city);
                    state = rs.getString("state");
                    state = manageString(state);
                    pincode = rs.getString("pincode");
                    pincode = manageString(pincode);
                    email = rs.getString("gemail");
                    email = manageString(email);
                    mobile = rs.getString("gmobile");
                    mobile = manageString(mobile);
                    examCenter = rs.getString("mid");
                    examCenter = manageString(examCenter);
                    examCenterAddr1 = rs.getString("mid");
                    examCenterAddr1 = manageString(examCenterAddr1);
                    examCenterAddr2 = rs.getString("mid");
                    examCenterAddr2 = manageString(examCenterAddr2);
                    examCenterAddr3 = rs.getString("mid");
                    examCenterAddr3 = manageString(examCenterAddr3);
                    previousmembership = rs.getString("previousmembership");
                    mtype = rs.getString("mtype");
                    mplan = rs.getString("mplan");
                    maritalstatus = rs.getString("maritalstatus");
                    spousename = rs.getString("spousename");

                    formfilledbycamp = rs.getString("formfilledbycamp");
                    paymethod = rs.getString("paymethod");
                    trno = rs.getString("trno");
                    trdate = rs.getString("trdate");
                    trbank = rs.getString("trbank");

                    gmobile = rs.getString("gmobile");
                    gwmobile = rs.getString("gwmobile");
                    gemail = rs.getString("gemail");
                    gdob = rs.getString("gdob");

                    amobile = rs.getString("amobile");
                    awmobile = rs.getString("awmobile");
                    aemail = rs.getString("aemail");
                    adob = rs.getString("adob");
                    gid = rs.getString("gid");
                    auxname = rs.getString("auxname");

                    s2q1 = rs.getString("s2q1");
                    s2q2 = rs.getString("s2q2");
                    s2q3 = rs.getString("s2q3");
                    s2q4 = rs.getString("s2q4");
                    s2q5 = rs.getString("s2q5");
                    s2q6 = rs.getString("s2q6");
                    s2q7 = rs.getString("s2q7");
                    s2q8 = rs.getString("s2q8");

                    churchname = rs.getString("churchname");
                    churchaddr = rs.getString("churchaddr");
                    churchcity = rs.getString("churchcity");

                    churchdenoination = rs.getString("churchdenoination");
                    pastorname = rs.getString("pastorname");
                    pastormobile = rs.getString("pastormobile");
                    pastoremail = rs.getString("pastoremail");

                    businessmanq1 = rs.getString("businessmanq1");
                    businessname = rs.getString("businessname");
                    businessnature = rs.getString("businessnature");
                    businesstitle = rs.getString("businesstitle");

                    secv = rs.getString("secv");
                    ref1name = rs.getString("ref1name");
                    ref1phone = rs.getString("ref1phone");
                    ref1camp = rs.getString("ref1camp");
                    ref2name = rs.getString("ref2name");
                    ref2phone = rs.getString("ref2phone");
                    ref2camp = rs.getString("ref2camp");

                    education = rs.getString("education");
                    worknature = rs.getString("worknature");
                    workplace = rs.getString("workplace");
                    jobtitle = rs.getString("jobtitle");
                    sourceofappln = rs.getString("sourceofappln");
                    formfilledbyfoname = rs.getString("formfilledbyfoname");
                    mfee = rs.getString("mfee");
                    icici_trno = rs.getString("icici_trno");
                    icici_trdate = rs.getString("icici_trdate");
                    icici_paymode = rs.getString("icici_paymode");

                    if (mplan.equalsIgnoreCase("Annual Auxiliary")) {
                        name = auxname + " (" + gid + ")";
                        gmobile = amobile;
                        gwmobile = awmobile;
                        gemail = aemail;
                        gdob = adob;
                        maritalstatus = "Married (" + gid + ")";
                    }

                    if (spousename == null) {
                        spousename = "NA";
                    }
                    if (trdate.equalsIgnoreCase("NA")) {
                        trdate = icici_trdate;
                    }
                    if (trbank.equalsIgnoreCase("NA")) {
                        trbank = icici_paymode;
                    }
                    if (trno.equalsIgnoreCase("NA")) {
                        trno = icici_trno;
                    }
                    if (formfilledbycamp == null) {
                        formfilledbycamp = "NA";
                    }
                    if (jobtitle == null) {
                        jobtitle = "NA";
                    }
                    if (worknature == null) {
                        worknature = "NA";
                    }
                    if (workplace == null) {
                        workplace = "NA";
                    }
                    if (mplan.contains("Both")) {
                        maritalstatus = "Married";
                        spousename = auxname;
                    }
                }
                rs.close();
                stmt.close();
                con.close();
                if (name.equals("")) {
                    request.setAttribute("ehtErrMsg", "Invalid Application Number");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/EHTP1_Err.jsp");
                    dispatcher.forward(request, response);
                } else if ((!f.exists()) || (!fSign.exists())) {
                    request.setAttribute("eAppln-File-Not-Found-msg", "Applicant Photo / Signature NOT Found. Contact Membership department at +91 984 999 1758 or membership@gideons.org.in");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/EHTP1_Err.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (Exception e) {
                System.out.println("eApplication/DBCode/" + new Date() + "/" + e.toString());
            }
// Fonts
            Font f_header16B = new Font();
            f_header16B.setSize(16);
            f_header16B.setStyle(Font.BOLD);
            Font f_header14B = new Font();
            f_header14B.setSize(14);
            f_header14B.setStyle(Font.BOLD);
            Font f_header14BC = new Font();
            f_header14BC.setSize(14);
            f_header14BC.setStyle(Font.BOLD);
            f_header14BC.setColor(1, 31, 74);
            Font f_header14 = new Font();
            f_header14.setSize(14);
            Font f_header14C = new Font();
            f_header14C.setSize(14);
            f_header14C.setColor(1, 31, 74);
            Font f_header13B = new Font();
            f_header13B.setSize(13);
            f_header13B.setStyle(Font.BOLD);
            Font f_header12B = new Font();
            f_header12B.setSize(12);
            f_header12B.setStyle(Font.BOLD);
            Font f_header12BC = new Font();
            f_header12BC.setSize(12);
            f_header12BC.setStyle(Font.BOLD);
            f_header12BC.setColor(1, 31, 74);
            Font f_header11 = new Font();
            f_header11.setSize(11);
            Font f_header11B = new Font();
            f_header11B.setSize(11);
            f_header11B.setStyle(Font.BOLD);
            Font f_header11BC = new Font();
            f_header11BC.setSize(11);
            f_header11BC.setStyle(Font.BOLD);
            f_header11BC.setColor(1, 31, 74);
            Font f_header10C = new Font();
            f_header10C.setSize(10);
            f_header10C.setColor(1, 31, 74);
            Font f_header10B = new Font();
            f_header10B.setSize(10);
            f_header10B.setStyle(Font.BOLD);
            Font f_header10BC = new Font();
            f_header10BC.setSize(10);
            f_header10BC.setStyle(Font.BOLD);
            f_header10BC.setColor(1, 31, 74);
            Font f_sub_header10BC = new Font();
            f_sub_header10BC.setSize(10);
            f_sub_header10BC.setStyle(Font.BOLD);
            f_sub_header10BC.setColor(97, 11, 11);
            Font f_header10UC = new Font();
            f_header10UC.setSize(10);
            f_header10UC.setStyle(Font.BOLD);
            f_header10UC.setStyle(Font.UNDERLINE);
            f_header10UC.setColor(1, 31, 74);
            Font f_header9 = new Font();
            f_header9.setSize(9);
            Font f_header9C = new Font();
            f_header9C.setSize(9);
            f_header9C.setColor(1, 31, 74);
            Font f_header9BC = new Font();
            f_header9BC.setSize(9);
            f_header9BC.setStyle(Font.BOLD);
            f_header9BC.setColor(1, 31, 74);
            Font f_header8 = new Font();
            f_header8.setSize(8);
            Font f_header8C = new Font();
            f_header8C.setSize(8);
            f_header8C.setColor(1, 31, 74);
            Font f_header8UC = new Font();
            f_header8UC.setSize(8);
            f_header8UC.setStyle(Font.UNDERLINE);
            f_header8UC.setColor(1, 31, 74);
            Font f_header8BUC = new Font();
            f_header8BUC.setSize(8);
            f_header8BUC.setStyle(Font.UNDERLINE | Font.BOLD);
            f_header8BUC.setColor(1, 31, 74);
            Font f_header8CBlue = new Font();
            f_header8CBlue.setSize(8);
            f_header8CBlue.setColor(Color.BLUE);
            Font f_header8B = new Font();
            f_header8B.setSize(8);
            f_header8B.setStyle(Font.BOLD);
            Font f_header8BC = new Font();
            f_header8BC.setSize(8);
            f_header8BC.setStyle(Font.BOLD);
            f_header8BC.setColor(1, 31, 74);
            Font f_header7 = new Font();
            f_header7.setSize(7);
            f_header7.setColor(1, 31, 74);
            Font f_header6 = new Font();
            f_header6.setSize(6);
            f_header6.setColor(1, 31, 74);
// PDF Related
            Document doc = new Document();
            Rectangle rectA4 = PageSize.A4;
            //Rectangle rectA4LS = rectA4.rotate();
            //doc.setPageSize(rectA4LS);
            doc.setPageSize(rectA4);
            //doc.setMargins(20, 5, 25, 7);
            doc.setMargins(5, 5, 25, 5);
            PdfWriter writer = PdfWriter.getInstance(doc, response.getOutputStream());
            doc.open();
            PdfPTable table = new PdfPTable(6);
            table.setTotalWidth(100);
            table.setWidths(new float[]{14, 23, 17, 17.5f, 0.5f, 28});
            PdfPCell cell;

// Row 1 - Header 
            PdfPTable itbl1 = new PdfPTable(3);
            itbl1.setTotalWidth(100);
            itbl1.setWidths(new int[]{10, 65, 25});
            PdfPCell icell1;

            // Image img = Image.getInstance("/home/gideons1/appservers/apache-tomcat-8x/webapps/ROOT/pg/images/KU.jpg");
            Image img = Image.getInstance("F:\\mis_images\\KU.jpg");
            img.scaleToFit(40, 40);
            img.setSpacingAfter(2);
            img.setSpacingBefore(2);

            icell1 = new PdfPCell(img);
            icell1.setLeading(5f, 1f);
            icell1.setPadding(2);
            icell1.setColspan(1);
            icell1.setBorder(0);
            icell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
            icell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl1.addCell(icell1);

            String head1 = "THE GIDEONS INTERNATIONAL IN INDIA\n";
            String head2 = "Gideon Membership Application Form\n";
            String head3 = "An Association of Christian Business and Professionsl Men\n";
            Phrase hp1 = new Phrase(head1, f_header10BC);
            Phrase hp2 = new Phrase(head2, f_sub_header10BC);
            Phrase hp3 = new Phrase(head3, f_header9BC);

            Paragraph pHeader = new Paragraph();
            pHeader.add(hp1);
            pHeader.add(hp2);
            pHeader.add(hp3);

            icell1 = new PdfPCell(pHeader);
            icell1.setLeading(5f, 1f);
            icell1.setPadding(2);
            icell1.setColspan(1);
            icell1.setBorder(0);
            icell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            icell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl1.addCell(icell1);

            Phrase phd1 = new Phrase("Help Desk\n", f_header8UC);
            Phrase phd2 = new Phrase("Ph : +91 984 999 1758\n", f_header8C);
            Phrase phd3 = new Phrase("membership@gideons.org.in\n", f_header8C);
            Phrase phd4 = new Phrase("Ref No : " + regno + "\n", f_header8C);
            Paragraph pHelpDesk = new Paragraph();
            pHelpDesk.add(phd1);
            pHelpDesk.add(phd2);
            pHelpDesk.add(phd3);
            pHelpDesk.add(phd4);
            icell1 = new PdfPCell(pHelpDesk);
            icell1.setLeading(5f, 1f);
            icell1.setPadding(2);
            icell1.setColspan(1);
            icell1.setBorder(0);
            icell1.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl1.addCell(icell1);

            cell = new PdfPCell(itbl1);
            cell.setLeading(5f, 1f);
            cell.setPadding(2);
            cell.setColspan(6);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

// row 4
            cell = new PdfPCell(new Phrase(""));
            cell.setLeading(5f, 1f);
            cell.setPadding(2);
            cell.setColspan(6);
            cell.setBorder(0);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

// Row 5 
// title,space(rs=4),photo(rs=4),appno,address, note1,linkno, note2
            cell = new PdfPCell(new Phrase("Section I. PERSONAL INFORMATION", f_header10BC));
            cell.setLeading(5f, 1f);
            cell.setPadding(4);
            cell.setColspan(4);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setBackgroundColor(new Color(202, 233, 252));
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase(""));
            cell.setLeading(5f, 1f);
            cell.setPadding(2);
            cell.setColspan(1);
            cell.setRowspan(3);
            cell.setBorder(0);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);
            Image img_photo = null;

            if (f.exists()) {
                //img_photo = Image.getInstance("/home/gideons1/appservers/apache-tomcat-8x/webapps/ROOT/pg/images/54450.jpg");
                img_photo = Image.getInstance("F:\\mis_images\\54450.jpg");
            } else {
                //img_photo = Image.getInstance("/home/gideons1/appservers/apache-tomcat-8x/webapps/ROOT/pg/images/54450.jpg");
                img_photo = Image.getInstance("F:\\mis_images\\54450.jpg");
            }

            img_photo.scaleToFit(200, 150);
            img_photo.setSpacingAfter(2);
            img_photo.setSpacingBefore(2);
            cell = new PdfPCell(img_photo);
            cell.setLeading(5f, 1f);
            cell.setPadding(6);
            cell.setColspan(1);
            cell.setRowspan(2);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

// appno and address
            PdfPTable itbl3 = new PdfPTable(3);
            itbl3.setTotalWidth(100);
            itbl3.setWidths(new int[]{13, 15, 72});
            PdfPCell icell3;

            PdfContentByte cb_a = writer.getDirectContent();
            StringBuffer data_a = new StringBuffer(appno);
            data_a.append(Barcode128.FNC1);
            Barcode128 code128_a = new Barcode128();
            code128_a.setX(0.75f);
            code128_a.setN(1.0f);
            code128_a.setSize(8f);
            code128_a.setTextAlignment(Element.ALIGN_CENTER);
            code128_a.setBaseline(10f);
            code128_a.setBarHeight(15f);
            code128_a.setCode(data_a.toString());
            Image img_a = code128_a.createImageWithBarcode(cb_a, Color.BLACK, Color.BLUE);

            icell3 = new PdfPCell(img_a);
            icell3.setLeading(5f, 1f);
            icell3.setPadding(5);
            icell3.setColspan(1);
            icell3.setRowspan(7);
            icell3.setBorder(0);
            icell3.setRotation(90);
            icell3.setHorizontalAlignment(Element.ALIGN_CENTER);
            icell3.setVerticalAlignment(Element.ALIGN_LEFT);
            itbl3.addCell(icell3);

            icell3 = new PdfPCell(new Phrase("Name", f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(":\t" + name, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

            icell3 = new PdfPCell(new Phrase("Address", f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(":\t" + addr1, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

            icell3 = new PdfPCell(new Phrase(""));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(" \t" + addr2, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

//            icell3 = new PdfPCell(new Phrase(""));
//            icell3.setLeading(2f, 1f);
//            icell3.setPadding(2);
//            icell3.setColspan(1);
//            icell3.setBorder(0);
//            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
//            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
//            itbl3.addCell(icell3);
//            icell3 = new PdfPCell(new Phrase(" \t" + addr3, f_header9));
//            icell3.setLeading(2f, 1f);
//            icell3.setPadding(2);
//            icell3.setColspan(1);
//            icell3.setBorder(0);
//            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
//            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
//            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase("City", f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(":\t" + city, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

            icell3 = new PdfPCell(new Phrase("State", f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(":\t" + state + "\t\t " + pincode, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

            icell3 = new PdfPCell(new Phrase("Mobile", f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(":\t" + gmobile + "\t\t Email : " + gemail, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

            icell3 = new PdfPCell(new Phrase("WhatsApp", f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);
            icell3 = new PdfPCell(new Phrase(":\t" + gwmobile + "\t\t DoB : " + gdob, f_header9));
            icell3.setLeading(2f, 1f);
            icell3.setPadding(2);
            icell3.setColspan(1);
            icell3.setBorder(0);
            icell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            icell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            itbl3.addCell(icell3);

            cell = new PdfPCell(itbl3);
            cell.setLeading(5f, 1f);
            cell.setPadding(6);
            cell.setColspan(4);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);
// row space
            cell = new PdfPCell(new Phrase(""));
            cell.setLeading(5f, 1f);
            cell.setPadding(2);
            cell.setColspan(6);
            cell.setBorder(0);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

//  row 8 - date, time details and candidate signature   
            cell = new PdfPCell(new Phrase("Membership Type, Plan and Camp", f_header10BC));
            cell.setLeading(5f, 1f);
            cell.setPadding(4);
            cell.setColspan(3);
            cell.setBorder(Cell.BOX);
            cell.setBackgroundColor(new Color(202, 233, 252));
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Payment Transaction Details", f_header10BC));
            cell.setLeading(5f, 1f);
            cell.setPadding(4);
            cell.setColspan(3);
            cell.setBorder(Cell.BOX);
            cell.setBackgroundColor(new Color(202, 233, 252));
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("\tType & Fee\n\n\tPlan\n\n\tMarital status\n\n\tCamp\n", f_header9));
            cell.setLeading(2f, 1f);
            cell.setPadding(4);
            cell.setColspan(1);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setVerticalAlignment(Element.ALIGN_TOP);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase("\t" + mtype + " - " + mfee + "\n\n\t" + mplan + "\n\n\t" + maritalstatus + " - " + spousename + "\n\n\t" + formfilledbycamp + "\n", f_header9));
            cell.setLeading(2f, 1f);
            cell.setPadding(4);
            cell.setColspan(2);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setVerticalAlignment(Element.ALIGN_TOP);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("\tPay mode\n\n\tTr No\n\n\tDate\n\n\tBank\n", f_header9));
            cell.setLeading(2f, 1f);
            cell.setPadding(4);
            cell.setColspan(2);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setVerticalAlignment(Element.ALIGN_TOP);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase("\t" + paymethod + "\n\n\t" + trno + "\n\n\t" + trdate + "\n\n\t" + trbank + "\n", f_header9));
            cell.setLeading(2f, 1f);
            cell.setPadding(4);
            cell.setColspan(2);
            cell.setBorder(Cell.BOX);
            cell.setBorderColor(new Color(1, 31, 74));
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setVerticalAlignment(Element.ALIGN_TOP);
            table.addCell(cell);
// row space
            cell = new PdfPCell(new Phrase(""));
            cell.setLeading(5f, 1f);
            cell.setPadding(2);
            cell.setColspan(6);
            cell.setBorder(0);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.addCell(cell);

// Section 2 starts here
            PdfPTable outerT = new PdfPTable(1);
            outerT.setTotalWidth(100);
            outerT.setWidths(new int[]{100});
            PdfPCell outerCell;

            outerCell = new PdfPCell(table);
            outerCell.setLeading(5f, 1f);
            outerCell.setPadding(3);
            outerCell.setColspan(1);
            outerCell.setBorder(Cell.BOX);
            outerCell.setBorderColor(new Color(1, 31, 74));
            outerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell);

            String inStrHeader = "Section II. SPIRITUAL INFORMATION";
            outerCell = new PdfPCell(new Phrase(inStrHeader, f_header10BC));
            outerCell.setLeading(5f, 1f);
            outerCell.setPadding(5);
            outerCell.setColspan(1);
            outerCell.setBorder(Cell.BOX);
            outerCell.setBackgroundColor(new Color(202, 233, 252));
            outerCell.setBorderColor(new Color(1, 31, 74));
            outerCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell);

            PdfPTable outerTInstr = new PdfPTable(2);
            outerTInstr.setTotalWidth(100);
            outerTInstr.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr;

            String in3 = "Do you believe the Bible is the inspired, infallible and inerrant Word of God? : " + s2q1 + "\n"
                    + "Do you believe in the Lord Jesus Christ as the eternal Son of God? : " + s2q2 + "\n"
                    + "Have you received Him as your personal Saviour : " + s2q3 + "\n"
                    + "Do you endeavor to follow Him in your daily life? : " + s2q4 + "\n"
                    + "Do you believe in the endless lake of fire for the unsaved? : " + s2q5 + "\n"
                    + "Do you believe in the Biblical view of marriage between one man and one woman? : " + s2q6 + "\n";
            Phrase pin3 = new Phrase(in3, f_header9);
            ocellInstr = new PdfPCell(new Phrase("A.", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);

            ocellInstr = new PdfPCell(pin3);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            ocellInstr = new PdfPCell(new Phrase("", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);

            ocellInstr = new PdfPCell(new Phrase("", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);

            String instr1 = "Are you a layman, NOT a clergyman? (Note: claergyman means one who is generally accepted and recognized as a practicing clergyman, a pastor or a minister of a church, an evangelist, or a missonary) : " + s2q7 + "\n\n";

            String instr2 = "Are you a member in in good standing of a church, as your church defines membership? : " + s2q8 + "\n\n";
            String in2 = "Name of the Church : " + churchname + "\n\nDenomination : " + churchdenoination + "\n\nChurch address : " + churchaddr + " " + churchcity + "\n\nChurch email or web address : " + pastoremail + "\n\n";
            String instr3 = "Name of Pastor/minister : " + pastorname + "\n\nPastor's/minister's Phone No : " + pastormobile + "\n\nPastoer's/minister's Email ID : " + pastoremail + "\n\n";
            String instr42 = "Have you held previous Gideon membership? : " + previousmembership + " \n(If yes,approximate date and your Gideon membership number : ___ ___)\n\n";
            String instr5 = "I am applying for membership in The Gideons International in India on the basis of my occupation (or that from which I retired) and from which my primary income is derived.\n\n";
            String instr6 = "Complete either Section III or IV as applicable.\n\n";

            Phrase phInstr1 = new Phrase(instr1, f_header9);
            Paragraph paInstr1 = new Paragraph();
            paInstr1.add(phInstr1);
            ocellInstr = new PdfPCell(new Phrase("B.", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(paInstr1);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            Phrase phInstr2 = new Phrase(instr2, f_header9);
            Paragraph paInstr2 = new Paragraph();
            paInstr2.add(phInstr2);
            ocellInstr = new PdfPCell(new Phrase("C.", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(paInstr2);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            Phrase pin2 = new Phrase(in2, f_header9);
            ocellInstr = new PdfPCell(new Phrase("D.", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(pin2);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            Phrase phInstr3 = new Phrase(instr3, f_header9);

            ocellInstr = new PdfPCell(new Phrase("E.", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(phInstr3);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            Phrase phInstr42 = new Phrase(instr42, f_header9);

            Paragraph paInstr4 = new Paragraph();
            paInstr4.add(phInstr42);

            ocellInstr = new PdfPCell(new Phrase("F.", f_header9));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(paInstr4);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            Phrase phInstr5 = new Phrase(instr5, f_header9);

            Paragraph paInstr5 = new Paragraph();
            paInstr5.add(phInstr5);

            ocellInstr = new PdfPCell(new Phrase("", f_header8C));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(paInstr5);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            Phrase phInstr6 = new Phrase(instr6, f_header9);

            Paragraph paInstr6 = new Paragraph();
            paInstr6.add(phInstr6);

            ocellInstr = new PdfPCell(new Phrase("", f_header8C));
            ocellInstr.setLeading(1f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr.addCell(ocellInstr);
            ocellInstr = new PdfPCell(paInstr6);
            ocellInstr.setLeading(3f, 1f);
            ocellInstr.setPadding(1);
            ocellInstr.setColspan(1);
            ocellInstr.setBorder(0);
            ocellInstr.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr.addCell(ocellInstr);

            outerCell = new PdfPCell(outerTInstr);
            outerCell.setLeading(5f, 1f);
            outerCell.setPadding(3);
            outerCell.setColspan(1);
            outerCell.setBorder(Cell.BOX);
            outerCell.setBorderColor(new Color(1, 31, 74));
            outerCell.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell);

// Section _3 starts here
            PdfPTable outerT_3 = new PdfPTable(1);
            outerT_3.setTotalWidth(100);
            outerT_3.setWidths(new int[]{100});
            PdfPCell outerCell_3;

            outerCell_3 = new PdfPCell(table);
            outerCell_3.setLeading(5f, 1f);
            outerCell_3.setPadding(3);
            outerCell_3.setColspan(1);
            outerCell_3.setBorder(Cell.BOX);
            outerCell_3.setBorderColor(new Color(1, 31, 74));
            outerCell_3.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell_3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT_3.addCell(outerCell_3);

            String inStrHeader_3 = "Section III. Business Occupations: Applicable if you are a Businessman";
            outerCell_3 = new PdfPCell(new Phrase(inStrHeader_3, f_header10BC));
            outerCell_3.setLeading(5f, 1f);
            outerCell_3.setPadding(5);
            outerCell_3.setColspan(1);
            outerCell_3.setBorder(Cell.BOX);
            outerCell_3.setBackgroundColor(new Color(202, 233, 252));
            outerCell_3.setBorderColor(new Color(1, 31, 74));
            outerCell_3.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell_3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_3);

            PdfPTable outerTInstr_3 = new PdfPTable(2);
            outerTInstr_3.setTotalWidth(100);
            outerTInstr_3.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr_3;

            String in3_3 = "Are you a self-employed businessman with more than 2 employees reporting to you? : " + businessmanq1 + "\n\n";
            Phrase pin3_3 = new Phrase(in3_3, f_header9);
            ocellInstr_3 = new PdfPCell(new Phrase("A.", f_header9));
            ocellInstr_3.setLeading(1f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_3.addCell(ocellInstr_3);

            ocellInstr_3 = new PdfPCell(pin3_3);
            ocellInstr_3.setLeading(3f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_3.addCell(ocellInstr_3);

            ocellInstr_3 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_3.setLeading(1f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_3.addCell(ocellInstr_3);

            ocellInstr_3 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_3.setLeading(1f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_3.addCell(ocellInstr_3);

            String instr1_3 = "Name of Business  : " + businessname + "\n\nThe nature/kind of my business or that in which I am involved is : " + businessnature + "\n\n";
            String instr2_3 = "My business title is  : " + businesstitle + "\n\n";

            Phrase phInstr1_3 = new Phrase(instr1_3, f_header9);
            Paragraph paInstr1_3 = new Paragraph();
            paInstr1_3.add(phInstr1_3);
            ocellInstr_3 = new PdfPCell(new Phrase("B.", f_header9));
            ocellInstr_3.setLeading(1f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_3.addCell(ocellInstr_3);
            ocellInstr_3 = new PdfPCell(paInstr1_3);
            ocellInstr_3.setLeading(3f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_3.addCell(ocellInstr_3);

            Phrase phInstr2_3 = new Phrase(instr2_3, f_header9);
            Paragraph paInstr2_3 = new Paragraph();
            paInstr2_3.add(phInstr2_3);
            ocellInstr_3 = new PdfPCell(new Phrase("C.", f_header9));
            ocellInstr_3.setLeading(1f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_3.addCell(ocellInstr_3);
            ocellInstr_3 = new PdfPCell(paInstr2_3);
            ocellInstr_3.setLeading(3f, 1f);
            ocellInstr_3.setPadding(1);
            ocellInstr_3.setColspan(1);
            ocellInstr_3.setBorder(0);
            ocellInstr_3.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_3.addCell(ocellInstr_3);

            outerCell_3 = new PdfPCell(outerTInstr_3);
            outerCell_3.setLeading(5f, 1f);
            outerCell_3.setPadding(3);
            outerCell_3.setColspan(1);
            outerCell_3.setBorder(Cell.BOX);
            outerCell_3.setBorderColor(new Color(1, 31, 74));
            outerCell_3.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell_3.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_3);

// Section _4 starts here
            PdfPTable outerT_4 = new PdfPTable(1);
            outerT_4.setTotalWidth(100);
            outerT_4.setWidths(new int[]{100});
            PdfPCell outerCell_4;

            outerCell_4 = new PdfPCell(table);
            outerCell_4.setLeading(5f, 1f);
            outerCell_4.setPadding(3);
            outerCell_4.setColspan(1);
            outerCell_4.setBorder(Cell.BOX);
            outerCell_4.setBorderColor(new Color(1, 31, 74));
            outerCell_4.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell_4.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT_4.addCell(outerCell_4);

            String inStrHeader_4 = "Section IV. Professional or Institutional Occupations: Applicable if you are employed";
            outerCell_4 = new PdfPCell(new Phrase(inStrHeader_4, f_header10BC));
            outerCell_4.setLeading(5f, 1f);
            outerCell_4.setPadding(5);
            outerCell_4.setColspan(1);
            outerCell_4.setBorder(Cell.BOX);
            outerCell_4.setBackgroundColor(new Color(202, 233, 252));
            outerCell_4.setBorderColor(new Color(1, 31, 74));
            outerCell_4.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell_4.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_4);

            PdfPTable outerTInstr_4 = new PdfPTable(2);
            outerTInstr_4.setTotalWidth(100);
            outerTInstr_4.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr_4;

            String in3_4 = "What is your highest Educational Qualification? : " + education + "\n\n";
            Phrase pin3_4 = new Phrase(in3_4, f_header9);
            ocellInstr_4 = new PdfPCell(new Phrase("A.", f_header9));
            ocellInstr_4.setLeading(1f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_4.addCell(ocellInstr_4);

            ocellInstr_4 = new PdfPCell(pin3_4);
            ocellInstr_4.setLeading(3f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_4.addCell(ocellInstr_4);

            ocellInstr_4 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_4.setLeading(1f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_4.addCell(ocellInstr_4);

            ocellInstr_4 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_4.setLeading(1f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_4.addCell(ocellInstr_4);

            String instr1_4 = "Name of Workplace  : " + workplace + "\n\nYour Job title  : " + jobtitle + "\n\n";
            String instr2_4 = "What is your nature of work (or profession retired from)?  : " + worknature + "\n\n";

            Phrase phInstr1_4 = new Phrase(instr1_4, f_header9);
            Paragraph paInstr1_4 = new Paragraph();
            paInstr1_4.add(phInstr1_4);
            ocellInstr_4 = new PdfPCell(new Phrase("B.", f_header9));
            ocellInstr_4.setLeading(1f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_4.addCell(ocellInstr_4);
            ocellInstr_4 = new PdfPCell(paInstr1_4);
            ocellInstr_4.setLeading(3f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_4.addCell(ocellInstr_4);

            Phrase phInstr2_4 = new Phrase(instr2_4, f_header9);
            Paragraph paInstr2_4 = new Paragraph();
            paInstr2_4.add(phInstr2_4);
            ocellInstr_4 = new PdfPCell(new Phrase("C.", f_header9));
            ocellInstr_4.setLeading(1f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_4.addCell(ocellInstr_4);
            ocellInstr_4 = new PdfPCell(paInstr2_4);
            ocellInstr_4.setLeading(3f, 1f);
            ocellInstr_4.setPadding(1);
            ocellInstr_4.setColspan(1);
            ocellInstr_4.setBorder(0);
            ocellInstr_4.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_4.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_4.addCell(ocellInstr_4);

            outerCell_4 = new PdfPCell(outerTInstr_4);
            outerCell_4.setLeading(5f, 1f);
            outerCell_4.setPadding(3);
            outerCell_4.setColspan(1);
            outerCell_4.setBorder(Cell.BOX);
            outerCell_4.setBorderColor(new Color(1, 31, 74));
            outerCell_4.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell_4.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_4);

// Section _5 starts here
            PdfPTable outerT_5 = new PdfPTable(1);
            outerT_5.setTotalWidth(100);
            outerT_5.setWidths(new int[]{100});
            PdfPCell outerCell_5;

            outerCell_5 = new PdfPCell(table);
            outerCell_5.setLeading(5f, 1f);
            outerCell_5.setPadding(3);
            outerCell_5.setColspan(1);
            outerCell_5.setBorder(Cell.BOX);
            outerCell_5.setBorderColor(new Color(1, 31, 74));
            outerCell_5.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell_5.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT_5.addCell(outerCell_5);

            String inStrHeader_5 = "Section V";
            outerCell_5 = new PdfPCell(new Phrase(inStrHeader_5, f_header10BC));
            outerCell_5.setLeading(5f, 1f);
            outerCell_5.setPadding(5);
            outerCell_5.setColspan(1);
            outerCell_5.setBorder(Cell.BOX);
            outerCell_5.setBackgroundColor(new Color(202, 233, 252));
            outerCell_5.setBorderColor(new Color(1, 31, 74));
            outerCell_5.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell_5.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_5);

            PdfPTable outerTInstr_5 = new PdfPTable(2);
            outerTInstr_5.setTotalWidth(100);
            outerTInstr_5.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr_5;

            String in3_5 = "Does your business/profession involve manufacture or sale of tobacco (or tobacco products) or alcohol? : " + secv + "\n\n";
            Phrase pin3_5 = new Phrase(in3_5, f_header9);
            ocellInstr_5 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_5.setLeading(1f, 1f);
            ocellInstr_5.setPadding(1);
            ocellInstr_5.setColspan(1);
            ocellInstr_5.setBorder(0);
            ocellInstr_5.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_5.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_5.addCell(ocellInstr_5);

            ocellInstr_5 = new PdfPCell(pin3_5);
            ocellInstr_5.setLeading(3f, 1f);
            ocellInstr_5.setPadding(1);
            ocellInstr_5.setColspan(1);
            ocellInstr_5.setBorder(0);
            ocellInstr_5.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_5.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_5.addCell(ocellInstr_5);

            ocellInstr_5 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_5.setLeading(1f, 1f);
            ocellInstr_5.setPadding(1);
            ocellInstr_5.setColspan(1);
            ocellInstr_5.setBorder(0);
            ocellInstr_5.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_5.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_5.addCell(ocellInstr_5);

            ocellInstr_5 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_5.setLeading(1f, 1f);
            ocellInstr_5.setPadding(1);
            ocellInstr_5.setColspan(1);
            ocellInstr_5.setBorder(0);
            ocellInstr_5.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_5.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_5.addCell(ocellInstr_5);

            outerCell_5 = new PdfPCell(outerTInstr_5);
            outerCell_5.setLeading(5f, 1f);
            outerCell_5.setPadding(3);
            outerCell_5.setColspan(1);
            outerCell_5.setBorder(Cell.BOX);
            outerCell_5.setBorderColor(new Color(1, 31, 74));
            outerCell_5.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell_5.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_5);

// Section _6 starts here
            PdfPTable outerT_6 = new PdfPTable(1);
            outerT_6.setTotalWidth(100);
            outerT_6.setWidths(new int[]{100});
            PdfPCell outerCell_6;

            outerCell_6 = new PdfPCell(table);
            outerCell_6.setLeading(5f, 1f);
            outerCell_6.setPadding(3);
            outerCell_6.setColspan(1);
            outerCell_6.setBorder(Cell.BOX);
            outerCell_6.setBorderColor(new Color(1, 31, 74));
            outerCell_6.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell_6.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT_6.addCell(outerCell_6);

            String inStrHeader_6 = "Section VI. References:";
            outerCell_6 = new PdfPCell(new Phrase(inStrHeader_6, f_header10BC));
            outerCell_6.setLeading(5f, 1f);
            outerCell_6.setPadding(5);
            outerCell_6.setColspan(1);
            outerCell_6.setBorder(Cell.BOX);
            outerCell_6.setBackgroundColor(new Color(202, 233, 252));
            outerCell_6.setBorderColor(new Color(1, 31, 74));
            outerCell_6.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell_6.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_6);

            PdfPTable outerTInstr_6 = new PdfPTable(2);
            outerTInstr_6.setTotalWidth(100);
            outerTInstr_6.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr_6;

            String in3_6 = "Please give names and contact details of two Christian business/professional men (Preferably Gideons) who know you well\n\n";
            Phrase pin3_6 = new Phrase(in3_6, f_header9);
            ocellInstr_6 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_6.setLeading(1f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_6.addCell(ocellInstr_6);
            ocellInstr_6 = new PdfPCell(pin3_6);
            ocellInstr_6.setLeading(3f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_6.addCell(ocellInstr_6);

            ocellInstr_6 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_6.setLeading(1f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_6.addCell(ocellInstr_6);

            ocellInstr_6 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_6.setLeading(1f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_6.addCell(ocellInstr_6);

            String instr1_6 = "(I)  Name : " + ref1name + " Mobile : " + ref1phone + " Camp : " + ref1camp + "\n\n";
            String instr2_6 = "(II) Name : " + ref2name + " Mobile : " + ref2phone + " Camp : " + ref2camp + "\n\n";

            Phrase phInstr1_6 = new Phrase(instr1_6, f_header9);
            Paragraph paInstr1_6 = new Paragraph();
            paInstr1_6.add(phInstr1_6);
            ocellInstr_6 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_6.setLeading(1f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_6.addCell(ocellInstr_6);
            ocellInstr_6 = new PdfPCell(paInstr1_6);
            ocellInstr_6.setLeading(3f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_6.addCell(ocellInstr_6);

            Phrase phInstr2_6 = new Phrase(instr2_6, f_header9);
            Paragraph paInstr2_6 = new Paragraph();
            paInstr2_6.add(phInstr2_6);
            ocellInstr_6 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_6.setLeading(1f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_6.addCell(ocellInstr_6);
            ocellInstr_6 = new PdfPCell(paInstr2_6);
            ocellInstr_6.setLeading(3f, 1f);
            ocellInstr_6.setPadding(1);
            ocellInstr_6.setColspan(1);
            ocellInstr_6.setBorder(0);
            ocellInstr_6.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_6.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_6.addCell(ocellInstr_6);

            outerCell_6 = new PdfPCell(outerTInstr_6);
            outerCell_6.setLeading(5f, 1f);
            outerCell_6.setPadding(3);
            outerCell_6.setColspan(1);
            outerCell_6.setBorder(Cell.BOX);
            outerCell_6.setBorderColor(new Color(1, 31, 74));
            outerCell_6.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell_6.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_6);

// Section _7 starts here
            PdfPTable outerT_7 = new PdfPTable(1);
            outerT_7.setTotalWidth(100);
            outerT_7.setWidths(new int[]{100});
            PdfPCell outerCell_7;

            outerCell_7 = new PdfPCell(table);
            outerCell_7.setLeading(5f, 1f);
            outerCell_7.setPadding(3);
            outerCell_7.setColspan(1);
            outerCell_7.setBorder(Cell.BOX);
            outerCell_7.setBorderColor(new Color(1, 31, 74));
            outerCell_7.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell_7.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT_7.addCell(outerCell_7);

            String inStrHeader_7 = "Section VII. Declaration";
            outerCell_7 = new PdfPCell(new Phrase(inStrHeader_7, f_header10BC));
            outerCell_7.setLeading(5f, 1f);
            outerCell_7.setPadding(5);
            outerCell_7.setColspan(1);
            outerCell_7.setBorder(Cell.BOX);
            outerCell_7.setBackgroundColor(new Color(202, 233, 252));
            outerCell_7.setBorderColor(new Color(1, 31, 74));
            outerCell_7.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell_7.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_7);

            PdfPTable outerTInstr_7 = new PdfPTable(2);
            outerTInstr_7.setTotalWidth(100);
            outerTInstr_7.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr_7;

            String in3_7 = "I have prayerfully considered all the preceding questions. I now apply for membership in The Gideons International in India. "
                    + "I also understand that the Membership committee must examine this application and the references, as it has the responsibility of guarding the membership standards of the Association. "
                    + "If accepted, I agree to do the work of the ministry according to the guidelines and policies as determined by the International Cabinet of The Gideons International. "
                    + "If my membership be terminated for any reason, I will return my membership card and the Gideon emblem.\n";
            Phrase pin3_7 = new Phrase(in3_7, f_header9);
            ocellInstr_7 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_7.setLeading(1f, 1f);
            ocellInstr_7.setPadding(1);
            ocellInstr_7.setColspan(1);
            ocellInstr_7.setBorder(0);
            ocellInstr_7.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_7.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_7.addCell(ocellInstr_7);

            ocellInstr_7 = new PdfPCell(pin3_7);
            ocellInstr_7.setLeading(3f, 1f);
            ocellInstr_7.setPadding(1);
            ocellInstr_7.setColspan(1);
            ocellInstr_7.setBorder(0);
            ocellInstr_7.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_7.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_7.addCell(ocellInstr_7);

            ocellInstr_7 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_7.setLeading(1f, 1f);
            ocellInstr_7.setPadding(1);
            ocellInstr_7.setColspan(1);
            ocellInstr_7.setBorder(0);
            ocellInstr_7.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_7.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_7.addCell(ocellInstr_7);

            ocellInstr_7 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_7.setLeading(1f, 1f);
            ocellInstr_7.setPadding(1);
            ocellInstr_7.setColspan(1);
            ocellInstr_7.setBorder(0);
            ocellInstr_7.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_7.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_7.addCell(ocellInstr_7);

            outerCell_7 = new PdfPCell(outerTInstr_7);
            outerCell_7.setLeading(5f, 1f);
            outerCell_7.setPadding(3);
            outerCell_7.setColspan(1);
            outerCell_7.setBorder(Cell.BOX);
            outerCell_7.setBorderColor(new Color(1, 31, 74));
            outerCell_7.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell_7.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_7);

//footer part            
            String csign = "" + name + "\nAPPLICANT NAME / SIGNATURE";
            //  String csignNote = "\n(Date & time : " + new Date().toString() + ")\n";
            Phrase pcs = new Phrase(csign, f_header10BC);
            // Phrase pcsn = new Phrase(csignNote, f_header9C);
            Paragraph pghC = new Paragraph();
            pghC.add(pcs);
            //   pghC.add(pcsn);
            outerCell = new PdfPCell(pghC);
            outerCell.setLeading(5f, 1f);
            outerCell.setPadding(10);
            outerCell.setColspan(2);
            outerCell.setBorder(Cell.BOX);
            outerCell.setBorderColor(new Color(1, 31, 74));
            outerCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            outerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell);

// Section _8 starts here
            PdfPTable outerT_8 = new PdfPTable(1);
            outerT_8.setTotalWidth(100);
            outerT_8.setWidths(new int[]{100});
            PdfPCell outerCell_8;

            outerCell_8 = new PdfPCell(table);
            outerCell_8.setLeading(5f, 1f);
            outerCell_8.setPadding(3);
            outerCell_8.setColspan(1);
            outerCell_8.setBorder(Cell.BOX);
            outerCell_8.setBorderColor(new Color(1, 31, 74));
            outerCell_8.setHorizontalAlignment(Element.ALIGN_CENTER);
            outerCell_8.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT_8.addCell(outerCell_8);

            String inStrHeader_8 = "Section VIII";
            outerCell_8 = new PdfPCell(new Phrase(inStrHeader_8, f_header10BC));
            outerCell_8.setLeading(5f, 1f);
            outerCell_8.setPadding(5);
            outerCell_8.setColspan(1);
            outerCell_8.setBorder(Cell.BOX);
            outerCell_8.setBackgroundColor(new Color(202, 233, 252));
            outerCell_8.setBorderColor(new Color(1, 31, 74));
            outerCell_8.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell_8.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_8);

            PdfPTable outerTInstr_8 = new PdfPTable(2);
            outerTInstr_8.setTotalWidth(100);
            outerTInstr_8.setWidths(new int[]{4, 96});
            PdfPCell ocellInstr_8;

            String in3_8 = "Source of Application? : " + sourceofappln + " Credited_to : " + formfilledbyfoname + "\n\n";
            Phrase pin3_8 = new Phrase(in3_8, f_header9);
            ocellInstr_8 = new PdfPCell(new Phrase("A.", f_header9));
            ocellInstr_8.setLeading(1f, 1f);
            ocellInstr_8.setPadding(1);
            ocellInstr_8.setColspan(1);
            ocellInstr_8.setBorder(0);
            ocellInstr_8.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_8.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_8.addCell(ocellInstr_8);

            ocellInstr_8 = new PdfPCell(pin3_8);
            ocellInstr_8.setLeading(3f, 1f);
            ocellInstr_8.setPadding(1);
            ocellInstr_8.setColspan(1);
            ocellInstr_8.setBorder(0);
            ocellInstr_8.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_8.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_8.addCell(ocellInstr_8);

            ocellInstr_8 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_8.setLeading(1f, 1f);
            ocellInstr_8.setPadding(1);
            ocellInstr_8.setColspan(1);
            ocellInstr_8.setBorder(0);
            ocellInstr_8.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_8.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_8.addCell(ocellInstr_8);

            ocellInstr_8 = new PdfPCell(new Phrase("", f_header9));
            ocellInstr_8.setLeading(1f, 1f);
            ocellInstr_8.setPadding(1);
            ocellInstr_8.setColspan(1);
            ocellInstr_8.setBorder(0);
            ocellInstr_8.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_8.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_8.addCell(ocellInstr_8);

            String instr2_8 = "We the " + formfilledbycamp + " Camp recommend this applicant, and confirm the information in Sections II and III.\n\nCredentials to be sent to : _____________\n\nPresident Name : ___________\n\nSecretary Name : ____________\n\n";

            Phrase phInstr2_8 = new Phrase(instr2_8, f_header9);
            Paragraph paInstr2_8 = new Paragraph();
            paInstr2_8.add(phInstr2_8);
            ocellInstr_8 = new PdfPCell(new Phrase("C.", f_header9));
            ocellInstr_8.setLeading(1f, 1f);
            ocellInstr_8.setPadding(1);
            ocellInstr_8.setColspan(1);
            ocellInstr_8.setBorder(0);
            ocellInstr_8.setHorizontalAlignment(Element.ALIGN_RIGHT);
            ocellInstr_8.setVerticalAlignment(Element.ALIGN_BASELINE);
            outerTInstr_8.addCell(ocellInstr_8);
            ocellInstr_8 = new PdfPCell(paInstr2_8);
            ocellInstr_8.setLeading(3f, 1f);
            ocellInstr_8.setPadding(1);
            ocellInstr_8.setColspan(1);
            ocellInstr_8.setBorder(0);
            ocellInstr_8.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            ocellInstr_8.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerTInstr_8.addCell(ocellInstr_8);

            outerCell_8 = new PdfPCell(outerTInstr_8);
            outerCell_8.setLeading(5f, 1f);
            outerCell_8.setPadding(3);
            outerCell_8.setColspan(1);
            outerCell_8.setBorder(Cell.BOX);
            outerCell_8.setBorderColor(new Color(1, 31, 74));
            outerCell_8.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
            outerCell_8.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell_8);

            // End of Instructions          
            PdfPTable outerT1 = new PdfPTable(2);
            outerT1.setTotalWidth(100);
            outerT1.setWidths(new int[]{50, 50});
            PdfPCell outerCell1;
            outerCell1 = new PdfPCell(new Phrase(new Date().toString(), f_header7));
            outerCell1.setLeading(1f, 1f);
            outerCell1.setPadding(1);
            outerCell1.setColspan(1);
            outerCell1.setBorder(0);
            outerCell1.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT1.addCell(outerCell1);

            outerCell1 = new PdfPCell(new Phrase("Membership Department | The Gideons International in India", f_header7));
            outerCell1.setLeading(1f, 1f);
            outerCell1.setPadding(1);
            outerCell1.setColspan(1);
            outerCell1.setBorder(0);
            outerCell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
            outerCell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT1.addCell(outerCell1);

            outerCell = new PdfPCell(outerT1);
            outerCell.setLeading(1f, 1f);
            outerCell.setPadding(1);
            outerCell.setColspan(1);
            outerCell.setBorder(0);
            outerCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            outerCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            outerT.addCell(outerCell);

            doc.add(outerT);
            doc.close();

        } catch (Exception e) {
            System.out.println("PrinteApplication Error - " + e.toString());
        } finally {
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
