
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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/Specialization")
public class MechanicSpecialization extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection con = null;
    PreparedStatement pstmt = null;
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String repairTypeEngine = request.getParameter("repairTypeEngine") != null ? "engine" : "N/A";
        String repairTypeElectrical = request.getParameter("repairTypeElectrical") != null ? "electrical" : "N/A";
        String repairTypeBrake = request.getParameter("repairTypeBrake") != null ? "brake" : "N/A";
        String repairTypeSuspension = request.getParameter("repairTypeSuspension") != null ? "suspension" : "N/A";
        String repairTypeTyre = request.getParameter("repairTypeTyre") != null ? "tyre_wheel" : "N/A";
        String repairTypeFrame = request.getParameter("repairTypeFrame") != null ? "bodywork" : "N/A";

        // Bike types
        String bikeTypeyamaha_r15 = request.getParameter("bikeTypeyamaha_r15") != null ? "yamaha_r15" : "N/A";
        String bikeTypeyamaha_mt15 = request.getParameter("bikeTypeyamaha_mt15") != null ? "yamaha_mt15" : "N/A";
        String bikeTypehonda_cb_hornet = request.getParameter("bikeTypehonda_cb_hornet") != null ? "honda_cb_hornet"
                : "N/A";
        String bikeTypehonda_cbr_250r = request.getParameter("bikeTypehonda_cbr_250r") != null ? "honda_cbr_250r"
                : "N/A";
        String bikeTypebajaj_pulsar_220 = request.getParameter("bikeTypebajaj_pulsar_220") != null ? "bajaj_pulsar_220"
                : "N/A";
        String bikeTypebajaj_dominar_400 = request.getParameter("bikeTypebajaj_dominar_400") != null
                ? "bajaj_dominar_400"
                : "N/A";
        String bikeTypere_classic_350 = request.getParameter("bikeTypere_classic_350") != null ? "re_classic_350"
                : "N/A";
        String bikeTypere_himalayan = request.getParameter("bikeTypere_himalayan") != null ? "re_himalayan" : "N/A";
        String bikeTypektm_duke_200 = request.getParameter("bikeTypektm_duke_200") != null ? "ktm_duke_200" : "N/A";
        String bikeTypektm_rc_390 = request.getParameter("bikeTypektm_rc_390") != null ? "ktm_rc_390" : "N/A";
        String bikeTypetvs_apache_rtr_160 = request.getParameter("bikeTypetvs_apache_rtr_160") != null
                ? "tvs_apache_rtr_160"
                : "N/A";
        String bikeTypetvs_apache_rr_310 = request.getParameter("bikeTypetvs_apache_rr_310") != null
                ? "tvs_apache_rr_310"
                : "N/A";
        String bikeTypesuzuki_gixxer_sf = request.getParameter("bikeTypesuzuki_gixxer_sf") != null ? "suzuki_gixxer_sf"
                : "N/A";
        String bikeTypesuzuki_intruder = request.getParameter("bikeTypesuzuki_intruder") != null ? "suzuki_intruder"
                : "N/A";
        String otherBikeType = request.getParameter("bikeType") != null ? "other" : "N/A";
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("usermechanic");

        try {
            con = DataBaseConnection.getConnection();
            String checkSql = "SELECT COUNT(*) FROM Specializations WHERE username = ?";
            pstmt = con.prepareStatement(checkSql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            boolean exists = rs.getInt(1) > 0;

            if (exists) {
                String updateSql = "UPDATE Specializations SET repairTypeEngine = ?, repairTypeElectrical = ?, repairTypeBrake = ?, "
                        + "repairTypeSuspension = ?, repairTypeTyre = ?, repairTypeFrame = ?, "
                        + "bikeTypeyamaha_r15 = ?, bikeTypeyamaha_mt15 = ?, bikeTypehonda_cb_hornet = ?, "
                        + "bikeTypehonda_cbr_250r = ?, bikeTypebajaj_pulsar_220 = ?, bikeTypebajaj_dominar_400 = ?, "
                        + "bikeTypere_classic_350 = ?, bikeTypere_himalayan = ?, bikeTypektm_duke_200 = ?, "
                        + "bikeTypektm_rc_390 = ?, bikeTypetvs_apache_rtr_160 = ?, bikeTypetvs_apache_rr_310 = ?, "
                        + "bikeTypesuzuki_gixxer_sf = ?, bikeTypesuzuki_intruder = ?, otherBikeType = ? "
                        + "WHERE username = ?";

                pstmt = con.prepareStatement(updateSql);
                pstmt.setString(1, repairTypeEngine);
                pstmt.setString(2, repairTypeElectrical);
                pstmt.setString(3, repairTypeBrake);
                pstmt.setString(4, repairTypeSuspension);
                pstmt.setString(5, repairTypeTyre);
                pstmt.setString(6, repairTypeFrame);
                pstmt.setString(7, bikeTypeyamaha_r15);
                pstmt.setString(8, bikeTypeyamaha_mt15);
                pstmt.setString(9, bikeTypehonda_cb_hornet);
                pstmt.setString(10, bikeTypehonda_cbr_250r);
                pstmt.setString(11, bikeTypebajaj_pulsar_220);
                pstmt.setString(12, bikeTypebajaj_dominar_400);
                pstmt.setString(13, bikeTypere_classic_350);
                pstmt.setString(14, bikeTypere_himalayan);
                pstmt.setString(15, bikeTypektm_duke_200);
                pstmt.setString(16, bikeTypektm_rc_390);
                pstmt.setString(17, bikeTypetvs_apache_rtr_160);
                pstmt.setString(18, bikeTypetvs_apache_rr_310);
                pstmt.setString(19, bikeTypesuzuki_gixxer_sf);
                pstmt.setString(20, bikeTypesuzuki_intruder);
                pstmt.setString(21, otherBikeType);
                pstmt.setString(22, username);
            } else {
                String insertSql = "INSERT INTO Specializations (repairTypeEngine, repairTypeElectrical, repairTypeBrake, repairTypeSuspension, repairTypeTyre, repairTypeFrame, "
                        + "bikeTypeyamaha_r15, bikeTypeyamaha_mt15, bikeTypehonda_cb_hornet, bikeTypehonda_cbr_250r, "
                        + "bikeTypebajaj_pulsar_220, bikeTypebajaj_dominar_400, bikeTypere_classic_350, bikeTypere_himalayan, "
                        + "bikeTypektm_duke_200, bikeTypektm_rc_390, bikeTypetvs_apache_rtr_160, bikeTypetvs_apache_rr_310, "
                        + "bikeTypesuzuki_gixxer_sf, bikeTypesuzuki_intruder, otherBikeType, username) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

                pstmt = con.prepareStatement(insertSql);

                pstmt.setString(1, repairTypeEngine);
                pstmt.setString(2, repairTypeElectrical);
                pstmt.setString(3, repairTypeBrake);
                pstmt.setString(4, repairTypeSuspension);
                pstmt.setString(5, repairTypeTyre);
                pstmt.setString(6, repairTypeFrame);
                pstmt.setString(7, bikeTypeyamaha_r15);
                pstmt.setString(8, bikeTypeyamaha_mt15);
                pstmt.setString(9, bikeTypehonda_cb_hornet);
                pstmt.setString(10, bikeTypehonda_cbr_250r);
                pstmt.setString(11, bikeTypebajaj_pulsar_220);
                pstmt.setString(12, bikeTypebajaj_dominar_400);
                pstmt.setString(13, bikeTypere_classic_350);
                pstmt.setString(14, bikeTypere_himalayan);
                pstmt.setString(15, bikeTypektm_duke_200);
                pstmt.setString(16, bikeTypektm_rc_390);
                pstmt.setString(17, bikeTypetvs_apache_rtr_160);
                pstmt.setString(18, bikeTypetvs_apache_rr_310);
                pstmt.setString(19, bikeTypesuzuki_gixxer_sf);
                pstmt.setString(20, bikeTypesuzuki_intruder);
                pstmt.setString(21, otherBikeType);
                pstmt.setString(22, username);
            }

            int row = pstmt.executeUpdate();
            if (row > 0) {
            	fetchSpecializations(request,response);
                response.sendRedirect("mechanicSpecializationView.jsp");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
        	response.sendRedirect("commanError.jsp");
        }
    }


    private void fetchSpecializations(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        
        String username = (String) session.getAttribute("usermechanic");

        try {
            con = DataBaseConnection.getConnection();
            String sql = "SELECT * FROM Specializations WHERE username = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);

            ResultSet rs = pstmt.executeQuery();
            Map<String, String> specializationMap = new HashMap<>();

            if (rs.next()) {
     
                specializationMap.put("Engine Repair", rs.getString("repairTypeEngine"));
                specializationMap.put("Electrical Repair", rs.getString("repairTypeElectrical"));
                specializationMap.put("Brake Repair", rs.getString("repairTypeBrake"));
                specializationMap.put("Suspension Repair", rs.getString("repairTypeSuspension"));
                specializationMap.put("Tyre & Wheel Repair", rs.getString("repairTypeTyre"));
                specializationMap.put("Bodywork & Frame Repair", rs.getString("repairTypeFrame"));

                specializationMap.put("Yamaha R15", rs.getString("bikeTypeyamaha_r15"));
                specializationMap.put("Yamaha MT-15", rs.getString("bikeTypeyamaha_mt15"));
                specializationMap.put("Honda CB Hornet", rs.getString("bikeTypehonda_cb_hornet"));
                specializationMap.put("Honda CBR 250R", rs.getString("bikeTypehonda_cbr_250r"));
                specializationMap.put("Bajaj Pulsar 220", rs.getString("bikeTypebajaj_pulsar_220"));
                specializationMap.put("Bajaj Dominar 400", rs.getString("bikeTypebajaj_dominar_400"));
                specializationMap.put("Royal Enfield Classic 350", rs.getString("bikeTypere_classic_350"));
                specializationMap.put("Royal Enfield Himalayan", rs.getString("bikeTypere_himalayan"));
                specializationMap.put("KTM Duke 200", rs.getString("bikeTypektm_duke_200"));
                specializationMap.put("KTM RC 390", rs.getString("bikeTypektm_rc_390"));
                specializationMap.put("TVS Apache RTR 160", rs.getString("bikeTypetvs_apache_rtr_160"));
                specializationMap.put("TVS Apache RR 310", rs.getString("bikeTypetvs_apache_rr_310"));
                specializationMap.put("Suzuki Gixxer SF", rs.getString("bikeTypesuzuki_gixxer_sf"));
                specializationMap.put("Suzuki Intruder", rs.getString("bikeTypesuzuki_intruder"));
                specializationMap.put("Other Bike Type", rs.getString("otherBikeType"));
            }

            session.setAttribute("specializationList", specializationMap);
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
        	try {
				response.sendRedirect("commonError.jsp");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
        }
    }
}

