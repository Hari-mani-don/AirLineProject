package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dpConnection.DpConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelClass.Flight;

@WebServlet("/planesServlet")
public class PlanesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter();) {

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from FlightDetails");

			List<Flight> flightList = new ArrayList<Flight>();
			while (rs.next()) {

				Flight flight = new Flight();
				int id = rs.getInt("id");
				String flightNumber = rs.getString("FlightNumber");
				String flightName = rs.getString("FlightName");
				String flightSource = rs.getString("FlightSource");
				String flightDestination = rs.getString("FlightDestination");
				String flightTime = rs.getString("FlightTime");
				double flightAmount = rs.getDouble("FlightAmount");

				flight.setId(id);
				flight.setFlightNumber(flightNumber);
				flight.setFlightName(flightName);
				flight.setFlightsource(flightSource);
				flight.setFlightdestination(flightDestination);
				flight.setFlightTimes(flightTime);
				flight.setFlightAmount(flightAmount);

				flightList.add(flight);

			}

			HttpSession session = request.getSession(true);
			session.setAttribute("flightList", flightList);
			if (!flightList.isEmpty()) {
				response.sendRedirect("PlanesPage.jsp");
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

	}

}
