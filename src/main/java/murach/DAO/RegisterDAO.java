package murach.DAO;

import bean.RegisterBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static int SignUp(RegisterBean registerBean){
        int result = 0;
        String sql = "INSERT INTO user(USERNAME,EMAIL,PASSWORD,TYPE) VALUES (?,?,?,0)";
        try{
            String pass = registerBean.getPassword();
            String re_pass = registerBean.getRe_Password();
            if(pass.equals(re_pass))
            {
                // get a connection
                conn = ConnectDB.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1,registerBean.getUsername());
                ps.setString(2,registerBean.getEmail());
                ps.setString(3,registerBean.getPassword());
                result = ps.executeUpdate();
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return result;
    }
}
