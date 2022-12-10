package murach;

import bean.*;
import murach.DAO.CartDAO;
import murach.DAO.CategoryDAO;
import murach.DAO.OderDAO;
import murach.DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@WebServlet("/HandleProductAdmin")
public class HandleProductAdmin extends HttpServlet {
    String url = "/AdminProduct";

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        System.out.println(action);
        if (action.equals("addCategory")) {
            insertCategory(request, response);
        }
        if (action.equals("editCategory")) {
            updateCategory(request, response);
        }
        if (action.equals("removeCategory")) {
            deleteCategory(request, response);
        }
        if (action.equals("addProduct")) {
            addProduct(request, response);
        }
        if (action.equals("editProduct")) {
            updateProduct(request, response);
        }
        if (action.equals("removeProduct")) {
            deleteProduct(request, response);
        }
        List<ProductBean> listProduct = ProductDAO.getListProduct();
        List<CategoryBean> listCategory = CategoryDAO.getListCategory();
        session.setAttribute("listProduct", listProduct);
        session.setAttribute("listCategory", listCategory);
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
        }
        else {
            url = "/error.jsp";
        }
    }

    public void updateCategory(HttpServletRequest request, HttpServletResponse response)
    {
        String category = request.getParameter("categoryname");
        int idcategory = Integer.parseInt(request.getParameter("idcategory"));
        int result = CategoryDAO.UpdateCategory(category,idcategory);
        if (result > 0) {

        }
        else {
            url = "/error.jsp";
        }
    }

    public void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
        int idcategory = Integer.parseInt(request.getParameter("idcategory"));
        ProductDAO.DeleteProductByCategory(idcategory);
        int result1 = CategoryDAO.DeleteCategory(idcategory);
        if (result1 > 0) {
        } else {
            url = "/error.jsp";
        }
    }

    public void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        int category = Integer.parseInt(request.getParameter("category"));
        double price = Double.parseDouble(request.getParameter("price"));
        String fileinput = request.getParameter("fileInput");
        int result = ProductDAO.InsertProduct(name,description,brand,Math.floor(price),category,fileinput);
        if (result > 0) {
        }
        else {
            url = "/error.jsp";
        }
    }

    public void updateProduct(HttpServletRequest request, HttpServletResponse response)
    {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        int category = Integer.parseInt(request.getParameter("category"));
        double price = Double.parseDouble(request.getParameter("price"));
        String fileinput = request.getParameter("fileInput");
        int idproduct = Integer.parseInt(request.getParameter("idproduct"));
        int result = ProductDAO.UpdateProduct(name,description,brand,Math.floor(price),category,fileinput,idproduct);
        if (result > 0) {

        }
        else {
            url = "/error.jsp";
        }
    }
    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int idproduct = Integer.parseInt(request.getParameter("idproduct"));
        int result = ProductDAO.DeleteProduct(idproduct);
        if (result > 0) {
        } else {
            url = "/error.jsp";
        }
    }

}
