package servletPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dpConnection.DpConnection;

@WebServlet("/TicketCancelledServlet")
public class TicketCancelledServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter();) {

			int id = Integer.parseInt(request.getParameter("id"));

			Connection con = DpConnection.getConnection();
			Statement stm = con.createStatement();
			String query = "update JourneyDetails set Process=? where JourneyDetailsid=?";
			PreparedStatement stm1 = con.prepareStatement(query);
			stm1.setString(1, "cancelled");
			stm1.setInt(2, id);

			stm1.executeUpdate();
			
			

			response.sendRedirect("JourneyDetailsDataBaseServlet");

		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
