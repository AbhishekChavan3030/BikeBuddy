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

@WebServlet("/parts")
public class MechanicParts extends HttpServlet {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("usermechanic");

			con = DataBaseConnection.getConnection();
			String query = "SELECT * FROM parts WHERE username = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, username);

			rs = ps.executeQuery();
			
			List<Parts> partlist = new ArrayList<>();

			while (rs.next()) {
				Parts part = new Parts();

				String partid = rs.getString("partid");
				String partname = rs.getString("partname");
				String partmodel = rs.getString("partmodel");
				String partqauntity = rs.getString("partquantity");
				
				part.setPartId(partid);
				part.setPartName(partname);
				part.setPartModel(partmodel);
				part.setPartQuantity(partqauntity);
				
				partlist.add(part);
			}
			session.setAttribute("partsList", partlist);
			
			response.sendRedirect("mechanicParts.jsp");

		} catch (Exception e) {
			response.sendRedirect("commonError.jsp");
			
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
