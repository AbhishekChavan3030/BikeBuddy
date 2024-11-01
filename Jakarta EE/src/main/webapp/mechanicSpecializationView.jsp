<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 85%;
	border-collapse: collapse;
}

th, td {
	padding: 2px;
	border: 1px solid black;
	text-align: center;
}
#specificationview {
	display: flex;
}
#viewSpeci{
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



#viewSpeci #input{
margin-top:10px;
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


#viewSpeci #input:hover{
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}

</style>
<meta charset="UTF-8">
<title>Specialization</title>
</head>
<body>
	<jsp:include page="mechanicHeader.jsp"></jsp:include>
	<div id="specificationview">
		<div>
			<jsp:include page="mechanicSidebar.jsp"></jsp:include>
		</div>
		
		<div id="viewSpeci">
		<h2 style="text-align: center;">Your Specializations</h2>
		<table>
			<thead>
				<tr>
					<th>Specialization</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody>
				<%
				Map<String, String> specializationMap = (Map<String, String>) session.getAttribute("specializationList");
				if (specializationMap != null && !specializationMap.isEmpty()) {
					for (Map.Entry<String, String> entry : specializationMap.entrySet()) {
						String specializationName = entry.getKey();
						String specializationValue = entry.getValue();
						if (!"N/A".equals(specializationValue)) {
				%>
				<tr>
					<td><%=specializationName%></td>
					<td><%=specializationValue%></td>
				</tr>
				<%
				}
				}
				} else {
				%>
				<tr>
					<td colspan="2">No specializations available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<div style="text-align: center;">
			<button onclick="location.href='mechanicHome.jsp'" id="input">Home</button>
		</div>
		</div>
	</div>


</body>
</html>