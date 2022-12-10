package murach;

import bean.CategoryBean;
import murach.DAO.CategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/storeddata")
public class StoredData extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/edit-product.jsp";
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if(action.equals("editcategory"))
        {
            int idCategory = Integer.parseInt(request.getParameter("idcategory"));
            String category = request.getParameter("category");
            session.setAttribute("idCategory",idCategory);
            session.setAttribute("category",category);
        }
        if(action.equals("editproduct"))
        {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String brand = request.getParameter("brand");
            int idCategory = Integer.parseInt(request.getParameter("idCategory"));
            CategoryBean categoryname = CategoryDAO.getCategoryByID(idCategory);
            double price = Double.parseDouble(request.getParameter("price"));
            String urlImage = request.getParameter("urlImage");
            int idProduct = Integer.parseInt(request.getParameter("idProduct"));
            session.setAttribute("name",name);
            session.setAttribute("description",description);
            session.setAttribute("brand",brand);
            session.setAttribute("categoryname",categoryname);
            session.setAttribute("price",price);
            session.setAttribute("urlImage",urlImage);
            session.setAttribute("idProduct",idProduct);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
