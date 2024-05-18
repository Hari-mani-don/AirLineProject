<%@page import="modelClass.Flight"%>
<%@page import="java.util.List"%>
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
	if (authentication == null) {
		response.sendRedirect("login.jsp");
	}

	List<Flight> flightList = (List<Flight>) session.getAttribute("flightList1");
	%>
	<div class="datas">
		<div class="datas1">
			<div class="container card allinputs">
				<h1>Add Flight</h1>
				<form action="adminAddFlightData" class="needs-validation"
					method="post">
					<div class="form-group">
						<label for="validationServer10">id</label> <input type="number"
							class="form-control" id="validationServer10" name="id" required>

					</div>
					<div class="form-group">
						<label for="validationServer01">FlightNumber</label> <input
							type="text" class="form-control" id="validationServer01"
							name="fNumber" required autofocus>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a FlightNumber.</div>
					</div>
					<div class="form-group">
						<label for="validationServer02">FlightName</label> <input
							type="text" class="form-control" id="validationServer02"
							name="fName" required autofocus>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a FlightName.</div>
					</div>
					<div class="form-group">
						<label for="validationServer03">FlightSource</label> <input
							type="text" class="form-control" id="validationServer03"
							name="fSource" required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a FlightSource.</div>
					</div>
					<div class="form-group">
						<label for="validationServer04">FlightDestination</label> <input
							type="text" class="form-control" id="validationServer04"
							name="fDestination" required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please enter a
							FlightDestination.</div>
					</div>
					<div class="form-group">
						<label for="validationServer012">FlightTime</label> <input
							type="time" class="form-control" id="validationServer04"
							name="fTime" required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a FlightTime.</div>
					</div>
					<div class="form-group">
						<label for="validationServer04">FlightAmount</label> <input
							type="number" class="form-control" id="validationServer04"
							name="fAmount" required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a FlightAmount.</div>
					</div>


					<button class="mt-5 mb-2 pr-2 btn btn-primary" type="submit">Add
						Flight</button>
					<a href="adminPage.jsp" class="mt-5 mb-2  btn btn-primary">Home</a>
				</form>
			</div>
		</div>

		<div class="datas2">
			<div class="col">
				<div class="table-wrapper">
					<table class="table table-bordered">
						<thead>
							<th>
							<tr>
								<th>id</th>
								<th>Flight Number</th>
								<th>Flight Name</th>
								<th>Flight Source</th>
								<th>FlightDestination</th>
								<th>Flight Amount</th>
								<th>Flight Time</th>

							</tr>
							</th>
						</thead>
						<tbody>

							<%
							for (Flight flight : flightList) {
							%>

							<tr>
								<td><%=flight.getId()%></td>
								<td><%=flight.getFlightNumber()%></td>
								<td><%=flight.getFlightName()%></td>
								<td><%=flight.getFlightsource()%></td>
								<td><%=flight.getFlightdestination()%></td>
								<td><%=flight.getFlightAmount()%></td>
								<td><%=flight.getFlightTimes()%></td>

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
	<script src="/w3School/airline/js/bootstrap.min.js">
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
