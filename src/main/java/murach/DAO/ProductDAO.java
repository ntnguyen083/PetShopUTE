package murach.DAO;

import bean.ProductBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static List<ProductBean> getListProduct()
    {
        List<ProductBean> listProduct = new ArrayList<>();
        String sql = "select * from petshop.product";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                ProductBean product = new ProductBean();
                product.setId(rs.getInt("ID"));
                product.setName(rs.getString("NAME"));
                product.setDescription(rs.getString("DESCRIPTION"));
                product.setPrice(rs.getDouble("PRICE"));
                product.setBrand(rs.getString("BRAND"));
                product.setIdCategory(rs.getInt("IDCATEGORY"));
                product.setUrlImage(rs.getString("URLIMAGE"));
                listProduct.add(product);
            }

        }catch(Exception e){System.out.println(e);}
        return listProduct;
    }
    public static List<ProductBean> getListProductByIDCategory(int id)
    {
        List<ProductBean> listProduct = new ArrayList<>();
        String sql = "select * from petshop.product where idCategory=?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {
                ProductBean product = new ProductBean();
                product.setId(rs.getInt("ID"));
                product.setName(rs.getString("NAME"));
                product.setDescription(rs.getString("DESCRIPTION"));
                product.setPrice(rs.getDouble("PRICE"));
                product.setBrand(rs.getString("BRAND"));
                product.setIdCategory(rs.getInt("IDCATEGORY"));
                product.setUrlImage(rs.getString("URLIMAGE"));
                listProduct.add(product);
            }

        }catch(Exception e){System.out.println(e);}
        return listProduct;
    }
    public static ProductBean getProductByID(int id)
    {
        ProductBean product = new ProductBean();
        String sql = "select * from petshop.product where id=?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {
                product.setId(rs.getInt("ID"));
                product.setName(rs.getString("NAME"));
                product.setDescription(rs.getString("DESCRIPTION"));
                product.setPrice(rs.getDouble("PRICE"));
                product.setBrand(rs.getString("BRAND"));
                product.setIdCategory(rs.getInt("IDCATEGORY"));
                product.setUrlImage(rs.getString("URLIMAGE"));
            }

        }catch(Exception e){System.out.println(e);}
        return product;
    }
    public static int getIDCategoryByID(int id)
    {
        int idCategory = 0;
        String sql = "select IDCATEGORY from petshop.product where id=?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {
                idCategory = rs.getInt("IDCATEGORY");
            }

        }catch(Exception e){System.out.println(e);}
        return idCategory;
    }
    public static int DeleteProduct(int id)
    {
        int result = 0;
        String sql = "DELETE FROM PRODUCT WHERE ID=?";
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
    public static int DeleteProductByCategory(int idcategory)
    {
        int result = 0;
        String sql = "DELETE FROM PRODUCT WHERE IDCATEGORY=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,idcategory);
            result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
