package murach.DAO;

import bean.CategoryBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static List<CategoryBean> getListCategory()
    {
        List<CategoryBean> listCategory = new ArrayList<>();
        String sql = "select * from category";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                CategoryBean category = new CategoryBean();
                category.setIdCategory(rs.getInt("IDCATEGORY"));
                category.setCategory(rs.getString("CATEGORY"));
                listCategory.add(category);
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return listCategory;
    }
    public static CategoryBean getCategoryByID(int id)
    {
        CategoryBean category = new CategoryBean();
        String sql = "select * from category where idcategory = ?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {

                category.setIdCategory(rs.getInt("IDCATEGORY"));
                category.setCategory(rs.getString("CATEGORY"));
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return category;
    }
    public static int InsertCategory(String category)
    {
        int result = 0;
        String sql = "INSERT INTO category(CATEGORY) VALUES (?)";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,category);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public static int UpdateCategory(String category, int id)
    {
        int result = 0;
        String sql = "UPDATE category SET CATEGORY=? WHERE IDCATEGORY=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,category);
            ps.setInt(2,id);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public static int DeleteCategory(int id)
    {
        int result = 0;
        String sql = "DELETE FROM category WHERE IDCATEGORY=?";
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
