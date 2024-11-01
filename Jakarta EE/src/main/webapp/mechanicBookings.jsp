<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="bikebuddy.Booking"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookings</title>

<style>
* {
	margin: 0;
	padding: 0;
}

#bookings {
	display: flex;
}

table {
	width: 85%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	border: 1px solid black;
	text-align: center;
}

#bookinglist {
	width: 87%;
	height: 80vh;
	box-shadow: inset -9px 1px 20px 6px lightblue;
	border-radius: 10px;
	margin: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#bookinglist #input {
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

#bookinglist #input:hover {
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}
</style>

</head>
<body>
	<%
	if (session.getAttribute("usermechanic") == null) {
		response.sendRedirect("mechanicLogin.jsp");
		return;
	}
	%>

	<jsp:include page="mechanicHeader.jsp"></jsp:include>

	<div id="bookings">
		<div>
			<jsp:include page="mechanicSidebar.jsp"></jsp:include>
		</div>

		<div id="bookinglist">
			<h1 style="margin-bottom: 10px">My Bookings</h1>
			<table>
				<thead>
					<tr>
						<th>Booking Type</th>
						<th>Email</th>
						<th>Date</th>
						<th>Mobile Number</th>
						<th>Name</th>
						<th>Bike</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Booking> bookings = (List<Booking>) session.getAttribute("bookings");
					if (bookings != null && !bookings.isEmpty()) {
						for (Booking booking : bookings) {
					%>
					<tr>
						<form action="mechaniccancelbooking" method="post">
							<td>
								<p><%=booking.getBookingType()%></p> <input type="hidden"
								value="<%=booking.getBookingType()%>" name="booktype">
							</td>
							<td>
								<p><%=booking.getCustomerEmail()%></p> <input type="hidden"
								value="<%=booking.getCustomerEmail()%>" name="customerEmail">
							</td>
							<td>
								<p><%=booking.getBookingDate()%></p> <input type="hidden"
								value="<%=booking.getBookingDate()%>" name="bookingDate">
							</td>
							<td>
								<p><%=booking.getCustomerMobile()%></p> <input type="hidden"
								value="<%=booking.getCustomerMobile()%>" name="customerMobile">
							</td>
							<td>
								<p><%=booking.getCustomerName()%></p> <input type="hidden"
								value="<%=booking.getCustomerName()%>" name="customerName">
							</td>
							<td>
								<p><%=booking.getBike()%></p> <input type="hidden"
								value="<%=booking.getBike()%>" name="bike">
							</td>
							<td><input type="submit" value="Cancel Booking" id="input"></td>
						</form>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="7">No bookings available.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
