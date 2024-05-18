package servletPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dpConnection.DpConnection;

@WebServlet("/AdminUpdateFlightData")
public class AdminUpdateFlightData extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter();) {

			int id = Integer.parseInt(request.getParameter("id"));
			String FlightNumber = request.getParameter("FlightNumber");
			String FlightName = request.getParameter("FlightName");
			String FlightSource = request.getParameter("FlightSource");
			String FlightDestination = request.getParameter("FlightDestination");
			String FlightTime = request.getParameter("FlightTime");
			double FlightAmount = Double.parseDouble(request.getParameter("FlightAmount"));

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from FlightDetails");
			int result = 0;
			while (rs.next()) {
				if (rs.getInt("id") == id) {
					String query = "update FlightDetails set id=?, FlightNumber=?,FlightName=?, FlightSource=?,FlightDestination=?, FlightTime=?, FlightAmount=? where id=?";
					PreparedStatement stm1 = con.prepareStatement(query);

					stm1.setInt(1, id);
					stm1.setString(2, FlightNumber);
					stm1.setString(3, FlightName);
					stm1.setString(4, FlightSource);
					stm1.setString(5, FlightDestination);
					stm1.setString(6, FlightTime);
					stm1.setDouble(7, FlightAmount);
					stm1.setLong(8, id);

					result = stm1.executeUpdate();
					break;
				}
			}

			if (result == 1) {
				response.sendRedirect("adminFlightDataUpdate.jsp");
				request.getSession(true).setAttribute("adminFlightUpdate", null);

			}

		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
