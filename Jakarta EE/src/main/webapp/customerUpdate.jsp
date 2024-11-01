<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<style>

</style>
</head>
<body>
	<%
	if (session.getAttribute("usercustomer") == null) {
		response.sendRedirect("customerLogin.jsp");
	}
	%>
	<jsp:include page="customerHeader.jsp"></jsp:include>

	<section>

		<div>
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</div>
		<form action="customerUpdate" method="get" style="border:1px solid black; height:100%">
			<input type="text" placeholder=${fname } name="fname" required>
			<input type="text" placeholder=${ lname } name="lname" required>
			<input type="email" placeholder=${ email} name="email" required>
			<input type="number" placeholder=${mobile } name="mobile" required>
			<input type="text" placeholder=${address } name="address" required>
			<input type="date" placeholder=${dob } name="dob" required>
			<button type="submit" style="margin-block:10px;">Update</button>
			<button onclick="location='customerProfile.jsp'">Cancel</button>

		</form>
	</section>

</body>
</html>