package murach.DAO;

import bean.CartBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static List<CartBean> getListCart()
    {
        List<CartBean> listCart = new ArrayList<>();
        String sql = "select * from petshop.cart";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                CartBean cart = new CartBean();
                cart.setId(rs.getInt("ID"));
                cart.setIdProduct(rs.getInt("IDPRODUCT"));
                cart.setAmount(rs.getInt("AMOUNT"));
                cart.setIdBill(rs.getInt("IDBILL"));
                cart.setDiscount(rs.getInt("DISCOUNT"));
                cart.setPrice(rs.getDouble("PRICE"));
                listCart.add(cart);
            }
        }catch(Exception e){System.out.println(e);}
        return listCart;
    }
    public static int InsertCart(int idproduct, int idbill) {
        int result = 0;
        String sql = "INSERT INTO CART(IDPRODUCT,AMOUNT,IDBILL,DISCOUNT,PRICE) VALUES (?,1,?,0,0)";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,idproduct);
            ps.setInt(2,idbill);
            result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static int UpdateCart(int id, int amount) {
        int result = 0;
        String sql = "UPDATE CART SET AMOUNT=? WHERE ID=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,amount);
            ps.setInt(2,id);
            result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static int DeleteCart(int id) {
        int result = 0;
        String sql = "DELETE FROM CART WHERE ID=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

}
