<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply Page</title>
    </head>
    <body>
        <center><h1>REPLY</h1></center>
        <%
            try
            {


                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");

                Statement st=con.createStatement();

                String id=request.getParameter("aqid");

                String qry="select * from askquery where aq_id="+id+";";

                ResultSet rs=st.executeQuery(qry);
                out.println("<center><table border='1'>");
                if(rs.next())
                {
                    out.println("<tr><td>Person Name</td><td>"+rs.getString("person_name")+"</td></tr>");
                    out.println("<tr><td>Email</td><td>"+rs.getString("email")+"</td></tr>");
                    out.println("<tr><td>Mobile</td><td>"+rs.getString("mobile")+"</td></tr>");
                    out.println("<tr><td>Query Date</td><td>"+rs.getString("aq_date")+"</td></tr>");
                    out.println("<tr><td>Subject</td><td>"+rs.getString("subject")+"</td></tr>");
                    out.println("<tr><td>Query</td><td>"+rs.getString("message")+"</td></tr>");
                }
                out.println("</table></center>");
            }catch(Exception str)
            {
                out.println("Error is"+str.getMessage());
            }
        %>
        <br/><br/>
        <center>
        <form id="frm" name="frm" action="" method="post">
            <textarea id="reply" name="reply" rows="5" cols="80" placeholder="!!Enter Reply...."></textarea><br/><br/>
            <input type="button" value="Reply"/>
        </form>
        </center>
    </body>
</html>
