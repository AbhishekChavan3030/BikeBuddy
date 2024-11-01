<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./cssFiles/mProfile.css" type="text/css">
<meta charset="UTF-8">

<style>
#profile {
	display: flex;
}

#profilecontainer p {
	padding-block: 20px;
}

#profilecontainer input {
	padding-block: 10px;
	padding-inline: 30px;
	background-color: blue;
	color: white;
	border-radius: 5px;
	border: none;
	font-family: "Quicksand", sans-serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
	font-family: "Quicksand", sans-serif;
}

#profilecontainer input:hover {
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}

#profile>#profilecontainer {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 87%;
	height:80vh;
	
	margin: 10px;

	box-shadow: inset -9px 1px 20px 6px lightblue;
	justify-content: center;
	border-radius: 10px;
}
</style>

<title>Profile</title>
</head>
<body>
	<%
	if ((String) session.getAttribute("usermechanic") == null) {
		response.sendRedirect("mechanicLogin.jsp");
	}
	String username = (String) session.getAttribute("usermechanic");
	%>

	<jsp:include page="mechanicHeader.jsp"></jsp:include>
	<div id="profile">

		<jsp:include page="mechanicSidebar.jsp"></jsp:include>

		<div id="profilecontainer">
			<h1>Profile Information</h1>
			<br>
			<p>
				<strong>First Name:</strong> ${fname}
			</p>
			<p>
				<strong>Last Name:</strong> ${lname}
			</p>
			<p>
				<strong>Mobile:</strong> ${mobile}
			</p>
			<p>
				<strong>Email:</strong> ${email}
			</p>
			<p>
				<strong>Address:</strong> ${address}
			</p>
			<p>
				<strong>Date of Birth:</strong> ${dob}
			</p>
			<div>
				<input type="button" value="Update"
					onclick="location='mechanicUpdateInfo.jsp'">
			</div>
		</div>




	</div>


</body>
</html>