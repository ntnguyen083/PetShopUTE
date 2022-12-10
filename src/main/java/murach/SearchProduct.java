package murach;

import bean.ProductBean;
import bean.ReportBean;
import murach.DAO.ProductDAO;
import murach.DAO.ReportDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchProduct")
public class SearchProduct extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/shop.jsp";
        String search = request.getParameter("search");
        List<ProductBean> listProductSearch = ProductDAO.getListProductSearch(search);
        if (listProductSearch != null) {
            HttpSession session = request.getSession();
            session.setAttribute("listProductSearch", listProductSearch);
        } else {
            url = "/error.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
