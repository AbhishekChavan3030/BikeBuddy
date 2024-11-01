<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	overflow: hidden;
}

* {
	padding: 0%;
	margin: 0%;
}

#logo {
	
	height: 60px;
	width: fit-content;
	padding: 15px;

}

#logo img {
	height: 100%;
	width: 100%;
	object-fit: cover;
}

nav {
	box-shadow: inset 16px -20px 184px 13px green;
	display: flex;
	align-items: center;
	justify-content : space-around;
	

}
</style>
<title>Customer Header</title>
</head>
<body>
	<nav>
		<div id="logo">
			<img src="./assets/logocopy.png" alt="Logo">
		</div>
		<jsp:include page="customerLogout.jsp"></jsp:include>
	</nav>
</body>
</html>