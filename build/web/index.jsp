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
        </style>
    </head>
    <body>
        <h1 style="color:darkslateblue;">PICSMASH.COM</h1>
        
        <div id="menudiv" style="height:40px;width:100%;background-color:darkslategrey;" >
	
            
            <a href="index.jsp" class="menu" style="text-decoration:none;" ><p style="clear:both; float:left; margin-top:2px; margin-left:11%; font-size:30px;">Home</p></a>

            <a href="signup.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:11%; font-size:30px;">Signup</p></a>

            <a href="askquery.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:11%; font-size:30px;">Ask Query</p></a>

            <a href="contacts.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:11%; font-size:30px;">Contacts</p></a>

            <a href="login.jsp" class="menu" style="text-decoration:none;" ><p style="float:left;margin-top:2px; margin-left:11%; font-size:30px;">Login</p></a>

        </div>
          <br/>
        <form id="frm" name="frm" action="" method="post">
            <center><input type="text" id="search" name="search" style=" margin-right:2%;"/>
            <input type="button" id="btn" name="btn" value="Search"/></center>
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
                               
                
                /*
                Date dt=new Date();
                    out.println("<center>");             
                     
               
                      out.println("<table>");
                      out.print("<tr><td><pre style='font-size:15px;'><b>Title: BBoy</b></pre></td></tr>"); 
                      out.print("<tr><td><pre>#dance#love#forever</pre></td></tr>");
                      out.print("<tr><td><img src=photo/1.jpg style='height:400px;width:800px;' /></td></tr>");
                      out.print("<tr><td><pre>Author Name: Sunny bhawsar</pre></td></tr>");
                      out.print("<tr><td><pre>Post Date: "+dt+"</pre></td></tr>");
                      out.println("</table>");
                      out.println("<br/><br/><br/><br/>");
                   
                      out.println("<table>");
                      out.print("<tr><td><pre style='font-size:15px;'><b>Title: MJ</b></pre></td></tr>"); 
                      out.print("<tr><td><pre>#god#of#dance#mj#love</pre></td></tr>");
                      out.print("<tr><td><img src=photo/4.jpg style='height:400px;width:800px;' /></td></tr>");
                      out.print("<tr><td><pre>Author Name: Michael</pre></td></tr>");
                      out.print("<tr><td><pre>Post Date: "+dt+"</pre></td></tr>");
                      out.println("</table>");
                      out.println("<br/><br/><br/><br/>");
                   
                      out.println("<table>");
                      out.print("<tr><td><pre style='font-size:15px;'><b>Title: Me</b></pre></td></tr>"); 
                      out.print("<tr><td><pre>#upside#down#stunts#love</pre></td></tr>");
                      out.print("<tr><td><img src=photo/9.jpg style='height:400px;width:800px;' /></td></tr>");
                      out.print("<tr><td><pre>Author Name: Me</pre></td></tr>");
                      out.print("<tr><td><pre>Post Date: "+dt+"</pre></td></tr>");
                      out.println("</table>");
                      out.println("<br/><br/><br/><br/>");
                   
                      out.println("<table>");
                      out.print("<tr><td><pre style='font-size:15px;'><b>Title: Michael Jackson</b></pre></td></tr>"); 
                      out.print("<tr><td><pre>#mj#legend#live#forever#dance#love</pre></td></tr>");
                      out.print("<tr><td><img src=photo/3.jpg style='height:400px;width:800px;' /></td></tr>");
                      out.print("<tr><td><pre>Author Name: Sunny</pre></td></tr>");
                      out.print("<tr><td><pre>Post Date: "+dt+"</pre></td></tr>");
                      out.println("</table>");
                      out.println("<br/><br/><br/><br/>");
                   
                    out.println("</center>");
                    
                  */
                
            }
            catch(Exception sb)
            {
                out.println("Error is "+sb.getMessage());
            }


            %>
    </body>
</html>
