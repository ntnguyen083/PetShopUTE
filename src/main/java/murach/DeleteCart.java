package murach;

import murach.DAO.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deletecart")
public class DeleteCart extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String url = "/viewcart";
        int idcart = Integer.parseInt(request.getParameter("idcart"));
        int result = CartDAO.DeleteCart(idcart);
        if (result == 0) {
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
