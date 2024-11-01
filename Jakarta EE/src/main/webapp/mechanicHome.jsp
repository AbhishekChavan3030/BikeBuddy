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
<title>Mechanic Home</title>

<style>
body {
	font-family: "Quicksand", sans-serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
}

#home {
	display: flex;
}

#section {

	display: flex;
	justify-content: center;
	align-items: center;
	width: 87%;
	height: 80vh;
	margin: 10px;
}
</style>
</head>
<body>
	<%
	if ((String) session.getAttribute("usermechanic") == null) {
		response.sendRedirect("mechanicLogin.jsp");
	}
	%>
	<jsp:include page="mechanicHeader.jsp"></jsp:include>
	<div id="home">
		<jsp:include page="mechanicSidebar.jsp"></jsp:include>
		<section id="section">
			<jsp:include page="mechanicDashboard.jsp"></jsp:include>
		</section>
	</div>

</body>
</html>