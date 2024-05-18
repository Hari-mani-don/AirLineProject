<%@page import="modelClass.Flight"%>
<%@page import="modelClass.AdminUpdate"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dpConnection.DpConnection"%>
<%@page import="modelClass.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./registration.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body {
	height: 100vh;
	width: 100vw;
}

.datas {
	display: flex;
	width: 100%;
	height: 100%;
	margin-left: 100px;
	content: normal;
	overflow: auto;
	margin-left: 100px;
}

.datas1 {
	width: 50%;
	overflow: auto;
}

.allinputs {
	width: 80%;
}

.datas2 {
	height: auto;
	width: 50%;
	overflow: auto;
	width: 50%;
}
</style>
</head>
<body>


	<%
	Login authentication = (Login) session.getAttribute("userEmail");
	session.setAttribute("userEmail", authentication);
	if (authentication == null) {
		response.sendRedirect("login.jsp");
	}
	Flight adminUpdate = (Flight) session.getAttribute("adminFlightUpdate");

	Connection con = DpConnection.getConnection();
	Statement stm = con.createStatement();
	ResultSet rs = stm.executeQuery("select * from FlightDetails");
	%>
	<div class="datas">
		<div class="datas1">
			<div class="container card allinputs">
				<h1>Update Form</h1>
				<form action="AdminUpdateFlightData" class="needs-validation"
					method="post">
					<div class="form-group">
						<label for="validationServer10">id</label> <input type="number"
							class="form-control" id="validationServer10" name="id"
							value="<%=(adminUpdate != null && adminUpdate.getId() != 0) ? adminUpdate.getId() : ""%>"
							readonly="readonly" required>

					</div>
					<div class="form-group">
						<label for="validationServer01">Flight Name</label> <input
							type="text" class="form-control" id="validationServer01"
							name="FlightName"
							value="<%=(adminUpdate != null && adminUpdate.getFlightName() != null) ? adminUpdate.getFlightName() : ""%>"
							required autofocus>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Flight Name.</div>
					</div>
					<div class="form-group">
						<label for="validationServer02">Flight Number</label> <input
							type="text" class="form-control" id="validationServer02"
							name="FlightNumber"
							value="<%=(adminUpdate != null && adminUpdate.getFlightNumber() != null) ? adminUpdate.getFlightNumber() : ""%>"
							required autofocus>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Flight Number.</div>
					</div>
					<div class="form-group">
						<label for="validationServer03">Source</label> <input type="text"
							class="form-control" id="validationServer03" name="FlightSource"
							value="<%=(adminUpdate != null && adminUpdate.getFlightsource() != null) ? adminUpdate.getFlightsource() : ""%>"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Source.</div>
					</div>
					<div class="form-group">
						<label for="validationServer04">Destination</label> <input
							type="text" class="form-control" id="validationServer04"
							name="FlightDestination"
							value="<%=(adminUpdate != null && adminUpdate.getFlightdestination() != null) ? adminUpdate.getFlightdestination() : ""%>"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please enter a Destination.</div>
					</div>
					<div class="form-group">
						<label for="validationServer012">Flight Time</label> <input
							type="time" class="form-control" id="validationServer04"
							name="FlightTime"
							value="<%=(adminUpdate != null && adminUpdate.getFlightTimes() != null) ? adminUpdate.getFlightTimes() : ""%>"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Flight Time.</div>
					</div>

					<div class="form-group">
						<label for="validationServer05">Amount</label> <input
							type="number" class="form-control" id="validationServer05"
							name="FlightAmount"
							value="<%=(adminUpdate != null && adminUpdate.getFlightAmount() != 0) ? adminUpdate.getFlightAmount() : ""%>"
							 required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Amount.</div>
					</div>


					<button class=" mt-3 mb-3 btn btn-primary" type="submit">Update</button>
					<a href="adminPage.jsp" class="mt-3 mb-3 btn btn-primary">Home</a>
				</form>
			</div>
		</div>

		<div class="datas2">
			<div class="col">
				<div class="table-wrapper">
					<table class="table table-bordered">
						<thead>

							<tr>
								<th></th>
								<th>id</th>
								<th>Flight Name</th>
								<th>Flight Number</th>
								<th>Source</th>
								<th>Destination</th>
								<th>Flight Time</th>
								<th>Amount</th>

							</tr>

						</thead>
						<tbody>

							<%
							while (rs.next()) {
							%>

							<tr>
								<td><a class="btn btn-success"
									href="AdminFlightUpdate?id=<%=rs.getInt("id")%>"> Edit</a></td>
								<td><%=rs.getInt("id")%></td>
								<td><%=rs.getString("FlightName")%></td>
								<td><%=rs.getString("FlightNumber")%></td>
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
	</div>

	<!-- Bootstrap JS (optional if you have JavaScript features) -->
	<script src="/w3School/airline/js/bootstrap.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Get all input fields that require dynamic validation
			const inputFields = document.querySelectorAll('.form-control');

			// Add event listener for input event to each input field
			inputFields.forEach(function(inputField) {
				inputField.addEventListener('input', function(event) {
					// Check if the input field is valid
					if (inputField.validity.valid) {
						// Add the 'is-valid' class
						inputField.classList.add('is-valid');
						// Remove the 'is-invalid' class if present
						inputField.classList.remove('is-invalid');
					} else {
						// Add the 'is-invalid' class
						inputField.classList.add('is-invalid');
						// Remove the 'is-valid' class if present
						inputField.classList.remove('is-valid');
					}
				});
			});

			// Add event listener for form submission
			document.querySelector('form').addEventListener('submit',
					function(event) {
						// Prevent form submission if any input field is invalid
						if (!this.checkValidity()) {
							event.preventDefault();
							event.stopPropagation();
						}

						// Add 'was-validated' class to show validation styles
						this.classList.add('was-validated');
					});
		});
	</script>
</body>
</html>
