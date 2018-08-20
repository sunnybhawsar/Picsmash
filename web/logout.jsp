<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
        HttpSession obj=request.getSession(false);
        obj.invalidate();
        out.println("<h3>Logout successfull!</h3>");
        
        HttpSession objj=request.getSession();
        objj.setAttribute("id",888);
        
        HttpSession objjj=request.getSession();
        objjj.setAttribute("id1",888);
        out.println("<center><a href='index.jsp' style=''><h2>Go to Site</h2></a></center>");
        %>
    </body>
</html>
