package murach.DAO;

import bean.BillBean;
import bean.ProductBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BillDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    public static int GetIDBillByIDUser(int iduser)
    {
        int result = 0;
        String sql = "SELECT ID FROM bill WHERE IDUSER = ?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,iduser);
            rs = ps.executeQuery();
            while (rs.next())
            {
                result = rs.getInt("ID");
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static int GetIDBillByID(int id)
    {
        int result = -1;
        String sql = "SELECT * FROM bill WHERE ID = ?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {
                result = rs.getInt("ID");
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static int InsertBill(int iduser) {
        int result = 0;
        String sql = "INSERT INTO bill (IDUSER,STATUS,TOTALPRICE) VALUES (?,0,0)";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,iduser);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public static int GetMaxIDBillByIDUser(int iduser) {
        int result = -1;
        String sql = "SELECT MAX(ID) FROM bill WHERE STATUS = 0 AND IDUSER = ?";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,iduser);
            rs = ps.executeQuery();
            while (rs.next())
            {
                result = rs.getInt("MAX(ID)");
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public static int UpdateBill(double totalPrice, int idbill)
    {
        int result = 0;
        String sql = "UPDATE bill SET TOTALPRICE = ?, STATUS = 1 WHERE ID = ?";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDouble(1,totalPrice);
            ps.setInt(2,idbill);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

}
