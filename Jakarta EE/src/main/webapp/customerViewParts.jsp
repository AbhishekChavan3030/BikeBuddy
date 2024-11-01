<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bikebuddy.Parts"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Parts</title>
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

#partcontainercc {
	display: flex;
}

#partlistcontainer {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
	align-items: center;
}

#btn5 {
	width: fit-content;
	padding-inline: 10px;
	padding-block: 10px;
	border-radius: 5px;
	border: none;
}

#btn5:hover {
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

	<div id="partcontainercc">
		<div>
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</div>

		<div id="partlistcontainer">
			<%
			ArrayList<Parts> cpartsList = (ArrayList<Parts>) session.getAttribute("customerpartsList");
			if (cpartsList != null && !cpartsList.isEmpty()) {
			%>
			<h1>Parts</h1>
			<table>
				<thead>
					<tr>
						<th>Mechanic</th>
						<th>Part ID</th>
						<th>Part Name</th>
						<th>Model</th>
						<th>Quantity</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Parts part : cpartsList) {
					%>
					<tr>
						<form action="partsorder" method="post">
							<td>
								<p><%=part.getMechanic().toUpperCase()%></p> <input
								type="hidden" value="<%=part.getMechanic()%>" name="mechanic">
							</td>
							<td>
								<p><%=part.getPartId()%></p> <input type="hidden"
								value="<%=part.getPartId()%>" name="partid">
							</td>
							<td>
								<p><%=part.getPartName()%></p> <input type="hidden"
								value="<%=part.getPartName()%>" name="partname">
							</td>
							<td>
								<p><%=part.getPartModel()%></p> <input type="hidden"
								value="<%=part.getPartModel()%>" name="partmodel">
							</td>
							<td>
								<p><%=part.getPartQuantity()%></p>
							</td>
							<td><input type="submit" value="Buy" id="btn5"></td>
						</form>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<form action="viewpartorder" method="post">
				<input type="submit" value="View My Orders" id="btn5">
			</form>
			<%
			} else {
			%>
			<p>No parts available at the moment.</p>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>
