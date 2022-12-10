package murach.DAO;

import bean.LoginBean;
import bean.UserBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static boolean validate(LoginBean loginBean){
        boolean status=false;
        String sql = "select * from petshop.user where email=? and password=? and type=0";
        try{
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,loginBean.getEmail());
            ps.setString(2,loginBean.getPassword());
            rs = ps.executeQuery();
            status=rs.next();


        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static boolean adminvalidate(LoginBean loginBean){
        boolean status=false;
        String sql = "select * from petshop.user where email=? and password=? and type=1";
        try{
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,loginBean.getEmail());
            ps.setString(2,loginBean.getPassword());
            rs = ps.executeQuery();
            status=rs.next();


        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static UserBean getUsername(LoginBean loginBean)
    {
        UserBean user = new UserBean();
        String sql = "select * from petshop.user where email=? and password=?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,loginBean.getEmail());
            ps.setString(2,loginBean.getPassword());
            rs = ps.executeQuery();
            while (rs.next())
            {
                user.setIdUser(rs.getInt("IDUSER"));
                user.setUserName(rs.getString("USERNAME"));
                user.setEmail(rs.getString("EMAIL"));
                user.setPassWord(rs.getString("PASSWORD"));
            }

        }catch(Exception e){System.out.println(e);}
        return user;
    }
    public static int UpdateUser(String address, String phoneNumber, int id)
    {
        int result = 0;
        String sql = "UPDATE USER SET ADDRESS = ?, PHONENUMBER = ? WHERE IDUSER = ?";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,address);
            ps.setString(2,phoneNumber);
            ps.setInt(3,id);
            result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
