package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
   public static Connection getConnection() throws Exception{
      String url = "jdbc:oracle:thin:@//localhost:1521/xe";
      String user = "system";
      String pwd = "1234";
      
      Class.forName("oracle.jdbc.OracleDriver");
      Connection con = DriverManager.getConnection(url, user, pwd);
      return con;
   }
   public static void getClose(Connection con, PreparedStatement pstmt) throws Exception {
      if(pstmt != null ) pstmt.close();
      if(con != null) con.close();
   }
   public static void getClose(Connection con, PreparedStatement pstmt, ResultSet rs) throws Exception {
      if(rs != null) rs.close();
      if(pstmt != null ) pstmt.close();
      if(con != null) con.close();
   }
}