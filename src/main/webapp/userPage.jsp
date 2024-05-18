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
<link rel="stylesheet" href="userPage.css">
<style>
body {
	background-image: url("./images/airplane.avif");
	background-repeat: no-repeat;
	background-size: cover;
}

/* Additional custom styles */
.navbar-nav .nav-link.active {
	color: blue;
	font-weight: 900;
	/* Changes the color of the active nav link to blue and increases font weight */
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="userPage.jsp">Mani Plane</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse lists" id="navbarNavDropdown">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link " aria-current="page"
						href="userPage.jsp" onclick="changeActiveLink(this)">Home</a></li>

					<li class="nav-item"><a class="nav-link" href="planesServlet"
						onclick="changeActiveLink(this)">Planes</a></li>
					
					<li class="nav-item"><a class="nav-link" href="JourneyDetailsDataBaseServlet"
						onclick="changeActiveLink(this)">Journey Details</a></li>
				</ul>
			</div>
			<div>
				<ul class="navbar-nav ml-auto Profile nav-link">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
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
	<script src="./js/bootstrap.bundle.min.js">
		function changeActiveLink(link) {
			// Remove 'active' class from all nav links
			var navLinks = document.querySelectorAll('.navbar-nav .nav-link');
			navLinks.forEach(function(navLink) {
				navLink.classList.remove('active');
			});

			// Add 'active' class to the clicked nav link
			link.classList.add('active');
		}
	</script>
</body>
</html>
