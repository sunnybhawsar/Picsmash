<%@page import="javax.servlet.http.HttpSession.*;" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style type="text/css">
        #log
        {
            float:right; margin-right:4%; text-decoration:none; color:darkslateblue; margin-top:13px;
        }
        #log:hover
        {
         text-decoration:underline;
        }
        
        #mypost
        {
            color:darkslateblue; text-decoration:none;
        }
        #mypost:hover
        {
            color:#cc0f0f; text-decoration:underline;
        }
        
        #editpro
        {
            text-decoration:none;
        }
        #editpro:hover
        {
            text-decoration:underline;
        }
        
        .menu
        {
            color:#ffffff;
        }
        .menu:hover
        {
            color:lightslategrey;
        }
        </style>
    </head>
    <body>
    <!--    <h1 style="float:left;font-size: 40px; color:darkslateblue;">Welcome Admin</h1>
        
        <a href="logout.jsp" style="float:left; margin-left:70%; text-decoration:none; margin-top:0px;"><h3>Logout</h3></a>
    -->

    <p style="float:left; margin-left:40%; color:darkslateblue; font-size:40px; margin-top:0px; margin-bottom:20px;">Welcome Admin</p>
    
    <a href="logout.jsp" id="log" ><h3 style=" font-size:20px;">Logout</h3></a>
   
        <div id="menudiv" style="clear:both;margin-top:0px;height:40px;width:100%;background-color:#000000;" >
	        
            <a href="admin_home.jsp" class="menu" style="text-decoration:none;" ><p style="clear:both; float:left; margin-top:2px; margin-left:9%; font-size:30px;">Home</p></a>

            <a href="admin.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:9%; font-size:30px;">Profile</p></a>

            <a href="viewmember.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:9%; font-size:30px; ">View Member</p></a>

            <a href="admin_upload_post.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:9%; font-size:30px; ">Upload Post</p></a>

            <a href="querylist.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:9%; font-size:30px;">Query List</p></a>

	</div>
   
    
        <a href="adminposts.jsp" id="mypost" ><h2 style="float:right; margin-right:2.7%; margin-bottom:4px;">My Posts</h2></a>
        <br/>
        <center style="margin:20px;">
            
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
                
                HttpSession obj=request.getSession(false);
                String id=obj.getAttribute("id1").toString();
                ResultSet rs=st.executeQuery("select * from admininfo");
                
                if(rs.next())
                {
                    out.println("<center>");
                    out.println("<b style='font-size:40px;color:#cc0f0f;'>Profile</b>");
                    out.println("<table>");
                    out.println("<tr><td>Name</td><td>");
                    out.println(rs.getString("name")+"</td></tr>");
                    out.println("<tr><td>Address</td><td>");
                    out.println(rs.getString("address")+"</td></tr>");
                    out.println("<tr><td>Post Code</td><td>");
                    out.println(rs.getString("postcode")+"</td></tr>");
                    out.println("<tr><td>Email</td><td>");
                    out.println(rs.getString("email")+"</td></tr>");
                    out.println("<tr><td>Mobile</td><td>");
                    out.println(rs.getString("mobile")+"</td></tr>");
                    out.println("<tr><td>Status</td><td>");
                    out.println(rs.getString("status")+"</td></tr></table>");
                    out.println("</center>");
                }
                }
            catch(Exception ee)
            {
                out.println("Error: "+ee.getMessage());
            }
            %>
            </center>
    
        <center style="margin-left:230px;">
            <a href="admin_editprofile.jsp" id="editpro" ><h2 style=" color:darkslateblue;">Edit Profile</h2></a>    
        </center>
    </body>
</html>
