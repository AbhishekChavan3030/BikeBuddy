<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="bikebuddy.FetchBookings"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Service</title>
<style>
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

#viewbookingcontainer {
	display: flex;
}

#viewbookingcc {
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
}

#btn4 {
	width: fit-content;
	padding-inline: 10px;
	padding-block: 10px;
	border-radius: 5px;
	border: none;
}

#btn4:hover {
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
	List<FetchBookings> fetchBookingsList = (List<FetchBookings>) session.getAttribute("FetchBookings");
	if (fetchBookingsList != null && !fetchBookingsList.isEmpty()) {
	%>

	<jsp:include page="customerHeader.jsp"></jsp:include>
	<div id="viewbookingcontainer">
		<div id="customerSidebarcontainer">
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</div>
		<div id="viewbookingcc">
			<table>
				<thead>
					<tr>
						<th>Customer Name</th>
						<th>Customer Mobile</th>
						<th>Customer Email</th>
						<th>Mechanic Name</th>
						<th>Mechanic Mobile</th>
						<th>Mechanic Email</th>
						<th>Booking Type</th>
						<th>Bike</th>
						<th>Booking Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (FetchBookings booking : fetchBookingsList) {
					%>
					<tr>
						<form action="cancelBooking" method="post">
							<td><input type="hidden" value="<%=booking.getCfname()%>"
								name="cfname"> <input type="hidden"
								value="<%=booking.getClname()%>" name="clname">
								<p><%=booking.getCfname()%>
									<%=booking.getClname()%></p></td>
							<td><input type="hidden" value="<%=booking.getCmobile()%>"
								name="cmobile">
								<p><%=booking.getCmobile()%></p></td>
							<td><input type="hidden" value="<%=booking.getCemail()%>"
								name="cemail">
								<p><%=booking.getCemail()%></p></td>
							<td><input type="hidden" value="<%=booking.getMfname()%>"
								name="mfname"> <input type="hidden"
								value="<%=booking.getMlname()%>" name="mlname">
								<p><%=booking.getMfname()%>
									<%=booking.getMlname()%></p></td>
							<td><input type="hidden" value="<%=booking.getMmobile()%>"
								name="mmobile">
								<p><%=booking.getMmobile()%></p></td>
							<td><input type="hidden" value="<%=booking.getMemail()%>"
								name="memail">
								<p><%=booking.getMemail()%></p></td>
							<td><input type="hidden" value="<%=booking.getBooktype()%>"
								name="booktype">
								<p><%=booking.getBooktype()%></p></td>
							<td><input type="hidden" value="<%=booking.getBike()%>"
								name="bike">
								<p><%=booking.getBike()%></p></td>
							<td><input type="hidden"
								value="<%=booking.getBookingdate()%>" name="bookingdate">
								<p><%=booking.getBookingdate()%></p></td>
							<td><input type="submit" value="Cancel" id="btn4"></td>
						</form>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<%
	} else {
	%>

	<jsp:include page="customerHeader.jsp"></jsp:include>
	<div id="viewbookingcontainer">
		<div id="customerSidebarcontainer">
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</div>
		<div id="viewbookingcc">
			<table>
				<thead>
					<tr>
						<th>Customer Name</th>
						<th>Customer Mobile</th>
						<th>Customer Email</th>
						<th>Mechanic Name</th>
						<th>Mechanic Mobile</th>
						<th>Mechanic Email</th>
						<th>Booking Type</th>
						<th>Bike</th>
						<th>Booking Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="10"><h2>No bookings found.</h2></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<%
	}
	%>

</body>
</html>
