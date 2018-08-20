<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Example</title>
    </head>
    <body
        <%
            HttpSession objjj=request.getSession(false);
            String idd=objjj.getAttribute("id").toString();
            if(idd.equals("888"))
            {
                response.sendRedirect("loginfirst.jsp");
            }
        %>
        <h1>Upload File</h1>
        <form id="frm" name="frm" action="uploadfile" method="post" enctype="multipart/form-data" >
            Select File :<br/> 
            <input type="file" id="photo" name="photo" />
            <br /><br />
            <input type="submit" id="sub" name="sub" value="Upload" />                  
        </form>
            
    </body>
</html>
