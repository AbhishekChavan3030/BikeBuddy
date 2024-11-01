<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bikebuddy.Mechanic"%>
<%@ page import="bikebuddy.Specialization"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking</title>
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

#bookingcontainer {
	display: flex;
}

#ccbook {
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
}

#btn2 {
	width: fit-content;
	padding-inline: 10px;
	padding-block: 10px;
	border-radius: 5px;
	border: none;
}

#btn2:hover {
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

	<div id="bookingcontainer">
		<div>
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</div>

		<div id="ccbook">
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Contact Details</th>
						<th>Address</th>
						<th>Specialization</th>
						<th>Book</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<Mechanic> mechanicList = (ArrayList<Mechanic>) session.getAttribute("mechanicslist");
					if (mechanicList != null) {
						for (Mechanic m : mechanicList) {
					%>

					<tr>
						<form action="bookMechanic" method="POST">
							<td>
								<p><%=m.getFname()%>
									<%=m.getLname()%></p> <input type="hidden"
								value="<%=m.getFname()%>" name="mfname"> <input
								type="hidden" value="<%=m.getLname()%>" name="mlname">
							</td>
							<td>
								<p><%=m.getMobile()%>
									|
									<%=m.getEmail()%></p> <input type="hidden"
								value="<%=m.getMobile()%>" name="mobile"> <input
								type="hidden" value="<%=m.getEmail()%>" name="email">
							</td>
							<td>
								<p><%=m.getAddress()%></p> <input type="hidden"
								value="<%=m.getAddress()%>" name="address">
							</td>

							<td><input type="hidden" name="mechanicId"
								value="<%=m.getUsername()%>"> <select
								name="specialization">
									<optgroup label="Repair Types">
										<%
										ArrayList<Specialization> specializationList = (ArrayList<Specialization>) session.getAttribute("specializationlist");
										if (specializationList != null) {
											for (Specialization s : specializationList) {
												if (m.getUsername().equals(s.getUsername())) {
										%>
										<option value="Engine"><%=s.getRepairTypeEngine()%></option>
										<option value="Electrical"><%=s.getRepairTypeElectrical()%></option>
										<option value="Brake"><%=s.getRepairTypeBrake()%></option>
										<option value="Suspension"><%=s.getRepairTypeSuspension()%></option>
										<option value="Tyre"><%=s.getRepairTypeTyre()%></option>
										<option value="Frame"><%=s.getRepairTypeFrame()%></option>
										<%
										}
										}
										}
										%>
									</optgroup>
									<optgroup label="Bike Types">
										<option value="Yamaha R15">Yamaha R15</option>
										<option value="Yamaha MT15">Yamaha MT15</option>
										<option value="Honda CB Hornet">Honda CB Hornet</option>
										<option value="Honda CBR 250R">Honda CBR 250R</option>
										<option value="Bajaj Pulsar 220">Bajaj Pulsar 220</option>
										<option value="Bajaj Dominar 400">Bajaj Dominar 400</option>
									</optgroup>
							</select></td>
							<td>
								<button type="submit" id="btn2">Book</button>
							</td>
						</form>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="5">No Mechanic available.</td>
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
