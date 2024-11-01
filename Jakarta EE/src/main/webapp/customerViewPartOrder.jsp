<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bikebuddy.PartsOrderJava"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
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

#viewpartcontainerorder {
	display: flex;
}

#viewpartlistorder {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction:column;
	box-shadow: inset 1px 1px 25px 0px lightgreen;
	width: 85%;
	height: 85vh;
	margin: 10px;
	border-radius: 15px;
}
</style>
<meta charset="UTF-8">
<title>View Parts Orders</title>
</head>
<body>

	<%
	if (session.getAttribute("usercustomer") == null) {
		response.sendRedirect("customerLogin.jsp");
		return; // Prevent further execution
	}

	List<PartsOrderJava> orderList = (ArrayList<PartsOrderJava>) session.getAttribute("PartsOrderJavaList"); // Updated name
	%>

	<jsp:include page="customerHeader.jsp"></jsp:include>

	<div id="viewpartcontainerorder">
		<div>
			<jsp:include page="customerSidebar.jsp"></jsp:include>
		</div>

		<div id="viewpartlistorder">
			<h1>My Orders</h1>
			<table>
				<thead>
					<tr>
						<th>Mechanic</th>
						<th>Part ID</th>
						<th>Part Name</th>
						<th>Part Model</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (orderList != null && !orderList.isEmpty()) {
						for (PartsOrderJava order : orderList) {
					%>
					<tr>
						<td><%=order.getUsername()%></td>
						<td><%=order.getPartid()%></td>
						<td><%=order.getPartname()%></td>
						<td><%=order.getPartmodel()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4">No parts orders found.</td>
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
