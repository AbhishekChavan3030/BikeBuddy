<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>customer logout</title>
<style>
#logout {
	padding-inline:10px;
	padding-block:8px;
	color:white;
	border: 1px solid black;
	border-radius: 5px;
	box-shadow: inset 16px -20px 184px 13px green;
}
#logout:hover {

	color:white;
	border: 2px solid black;
	border-radius: 5px;
	box-shadow: inset 16px -20px 184px 13px darkgreen;
}
</style>
</head>
<body>
	<form action="cLogout" method="get">
		<input type="submit" value="LogOut" id="logout">
	</form>
</body>
</html>