package dpConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dpConnection.DpConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelClass.JourneyDetails;
import modelClass.Login;

@WebServlet("/JourneyDetailsDataBaseServlet")
public class JourneyDetailsDataBaseServlet extends HttpServlet {
	List<JourneyDetails> journeyLists;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		journeyLists = new ArrayList<JourneyDetails>();

		try (PrintWriter out = response.getWriter();) {
			Login login = (Login) request.getSession(false).getAttribute("userEmail");

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from JourneyDetails");
			while (rs.next()) {

				String UserName = rs.getString("UserName");
				String FlightNumber = rs.getString("FlightNumber");
				String FlightName = rs.getString("FlightName");
				String Destination = rs.getString("Destination");
				String Source = rs.getString("Source");
				String Time = rs.getString("Time");
				String email = rs.getString("email");
				String Process = rs.getString("Process");
				double Amount = rs.getDouble("Amount");
				int id = rs.getInt("JourneyDetailsid");

				if (email.equals(login.getEmail())) {

					JourneyDetails journey = new JourneyDetails();

					journey.setAmount(Amount);
					journey.setDestination(Destination);
					journey.setEmail(email);
					journey.setFlightName(FlightName);
					journey.setFlightNumber(FlightNumber);
					journey.setProcess(Process);
					journey.setSource(Source);
					journey.setTime(Time);
					journey.setUserName(UserName);
					journey.setId(id);

					journeyLists.add(journey);

				}

			}

			if (!journeyLists.isEmpty()) {
				HttpSession session1 = request.getSession(true);
				session1.setAttribute("journeyList", journeyLists);
				response.sendRedirect("journeyDetailsPage.jsp");

			}
		} catch (SQLException e) {
			System.out.println(e);
		}

	}

}
