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

@WebServlet("/GetProductByCategoryID")
public class ProductByCategoryServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/shop.jsp";
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        List<ProductBean> listProductByID = ProductDAO.getListProductByIDCategory(idCategory);
        if (listProductByID != null) {
            HttpSession session = request.getSession();
            session.setAttribute("listProductByID", listProductByID);
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
