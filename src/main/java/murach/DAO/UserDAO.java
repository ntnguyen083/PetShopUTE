package murach.DAO;

import bean.LoginBean;
import bean.UserBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    public static boolean validate(LoginBean loginBean) {
        boolean status = false;
        String sql = "select * from user where email=? and password=? and type=0";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, loginBean.getEmail());
            ps.setString(2, loginBean.getPassword());
            rs = ps.executeQuery();
            status = rs.next();


        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static boolean adminvalidate(LoginBean loginBean) {
        boolean status = false;
        String sql = "select * from user where email=? and password=? and type=1";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, loginBean.getEmail());
            ps.setString(2, loginBean.getPassword());
            rs = ps.executeQuery();
            status = rs.next();


        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<UserBean> adminaccount() {
        List<UserBean> listAdmin = new ArrayList<>();
        String sql = "select * from user where type=1";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserBean admin = new UserBean();
                admin.setIdUser(rs.getInt("IDUSER"));
                admin.setUserName(rs.getString("USERNAME"));
                admin.setEmail(rs.getString("EMAIL"));
                admin.setPassWord(rs.getString("PASSWORD"));
                admin.setAddress(rs.getString("ADDRESS"));
                admin.setPhoneNumber(rs.getString("PHONENUMBER"));
                listAdmin.add(admin);
            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return listAdmin;
    }

    public static UserBean getUsername(LoginBean loginBean) {
        UserBean user = new UserBean();
        String sql = "select * from user where email=? and password=?";
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, loginBean.getEmail());
            ps.setString(2, loginBean.getPassword());
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setIdUser(rs.getInt("IDUSER"));
                user.setUserName(rs.getString("USERNAME"));
                user.setEmail(rs.getString("EMAIL"));
                user.setPassWord(rs.getString("PASSWORD"));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }

    public static int UpdateUser(String address, String phoneNumber, int id) {
        int result = 0;
        String sql = "UPDATE user SET ADDRESS = ?, PHONENUMBER = ? WHERE IDUSER = ?";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, address);
            ps.setString(2, phoneNumber);
            ps.setInt(3, id);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static int createAdminAccount(String username, String email, String password, String address, String phone) {
        int result = 0;
        String sql = "INSERT INTO user(USERNAME,EMAIL,PASSWORD,ADDRESS,PHONENUMBER,TYPE) VALUES (?,?,?,?,?,1)";
        try {
            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, address);
            ps.setString(5, phone);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static int DeleteAdminAccount(int id)
    {
        int result = 0;
        String sql = "DELETE FROM user WHERE IDUSER=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
