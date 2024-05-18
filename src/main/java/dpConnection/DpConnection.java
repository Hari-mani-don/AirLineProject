package dpConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DpConnection {

	public static Connection getConnection() {
		Connection con = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");// com.mysql.cj.jdbc.Driver
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline", "root", "root");

		} catch (SQLException | ClassNotFoundException e) {

			System.out.println(e);
		}
		return con;
	}

}
