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

@WebServlet("/RelatedProduct")
public class RelatedProduct extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/product.jsp";
        int idCategory = ProductDAO.getIDCategoryByID(Integer.parseInt(request.getParameter("idproduct")));
        List<ProductBean> listRelatedProduct = ProductDAO.getListProductByIDCategory(idCategory);
        if (listRelatedProduct != null) {
            HttpSession session = request.getSession();
            session.setAttribute("listRelatedProduct", listRelatedProduct);
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
