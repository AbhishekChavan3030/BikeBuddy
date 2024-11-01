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
import java.sql.SQLException;

@WebServlet("/mechaniccancelbooking")
public class MechanicCancelBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement ps = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("mechanicHome.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			con = DataBaseConnection.getConnection();
			String cancelbooking = "DELETE FROM booking WHERE mechanic = ? AND booktype = ? AND bike = ? AND bookingdate = ? AND cemail = ? AND cmobile = ?";

			ps = con.prepareStatement(cancelbooking);
			ps.setString(1, (String) session.getAttribute("usermechanic"));
			ps.setString(2, request.getParameter("booktype"));
			ps.setString(3, request.getParameter("bike"));
			ps.setString(4, request.getParameter("bookingDate"));
			ps.setString(5, request.getParameter("customerEmail"));
			ps.setString(6, request.getParameter("customerMobile"));

			ps.executeUpdate();
			doGet(request, response);
		} catch (SQLException e) {
			response.sendRedirect("commonError.jsp");
		} finally {
			DataBaseConnection.closeConnection(con);
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
				}
		}
	}
}
