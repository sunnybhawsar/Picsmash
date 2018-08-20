<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<%@page import="java.util.*;" %>
<%@page import="java.util.Date;" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit file</title>
    </head>
    <body>
        <center><h1>Edit Text</h1></center>
        <br/>
        <center><form id="frm" name="frm" action="" method="post">
            <table style="height:100px; width:200px;">
            <tr><td>Title</td><td><input type="text" id="tit" name="tit" /></td></tr>
            <tr><td>Caption</td><td><textarea rows="3" cols="30" id="cap" name="cap" ></textarea></td></tr>
            <tr><td>Author_Name</td><td><input type="text" id="author" name="author" /></td></tr>
            </table>
                </br>
            <input type="submit" id="sub" name="sub" value="Update"/>
        </form></center>
        
        <%
        try
        {
            Date dt=new Date();
            String id=request.getParameter("fileid");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
            Statement st=con.createStatement();
            String qry1="select * from fileinfo where pid='"+id+"'";
            ResultSet rs=st.executeQuery(qry1);
            
            if(rs.next())
            {
            
            }

            if(request.getParameter("sub")!=null)
            {
            String qry="update fileinfo set ftitle='"+request.getParameter("tit")+"',fcaption='"+request.getParameter("cap")+"',authorname='"+request.getParameter("author")+"',fdate='"+dt+"' where pid='"+id+"';";
            if(st.executeUpdate(qry)==1)
            {
            out.println("<br/><br/> Your Picture Updated Successfully!");
            Thread.sleep(3000);
            response.sendRedirect("admin.jsp");
            }
            else
            {
            out.println("<br/><br/>Can't Upadate.");
            }
            }
        }catch(Exception str)
        {
            out.println("Error is "+str.getMessage());
        }
        %>
        
    </body>
</html>
