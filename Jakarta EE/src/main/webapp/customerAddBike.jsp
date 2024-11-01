<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bike Details</title>
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

#bikecontainer {
	display: flex;
}

#addbikecontainer {
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
}

#bikeaddfrom {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 70%;
	height: 70%;
}

#bikeaddfrom input {
	padding: 5px;
	margin-block: 10px;
}

#btn3 {
	width: fit-content;
	border-radius: 5px;
	border: none;
}

#btn3:hover {
	background-color: green;
	color: white;
}
</style>
</head>
<body>


	<%
	if (session.getAttribute("model") == null) {
	%><jsp:include page="customerHeader.jsp"></jsp:include>
	<div id="bikecontainer">
		<div><jsp:include page="customerSidebar.jsp"></jsp:include></div>
		<div id="addbikecontainer">
			<form action="bike" method="post" id="bikeaddfrom">
				<h1>No Bikes Added</h1>

				<h2>Enter Information of Your Bike</h2>
				<input type="text" placeholder="Model" name="model" required>
				<input type="text" placeholder="Series" name="series" required>
				<input type="text" placeholder="Brand" name="brand" required>
				<input type="text" placeholder="Engine (in cc. i.e. 200cc)"
					name="engine" required> <input type="text"
					placeholder="Purchase Year" name="year" required> <input
					type="text" placeholder="Last 4 Digit of Chassis" name="chassis"
					required> <input type="text"
					placeholder="Vehicle Registration Number" name="reg" required>

				<div>
					<input type="reset" value="Reset" id="btn3"
						style="padding-inline: 10px; padding-block: 10px;"> <input
						type="submit" value="Add" id="btn3" style="padding-inline: 10px; padding-block: 10px;">
				</div>

				<div>
					<input type="button" value="Home"
						onclick="location='customerHome.jsp'" id="btn3" style="padding-inline: 10px; padding-block: 10px;">
				</div>
			</form>
		</div>
	</div>


	<%
	} else {
	%>
	<jsp:include page="customerHeader.jsp"></jsp:include>


	<div id="bikecontainer">
		<div><jsp:include page="customerSidebar.jsp"></jsp:include></div>
		<div id="addbikecontainer">
			<table>
				<tr>
					<th>Model</th>
					<td>${model}</td>
				</tr>
				<tr>
					<th>Brand</th>
					<td>${brand}</td>
				</tr>
				<tr>
					<th>Series</th>
					<td>${series}</td>
				</tr>
				<tr>
					<th>Year</th>
					<td>${year}</td>
				</tr>
				<tr>
					<th>Engine (cc)</th>
					<td>${engine}</td>
				</tr>
				<tr>
					<th>Chassis Number</th>
					<td>xxxx-xxxx-${chassis}</td>
				</tr>
				<tr>
					<th>Registration Number</th>
					<td>${reg}</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="button" value="Home" onclick="location='customerHome.jsp'"
						id="btn3" style="padding-inline: 10px; padding-block: 10px;">
						<form action="removeBike" method="post" style="display: inline;">
							<input type="submit" value="Remove Bike" id="btn3" style="padding-inline: 10px; padding-block: 10px;">
						</form></td>
				</tr>
			</table>
		</div>
	</div>

	<%
	}
	%>


</body>
</html>