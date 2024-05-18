package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

@WebServlet("/adminDataUpdateServlet")
public class AdminDataUpdatServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter();) {

			int id = Integer.parseInt(request.getParameter("id"));
			String firstName = request.getParameter("fName");
			String lastName = request.getParameter("lName");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("Gender");
			String dob = request.getParameter("dob");
			long mobileNumber = Long.parseLong(request.getParameter("mobileNumber"));
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String address = request.getParameter("address");
			long pincode = Long.parseLong(request.getParameter("pincode"));

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from airlineRegistration");
			int result = 0;
			while (rs.next()) {
				if (rs.getInt("id") == id) {
					String query = "update airlineRegistration set id=?, FirstName=?,LastName=?, UserName=?,Password=?, Email=?, Age=?,Gender=?,DOB=? , MobileNumber=?, City=?, State=?, Address=?, PinCode=? where id=?";
					PreparedStatement stm1 = con.prepareStatement(query);

					stm1.setInt(1, id);
					stm1.setString(2, firstName);
					stm1.setString(3, lastName);
					stm1.setString(4, userName);
					stm1.setString(5, password);
					stm1.setString(6, email);
					stm1.setInt(7, age);
					stm1.setString(8, gender);
					stm1.setString(9, dob);
					stm1.setLong(10, mobileNumber);
					stm1.setString(11, city);
					stm1.setString(12, state);
					stm1.setString(13, address);
					stm1.setLong(14, pincode);
					stm1.setLong(15, id);

					result = stm1.executeUpdate();
					break;
				}
			}

			if (result == 1) {
				response.sendRedirect("adminUpdateUser.jsp");
				request.getSession(true).setAttribute("adminUpdate", null);
			}

		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
