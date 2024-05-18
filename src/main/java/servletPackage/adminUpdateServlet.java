package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dpConnection.DpConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelClass.AdminUpdate;

@WebServlet("/adminUpdateServlet")
public class adminUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {
			int id = Integer.parseInt(request.getParameter("id"));

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from airlineRegistration");

			while (rs.next()) {

				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String userName = rs.getString("UserName");
				String password = rs.getString("Password");
				String email = rs.getString("Email");
				int age = rs.getInt("Age");
				String gender = rs.getString("Gender");
				String dob = rs.getString("DOB");
				long mobileNumber = rs.getLong("MobileNumber");
				String city = rs.getString("City");
				String state = rs.getString("State");
				String address = rs.getString("Address");
				long pincode = rs.getLong("PinCode");
				if (rs.getInt("id") == id) {
					HttpSession session1 = request.getSession();
					AdminUpdate adminUpdate = new AdminUpdate(id, firstName, lastName, userName, password, email, age,
							gender, dob, mobileNumber, city, state, address, pincode);
					session1.setAttribute("adminUpdate", adminUpdate);
					response.sendRedirect("adminUpdateUser.jsp");
				}

			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
