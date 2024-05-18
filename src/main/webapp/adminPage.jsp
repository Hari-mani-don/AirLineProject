<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mani Plane</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<!-- Font Awesome for icons (you can replace this with any icon library) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- <link rel="stylesheet" href="/w3School/userPage/userpage.css"> -->
<style>
body {
	background-image: url("./images/airplane.avif");
	background-repeat: no-repeat;
	background-size: cover;
}
/* Additional custom styles */
.navbar-nav .nav-link.active {
	color: black;
	font-weight: 900;
	/* Changes the color of the active nav link to blue and increases font weight */
}

/* Style for dropdowns */
.dropdown-toggle::after {
	display: inline-block;
	margin-left: .255em;
	vertical-align: .255em;
	content: "";
	border-top: .3em solid;
	border-right: .3em solid transparent;
	border-bottom: 0;
	border-left: .3em solid transparent;
}

.dropdown-menu {
	border-radius: 0;
	margin-top: 0;
}

.Profile.dropdown-toggle::after {
	display: none; /* Hide the arrow for the profile dropdown */
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="adminPage.jsp">Mani Plane</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse lists" id="navbarNavDropdown">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a class="nav-link "
						aria-current="page" href="adminPage.jsp"
						onclick="changeActiveLink(this)">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink1" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Users </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink1">
							<li><a class="dropdown-item" href="adminInsertDataPage.jsp"
								onclick="changeActiveLink(this)">add User</a></li>
							<li><a class="dropdown-item" href="adminUpdateUser.jsp"
								onclick="changeActiveLink(this)">update user</a></li>
							<li><a class="dropdown-item" href="adminDeletPage.jsp"
								onclick="changeActiveLink(this)">delete user</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="planesServlet"
						id="navbarDropdownMenuLink2" role="button"
						data-bs-toggle="dropdown" > Planes </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink2">
							<li><a class="dropdown-item" href="adminFlightDataInsert.jsp"
								onclick="changeActiveLink(this)">add Plane</a></li>
							<li><a class="dropdown-item" href="adminFlightDataUpdate.jsp"
								onclick="changeActiveLink(this)">update Plane</a></li>
							<li><a class="dropdown-item" href="adminFlightDelete.jsp"
								onclick="changeActiveLink(this)">delete Plane</a></li>
						</ul></li>
					<!-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink3" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Tickets </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink3">
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">add ticket</a></li>
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">update ticket</a></li>
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">delete ticket</a></li>
						</ul></li> -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink4" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Turn Over </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink4">
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">Per day</a></li>
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">Per month</a></li>
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">Per Year</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink4" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Day TurnOVer </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink4">
							<li><a class="dropdown-item" href="#"
								onclick="changeActiveLink(this)">Select date</a></li>
						</ul></li>
				</ul>
			</div>
			<div>
				<ul class="navbar-nav ml-auto Profile nav-link">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle Profile" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fas fa-user-circle"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">My Profile</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="logOutServlet">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Bootstrap JS -->
	<script src="./js/bootstrap.bundle.min.js"></script>
	<script>
		function changeActiveLink(link) {
			// Remove 'active' class from all nav links within the dropdown menu
			var parentDropdown = link.closest('.dropdown-menu');
			if (parentDropdown) {
				var navLinks = parentDropdown
						.querySelectorAll('.dropdown-item');
				navLinks.forEach(function(navLink) {
					navLink.classList.remove('active');
				});
			} else {
				// Remove 'active' class from all nav links
				var navLinks = document
						.querySelectorAll('.navbar-nav .nav-link');
				navLinks.forEach(function(navLink) {
					navLink.classList.remove('active');
				});
			}

			// Add 'active' class to the clicked nav link
			link.classList.add('active');
		}
	</script>
</body>
</html>
