import java.io.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.sql.*;
import javax.servlet.http.HttpSession;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

@WebServlet(name ="uploadfile" ,urlPatterns = {"/uploadfile"})
public class uploadfile extends HttpServlet 
{
    public static String serverpath="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter())
        {
            if(ServletFileUpload.isMultipartContent(request))
            {
                String fname="";
                String ftype="";
                String fsize="";
                try
                {                    
                List<FileItem> myfile=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item:myfile)
                {                                    
                    if(!item.isFormField())
                    {                    
                        fname=new File(item.getName()).getName().toString();
                        ftype=item.getContentType().toString();
                        fsize=new Long(item.getSize()).toString();                        
                        out.println("Name is "+fname);
                        out.println("<br />Type is "+ftype);
                        out.println("<br />Size is "+fsize);                        
                        String path=getServletContext().getRealPath("")+"\\photo//";
                        item.write(new File(path+fname));                        
                        String filepath="photo/"+fname;
                        

                        out.println("<br />Writting completed <br/><br/>");
                         try
                        {
                         HttpSession obj=request.getSession(false);
                         String id=obj.getAttribute("id").toString();
                         HttpSession objj=request.getSession();

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/upload_post","root","");
                        Statement st=con.createStatement();                        
                        String qry="insert into fileinfo (mid,fname,fsize,ftype,fpath,fdate,ftitle,fcaption,authorname) values ('"+id+"','"+fname+"','"+fsize+"','"+ftype+"','"+filepath+"','"+null+"','"+null+"','"+null+"','"+null+"')";                        
                        ResultSet rs;
                        if(st.executeUpdate(qry)==1)
                        {
                            out.println("<br/><br/>File Stored successful");
                            String qry2="select MAX(pid) from fileinfo";
                            rs=st.executeQuery(qry2);
                            if(rs.next())
                            {
                            objj.setAttribute("pid", rs.getString(1));
                            }
                            out.println("<br /><br /><a href='utext.jsp' >Add Caption</a>");
                        }
                        else
                        {
                            out.println("<br/><br/>File is not stored");
                        }
                        
                        }
                        catch(Exception sk)
                        {
                            out.println("<br/><br/>Error in code "+sk.getMessage());
                        } 
                        
                        
                        break;
                    }
                }
                
                
                }catch(Exception sk)
                {
                    out.println("<br/><br/>Error in file");
                }
            }
            else
            {
                out.println("<br/><br/>Please Select File");
            }
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
