<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parts</title>
</head>
<body>

	<jsp:include page="mechanicHeader.jsp"></jsp:include>

	<div id="partspage">
		<jsp:include page="mechanicSidebar.jsp"></jsp:include>

		<div>
			<form action="parts" method="get">
				<input type="submit" value="Available Parts">
			</form>

			<table border="2px" cellspacing="5px" cellpadding="5px">
				<thead>
					<tr>
						<th>Part Id</th>
						<th>Part Name</th>
						<th>Part Model</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="part" items="${sessionScope.partsList}">
						<tr>
							<td>${part.partid}</td>
							<td>${part.partname}</td>
							<td>${part.partmodel}</td>
							<td>${part.partquantity}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<h3>or</h3>

			<form action="parts" method="post">
				<input type="text" placeholder="Part Id" name="pid"> <input
					type="text" placeholder="Part Name" name="pname"> <input
					type="text" placeholder="Part Model" name="pmodel"> <input
					type="number" placeholder="Available Quantity" name="pquantity">
				<input type="submit" value="Add">
			</form>
		</div>
	</div>

</body>
</html>
