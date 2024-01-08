<%  String sa_no = request.getParameter("sa_no");
    String rid = request.getParameter("rid");
    String fdate = request.getParameter("fdate");
    String todate = request.getParameter("todate");
    if (fdate == null) {
        fdate = "";
    }
    if (todate == null) {
        todate = "";
    }
    if (sa_no == null) {
        sa_no = "";
    }
    String useraccessname = "";
    String designation = "";
    String userName = "";
    String useraccessno = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
        userName = session.getAttribute("useraccessname").toString();
        designation = session.getAttribute("designation").toString();
        useraccessno = session.getAttribute("useraccessno").toString();
    }
    String username = userName;
%>