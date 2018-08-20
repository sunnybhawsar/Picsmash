<%@page import="java.sql.*;" %>

<%
          try
          {
               String qry="delete from fileinfo where pid='"+request.getParameter("itemid")+"'";
               Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
               Statement st=con.createStatement();

               if(st.executeUpdate(qry)==1)
               {
                   response.sendRedirect("adminposts.jsp");
               }
               else
               {
                   out.println("<br/><br/>Item have error to delete");
               }

           }catch(Exception sk)
           {
               out.println("<br/><br/>Error is "+sk.getMessage().toString());
           }



%>