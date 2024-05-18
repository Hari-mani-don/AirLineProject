<%@page import="java.util.ArrayList"%>
<%@page import="dpConnection.DpConnection"%>
<%@page import="modelClass.Flight"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelClass.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Planes</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<style>
/* Custom CSS */
.custom-card {
	border: 1px solid #dee2e6;
	border-radius: 0.25rem;
	margin-bottom: 20px;
}

.card-body {
	max-height: 200px; /* Adjust the maximum height as needed */
	overflow: auto;
	/* Add scrollbar if content exceeds the maximum height */
}
/* Custom CSS */
.seat {
	width: 50px;
	height: 50px;
	background-color: #ccc;
	border: 1px solid #aaa;
	margin: 5px;
	display: inline-block;
	text-align: center;
	line-height: 50px;
}

.available {
	background-color: #28a745;
	color: #fff;
}

.unavailable {
	background-color: #dc3545;
	color: #fff;
}
</style>
</head>
<body>
	<%
	Login authentication = (Login) session.getAttribute("userEmail");
	ArrayList<Flight> flights = (ArrayList<Flight>) session.getAttribute("flightList");
	if (authentication == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<%
	int flag = 0;
	for (Flight flightList : flights) {

		if (flag == 0) {
			flag = 1;
	%>


	<div class="container">
		<div class="row mt-5">
			<!-- Left card -->
			<div class="col-md-5">
				<div class="card custom-card">
					<img src="./images/airplane2.jpg" class="card-img-top"
						alt="Left Card Image">
					<div class="card-body">
						<h5 class="card-title"><%=(flightList.getFlightName())%></h5>
						<p class="card-text">
							<strong>Flight Number:</strong>
							<%=flightList.getFlightNumber()%><br> <strong>Destination:</strong>
							<%=flightList.getFlightdestination()%><br> <strong>Source:</strong>
							<%=flightList.getFlightsource()%><br> <strong>Amount:</strong>
							$<%=flightList.getFlightAmount()%><br> <strong>Distance
								(km):</strong> 4000<br> <strong>Speed:</strong> 800 km/h<br> <strong>Time:</strong><%=flightList.getFlightTimes()%><br>
						</p>
						<a
							href="ticketBookingPage.jsp?flightName=<%=flightList.getFlightName()%>&source=<%=flightList.getFlightsource()%>&destination=<%=flightList.getFlightdestination()%>&amount=<%=flightList.getFlightAmount()%>&time=<%=flightList.getFlightTimes()%>&flightNumber=<%=flightList.getFlightNumber()%>"
							class="btn btn-primary">Book Tickets</a> 
							<a
							id="showSeatsBtn<%=flightList.getId()%>"
							class="btn btn-secondary">Seats Check</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<div class="col-md-6"></div>
			<%
			if (flag == 1) {
				flag = 0;
			%>
		</div>
		<div class="row mt-5">
			<div class="col-md-6"></div>
			<!-- Right card -->
			<div class="col-md-5">
				<div class="card custom-card">
					<img src="./images/airplane2.jpg" class="card-img-top"
						alt="Left Card Image">
					<div class="card-body">
						<h5 class="card-title"><%=(flightList.getFlightName())%></h5>
						<p class="card-text">
							<strong>Destination:</strong>
							<%=flightList.getFlightdestination()%><br> <strong>Source:</strong>
							<%=flightList.getFlightsource()%><br> <strong>Amount:</strong>
							$<%=flightList.getFlightAmount()%><br> <strong>Distance
								(km):</strong> 4000<br> <strong>Speed:</strong> 800 km/h<br> <strong>Time:</strong><%=flightList.getFlightTimes()%><br>
						</p>
						<a href="#" class="btn btn-primary">BooK Tickets</a> <a
							id="showSeatsBtn" class="btn btn-secondary">Show seats</a>
					</div>
				</div>
			</div>
			<div class="col-md-6"></div>
		</div>



	</div>
	<%
	}
	%>
	<%
	}
	%>

	<script>
		// Mock data for available seats
		var availableSeats = [ {
			seatNumber : 'A1',
			available : true
		}, {
			seatNumber : 'A2',
			available : false
		}, {
			seatNumber : 'A3',
			available : true
		}, {
			seatNumber : 'A4',
			available : false
		}, {
			seatNumber : 'B1',
			available : true
		}, {
			seatNumber : 'B2',
			available : false
		}, {
			seatNumber : 'B3',
			available : true
		}, {
			seatNumber : 'B4',
			available : true
		}, {
			seatNumber : 'C1',
			available : false
		}, {
			seatNumber : 'C2',
			available : true
		}, {
			seatNumber : 'C3',
			available : false
		}, {
			seatNumber : 'C4',
			available : true
		}, ];

		var availableSeats2 = [ {
			seatNumber : 'A1',
			available : true
		}, {
			seatNumber : 'A2',
			available : false
		}, {
			seatNumber : 'A3',
			available : true
		}, {
			seatNumber : 'A4',
			available : false
		}, {
			seatNumber : 'B1',
			available : true
		}, {
			seatNumber : 'B2',
			available : false
		}, {
			seatNumber : 'B3',
			available : true
		}, {
			seatNumber : 'B4',
			available : true
		}, {
			seatNumber : 'C1',
			available : false
		}, {
			seatNumber : 'C2',
			available : true
		}, {
			seatNumber : 'C3',
			available : false
		}, {
			seatNumber : 'C4',
			available : true
		}, ];

		// Function to display available seats
		function showAvailableSeats() {
			var seatsContainer = document.createElement('div');
			seatsContainer.classList.add('row', 'mt-3');
			seatsContainer.id = 'seatsContainer'; // Add id for future reference

			availableSeats.forEach(function(seat) {
				var seatElement = document.createElement('div');
				seatElement.textContent = seat.seatNumber;
				seatElement.classList.add('seat');
				if (seat.available) {
					seatElement.classList.add('available');
				} else {
					seatElement.classList.add('unavailable');
				}
				seatsContainer.appendChild(seatElement);
			});

			var button = document.getElementById('showSeatsBtn2');
			button.parentNode.insertBefore(seatsContainer, button.nextSibling);
		}
		function showAvailableSeats1() {
			var seatsContainer = document.createElement('div');
			seatsContainer.classList.add('row', 'mt-3');
			seatsContainer.id = 'seatsContainer'; // Add id for future reference

			availableSeats.forEach(function(seat) {
				var seatElement = document.createElement('div');
				seatElement.textContent = seat.seatNumber;
				seatElement.classList.add('seat');
				if (seat.available) {
					seatElement.classList.add('available');
				} else {
					seatElement.classList.add('unavailable');
				}
				seatsContainer.appendChild(seatElement);
			});

			var button = document.getElementById('showSeatsBtn1');
			button.parentNode.insertBefore(seatsContainer, button.nextSibling);
		}

		// Event listener for button click to show available seats
		document.getElementById('showSeatsBtn2').addEventListener('click',
				function() {
					showAvailableSeats();
				});
		document.getElementById('showSeatsBtn1').addEventListener('click',
				function() {
					showAvailableSeats1();
				});
	</script>

</body>
</html>
