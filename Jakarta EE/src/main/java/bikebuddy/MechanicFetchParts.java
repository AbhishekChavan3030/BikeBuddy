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

@WebServlet("/fetchpart")
public class MechanicFetchParts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Parts> partsList = new ArrayList<>();

		try {

			con = DataBaseConnection.getConnection();
			String fetch = "SELECT * FROM parts WHERE username = ?";
			ps = con.prepareStatement(fetch);
			ps.setString(1, (String) session.getAttribute("usermechanic"));
			rs = ps.executeQuery();

			while (rs.next()) {
				Parts part = new Parts();
				part.setPartId(rs.getString("partid"));
				part.setPartName(rs.getString("partname"));
				part.setPartModel(rs.getString("partmodel"));
				part.setPartQuantity(rs.getString("partquantity"));
				partsList.add(part);

			}
			request.setAttribute("partsList", partsList);

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
				response.sendRedirect("commonError.jsp");
			}

		}
		request.getRequestDispatcher("mechanicParts.jsp").forward(request, response);
	}

}
