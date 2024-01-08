<%@page import="java.util.Date"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" import="java.util.*"%>
<%@page import="efm.SendSMS" %>
<%

    DataSource ds = null;
    Connection con = null;
    Context context = new InitialContext();
    Context envCtx = (Context) context.lookup("java:comp/env");
    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
    try {
        con = ds.getConnection();
        Statement stmt = con.createStatement();
        String Status_SMS = "";
        String mobile = "";
        String msg = "";
        String mid = "";
        String camp = "";

        SendSMS s = new SendSMS();
        //msg = "Dear Member, Greetings from The Gideons International in India. Your membership expired on 31st Oct 2020. Renew it TODAY, to join hands with 45,000 Gideons & Auxiliary across India for more prayer, stronger spiritual foundation and more witnessing as we associate together and strive side by side for the faith of the gospel. Click the below link to Renew Today. https://pg.gideons.org.in If already paid, please Call/ WhatsApp/ Sms +91 9959807766";
        //   String sql = ("SELECT 'Dear '||name||', Greetings from The Gideons International in India. Your membership expired on 31st Oct 2020. Renew it TODAY, to join hands with 45,000 Gideons and Auxiliary across India for more prayer, stronger spiritual foundation and more witnessing as we associate together and strive side by side for the faith of the gospel. Click the link https://pg.gideons.org.in/renewonline.jsp to Renew Today. If already paid, please Call/ WhatsApp/ Sms +91 98499 91758' as msg, "
        //          + "phone from RENEWAL_REMINDER_SMS_DEC_1211 order by phone");

        /* this msg to All renewed members - Christmas sms */
        //  String sql = ("SELECT 'Dear '||name||', The Gideons International in India wishes you a Merry Christmas and a Happy New Year 2021. As we celebrate the joy of Christmas, let us be reminded of our duty as Gideon and Auxiliary to share this joy with others. Download GMAP (Gideons Mobile App) today! Android : bit.ly/3rrULLk iOS : apple.co/38DDlmm' as msg, "
        //     + " phone from CHRISTMAS_SMS_CURRENT_DEC_25122020 order by phone");

        /* this msg to All YTR members */
        String sql = ("SELECT 'Dear '||name||', The Gideons International in India wishes you a Merry Christmas and a Happy New Year 2021. As we celebrate the joy of Christmas, let this be an opportunity to renew our commitment as Gideon and Auxiliary to share this joy with others by renewing your membership and associating together for service by striving side by side for the faith of the gospel. Please note that your membership has expired on 31st October 2020. Click the link bit.ly/3piiL1y to renew. If already paid, please call/whatsapp/sms +91 99598 07766' as msg, "
                + " phone,mid,camp from CHRISTMAS_SMS_YTR_DEC_25122020 order by phone");
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                mobile = res.getString("phone");
                mid = res.getString("mid");
                camp = res.getString("camp");
                msg = res.getString("msg");
                /* this msg to All YTR members -regular sms */
                // Status_SMS = s.sendSMS(res.getString("phone"), res.getString("msg"), "1207160721805669");

                /* this msg to All renewed members -Christmas sms */
                //  Status_SMS = s.sendSMS(res.getString("phone"), res.getString("msg"), "12071608890415034");

                /* this msg to All YTR members -Christmas sms */
                Status_SMS = s.sendSMS(res.getString("phone"), res.getString("msg"), "1207160889057189243");
%>
<p>SMS has been Sent to <%=mobile%>&nbsp; / &nbsp;<%=camp%>&nbsp;( <%=mid%> )&nbsp; - Message <%=msg%>&nbsp; Status : <%=Status_SMS%></p>
<%
            }
        } catch (Exception e) {
            out.println(e);
        }
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>