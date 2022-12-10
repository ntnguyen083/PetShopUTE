package murach;

import bean.CartBean;
import bean.OderBean;
import bean.ShipBean;
import bean.UserBean;
import murach.DAO.BillDAO;
import murach.DAO.CartDAO;
import murach.DAO.OderDAO;
import murach.DAO.ShipDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewcart")
public class ViewCartServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        String url = "/cart.jsp";
        if (user == null) {
            String message = "You must be login to buy product!";
            session.setAttribute("message", message);
            url = "/login.jsp";
        } else
        {
            int idbillmax = BillDAO.GetMaxIDBillByIDUser(user.getIdUser());
            if (idbillmax == 0) {
                int result = BillDAO.InsertBill(user.getIdUser());
                idbillmax = BillDAO.GetMaxIDBillByIDUser(user.getIdUser());
                session.setAttribute("idbillmax", idbillmax);
                if (result == 0) {
                    url = "/error.jsp";
                }
            }
            int ship = Integer.parseInt(request.getParameter("ship"));
            ShipBean shipBean = ShipDAO.getShipByID(ship + 1);
            List<CartBean> listCart = CartDAO.getListCart();
            session.setAttribute("listCart", listCart);
            List<OderBean> listOder = OderDAO.getOderProductByIdbill(idbillmax, user.getIdUser());
            double billPrice = 0;
            for (OderBean oder: listOder) {
                billPrice += oder.getTotalPrice();
            }
            double totalbillPrice = billPrice + shipBean.getPrice();
            session.setAttribute("shipBean",shipBean);
            session.setAttribute("idbillmax",idbillmax);
            session.setAttribute("listOder", listOder);
            session.setAttribute("billPrice", billPrice);
            session.setAttribute("totalbillPrice", totalbillPrice);
            List<ShipBean> listShip = ShipDAO.getListShip();
            session.setAttribute("listShip", listShip);
        }

            getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
