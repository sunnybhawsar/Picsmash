<%@page import="java.util.Date;"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
            HttpSession objjj=request.getSession(false);
            String idd=objjj.getAttribute("id").toString();
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
                String id=obj.getAttribute("id").toString();
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
         
        
        <div id="menudiv" style="clear:both;height:40px;width:100%;background-color:darkslategrey;" >
	
            <a href="user_home.jsp" class="menu" style="text-decoration:none;" ><p style="clear:both; float:left; margin-top:2px; margin-left:10%; font-size:30px;">Home</p></a>

            <a href="user.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px; ">Profile</p></a>

            <a href="3.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">Upload Post</p></a>

            <a href="viewhistory.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">View History</p></a>

            <a href="logout.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:10%; font-size:30px;">Logout</p></a>

        </div>
            <br/>
        <form id="frm" name="frm" action="" method="post">
            <center>
                <input type="text" id="search" name="search"/>
            <input type="button" id="btn" name="btn" value="Search"/>
            </center>
        </form>

        <br/><br/>
        <%
        int count=0;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
                Statement st=con.createStatement();

                String qry="select * from fileinfo order by pid desc";

                ResultSet rs=st.executeQuery(qry);

                out.println("<center>");             
                     
                    while(rs.next())
                    {
                      count++;
                      out.println("<table>");
                      out.print("<tr><td><pre style='font-size:15px;'><b>Title: "+rs.getString("ftitle")+"</b></pre></td></tr>"); 
                      out.print("<tr><td><pre>"+rs.getString("fcaption") +"</pre></td></tr>");
                      out.print("<tr><td><img src='"+rs.getString("fpath")+"' style='height:400px;width:900px;' /></td></tr>");
                      out.print("<tr><td><pre>Author Name: "+rs.getString("authorname")+"</pre></td></tr>");
                      out.print("<tr><td><pre>Post Date: "+rs.getString("fdate")+"</pre></td></tr>");
                      out.println("</table>");
                      out.println("<br/><br/><br/><br/>");
                      if(count==6)
                      {
                       break;   
                      }
                    } 
                               
                    
            }
            catch(Exception sb)
            {
                out.println("Error is "+sb.getMessage());
            }


            %>
    </body>
</html>
