<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query Page</title>
    </head>
    <body>
        <h1 style="font-size: 40px;color:#ffcc00;text-align: center;">QUERY LIST</h1>
         
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

                String qry="select * from askquery";

                ResultSet rs=st.executeQuery(qry);

                out.println("<center><table border='1'>");
                out.println("<tr><th>DATE</th><th>PERSON NAME</th><th>EMAIL</th><th>MOBILE</th><th>SUBJECT</th><th>QUERY</th><th>REPLY</th></tr>");

                while(rs.next())
                {
                    out.println("<tr><td>"+rs.getString("aq_date")+"</td><td>"+rs.getString("person_name")+"</td><td>"+rs.getString("email")+"</td><td>"+rs.getString("mobile")+"</td><td>"+rs.getString("subject")+"</td><td>"+rs.getString("message")+"</td><td><a href='reply.jsp?aqid="+rs.getString("aq_id")+"'>Reply</a></td></tr>");
                }

                out.println("</table></center>");


            }
            catch(Exception ee)
            {
                out.println(ee.getMessage());
            }
            %>
    </body>
</html>
