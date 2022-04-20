package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConnection {

	public static Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/Registration";
		String user = "root";
		String password = "Mehul@1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
}