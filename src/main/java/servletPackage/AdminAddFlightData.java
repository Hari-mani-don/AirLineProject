package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import dpConnection.DpConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelClass.Flight;

@WebServlet("/adminAddFlightData")
public class AdminAddFlightData extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		try (PrintWriter out = response.getWriter();) {
			
			int flightId = Integer.parseInt(request.getParameter("id")) ;
			String flightNumber = request.getParameter("fNumber").trim();
			String flightName = request.getParameter("fName").trim();
			String flightSource = request.getParameter("fSource").trim();
			String flightDestination = request.getParameter("fDestination").trim();
			String flightTime = request.getParameter("fTime").trim();
			double flightAmount = Double.parseDouble(request.getParameter("fAmount").trim());

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			int rs = stm.executeUpdate(
					"INSERT INTO FlightDetails (FlightNumber, FlightName, FlightSource, FlightDestination, FlightTime, FlightAmount) VALUES ('"
							+ flightNumber + "','" + flightName + "','" + flightSource + "','" + flightDestination
							+ "','" + flightTime + "','" + flightAmount + "')");
			List<Flight> flightList = (List<Flight>) request.getSession(false).getAttribute("flightList1");
		
			Flight flight = new Flight();
			flight.setFlightAmount(flightAmount);
			flight.setFlightName(flightName);
			flight.setFlightNumber(flightNumber);
			flight.setFlightsource(flightSource);
			flight.setFlightdestination(flightDestination);
			flight.setFlightTimes(flightTime);
			flight.setId(flightId);
			
			flightList.add(flight);

			if (rs == 1) {
				response.sendRedirect("adminFlightDataInsert.jsp");

			}

		} catch (SQLException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
