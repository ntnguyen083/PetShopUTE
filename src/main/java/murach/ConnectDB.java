package murach;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectDB {
    public static Connection getConnection() throws SQLException {
        Connection conn = null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // assign from environment variable
//            String url = System.getenv("DATASOURCE_URL");
//            String user = System.getenv("DATASOURCE_USERNAME");
//            String password = System.getenv("DATASOURCE_PASSWORD");
            String url = "jdbc:mysql://remotemysql.com:3306/zmcTVVybbF";
            String user = "zmcTVVybbF";
            String password = "fJijsejA8f";

            // create a connection to the database
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}
