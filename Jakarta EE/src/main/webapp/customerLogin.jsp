<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
<style>
* {
	margin: 0%;
	padding: 0%;
}

#loginform {
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
<form action="clogin" method="post" id="loginform" >
		<div id="container">
			<input type="text" placeholder="Username" name="username" required> 
			<input type="password" placeholder="Password" name=password required> 
			<input type="reset" value="Reset" id="input5"> 
			<input type="submit" value="Login" id="input5">
			<h2>or</h2>
			<input type="button" value="Create Account" onclick="location='customerSignup.jsp'" id="input5">
			<input type="button" value="Home" onclick="location='index.jsp'" id="input5">
		</div>
	</form>
</body>
</html>