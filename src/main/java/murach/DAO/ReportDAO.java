package murach.DAO;

import bean.ReportBean;
import murach.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    public static List<ReportBean> GetReport()
    {
        List<ReportBean> listReport = new ArrayList<>();
        String sql = "SELECT B.ID,B.STATUS,U.USERNAME,B.TOTALPRICE,U.EMAIL,U.ADDRESS,U.PHONENUMBER FROM bill AS B, user AS U WHERE U.IDUSER = B.iduser";
        try {

            // get a connection
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                ReportBean report = new ReportBean();
                report.setId(rs.getInt("ID"));
                report.setStatus(rs.getInt("STATUS"));
                report.setUsername(rs.getString("USERNAME"));
                report.setTotalPrice(rs.getDouble("TOTALPRICE"));
                report.setEmail(rs.getString("EMAIL"));
                report.setAddress(rs.getString("ADDRESS"));
                report.setPhoneNumber(rs.getString("PHONENUMBER"));
                listReport.add(report);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listReport;
    }
}
