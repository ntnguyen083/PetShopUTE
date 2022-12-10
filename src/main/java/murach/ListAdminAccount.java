package murach;

import bean.CategoryBean;
import bean.UserBean;
import murach.DAO.CategoryDAO;
import murach.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListAdminAccount")
public class ListAdminAccount extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/accounts_admin.jsp";
        List<UserBean> listAdmin = UserDAO.adminaccount();
        if(listAdmin != null){
            HttpSession session = request.getSession();
            session.setAttribute("listAdmin",listAdmin);
        } else {
            url = "/error.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
