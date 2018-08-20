<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        
        <br/><br/><br/><br/>
        <form id="frm" name="frm" action="" method="post">
            <table>
                <tr>
                    <td><h1 style="font-size: 40px;color:#ffcc00;">LOGIN</h1></td>
                </tr>
                <tr>
                    <td><b>User Name </b></td><td><input type="text" id="uname" name="uname"/></td>
                </tr>
                <tr>
                    <td><b>Password </b></td><td><input type="password" id="pwd" name="pwd"/></td>
                </tr>
                <tr>
                    <td><b>User Type </b></td><td>
                        <select id="select" name="select">
                            <option>Type</option>
                            <option>Admin</option>
                            <option>User</option>
                        </select></td>
                </tr>
                <tr><td></br><input type="submit" id="sub" name="sub" value="Login"/></td></tr>
            </table>
        </form>
        <%
            try
            {
                if(request.getParameter("sub")!=null)
                {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");

                Statement st=con.createStatement();
                HttpSession obj=request.getSession();

                if(request.getParameter("select").equals("Admin"))
                {
                    ResultSet rs=st.executeQuery("select * from admininfo");
                    if(rs.next())
                    {
                        if(request.getParameter("uname").equals(rs.getString("username")) && request.getParameter("pwd").equals(rs.getString("pwd")))
                        {
                            obj.setAttribute("id1",rs.getString("admin_id"));
                            response.sendRedirect("admin.jsp");
                        }
                    }
                    else
                   {
                    out.println("Incorrect Entries!");
                   }
                }
                else
                {
                    ResultSet rs=st.executeQuery("select * from userinfo");
                    while(rs.next())
                    {
                        if(request.getParameter("uname").equals(rs.getString("username")) && request.getParameter("pwd").equals(rs.getString("password")))
                        {
                            obj.setAttribute("id",rs.getString(1));
                            response.sendRedirect("user.jsp");
                        }
                    }
                    
                }
                }
            }catch(Exception str)
            {
                out.println("Error is :"+str.getMessage());
            }
        %>
    </body>
</html>
