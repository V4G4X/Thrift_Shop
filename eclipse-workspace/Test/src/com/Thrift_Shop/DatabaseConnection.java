package com.Thrift_Shop;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.DriverManager;
public class DatabaseConnection {
	protected static Connection initializeDatabase() throws SQLException, ClassNotFoundException{
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "Thrift_Shop";
		String user = "Admin";
		String pass = "Admin@123";
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			try {
				dbDriver = "com.mysql.jdbc.Driver";
				Class.forName(dbDriver);
			} catch (Exception e2) {
				System.out.println("Driver Error");
				e.printStackTrace();
			}
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
