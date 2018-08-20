
<%@page import="java.util.Date;"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query Page</title>
    </head>
    <body>
        <h1 style="font-size: 50px;text-align: center;">Query</h1>
        <center>
        <form id="frm" name="frm" action="" method="post">
            <table>
                <tr>
                    <td>Person Name</td><td><input type="text" id="name" name="name"/></td>
                </tr>
                <tr>
                    <td>Email</td><td><input type="text" id="email" name="email"/></td>
                </tr>
                <tr>
                    <td>Mobile</td><td><input type="text" id="mble" name="mble"/></td>
                </tr>
                <tr>
                    <td>Subject</td><td><textarea id="subject" name="subject" rows="2" cols="30"></textarea></td>
                </tr>
                <tr>
                    <td>Message</td><td><textarea id="msg" name="msg" rows="5" cols="40"></textarea></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" id="sub" name="sub" value="submit"/></td>
                </tr>
            </table>
        </form>
        </center>

        <%
        try
        {
            if(request.getParameter("sub")!=null)
            {
            Date dt=new Date();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
            Statement st=con.createStatement();
            String qry="insert into askquery(aq_date,person_name,email,mobile,subject,message) values('"+dt+"','"+request.getParameter("name")+"','"+request.getParameter("email")+"','"+request.getParameter("mble")+"','"+request.getParameter("subject")+"','"+request.getParameter("msg")+"');";
            if(st.executeUpdate(qry)==1)
            {
            out.println("<br/>Query sent successfully..");
            try
            {
            Thread.sleep(5000);
            }
            catch(Exception tt)
            {
            out.println("<br/><br/>Error: "+tt.getMessage());
            }
            response.sendRedirect("index.jsp");
            }
            else
            {
            out.println("<br/><br/>Can't Sent.");
            }
            }
        }catch(Exception str)
        {
            out.println("<br/><br/>Error is "+str.getMessage());
        }
        %>
    </body>
</html>
