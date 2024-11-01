<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0%;
	padding: 0%;
}

#signform {
	height: 100vh;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: darkslategray;
}

#container h2 {
	flex: 1 1 100%;
	text-align: center;
}

#container {
	backdrop-filter: blur(15px);
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	justify-content: space-between;
	padding: 20px;
	border-radius: 15px;
	max-width: 30%;
	border: 1px solid white;
}

#container input {
	border: 1px solid white;
	color: white;
	background-color: darkslategray;
	padding: 10px;
	border-radius: 8px;
	font-size: 20px;
	flex: 1 1 45%;
}

#input5:hover {
	background-color: teal;
}
</style>
</head>
<body>
	<form action="msignup" method="post" id="signform">
		<div id="container">

			<input type="text" placeholder="First Name" name="fname" required>
			<input type="text" placeholder="Last Name" name="lname" required>
			<input type="tel" placeholder="Mobile Number" name="mobile" required
				pattern="[0-9]{10}"> <input type="email"
				placeholder="Email Id" name="email" required> <input
				type="text" placeholder="Address" name="address" required> <input
				type="date" name="dob" placeholder="YYYY-MM-DD" /> <input
				type="text" placeholder="Username" name="username" required>
			<input type="password" placeholder="Password" name=password required>

			<input type="reset" value="Reset" id="input5"> <input type="submit"
				value="Create" id="input5">
			<h2>or</h2>
			<input type="button" value="Login"
				onclick="location='mechanicLogin.jsp'" id="input5"> <input type="button"
				value="Home" onclick="location='index.jsp'" id="input5">
		</div>
	</form>
</body>
</html>