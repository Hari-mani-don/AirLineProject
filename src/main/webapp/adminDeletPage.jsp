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
	AdminUpdate adminUpdate = (AdminUpdate) session.getAttribute("adminUpdate");

	Connection con = DpConnection.getConnection();
	Statement stm = con.createStatement();
	ResultSet rs = stm.executeQuery("select * from airlineRegistration");
	%>
	<div class="datas2">
		<div class="col">
			<div class="table-wrapper">
				<table class="table table-bordered">
					<thead>
						<th>
						<tr>

							<th></th>
							<th>id</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>user Name</th>
							<th>Password</th>
							<th>Email</th>
							<th>DOB</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Mobile Number</th>
							<th>Address</th>
							<th>city</th>
							<th>State</th>
							<th>Pincode</th>
						</tr>
						</th>
					</thead>
					<tbody>

						<%
						while (rs.next()) {
						%>

						<tr>
							<td><a class="btn btn-danger" href="adminDeleteDataServlet?id=<%=rs.getInt("id")%>">Delete</td>
							<td><%=rs.getInt("id")%></a></td>
							<td><%=rs.getString("FirstName")%></td>
							<td><%=rs.getString("LastName")%></td>
							<td><%=rs.getString("UserName")%></td>
							<td><%=rs.getString("Password")%></td>
							<td><%=rs.getString("Email")%></td>
							<td><%=rs.getString("DOB")%></td>
							<td><%=rs.getInt("Age")%></td>
							<td><%=rs.getString("Gender")%></td>
							<td><%=rs.getLong("MobileNumber")%></td>
							<td><%=rs.getString("Address")%></td>
							<td><%=rs.getString("City")%></td>
							<td><%=rs.getString("State")%></td>
							<td><%=rs.getLong("PinCode")%></td>
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