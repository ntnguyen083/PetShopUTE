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

@WebServlet("/ViewProduct")
public class ViewProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        int idproduct = Integer.parseInt(request.getParameter("idproduct"));
        ProductBean product = ProductDAO.getProductByID(idproduct);
//        request.setAttribute("idCategory",product.getId());
        String url = "/RelatedProduct";
        if (product != null) {
            HttpSession session = request.getSession();
            session.setAttribute("product", product);
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
