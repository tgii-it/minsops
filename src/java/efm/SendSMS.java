/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

public class SendSMS {

    public String sendSMS(String mobno, String message, String dTid) {
        String status = "";
        try {
            Date mydate = new Date(System.currentTimeMillis());
            String data = "";
            data += "method=sendMessage";
            data += "&userid=2000145570"; // your loginId
            data += "&password="
                    + URLEncoder.encode("NqtAUJZY0", "UTF-8"); // your password           
            data += "&msg=" + URLEncoder.encode(message, "UTF-8");
            data += "&send_to="
                    + URLEncoder.encode(mobno, "UTF-8"); // a valid 10 digit phone no.
            data += "&principalEntityId=1201159282698394026";
            data += "&dltTemplateId=" + dTid;
            // data += "&dltTemplateId=1207160336030939761";
            data += "&v=1.1";
            data += "&msg_type=TEXT"; // Can by "FLASH" or          "UNICODE_TEXT" or “BINARY            ”
            data += "&auth_scheme=PLAIN";
            //URL url = new URL("http://enterprise.webaroo.com/GatewayAPI/rest?" + data);
            URL url = new URL("http://enterprise.smsgupshup.com/GatewayAPI/rest?" + data);
            // URL url = new URL("http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=gideons&password=630638106&sendername=GIDEON&mobileno="+mobno+"&message="+message);
            HttpURLConnection conn
                    = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.connect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuffer buffer = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                buffer.append(line).append("\n");
            }
            status = buffer.toString();
            System.out.println("SmS-Sending-Status : " + status);
            rd.close();
            conn.disconnect();
        } catch (Exception e) {
            System.out.println("SendSMS/" + e.toString());
        }
        return status;
    }
}
