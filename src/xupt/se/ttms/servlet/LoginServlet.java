package xupt.se.ttms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xupt.se.util.ConnectionManager;

public class LoginServlet extends HttpServlet implements Servlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {
        try
        {
            HttpSession session = req.getSession();
            String emp_no = req.getParameter("Emp_no");
            String emp_pass = req.getParameter("Emp_pass");
            // int state;
            System.out.println(emp_no + "    " + emp_pass);
            Connection con = ConnectionManager.getInstance().getConnection();
            /* String sql = "SELECT * FROM user WHERE emp_no=? && emp_pass=?"; */

            PreparedStatement pre = con.prepareStatement("SELECT * FROM user WHERE emp_no=? && emp_pass=?");
            pre.setString(1, emp_no);
            pre.setString(2, emp_pass);
            ResultSet rs = pre.executeQuery();
            session.setAttribute("flag", "false");
            session.setAttribute("desc", "用户名，密码错误");
            if(rs.next())
            {
                session.setAttribute("emp_name", "false");
                System.out.println(rs.getString("emp_no") + "   " + rs.getString(2));
                if(rs.getInt(3) == 0)
                {
                    session.setAttribute("emp_type", "0");
                    req.getRequestDispatcher("index1.jsp").forward(req, resp);
                }
                else
                    if(rs.getInt(3) == 1)
                    {
                        session.setAttribute("emp_type", "1");
                        req.getRequestDispatcher("index1.jsp").forward(req, resp);
                    }
            }
            else
            {
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        }
        catch(Exception e)
        {
            // TODO: handle exception
        }

    }

}
