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


@WebServlet("/partsorder")
public class PartsOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("customerHome.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			con = DataBaseConnection.getConnection();

			HttpSession session = request.getSession();

			String query = "INSERT INTO partsorders(username,partid,partname,partmodel, customer) values(?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, request.getParameter("mechanic"));
			ps.setString(2, request.getParameter("partid"));
			ps.setString(3, request.getParameter("partname"));
			ps.setString(4, request.getParameter("partmodel"));

			ps.setString(5, (String) session.getAttribute("usercustomer"));

			int i = ps.executeUpdate();
			if (i > 0) {
				doGet(request, response);
			} else {
				response.sendRedirect("commonError.jsp");
			}

		} catch (Exception e) {
			response.sendRedirect("commonError.jsp");
		}

	}

}
