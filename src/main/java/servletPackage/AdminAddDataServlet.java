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
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/adminAddDataServlet")
public class AdminAddDataServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		
		try (PrintWriter out = response.getWriter();) {
			
		
			String firstName = request.getParameter("fName").trim();
			
			String lastName = request.getParameter("lName").trim();
			String userName = request.getParameter("userName").trim();
			String password = request.getParameter("password").trim();
			String email = request.getParameter("email").trim();
			int age = Integer.parseInt(request.getParameter("age").trim());
			String gender = request.getParameter("Gender").trim();
			String dob = request.getParameter("dob").trim();
			long mobileNumber = Long.parseLong(request.getParameter("mobileNumber").trim());
			String city = request.getParameter("city").trim();
			String state = request.getParameter("state").trim();
			String address = request.getParameter("address").trim();
			long pincode = Long.parseLong(request.getParameter("pincode").trim());

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline", "root", "root");
			Statement stm = con.createStatement();
			int rs = stm.executeUpdate(
				    "INSERT INTO airlineRegistration (FirstName, LastName, UserName, Password, Email, DOB, Age, Gender, MobileNumber, Address, City, State, PinCode) VALUES ('"
				    + firstName + "','" + lastName + "','" + userName + "','" + password + "','" + email + "','" + dob + "','" + age + "','" + gender + "', '" + mobileNumber + "','" + address + "','" + city + "','" + state + "','" + pincode + "')");


			if (rs == 1) {
				out.println("sucess");
				response.sendRedirect("adminInsertDataPage.jsp");

			} else {
				out.println("Data not inserted try again!!");
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
