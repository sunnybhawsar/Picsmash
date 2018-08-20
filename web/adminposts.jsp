<%@page import="java.sql.*;" %>
<%@page import="java.util.Date;" %>
<%@page import="java.util.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body>
    <center><h1 style="color:darkslateblue;">My Posts</h1></center>
    <br/></br>
        
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
                    String id1=obj.getAttribute("id1").toString();

                    String qry="select * from fileinfo where mid='"+id1+"' order by pid desc;";
                    ResultSet rs=st.executeQuery(qry);

                    out.println("<center>");             
                     
                    while(rs.next())
                    {
                      out.println("<table>");
                      out.print("<tr><td><pre style='font-size:15px;'><b>Title: "+rs.getString("ftitle")+"</b></pre></td></tr>"); 
                      out.print("<tr><td><pre>"+rs.getString("fcaption") +"</pre></td></tr>");
                      out.print("<tr><td><img src='"+rs.getString("fpath")+"' style='height:400px;width:800px;' /></td></tr>");
                      out.print("<tr><td><pre>Author Name: "+rs.getString("authorname")+"</pre></td></tr>");
                      out.print("<tr><td><pre>Post Date: "+rs.getString("fdate")+"</pre></td></tr>");
                      out.println("</table>");
                      out.println("<a href='admin_delete.jsp?itemid="+rs.getString(1)+"' style='float:right; margin-top:0px; margin-right:20%;color:black; text-decoration:none;'><h3>Delete Post</h3></a> <a href='admin_editfile.jsp?fileid="+rs.getString(1)+"' style='float:right; margin-top:0px; margin-right:30px;color:black; text-decoration:none;'><h3>Edit Post</h3></a>");
                      out.println("<br/><br/><br/><br/>");
                    } 
                         
                    out.println("</center>");
                    
              
                    out.println("<br/><br/><br/><a href='admin.jsp' style=''><h2>Back to Profile</h2></a>");
                 }catch(Exception sk)
                 {
                     out.println("Error is "+sk.getMessage().toString());
                 }
        %>
    </body>
</html>
