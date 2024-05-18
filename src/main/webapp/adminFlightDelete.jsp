<%@page import="modelClass.Flight"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dpConnection.DpConnection"%>
<%@page import="modelClass.Login"%>
<%@page import="modelClass.AdminUpdate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./registration.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
.datas2 {
	overflow: auto;
}
</style>
</head>
<body>

	<%
	Login authentication = (Login) session.getAttribute("userEmail");

	if (authentication == null) {
		response.sendRedirect("login.jsp");
	}
	Flight adminUpdate = (Flight) session.getAttribute("adminFlightUpdate");

	Connection con = DpConnection.getConnection();
	Statement stm = con.createStatement();
	ResultSet rs = stm.executeQuery("select * from FlightDetails");
	%>
	<div class="datas2">
		<div class="col">
			<div class="table-wrapper">
				<table class="table table-bordered">
					<thead>
					
						<tr>

							<th></th>
							<th>id</th>
							<th>Flight Number</th>
							<th>Flight Name</th>
							<th>Flight Source</th>
							<th>FlightDestination</th>
							<th>Flight Amount</th>
							<th>Flight Time</th>

						</tr>
						
					</thead>
					<tbody>

						<%
						while (rs.next()) {
						%>

						<tr>
							<td><a class="btn btn-danger"
								href="AdminFlightDeleteServlet?id=<%=rs.getInt("id")%>">Delete</a></td>
							<td><%=rs.getInt("id")%></td>
							<td><%=rs.getString("FlightNumber")%></td>
							<td><%=rs.getString("FlightName")%></td>
							<td><%=rs.getString("FlightSource")%></td>
							<td><%=rs.getString("FlightDestination")%></td>
							<td><%=rs.getString("FlightTime")%></td>
							<td><%=rs.getString("FlightAmount")%></td>
							
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>