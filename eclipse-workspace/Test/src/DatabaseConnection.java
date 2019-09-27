import java.sql.SQLException;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	protected static Connection initializeDatabase() throws SQLException, ClassNotFoundException{
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "test";
		String user = "Varun";
		String pass = "varun2003";
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			System.out.println("Driver Error");
		}
		try {
			Connection con = DriverManager.getConnection(url+dbName,user,pass);
			return con;
		} catch (Exception e) {
			System.out.println("Connection Error");
		}
		return null;
	}
}
