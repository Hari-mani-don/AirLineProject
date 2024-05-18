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
	
	Connection con = DpConnection.getConnection();
	Statement stm = con.createStatement();
	ResultSet rs = stm.executeQuery("select * from airlineRegistration");
	%>
	<div class="datas">
		<div class="datas1">
			<div class="container card allinputs">
				<h1>Add User </h1>
				<form action="adminAddDataServlet" class="needs-validation"
					method="post">
					<div class="form-group">
						<label for="validationServer10">id</label> <input type="number"
							class="form-control" id="validationServer10" name="id"
							
						readonly="readonly"	required>

					</div>
					<div class="form-group">
						<label for="validationServer01">First Name</label> <input
							type="text" class="form-control" id="validationServer01"
							name="fName"
							required autofocus>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a FistName.</div>
					</div>
					<div class="form-group">
						<label for="validationServer02">LastName</label> <input
							type="text" class="form-control" id="validationServer02"
							name="lName"
							required autofocus>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a LastName.</div>
					</div>
					<div class="form-group">
						<label for="validationServer03">Username</label> <input
							type="text" class="form-control" id="validationServer03"
							name="userName"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a username.</div>
					</div>
					<div class="form-group">
						<label for="validationServer04">Password</label> <input
							type="password" class="form-control" id="validationServer04"
							name="password"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please enter a password.</div>
					</div>
					<div class="form-group">
						<label for="validationServer012">Email</label> <input type="email"
							class="form-control" id="validationServer04" name="email"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a email.</div>
					</div>
					<div class="form-group">
						<label for="validationServer04">DOB</label> <input type="date"
							class="form-control" id="validationServer04" name="dob"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a DOB.</div>
					</div>
					<div class="form-group">
						<label for="validationServer05">Age</label> <input type="number"
							class="form-control" id="validationServer05" name="age"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Age.</div>
					</div>
					<div class="form-group Gender">
						<label for="Male">Gender</label> <input type="radio" id="Male"
							name="Gender" value="Male"
							checked required> <label for="Male">Male</label> <input
							type="radio" id="Female" name="Gender" value="Female"
							required> <label for="Female">Female</label>

					</div>
					<div class="form-group">
						<label for="validationServer07">MobileNumber</label> <input
							type="tel" class="form-control" id="validationServer07"
							name="mobileNumber" pattern="[0-9]{10}"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a MobileNumber.</div>
					</div>
					<div class="form-group">
						<label for="validationServer08">Address</label> <input type="text"
							class="form-control" id="validationServer08" name="address"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Address.</div>
					</div>
					<div class="form-group">
						<label for="validationServer09">City</label> <input type="text"
							class="form-control" id="validationServer09" name="city"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a City.</div>
					</div>
					<div class="form-group">
						<label for="validationServer10">State</label> <input type="text"
							class="form-control" id="validationServer10" name="state"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a State.</div>
					</div>
					<div class="form-group">
						<label for="validationServer11">Pincode</label> <input type="number"
							class="form-control" id="validationServer11" name="pincode"
							required>
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Please choose a Pincode.</div>
					</div>

					<button class="mt-5 mb-2 pr-2 btn btn-primary" type="submit">Add</button>
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
								<td><%=rs.getInt("id")%></td>
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
