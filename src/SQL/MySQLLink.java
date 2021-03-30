package SQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MySQLLink {
    private final String driver = "com.mysql.jdbc.Driver";  //jdbc驱动类地址
    private final String url = "jdbc:mysql://localhost:3306/questions_manag";//数据库链接地址
    private final String user = "root";//帐号
    private final String passsord = "root"; //密码
    private static MySQLLink use = null;
    private Connection conn = null;

    private MySQLLink() {
        try {
            Class.forName(driver);//加载驱动
            conn = DriverManager.getConnection(url, user, passsord);//获取数据库链接
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MySQLLink.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MySQLLink.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static MySQLLink getMySQLLink() {//单例模式
        if (use == null) {
            try {
                use = new MySQLLink();
            } catch (Exception ex) {
                Logger.getLogger(MySQLLink.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return use;
    }

    public Connection getConnection() {
       try {
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(url, user, passsord);//如果外界关闭了数据库链接重新链接数据库
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQLLink.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
}
