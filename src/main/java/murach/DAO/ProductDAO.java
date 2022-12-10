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
        String sql = "select * from product";
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
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return listProduct;
    }
    public static List<ProductBean> getListProductSearch(String text)
    {
        List<ProductBean> listProductsearch = new ArrayList<>();
        String sql = "select * from product where name like ?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,text+"%");
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
                listProductsearch.add(product);
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return listProductsearch;
    }
    public static List<ProductBean> getListProductByIDCategory(int id)
    {
        List<ProductBean> listProduct = new ArrayList<>();
        String sql = "select * from product where idCategory=?";
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
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return listProduct;
    }
    public static ProductBean getProductByID(int id)
    {
        ProductBean product = new ProductBean();
        String sql = "select * from product where id=?";
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
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return product;
    }
    public static int getIDCategoryByID(int id)
    {
        int idCategory = 0;
        String sql = "select IDCATEGORY from product where id=?";
        try{
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next())
            {
                idCategory = rs.getInt("IDCATEGORY");
            }
            conn.close();
        }catch(Exception e){System.out.println(e);}
        return idCategory;
    }

    public static int InsertProduct(String name, String description, String brand, double price, int idCategory, String urlImage)
    {
        int result = 0;
        String sql = "INSERT INTO product (NAME,DESCRIPTION,PRICE,BRAND,IDCATEGORY,URLIMAGE) VALUES (?,?,?,?,?,?)";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,description);
            ps.setDouble(3,price);
            ps.setString(4,brand);
            ps.setInt(5,idCategory);
            ps.setString(6,urlImage);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public static int UpdateProduct(String name, String description, String brand, double price, int idCategory, String urlImage, int id)
    {
        int result = 0;
        String sql = "UPDATE product SET NAME=?,DESCRIPTION=?,PRICE=?,BRAND=?,IDCATEGORY=?,URLIMAGE=? WHERE ID=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,description);
            ps.setDouble(3,price);
            ps.setString(4,brand);
            ps.setInt(5,idCategory);
            ps.setString(6,urlImage);
            ps.setInt(7,id);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public static int DeleteProduct(int id)
    {
        int result = 0;
        String sql = "DELETE FROM product WHERE ID=?";
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
    public static int DeleteProductByCategory(int idcategory)
    {
        int result = 0;
        String sql = "DELETE FROM product WHERE IDCATEGORY=?";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,idcategory);
            result = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
