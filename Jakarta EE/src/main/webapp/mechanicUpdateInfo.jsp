<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Info</title>

<style>
#updateprofile {

	display: flex;
}

#updateprofilecontainer {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 10px;
	width: 87%;
	height: 80vh;
	box-shadow: inset -9px 1px 20px 6px lightblue;
	justify-content: center;
	border-radius: 10px;
}

#updateprofilecontainer input {
padding:8px;
}


#updateprofilecontainer #input {
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

#updateprofilecontainer #input:hover {
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}

#updateprofilecontainer p {
	padding-block: 20px;
}
#updateprofilecontainerform{
display: flex;
	flex-direction: column;
	align-items: center;

}


</style>
</head>
<body>
	<%
	if ((String) session.getAttribute("usermechanic") == null) {
		response.sendRedirect("mechanicLogin.jsp");
	}
	String username = (String) session.getAttribute("usermechanic");
	%>

	<jsp:include page="mechanicHeader.jsp"></jsp:include>


	<div id="updateprofile">

		<jsp:include page="mechanicSidebar.jsp"></jsp:include>

		<div id="updateprofilecontainer">
			<form action="updateInfo" method="post" id="updateprofilecontainerform">
				<p>
					First Name : <input type="text" placeholder=${fname}! name="fname"
						required>
				</p>
				<p>
					Last Name : <input type="text" placeholder=${lname}! name="lname"
						required>
				</p>
				<p>
					Contact Number : <input type="text" placeholder=${mobile}!
						name="mobile" required>
				</p>
				<p>
					Email Id : <input type="text" placeholder=${email}! name="email"
						required>
				</p>
				<p>
					Address : <input type="text" placeholder=${address}! name="add">
				</p>
				<p>
					Date of Birth : <input type="date" placeholder=${dob}! name="dob"
						required>
				</p>

				<p>
					<input type="submit" value="Update" id="input">
				</p>

			</form>
		</div>

	</div>
</body>
</html>