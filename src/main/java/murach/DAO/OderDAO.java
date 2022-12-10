package murach.DAO;

import bean.CartBean;
import bean.OderBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OderDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static List<OderBean> getOderProductByIdbill(int idbillmax,int iduser)
    {
        List<OderBean> listOder = new ArrayList<>();
        String sql = "SELECT P.ID,P.NAME,C.AMOUNT,C.DISCOUNT,P.PRICE,P.PRICE*C.AMOUNT AS 'TOTALPRICE',B.ID AS IDBILL,C.ID as IDCART,P.ID AS IDPRODUCT ,U.IDUSER,P.URLIMAGE FROM product AS P, cart AS C, bill AS B, user AS U WHERE\n" +
                "C.IDBILL = ? AND U.IDUSER = ? AND B.STATUS = 0 AND B.ID = ? AND C.IDPRODUCT = P.ID";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,idbillmax);
            ps.setInt(2,iduser);
            ps.setInt(3,idbillmax);
            rs = ps.executeQuery();
            while (rs.next())
            {
                OderBean oder = new OderBean();
                oder.setId(rs.getInt("ID"));
                oder.setNameProduct(rs.getString("NAME"));
                oder.setUrlImage(rs.getString("URLIMAGE"));
                oder.setAmount(rs.getInt("AMOUNT"));
                oder.setIdBill(rs.getInt("IDBILL"));
                oder.setIdCart(rs.getInt("IDCART"));
                oder.setIdProduct(rs.getInt("IDPRODUCT"));
                oder.setDiscount(rs.getInt("DISCOUNT"));
                oder.setPrice(rs.getDouble("PRICE"));
                oder.setTotalPrice(rs.getDouble("TOTALPRICE"));
                oder.setIdUser(rs.getInt("IDUSER"));
                listOder.add(oder);
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return listOder;
    }

}
