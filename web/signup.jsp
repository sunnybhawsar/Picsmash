<%@page import="java.util.*;"%>
<%@page import="javax.servlet.*;"%>
<%@page import="java.io.*;"%>
<%@page import="java.io.IOException;"%>
<%@page import="java.io.PrintWriter;"%>
<%@page import="javax.servlet.ServletException;" %>
<%@page import="javax.servlet.annotation.WebServlet;" %>
<%@page import="javax.servlet.http.HttpServlet;" %>
<%@page import="javax.servlet.http.HttpServletRequest;" %>
<%@page import="javax.servlet.http.HttpServletResponse;" %>
<%@page import="org.apache.commons.io.*;"%>
<%@page import="org.apache.commons.fileupload.*;"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload;"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory;"%>
<%@page import="java.util.Date;"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
    </head>
    <body>
        <center><h1>SIGN UP</h1></center>
        <br/><br/>
        <center><form id="frm" name="frm" action="" method="post">
            <table style="height:400px;width:300px;">
            <tr><td>Member Name</td><td><input type="text" id="mname" name="mname" /></td></tr>
            <tr><td>Address</td><td><input type="text" id="add" name="add" /></td></tr>
            <tr><td>Post Code</td><td><input type="text" id="mpost" name="mpost" /></td></tr>
            <tr><td>Email</td><td><input type="text" id="email" name="email" /></td></tr>
            <tr><td>Mobile</td><td><input type="text" id="mble" name="mble" /></td></tr>
            <tr><td>Identity No.</td><td><input type="text" id="ino" name="ino" /></td></tr>
            <tr><td>User Name</td><td><input type="text" id="muname" name="muname" /></td></tr>
            <tr><td>Password</td><td><input type="password" id="mpass" name="mpass" /></td></tr>
            <tr><td>Security Question</td><td><input type="text" id="sques" name="sques" /></td></tr>
            <tr><td>Security Answer</td><td><input type="text" id="sans" name="sans" /></td></tr>
            <tr><td>Status</td><td><input type="text" id="msta" name="msta" /></td></tr>
            </table>
                </br>
            <input type="submit" id="sub" name="sub" value="submit"/>
        </form></center>
        <%

            /*if(ServletFileUpload.isMultipartContent(request))
            {
                String fname="";
                String ftype="";
                String fsize="";
                String path="";*/
                try
                {
                    /*List<FileItem> myfile=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    for(FileItem item:myfile)
                    {
                        if(!item.isFormField())
                        {
                            fname=new File(item.getName()).getName().toString();

                            path=getServletContext().getRealPath("")+fname;

                         }
                         else
                         {
                            out.println("File is not stored");
                         }
                    }*/

                    Date dt=new Date();
                     String path="";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
                    Statement st=con.createStatement();
                    String qry="insert into userinfo(mname,address,postcode,email,mobile,id_no,username,password,sec_ques,sec_ans,join_date,status) values('"+request.getParameter("mname")+"','"+request.getParameter("add")+"','"+request.getParameter("mpost")+"','"+request.getParameter("email")+"','"+request.getParameter("mble")+"','"+request.getParameter("ino")+"','"+request.getParameter("muname")+"','"+request.getParameter("mpass")+"','"+request.getParameter("sques")+"','"+request.getParameter("sans")+"','"+dt+"','"+request.getParameter("msta")+"');";
                    if(request.getParameter("sub")!=null)
                    {
                        st.executeUpdate(qry);
                        out.print(""+path);
                        response.sendRedirect("login.jsp");
                    }
                    
                }catch(Exception str)
                {
                    out.println("Error is "+str.getMessage());
                }
           
        %>
    </body>
</html>
