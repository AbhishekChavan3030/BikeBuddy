<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
<style>
#ccHome {
	display: flex;
}

#ccchome {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
}

#homecontainer {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#homecontainer li {
	list-style: none;
	margin-block: 15px;
	border: .2px solid green;
	padding: 5px;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#imageofbike {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 60%;
	height: 50%;
	margin-block: 30px;
}

#imageofbike img {
	height: 80%;
	width: 45%;
	margin-inline: 20px;
	object-fit: contain;
}
</style>
</head>
<body>
	<%
	String user = (String) session.getAttribute("usercustomer");
	if (user == null) {
		response.sendRedirect("customerLogin.jsp");
		return; // Ensure to return after redirecting
	}
	%>

	<jsp:include page="customerHeader.jsp"></jsp:include>
	<div id="ccHome">
		<aside>
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</aside>
		<div id="ccchome">
			<div id="homecontainer">

				<div id="imageofbike">
					<img src="./assets/bike.png" alt="BIKE"> <img
						src="./assets/logocopy.png" alt="logo">
				</div>
				<h2>
					Welcome To BikeBuddy,
					<%=user.toUpperCase()%></h2>
				<p>As a valued customer, you can:</p>
				<ul>
					<li>Book a service</li>
					<li>Cancel a service</li>
					<li>Buy parts for your bike</li>
					<li>Add bike details</li>
					<li>Remove bike details</li>
					<li>Search for services according to your bike</li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>
