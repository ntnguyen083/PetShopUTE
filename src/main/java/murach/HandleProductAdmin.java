package murach;

import bean.*;
import murach.DAO.CartDAO;
import murach.DAO.CategoryDAO;
import murach.DAO.OderDAO;
import murach.DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/HandleProductAdmin")
public class HandleProductAdmin extends HttpServlet {
    String url = "/AdminProduct";

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        System.out.println(action);
        if (action.equals("addCategory")) {
            insertCategory(request, response);
        }
        if (action.equals("removeProduct")) {
            deleteProduct(request, response);
        }
        if (action.equals("removeCategory")) {
            System.out.println("Vo roi");
            deleteCategory(request, response);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void insertCategory(HttpServletRequest request, HttpServletResponse response) {
        String category = request.getParameter("newcategory");
        int result = CategoryDAO.InsertCategory(category);
        if (result > 0) {
            List<CategoryBean> listCategory = CategoryDAO.getListCategory();
            List<ProductBean> listProduct = ProductDAO.getListProduct();
            HttpSession session = request.getSession();
            session.setAttribute("listProduct", listProduct);
            session.setAttribute("listCategory", listCategory);
        }
    }

    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int idproduct = Integer.parseInt(request.getParameter("idproduct"));
        int result = ProductDAO.DeleteProduct(idproduct);
        if (result > 0) {
            List<ProductBean> listProduct = ProductDAO.getListProduct();
            HttpSession session = request.getSession();
            session.setAttribute("listProduct", listProduct);
        } else {
            url = "/error.jsp";
        }
    }

    public void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Day nua");
        int idcategory = Integer.parseInt(request.getParameter("idcategory"));
        System.out.println("Qua khong");
        ProductDAO.DeleteProductByCategory(idcategory);
        int result1 = CategoryDAO.DeleteCategory(idcategory);
        if (result1 > 0) {
            List<ProductBean> listProduct = ProductDAO.getListProduct();
            List<CategoryBean> listCategory = CategoryDAO.getListCategory();
            HttpSession session = request.getSession();
            session.setAttribute("listProduct", listProduct);
            session.setAttribute("listCategory", listCategory);
        } else {
            url = "/error.jsp";
        }
    }

}
