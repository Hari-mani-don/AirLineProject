<%@page import="modelClass.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Flight Ticket Booking</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
</style>
</head>
<body>
	<% 
Login login = (Login) session.getAttribute("userEmail");
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String amount = request.getParameter("amount");
String time = request.getParameter("time");
String flightNumber = request.getParameter("flightNumber");
String flightName = request.getParameter("flightName");

%>
	<div class="container">
		<h2 class="mt-4 mb-4">Flight Ticket Booking</h2>
		<form action="TicketBookingServlet" method="post" id="bookingForm">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="fullName">Full Name:</label> <input type="text"
						class="form-control" id="fullName" name="fullName" required>
				</div>
				<div class="form-group col-md-6">
					<label for="animal">Your Favourit animal:</label> <input type="text"
						class="form-control" id="animal" name="animal" required>
				</div>

			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="phone">Phone Number:</label> <input type="tel"
						class="form-control" id="phone" name="phone" pattern="[0-9]{10}"
						required>
				</div>
				<div class="form-group col-md-6">
					<label for="panCard">PAN Card Number:</label> <input type="text"
						class="form-control" id="panCard" name="panCard" required>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="aadhaar">Aadhaar Number:</label> <input type="tel"
						class="form-control" id="aadhaar" name="aadhaar"
						pattern="[0-9]{12}" required>
				</div>
				<div class="form-group col-md-6">
					<label for="passport">Passport Number:</label> <input type="number"
						class="form-control" id="passport" name="passport" required>
				</div>

			</div>
			<div class="form-row">
				<label for="email"></label> <input type="hidden"
					class="form-control" id="email" name="email"
					value="<%=login.getEmail() %>" required> <input
					type="hidden" class="form-control" id="destination"
					name="destination" value="<%=destination %>" required> <input
					type="hidden" class="form-control" id="source" name="source"
					value="<%=source %>" required> <input type="hidden"
					class="form-control" id="amount" name="amount" value="<%=amount %>"
					required> <input type="hidden" class="form-control"
					id="time" name="time" value="<%=time %>" required> <input
					type="hidden" class="form-control" id="flightNumber"
					name="flightNumber" value="<%=flightNumber %>" required> <input
					type="hidden" class="form-control" id="flightName"
					name="flightName" value="<%=flightName %>" required> <input
					type="hidden" class="form-control" id="source" name="source"
					value="<%=source %>" required>

			</div>
			<button type="submit" class="btn btn-primary">Book Ticket</button>
		</form>
	</div>


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
