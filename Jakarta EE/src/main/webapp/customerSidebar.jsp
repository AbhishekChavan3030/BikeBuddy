<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap"
	rel="stylesheet">
<title>Customer Sidebar</title>
<style>
body{
	font-family: "Quicksand", sans-serif;
	font-optical-sizing: auto;
	font-weight: 600;
	font-style: normal;
	font-family: "Quicksand", sans-serif;
}

#csidebar {
	width: 10vw;
	height:fit-content;
	margin-block: 30px;
	margin-right: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 10px;
	border-radius: 0px 10px 10px 0px;
	box-shadow: inset 16px -20px 184px 13px green;
}

#cusername {
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	width: 100%;
	margin: 10px;
}

#cinfoimage {
	display: flex;
	align-items: center;
	height: 100%;
	width: 50%;
}

#cinfoimage img {
	object-fit: contain;
	width: 90%;
	height: 100%;
	border-radius: 50%;
}

#coptioncontainer {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#coptioncontainer>form {
	margin-block: 10px;
	width: 100%;
}

#coptioncontainer button {
	width: 100%;
	padding-inline: 10px;
	padding-block: 10px;
	border-radius: 5px;
	border: none;
	
}
#btn{
font-family: "Quicksand", sans-serif;
	font-optical-sizing: auto;
	font-weight: 600;
	font-style: normal;
	font-family: "Quicksand", sans-serif;
}
#btn:hover{
background-color:green;
color:white;
}
</style>

</head>
<body>

	<%
	if (session.getAttribute("usercustomer") == null) {
		response.sendRedirect("customerLogin.jsp");
	}
	String user = (String) session.getAttribute("usercustomer");
	%>

	<div id="csidebar">
		<div id="cusername">
			<div id="cinfoimage">
				<img
					src="https://img.freepik.com/premium-photo/stylish-man-flat-vector-profile-picture-ai-generated_606187-310.jpg"
					alt="LOGO">
			</div>

			<h2><%=user.toUpperCase()%></h2>
		</div>

		<div id="coptioncontainer">

			<form action="customerProfile.jsp">
				<button type="submit" id="btn">Profile</button>
			</form>

			<form action="customerBooking" method="post">
				<button type="submit" id="btn">Book Service</button>
			</form>

			<form action="bike">
				<button type="submit" id="btn">Bike Details</button>
			</form>


			<form action="viewMyServices" method="post">
				<button type="submit" id="btn">View My Services</button>
			</form>

			<form action="searchParts" method="post">
				<button type="submit" id="btn">Search Parts</button>
			</form>

			<form action="customerHome.jsp">
				<button type="submit" id="btn">Home</button>
			</form>
		</div>
	</div>

</body>
</html>
