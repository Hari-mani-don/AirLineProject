package servletPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/adminDeleteDataServlet")
public class AdminDeleteDataServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter();) {

			int correspondingId = Integer.parseInt(request.getParameter("id"));
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline", "root", "root");
			Statement stm1 = con.createStatement();
			Statement stm = con.createStatement();
			ResultSet result = stm1.executeQuery("Select * from airlineRegistration");
			Integer id = null;
			while (result.next()) {
				if (result.getInt("id") == correspondingId) {
					
					id = stm.executeUpdate("delete from airlineRegistration where id=" + correspondingId);
					break;
				}
			}

			if (id == 1) {
				response.sendRedirect("adminDeletPage.jsp");
			} else {
				response.sendRedirect("adminDeletPage.jsp");
			}

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
