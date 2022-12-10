package murach;

import bean.LoginBean;
import bean.UserBean;
import murach.DAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminLogin")
public class LoginAdmin extends HttpServlet {
    private UserDAO userDao;

    public void init() {
        userDao = new UserDAO();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        String e=request.getParameter("email");
        String p=request.getParameter("password");
        LoginBean loginBean = new LoginBean();
        loginBean.setEmail(e);
        loginBean.setPassword(p);
        if(userDao.adminvalidate(loginBean)){
            UserBean admin = userDao.getUsername(loginBean);
            HttpSession session = request.getSession();
            session.setAttribute("admin",admin);
            RequestDispatcher rd=request.getRequestDispatcher("/report");
            rd.forward(request,response);
        }
        else{
            String message = "Sign in fail. Email or password was wrong!";
            HttpSession session = request.getSession();
            session.setAttribute("message", message);
            RequestDispatcher rd=request.getRequestDispatcher("adminLogin.jsp");
            rd.include(request,response);
        }

    }
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
