package murach;

import bean.UserBean;
import murach.DAO.BillDAO;
import murach.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/creatAdminAcount")
public class CreatAdminAccount extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/ListAdminAccount";
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if(password.equals(password2))
        {
            int result = UserDAO.createAdminAccount(username,email,password,address,phone);
            if(result>0)
            {

            }
            else {
                url = "./error.jsp";
            }
        }
        else
        {
            String message = "Re-input password is not match with password!";
            session.setAttribute("messagecreate",message);
            url = "/accounts_admin.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
