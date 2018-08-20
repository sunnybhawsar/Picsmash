<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
    </head>
    <body>
        
        <%
            HttpSession objjj=request.getSession(false);
            String idd=objjj.getAttribute("id").toString();
            if(idd.equals("888"))
            {
                response.sendRedirect("loginfirst.jsp");
            }
        %>
        
        <center><h1>Edit Profile</h1></center>
        <br/>
        <center><form id="frm" name="frm" action="" method="post">
            <table style="height:200px; width:300px;">
            <tr><td>Member Name</td><td><input type="text" id="mname" name="mname" /></td></tr>
            <tr><td>Address</td><td><input type="text" id="add" name="add" /></td></tr>
            <tr><td>Post Code</td><td><input type="text" id="mpost" name="mpost" /></td></tr>
            <tr><td>Email</td><td><input type="text" id="email" name="email" /></td></tr>
            <tr><td>Mobile</td><td><input type="text" id="mble" name="mble" /></td></tr>
            </table>
                </br>
            <input type="submit" id="sub" name="sub" value="Update"/>
        </form></center>
        <%
        try
        {
            HttpSession obj=request.getSession(false);
            String id=obj.getAttribute("id").toString();

            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
            Statement st=con.createStatement();
            String qry1="select * from userinfo where mid='"+id+"'";
            ResultSet rs=st.executeQuery(qry1);
            
            if(rs.next())
            {
            
            }

            if(request.getParameter("sub")!=null)
            {
            String qry="update userinfo set mname='"+request.getParameter("mname")+"',address='"+request.getParameter("add")+"',postcode='"+request.getParameter("mpost")+"',email='"+request.getParameter("email")+"',mobile='"+request.getParameter("mble")+"',photo='"+request.getParameter("photo")+"' where mid='"+id+"';";
            st.executeUpdate(qry);
            response.sendRedirect("user.jsp");
            }
        }catch(Exception str)
        {
            out.println("Error is "+str.getMessage());
        }
        %>
    </body>
</html>
