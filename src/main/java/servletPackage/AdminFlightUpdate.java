package servletPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelClass.AdminUpdate;
import modelClass.Flight;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dpConnection.DpConnection;

@WebServlet("/AdminFlightUpdate")
public class AdminFlightUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {
			int id = Integer.parseInt(request.getParameter("id"));

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from FlightDetails");

			while (rs.next()) {

				String FlightNumber = rs.getString("FlightNumber");
				String FlightName = rs.getString("FlightName");
				String FlightSource = rs.getString("FlightSource");
				String FlightDestination = rs.getString("FlightDestination");
				String FlightTime = rs.getString("FlightTime");
				double FlightAmount = rs.getInt("FlightAmount");

				if (rs.getInt("id") == id) {
					HttpSession session1 = request.getSession();

					Flight flight = new Flight();

					flight.setId(id);
					flight.setFlightAmount(FlightAmount);
					flight.setFlightdestination(FlightDestination);
					flight.setFlightName(FlightName);
					flight.setFlightNumber(FlightNumber);
					flight.setFlightTimes(FlightTime);
					flight.setFlightsource(FlightSource);

					session1.setAttribute("adminFlightUpdate", flight);
					response.sendRedirect("adminFlightDataUpdate.jsp");
					
				}

			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
