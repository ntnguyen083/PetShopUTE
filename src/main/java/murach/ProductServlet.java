package murach;

import bean.ProductBean;
import murach.DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/shop.jsp";

        List<ProductBean> listProduct = ProductDAO.getListProduct();
        if (listProduct != null) {
            HttpSession session = request.getSession();
            session.setAttribute("listProduct", listProduct);
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
