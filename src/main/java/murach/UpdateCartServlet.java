package murach;

import bean.OderBean;
import murach.DAO.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updatecart")
public class UpdateCartServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String url = "/viewcart?ship=0";
        int idcart = Integer.parseInt(request.getParameter("idcart"));
        int currentAmount = Integer.parseInt(request.getParameter("currentAmount"));
        String caseAmount = request.getParameter("caseAmount");
        int newAmount = currentAmount;
        if(caseAmount.equals("up"))
        {
            newAmount+=1;
        }
        if(caseAmount.equals("down"))
        {
            newAmount-=1;
        }
        if(newAmount == 0)
        {
            int result = CartDAO.DeleteCart(idcart);
            if (result == 0) {
                url = "/error.jsp";
            }
        }
        else {
            int result = CartDAO.UpdateCart(idcart,newAmount);
            if (result == 0) {
                url = "/error.jsp";
            }
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
