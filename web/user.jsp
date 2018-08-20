<%@page import="javax.servlet.http.HttpSession.*;" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        
        <style type="text/css">
        .menu
        {
            color:#FFFFFF;
        }
        .menu:hover
        {
            color:lightslategrey;
        }
        
        #editpro
        {
            text-decoration: none;
        }
        #editpro:hover
        {
            text-decoration:underline;
        }
        </style>
    </head>
    <body>
        <h1 style="float:left;color:darkslateblue;margin-top:0px;">PICSMASH.COM</h1>
        <%
            HttpSession obj=request.getSession(false);
            String idd=obj.getAttribute("id").toString();
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

                
                
                HttpSession objjj=request.getSession(false);
                String id=objjj.getAttribute("id").toString();
                ResultSet rs=st.executeQuery("select *from userinfo where mid='"+id+"'");
                
                if(rs.next())
                {
                    out.print("<h2 style='float:right;  margin-bottom:5px; margin-right:10px;'>"+rs.getString("mname")+"</h2>");
                }
            }
            catch(Exception tt)
            {
            
            }
            
           %>
           
        <div id="menudiv" style="clear:both; margin-top:5px; height:40px;width:100%;background-color:darkslategrey;" >
	
            <a href="user_home.jsp" class="menu" style="text-decoration:none;" ><p style="clear:both; float:left; margin-top:2px; margin-left:10%; font-size:30px;">Home</p></a>

            <a href="user.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">Profile</p></a>

            <a href="3.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">Upload Post</p></a>

            <a href="viewhistory.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">View History</p></a>

            <a href="logout.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">Logout</p></a>


	</div>

        <center><div id="" style="height: 160px;width:50%;margin: 30px;">
            <%
            try
            {

                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");

                Statement st=con.createStatement();

                
                
                HttpSession objj=request.getSession(false);
                String id=objj.getAttribute("id").toString();
                ResultSet rs=st.executeQuery("select *from userinfo where mid='"+id+"'");
                
                if(rs.next())
                {
                    out.println("<b style='font-size:40px;color:#cc0f0f;'>Profile</b>");
                    out.println("<table>");
                    out.println("<tr><td>Name</td><td>");
                    out.println(rs.getString("mname")+"</td></tr>");
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
                }
                }
            catch(Exception ee)
            {
                out.println(ee.getMessage());
            }
            %>
            </div></center>
    <br/>
    <center style="margin-left:230px;"><a href='editprofile.jsp' id="editpro" ><h3>Edit Profile</h3></a></center>
        
        <div>

        </div>
    </body>
</html>
