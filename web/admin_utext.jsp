<%@page import="java.io.*;"%>
<%@page import="java.util.*;"%>
<%@page import="javax.servlet.http.HttpServlet;"%>
<%@page import="javax.servlet.http.HttpServlet;"%>
<%@page import="javax.servlet.http.HttpServletRequest;"%>
<%@page import="javax.servlet.http.HttpServletResponse;"%>
<%@page import="java.util.Date;"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Page</title>
    </head>
    <body>
        <h1 style="font-size: 40px;color: #cc00ff;text-align: center;">UPLOAD TEXT</h1>
        <form id="frm" name="frm" action="" method="post">
            <center><table>
                    <tr>
                        <td>Title</td><td><input type="text" id="title" name="title"/></td>
                    </tr>
                    <tr>
                        <td>Caption</td><td><textarea id="cap" name="cap" rows="3" cols="50"></textarea></td>
                    </tr>
                    <tr>
                        <td>Author Name</td><td><input type="text" id="aname" name="aname" /></td>
                    </tr>
                    <tr>
                        <td></br>&nbsp;&nbsp;<input type="submit" id="btn" name="btn" value="Post" /></td>
                    </tr>
            </table></center>
        </form>
        <%
            
                if(request.getParameter("btn")!=null)
                {
                    try
                    {
                        Date dt=new Date();
                        HttpSession objj=request.getSession(false);
                        String pid=objj.getAttribute("pid").toString();
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
                        Statement st=con.createStatement();

                        String qry="update fileinfo set fdate='"+dt+"',ftitle='"+request.getParameter("title")+"',fcaption='"+request.getParameter("cap")+"',authorname='"+request.getParameter("aname")+"' where pid='"+pid+"';";

                        if(st.executeUpdate(qry)==1)
                        {
                        out.println("<br/><br/><br/>");
                        out.println("Capton Saved Successfully!");
                        Thread.sleep(3000);
                        response.sendRedirect("adminposts.jsp");
                        }
                    }catch(Exception str)
                    {
                        out.println("Error is "+str.getMessage());
                    }
                }
               
            
        %>
    </body>
</html>


