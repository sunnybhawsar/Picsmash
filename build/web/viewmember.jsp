<%@page import="javax.servlet.http.HttpSession.*;" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Page</title>
    </head>
    <body>
        <h1 style="color:darkgreen;">Member List</h1>
       <%
            HttpSession objjj=request.getSession(false);
            String idd=objjj.getAttribute("id1").toString();
            if(idd.equals("888"))
            {
                response.sendRedirect("loginfirst.jsp");
            }
        %>
        <%
        try
        {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from userinfo");
                
                out.println("<table style='width:70%;'>");
                out.println("<tr><th>Id</th><th>Name</th><th>Address</th><th>Mobile</th><th>Email</th></tr>");
                
                while(rs.next())
                {
                out.println("<tr align='center'>");
                out.println("<td>"+rs.getString("mid")+"</td>");
                out.println("<td>"+rs.getString("mname")+"</td>");
                out.println("<td>"+rs.getString("address")+"</td>");
                out.println("<td>"+rs.getString("mobile")+"</td>");
                out.println("<td>"+rs.getString("email")+"</td>");
                out.println("</tr>");
                }
                out.println("</table>");  
             
                                         
        }
        catch(Exception ee)
        {
        out.println("Error : "+ee.getMessage());
        }
        %>
    </body>
</html>
