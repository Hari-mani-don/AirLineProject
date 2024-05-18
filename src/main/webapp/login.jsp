<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="login.css">

</head>
<body>
	<div class="login card">

		<form action="LoginServlet" class="mt-3" method="post">
			<div class="mt-1 mb-3 ml-2">
				<input type="email" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" name="user-email"
					placeholder="example@gmail.com" required="required">
			</div>
			<div class="mb-3">
				<input type="password" class="form-control"
					id="exampleInputPassword1" name="password"
					placeholder="***********" required="required">
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
			<div class="mb-3 Forgotten">
				<a href="">Forgotten password?</a>
			</div>
			<div class="button">
				<a class="btn btn-primary create-btn" href="registration.jsp">Create
					new account</a>
			</div>
		</form>	

	</div>
</body>
</html>
