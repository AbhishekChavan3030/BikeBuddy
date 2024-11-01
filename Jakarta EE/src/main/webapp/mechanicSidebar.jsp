<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Options</title>
<style>
* {
	margin: 0%;
	padding: 0%;
}

body {
	overflow: hidden;
	font-family: "Quicksand", sans-serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
	font-family: "Quicksand", sans-serif;
}

#sidebar {
	box-shadow: inset 78px 12px 110px 27px #4f4fa1;
	width: fit-content;
	height: 95vh;
	background-color: lightblue;
	padding: 20px;
	border-radius: 0px 10px 10px 0px;
	margin-block: 30px;
	height: 45vh;
	margin-right: 20px;
}

#info {
	width: 100%;
	height: 20%;
	display: flex;
	align-items: center;
	padding: 0%;
	gap: 10px;
}

#info img {
	width: 100%;
	height: 100%;
	object-fit: contain;
	border-radius: 50%;
}

#sidebaroptions {
	display: flex;
	flex-direction: column;
	padding: 10px;
}

#sidebaroptions>form {
	display: flex;
	flex-direction: column;
}

#sidebaroptions>input {
	padding: 10px;
	margin: 5px;
	border-radius: 5px;
}

#sidebaroptions form>input {
	padding: 10px;
	margin: 5px;
	border-radius: 5px;
}

#logoutbtn {
	display: flex;
	justify-content: center;
	margin: 0%;
	padding: 0%;
}

#input3 {
	border: none;
	font-family: "Quicksand", sans-serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
}

#input3:hover {
	background-color: lightblue;
}
</style>
</head>
<body>
	<%
	if ((String) session.getAttribute("usermechanic") == null) {
		response.sendRedirect("mechanicLogin.jsp");
	}
	String user = (String) session.getAttribute("usermechanic");
	%>



	<div id="sidebar">
		<div id="info">
			<img
				src="https://img.freepik.com/premium-photo/stylish-man-flat-vector-profile-picture-ai-generated_606187-310.jpg"
				alt="img" />
			<h2><%=user.toUpperCase()%></h2>
		</div>

		<div id="sidebaroptions">
			<input type="button" value="Dashboard" name="dashboard"
				onclick="location='mechanicHome.jsp'" id="input3"> <input
				type="button" value="Profile" name="profile"
				onclick="location='mechanicProfile.jsp'" id="input3">


			<form method="post" action="mechanicBookings">
				<input type="submit" value="Bookings" name="bookings" id="input3">
			</form>

			<form action="fetchpart" method="post">
				<input type="submit" value="Parts" name="parts" id="input3">
			</form>
			<form>
				<input type="button" value="Specialization" name="specialization"
					onclick="location='mechanicSpecialization.jsp'" id="input3">
			</form>

		</div>

		<div id="logoutbtn">
			<jsp:include page="mechanicLogout.jsp" />
		</div>
	</div>
</body>
</html>