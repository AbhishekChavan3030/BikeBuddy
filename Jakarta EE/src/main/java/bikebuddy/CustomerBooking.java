package bikebuddy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/customerBooking")
public class CustomerBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			con = DataBaseConnection.getConnection();
			getMechanic(request, con);
			getSpecialization(request, con);
		} catch (Exception e) {
			response.sendRedirect("commonError.jsp");
		}

		request.getRequestDispatcher("customerBooking.jsp").forward(request, response);
	}

	public void getMechanic(HttpServletRequest req, Connection con) {
		List<Mechanic> mechanicList = new ArrayList<>();
		try {
			String query = "SELECT * FROM mechanic";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Mechanic mechanic = new Mechanic();
				mechanic.setFname(rs.getString("FirstName"));
				mechanic.setLname(rs.getString("LastName"));
				mechanic.setUsername(rs.getString("UserName"));
				mechanic.setMobile(rs.getString("ContactNumber"));
				mechanic.setEmail(rs.getString("Email"));
				mechanic.setAddress(rs.getString("Address"));

				mechanicList.add(mechanic);
			}
			HttpSession session = req.getSession();
			session.setAttribute("mechanicslist", mechanicList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getSpecialization(HttpServletRequest req, Connection con) {
		List<Specialization> specializationList = new ArrayList<>();
		try {
			String query = "SELECT * FROM specializations";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Specialization specialization = new Specialization();
				specialization.setRepairTypeEngine(rs.getString("repairTypeEngine"));
				specialization.setRepairTypeElectrical(rs.getString("repairTypeElectrical"));
				specialization.setRepairTypeBrake(rs.getString("repairTypeBrake"));
				specialization.setRepairTypeSuspension(rs.getString("repairTypeSuspension"));
				specialization.setRepairTypeTyre(rs.getString("repairTypeTyre"));
				specialization.setRepairTypeFrame(rs.getString("repairTypeFrame"));
				specialization.setBikeTypeyamaha_r15(rs.getString("bikeTypeyamaha_r15"));
				specialization.setBikeTypeyamaha_mt15(rs.getString("bikeTypeyamaha_mt15"));
				specialization.setBikeTypehonda_cb_hornet(rs.getString("bikeTypehonda_cb_hornet"));
				specialization.setBikeTypehonda_cbr_250r(rs.getString("bikeTypehonda_cbr_250r"));
				specialization.setBikeTypebajaj_pulsar_220(rs.getString("bikeTypebajaj_pulsar_220"));
				specialization.setBikeTypebajaj_dominar_400(rs.getString("bikeTypebajaj_dominar_400"));
				specialization.setBikeTypere_classic_350(rs.getString("bikeTypere_classic_350"));
				specialization.setBikeTypere_himalayan(rs.getString("bikeTypere_himalayan"));
				specialization.setBikeTypektm_duke_200(rs.getString("bikeTypektm_duke_200"));
				specialization.setBikeTypektm_rc_390(rs.getString("bikeTypektm_rc_390"));
				specialization.setBikeTypetvs_apache_rtr_160(rs.getString("bikeTypetvs_apache_rtr_160"));
				specialization.setBikeTypetvs_apache_rr_310(rs.getString("bikeTypetvs_apache_rr_310"));
				specialization.setBikeTypesuzuki_gixxer_sf(rs.getString("bikeTypesuzuki_gixxer_sf"));
				specialization.setBikeTypesuzuki_intruder(rs.getString("bikeTypesuzuki_intruder"));
				specialization.setOtherBikeType(rs.getString("otherBikeType"));
				specialization.setUsername(rs.getString("username"));

				specializationList.add(specialization);
			}

			HttpSession session = req.getSession();
			session.setAttribute("specializationlist", specializationList);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
