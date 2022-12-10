package murach;

import bean.CategoryBean;
import bean.ProductBean;
import murach.DAO.CategoryDAO;
import murach.DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminProduct")
public class ProductAdminServlet extends HttpServlet {
    String url = "/adminproduct.jsp";
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        getCategory(request,response);
        getProduct(request,response);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    public void getCategory(HttpServletRequest request, HttpServletResponse response)
    {
        List<CategoryBean> listCategory = CategoryDAO.getListCategory();
        if(listCategory != null){
            HttpSession session = request.getSession();
            session.removeAttribute("listProductByID");
            session.setAttribute("listCategory",listCategory);
        } else {
            url = "/error.jsp";
        }
    }
    public void getProduct(HttpServletRequest request, HttpServletResponse response)
    {
        List<ProductBean> listProduct = ProductDAO.getListProduct();
        if (listProduct != null) {
            HttpSession session = request.getSession();
            session.setAttribute("listProduct", listProduct);
        } else {
            url = "/error.jsp";
        }
    }
}
