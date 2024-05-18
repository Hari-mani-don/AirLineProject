package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dpConnection.DpConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelClass.Login;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {

			String userName = request.getParameter("user-email");
			String userPassword = request.getParameter("password");

			Login loginUser = new Login(userName, userPassword);

			HttpSession session1 = request.getSession(true);
			session1.setAttribute("userEmail", loginUser);

			if (userName.equals("admin@gmail.com") && userPassword.equals("admin@123")) {

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminFlightDataBaseServlet");
				requestDispatcher.forward(request, response);

			} else {
				Connection con = DpConnection.getConnection();
				Statement stm = con.createStatement();
				ResultSet rs = stm.executeQuery("select * from airlineRegistration");

				int loginCheckFlag = 0;
				while (rs.next()) {
					String name = rs.getString("Email");
					String password = rs.getString("Password");

					if (name.equals(userName) && password.equals(userPassword)) {
						loginCheckFlag = 1;
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("userPage.jsp");
						requestDispatcher.forward(request, response);
					}
				}
				if (loginCheckFlag == 0) {
					response.sendRedirect("login.jsp");
				}
			}

		} catch (SQLException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
