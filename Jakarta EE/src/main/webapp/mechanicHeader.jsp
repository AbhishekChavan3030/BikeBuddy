<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mechanic Nav</title>
<style>
#mechanicnav {

	display: flex;
	box-sizing: border-box;
	box-shadow: inset 78px 12px 110px 27px #4f4fa1;
	width: 100%;
	align-items: center;
	justify-content: space-between;
	background-color: green;
}

#mechanicnav>h1 {
	margin: 20px;
	padding-right: 30px;
	color: white;
}

#mechanicnav>#logo {
	width: 10%;
	height: 6vh;
	margin: 20px;
	padding-left: 30px;
}

#logo>img {
	width: 90%;
	height: 100%;
	object-fit: contain;
	filter drop-shadow(2px 4px 6px white);
	
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
	<nav id="mechanicnav">
		<div id="logo">
			<img src="./assets/logocopy.png" alt="BikeBuddy">
		</div>
		<h1>
			WELCOME BACK
			<%=user.toUpperCase()%>
		</h1>
	</nav>

</body>
</html>