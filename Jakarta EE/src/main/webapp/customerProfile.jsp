<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<style>
#ccprofile {
	display: flex;
}

#cinforContainer {
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	
	display:flex;
	align-items:center;
	justify-content:center;
}

table {
	width: 90%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

#btn1 {
	width: fit-content;
	padding-inline: 10px;
	padding-block: 10px;
	border-radius: 5px;
	border: none;
}

#btn1:hover {
	background-color: green;
	color: white;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("usercustomer") == null) {
		response.sendRedirect("customerLogin.jsp");
	}
	%>

	<jsp:include page="customerHeader.jsp"></jsp:include>

	<div id="ccprofile">
		<jsp:include page="customerSidebar.jsp"></jsp:include>
		<div id="cinforContainer">

			<table>
				<tr>
					<th>Name</th>
					<td>${fname}${lname}</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>${email}</td>
				</tr>
				<tr>
					<th>Contact</th>
					<td>${mobile}</td>
				</tr>
				<tr>
					<th>Address</th>
					<td>${address}</td>
				</tr>
				<tr>
					<th>Date of Birth</th>
					<td>${dob}</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center; margin-inline:20px;">
						<button type="submit" onclick="location='customerUpdate.jsp'" id="btn1">Update</button>
						<button type="button" onclick="location='customerHome.jsp'" id="btn1">Home</button>
					</td>
					
				</tr>
			</table>
		</div>
	</div>

</body>
</html>