package murach;

import bean.RegisterBean;
import murach.DAO.RegisterDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegisterController")
public class RegisterServlet extends HttpServlet {
    private RegisterDAO registerDAO;

    public void init() {
        registerDAO = new RegisterDAO();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String n=request.getParameter("username");
        String e=request.getParameter("email");
        String p=request.getParameter("password");
        String re_p=request.getParameter("re_pass");
        RegisterBean registerBean = new RegisterBean();
        registerBean.setUsername(n);
        registerBean.setEmail(e);
        registerBean.setPassword(p);
        registerBean.setRe_Password(re_p);
        if(registerDAO.SignUp(registerBean) > 0){
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request,response);
        }
        else{
            String message = "Sign up fail. Please try again!";
            HttpSession session = request.getSession();
            session.setAttribute("message", message);
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
            rd.include(request,response);
        }

        out.close();
    }
}
