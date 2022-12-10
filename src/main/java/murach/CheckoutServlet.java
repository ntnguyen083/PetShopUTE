package murach;

import bean.CartBean;
import bean.OderBean;
import bean.ShipBean;
import bean.UserBean;
import murach.DAO.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = "/thanks.jsp";
        String address =  request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        int idBill = (int) session.getAttribute("idbillmax");
        double totalPrice = (double) session.getAttribute("totalbillPrice");
        UserBean user = (UserBean) session.getAttribute("user");
        List<OderBean> listOder = (List<OderBean>) session.getAttribute("listOder");
        int result1 = BillDAO.UpdateBill(totalPrice,idBill);
        int result2 = UserDAO.UpdateUser(address,phonenumber,user.getIdUser());
        if(result1 > 0 && result2 > 0)
        {

        }
        else {
            url = "/error.jsp";
        }
        sendMail.sendMail(user.getEmail(),listOder);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
