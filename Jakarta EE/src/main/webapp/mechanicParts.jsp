<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bikebuddy.Parts"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parts</title>

<style>
table {
	width: 85%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	border: 1px solid black;
	text-align: center;
}

#addpart {
	display: flex;
}

#formaddpart {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#formaddpart>div {
	padding: 10px;
}

#partconatiner #h2 {
	
}

#partconatiner {
	position: relative; width : 87%;
	height: 80vh;
	box-shadow: inset -9px 1px 20px 6px lightblue;
	border-radius: 10px;
	margin: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	overflow-y: scroll;
	width: 87%;
}

#partconatiner input {
	padding: 5px;
}

#partconatiner #input {
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

#partconatiner #input:hover {
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}

#partconatiner1 {
	position: absolute;
	top:30px;
	
	width: 80%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: end;

}
</style>
</head>
<body>

	<%
	if (session.getAttribute("usermechanic") == null) {
		response.sendRedirect("customerLogin.jsp");
	}
	%>





	<jsp:include page="mechanicHeader.jsp"></jsp:include>

	<div id="addpart">
		<div>
			<jsp:include page="mechanicSidebar.jsp"></jsp:include>
		</div>




		<div id="partconatiner">
			<div id="partconatiner1">

				<h2 id="h2">Available Parts List</h2>
				<table>
					<tr>
						<th>Part ID</th>
						<th>Part Name</th>
						<th>Part Model</th>
						<th>Part Quantity</th>
					</tr>
					<%
					ArrayList<Parts> partsList = (ArrayList<Parts>) request.getAttribute("partsList");
					if (partsList != null) {
						for (Parts part : partsList) {
					%>
					<tr>
						<td><%=part.getPartId()%></td>
						<td><%=part.getPartName()%></td>
						<td><%=part.getPartModel()%></td>
						<td><%=part.getPartQuantity()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4">No parts available.</td>
					</tr>
					<%
					}
					%>
				</table>
				<h2>Add Part</h2>
				<form action="addpartdb" id="formaddpart" method="post">
					<div>
						<input type="text" placeholder="Enter Part ID" name="partid">
					</div>
					<div>
						<input type="text" placeholder="Enter Part Name" name="partname">
					</div>
					<div>
						<input type="text" placeholder="Enter Part Model" name="partmodel">
					</div>
					<div>
						<input type="number" placeholder="Enter Part Quantity"
							name="partquantity">
					</div>
					<div>
						<input type="reset" value="Reset" id="input"> <input
							type="submit" value="Add" id="input">
					</div>
				</form>

				<h2>Remove Part</h2>


				<form action="removepartdb" id="formaddpart" method="post">
					<div>
						<input type="text" placeholder="Enter Part ID" name="partid">
					</div>

					<div>
						<input type="reset" value="Reset" id="input"> <input
							type="submit" value="Remove" id="input">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>