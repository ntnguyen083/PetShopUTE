package murach.DAO;

import bean.CartBean;
import bean.ShipBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ShipDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static List<ShipBean> getListShip()
    {
        List<ShipBean> listShip = new ArrayList<>();
        String sql = "select * from ship";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                ShipBean ship = new ShipBean();
                ship.setId(rs.getInt("ID"));
                ship.setType(rs.getString("TYPE"));
                ship.setPrice(rs.getDouble("PRICE"));
                listShip.add(ship);
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return listShip;
    }
    public static ShipBean getShipByID(int id)
    {
        ShipBean ship = new ShipBean();
        String sql = "select * from ship where id = ?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {

                ship.setId(rs.getInt("ID"));
                ship.setType(rs.getString("TYPE"));
                ship.setPrice(rs.getDouble("PRICE"));
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return ship;
    }
}
