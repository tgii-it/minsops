<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="efm.events_DataAccessLayer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    events_DataAccessLayer da = new events_DataAccessLayer();
    String sId = request.getParameter("sId");
    String res = "";
    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    // String filePath = "/home/gideons1/appservers/apache-tomcat-8x/webapps/ROOT/accounts/SupDoc/";
    String filePath = "C:\\Users\\TGII_WORKSTATION\\Documents\\NetBeansProjects\\accounts\\web\\SupDoc";

    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("c:\\temp"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxFileSize);
        try {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    fileName = sId + "_" + fileName;
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    file = new File(filePath + fileName);
                    fi.write(file);
                    res = da.Accounts_Payments_SupDoc_Insert(sId, fileName);
                    out.println("File '" + fileName + "' - '" + res + " Uploaded");
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    } else {
        out.println("No file uploaded");
    }
%>