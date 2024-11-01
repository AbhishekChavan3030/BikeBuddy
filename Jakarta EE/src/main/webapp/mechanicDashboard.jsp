<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
#dashboardcontaianer {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	box-shadow: inset -9px 1px 20px 6px lightblue;
	justify-content: center;
	border-radius: 10px;
}

#bikeimage {
	display: flex;
	height: 49%;
	justify-content: center;
	align-items: center;
}

#bikeimage img {
	height: 40%;
	width: 38%;
	object-fit: contain;
}

#usercontainer {
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 49%;
	align-items: center;
}

#usercontainer h2 {
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<%
	if ((String) session.getAttribute("usermechanic") == null) {
		response.sendRedirect("mechanicLogin.jsp");
	}
	String username = (String) session.getAttribute("usermechanic");
	%>

	<div id="dashboardcontaianer">
		<div id="bikeimage">
			<img src="./assets/bike.png" alt="BIKE"> <img
				src="./assets/logocopy.png" alt="logo">
		</div>

		<div id="usercontainer">
			<h1>
				WELCOME BACK
				<%=username.toUpperCase()%></h1>
			<%
			Integer bookingCount = (Integer) session.getAttribute("bookingCount");
			Integer partCount = (Integer) session.getAttribute("partCount");
			%>

			<h2>
				You Have
				<%=bookingCount != null ? bookingCount : 0%>
				new Bookings and
				<%=partCount != null ? partCount : 0%>
				Parts Available

			</h2>

		</div>
	</div>


</body>
</html>