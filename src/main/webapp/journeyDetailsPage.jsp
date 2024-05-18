<%@page import="modelClass.JourneyDetails"%>
<%@page import="modelClass.TicketBooking"%>
<%@page import="java.util.List"%>
<%@page import="modelClass.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JourneyDetails</title>
<link rel="stylesheet" href="./css/bootstrap.css">
</head>
<body>
	<%
	Login authentication = (Login) session.getAttribute("userEmail");
	if (authentication == null) {
		response.sendRedirect("login.jsp");
	}
	List<JourneyDetails> journeyDetails = (List<JourneyDetails>) session.getAttribute("journeyList");
	%>
	<div class="container">
		<div class="row mt-5">
			<%
			for (JourneyDetails journey : journeyDetails) {
			%>
			<!-- Left card -->
			<div class="col-md-5 mb-4">
				<div class="card custom-card">
					<div class="card-body">
						<h5 class="card-title">Journey Details</h5>
						<table class="table">
							<tr>
								<td><strong>User Name:</strong></td>
								<td><%=journey.getUserName()%></td>
							</tr>
							<tr>
								<td><strong>Flight Name:</strong></td>
								<td><%=journey.getFlightName()%></td>
							</tr>
							<tr>
								<td><strong>Destination:</strong></td>
								<td><%=journey.getDestination()%></td>
							</tr>
							<tr>
								<td><strong>Source:</strong></td>
								<td><%=journey.getSource()%></td>
							</tr>
							<tr>
								<td><strong>Amount:</strong></td>
								<td>$<%=journey.getAmount()%></td>
							</tr>
							<tr>
								<td><strong>Flight Number:</strong></td>
								<td><%=journey.getFlightNumber()%></td>
							</tr>
							<tr>
								<td><strong>Time:</strong></td>
								<td><%=journey.getTime()%></td>
							</tr>
							<tr>
								<td><strong>Ticket:</strong></td>
								<td><%=journey.getProcess()%></td>
							</tr>
						</table>
						<%
						if (journey.getProcess().equals("booked")) {
						%>

						<a href="TicketCancelledServlet?id=<%=journey.getId()%>"
							class="btn btn-danger">cancel</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
