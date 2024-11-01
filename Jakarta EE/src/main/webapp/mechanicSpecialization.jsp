<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Specialization</title>
<style>
#specification {
	display: flex;
}

#specializationcontainer {
	width: 87%;
	height: 80vh;
	box-shadow: inset -9px 1px 20px 6px lightblue;
	border-radius: 10px;
	margin: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	overflow-y: scroll;
}

#specializationcontainer #input, #specializationcontainer #input2 {
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

#specializationcontainer #input2 {
	margin-top: 20px;
	background-color: lightblue
}

#specializationcontainer #input:hover {
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}

#specializationcontainer #input2:hover {
	background-color: darkblue;
	color: white;
	border-radius: 5px;
	border: none;
	curser: pointer;
}



#mechnaicside div {
	border: .3px solid violet;
	border-radius: 5px;
	margin-block: 2px;
	padding-block: 5px;
	padding-inline: 5px;
}

#addedformargin {
	margin-top: 240px;
}
</style>
</head>
<body>
	<jsp:include page="mechanicHeader.jsp"></jsp:include>
	<div id="specification">
		<div>
			<jsp:include page="mechanicSidebar.jsp"></jsp:include>
		</div>

		<div id="specializationcontainer">

			<form action="Specialization" method="post" id="specializationfrom">

				<h1 id="addedformargin">What You Can Repair?</h1>
				<div id="mechnaicside">

					<div>
						Engine Repairs: <input type="checkbox" name="repairTypeEngine"
							value="engine">
					</div>
					<div>
						Electrical Repairs: <input type="checkbox"
							name="repairTypeElectrical" value="electrical">
					</div>
					<div>
						Brake Repairs: <input type="checkbox" name="repairTypeBrake"
							value="brake">
					</div>
					<div>
						Suspension Repairs: <input type="checkbox"
							name="repairTypeSuspension" value="suspension">
					</div>
					<div>
						Tyre and Wheel Repairs: <input type="checkbox"
							name="repairTypeTyre" value="tyre_wheel">
					</div>
					<div>
						Bodywork and Frame Repairs: <input type="checkbox"
							name="repairTypeFrame" value="bodywork">
					</div>



					<h1>Select Bikes You Can Repair</h1>

					<div>
						Yamaha R15: <input type="checkbox" name="bikeTypeyamaha_r15"
							value="yamaha_r15">
					</div>
					<div>
						Yamaha MT-15: <input type="checkbox" name="bikeTypeyamaha_mt15"
							value="yamaha_mt15">
					</div>
					<div>
						Honda CB Hornet: <input type="checkbox"
							name="bikeTypehonda_cb_hornet" value="honda_cb_hornet">
					</div>
					<div>
						Honda CBR 250R: <input type="checkbox"
							name="bikeTypehonda_cbr_250r" value="honda_cbr_250r">
					</div>
					<div>
						Bajaj Pulsar 220: <input type="checkbox"
							name="bikeTypebajaj_pulsar_220" value="bajaj_pulsar_220">
					</div>
					<div>
						Bajaj Dominar 400: <input type="checkbox"
							name="bikeTypebajaj_dominar_400" value="bajaj_dominar_400">
					</div>
					<div>
						Royal Enfield Classic 350: <input type="checkbox"
							name="bikeTypere_classic_350" value="re_classic_350">
					</div>
					<div>
						Royal Enfield Himalayan: <input type="checkbox"
							name="bikeTypere_himalayan" value="re_himalayan">
					</div>
					<div>
						KTM Duke 200: <input type="checkbox" name="bikeTypektm_duke_200"
							value="ktm_duke_200">
					</div>
					<div>
						KTM RC 390: <input type="checkbox" name="bikeTypektm_rc_390"
							value="ktm_rc_390">
					</div>
					<div>
						TVS Apache RTR 160: <input type="checkbox"
							name="bikeTypetvs_apache_rtr_160" value="tvs_apache_rtr_160">
					</div>
					<div>
						TVS Apache RR 310: <input type="checkbox"
							name="bikeTypetvs_apache_rr_310" value="tvs_apache_rr_310">
					</div>
					<div>
						Suzuki Gixxer SF: <input type="checkbox"
							name="bikeTypesuzuki_gixxer_sf" value="suzuki_gixxer_sf">
					</div>
					<div>
						Suzuki Intruder: <input type="checkbox"
							name="bikeTypesuzuki_intruder" value="suzuki_intruder">
					</div>
					<div>
						Other: <input type="checkbox" name="bikeType" value="other">
					</div>
				</div>
				<div>
					<button type="submit" name="" value="" id="input">Add</button>
					<button onclick="location='mechanicHome.jsp'" id="input">Home</button>
				</div>
			</form>
			<div style="text-align: center;" id="againaddedformargin">
				<button onclick="location.href='mechanicSpecializationView.jsp'"
					id="input2">View My Specialization</button>
			</div>
		</div>
	</div>
</body>
</html>
