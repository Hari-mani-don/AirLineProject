package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelClass.TicketBooking;

@WebServlet("/TicketBookingServlet")
public class TicketBookingServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter();) {

			String fullName = request.getParameter("fullName").trim();

			String panCard = request.getParameter("panCard").trim();
			long phone = Long.parseLong(request.getParameter("phone").trim());
			String email = request.getParameter("email").trim();
			long aadhaar = Long.parseLong(request.getParameter("aadhaar").trim());
			String passport = request.getParameter("passport").trim();
			String source = request.getParameter("source").trim();
			String destination = request.getParameter("destination").trim();
			double amount = Double.parseDouble(request.getParameter("amount").trim());
			String time = request.getParameter("time").trim();
			String flightNumber = request.getParameter("flightNumber").trim();
			String flightName = request.getParameter("flightName").trim();

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline", "root", "root");
			Statement stm = con.createStatement();
			int rs = stm.executeUpdate(
					"INSERT INTO ticketBooking (fullName, panCard, phone, email, aadhaar, destination, source, passport,flightName,flightNumber,time,amount) VALUES ('"
							+ fullName + "','" + panCard + "','" + phone + "','" + email + "','" + aadhaar + "','"
							+ destination + "','" + source + "','" + passport + "','" + flightName + "','"
							+ flightNumber + "','" + time + "','" + amount + "')");

			Statement stm1 = con.createStatement();
			int result = stm1.executeUpdate(
					"INSERT INTO JourneyDetails (UserName, FlightNumber, FlightName, Destination, Source, Amount, Time, email) VALUES ('"
							+ fullName + "','" + flightNumber + "','" + flightName + "','" + destination + "','"
							+ source + "','" + amount + "','" + time + "','" + email + "')");
			
			response.sendRedirect("JourneyDetailsDataBaseServlet");

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
