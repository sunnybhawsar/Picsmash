<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
           
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
    </head>
    <body>
        <center><h1>Edit Profile</h1></center>
        <br/>
        <center><form id="frm" name="frm" action="" method="post">
            <table style="height:200px; width:300px;">

                <%
    try{
         HttpSession obj=request.getSession(false);
            String id=obj.getAttribute("id1").toString();


        Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
            Statement st=con.createStatement();
 String qry1="select * from admininfo where admin_id='"+id+"'";
            ResultSet rs=st.executeQuery(qry1);
   
            out.print("<tr><td>Name</td><td><input type='text' id='mname' name='mname' value="+rs.getString("name")+" /></td></tr>");
            out.print("<tr><td>Address</td><td><input type='text' id='add' name='add' value="+rs.getString("address")+" /></td></tr>");
            out.print("<tr><td>Post Code</td><td><input type='text' id='mpost' name='mpost' value="+rs.getString("postcode")+" /></td></tr>");
            out.print("<tr><td>Email</td><td><input type='text' id='email' name='email' value="+rs.getString("email")+" /></td></tr>");
            out.print("<tr><td>Mobile</td><td><input type='text' id='mble' name='mble' value="+rs.getString("mobile")+" /></td></tr>");
            
            
 }
    catch(Exception t)
    {
    out.println("Error is "+t.getMessage());
    }
                %>
   
            </table>
            </br>
        <input type="submit" id="sub" name="sub" value="Update"/>
        </form></center>
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
            HttpSession obj=request.getSession(false);
            String id=obj.getAttribute("id1").toString();

            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
            Statement st=con.createStatement();
            
            if(request.getParameter("sub")!=null)
            {
            String qry="update admininfo set name='"+request.getParameter("mname")+"',address='"+request.getParameter("add")+"',postcode='"+request.getParameter("mpost")+"',email='"+request.getParameter("email")+"',mobile='"+request.getParameter("mble")+"' where admin_id='"+id+"';";
            st.executeUpdate(qry);
            out.println("<br/><br/> Your Profile Updated Successfully!");
            Thread.sleep(3000);
            response.sendRedirect("admin.jsp");
            }
        }catch(Exception str)
        {
            out.println("Error is "+str.getMessage());
        }
        %>
    </body>
</html>
