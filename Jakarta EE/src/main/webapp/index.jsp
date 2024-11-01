<%@ page language="java" contentType="text/html charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BikeBuddy</title>
<style>
* {
	margin: 0%;
}

form {
	height: 100vh;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-image: url('./assets/kat-sazonova-4ORysIjH-mY-unsplash.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

#container {
	width: 40%;
	height: 50%;
	background-color: rgba(0, 0, 0, 0, 0.1);
	backdrop-filter: blur(8px);
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 20px;
	border: 1px solid gray;
}

#container input {
	border: 1px solid white;
	color: white;
	background-color: red;
	padding: 10px;
	border-radius: 8px;
	font-size: 20px;
}
</style>
</head>

<body>

	<form>

		<div id="container">
			<input type="button" value="I am Mechanic"
				onclick="location='mechanicLogin.jsp'"> <input type="button"
				value="I am Customer" onclick="location='customerLogin.jsp'">
		</div>
	</form>
</body>
</html>