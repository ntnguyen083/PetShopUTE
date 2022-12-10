package murach;

import bean.*;
import murach.DAO.BillDAO;
import murach.DAO.CartDAO;
import murach.DAO.OderDAO;
import murach.DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        String url = "/viewcart?ship=0";
        boolean same = false;
        int idproduct = Integer.parseInt(request.getParameter("idProduct"));
        HttpSession session = request.getSession();
        int amount = (int) session.getAttribute("amount");
        int idBill = (int) session.getAttribute("idbillmax");
        UserBean user = (UserBean) session.getAttribute("user");
        List<OderBean> listOder = OderDAO.getOderProductByIdbill(idBill, user.getIdUser());
        OderBean sameOder = new OderBean();
        for (OderBean oder: listOder) {
            if(oder.getIdProduct() == idproduct)
            {
                same = true;
                sameOder = oder;
                break;
            }
        }
        if(same)
        {
            int result = CartDAO.UpdateCart(sameOder.getIdCart(),sameOder.getAmount() + amount);
            if (result > 0) {
            } else {
                url = "/error.jsp";
            }
        }
        else {
            int result = CartDAO.InsertCart(idproduct, idBill, amount);
            if (result > 0) {
            } else {
                url = "/error.jsp";
            }
        }

        List<CartBean> listCart = CartDAO.getListCart();
        session.setAttribute("listCart", listCart);
        listOder = OderDAO.getOderProductByIdbill(idBill, user.getIdUser());
        session.setAttribute("listOder", listOder);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
