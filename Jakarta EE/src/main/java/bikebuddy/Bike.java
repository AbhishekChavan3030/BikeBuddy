package bikebuddy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/bike")
public class Bike extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	HttpSession session = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			con = DataBaseConnection.getConnection();
			session = request.getSession();

			String query = "SELECT * FROM bike WHERE username = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, (String) session.getAttribute("usercustomer"));
			rs = ps.executeQuery();

			if (rs.next()) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<html><body>");
				out.println("<script type='text/javascript'>");
				out.println("alert('You cannot add more than 1 bike');");
				out.println("window.location.href = 'customerAddBike.jsp';");
				out.println("</script>");
				out.println("</body></html>");
			} else {
				String addQuery = "INSERT INTO bike(model, series, brand, engine, year, chassis, reg, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
				ps = con.prepareStatement(addQuery);
				ps.setString(1, request.getParameter("model"));
				ps.setString(2, request.getParameter("series"));
				ps.setString(3, request.getParameter("brand"));
				ps.setString(4, request.getParameter("engine"));
				ps.setString(5, request.getParameter("year"));
				ps.setString(6, request.getParameter("chassis"));
				ps.setString(7, request.getParameter("reg"));
				ps.setString(8, (String) session.getAttribute("usercustomer"));
				ps.executeUpdate();

				session.setAttribute("model", request.getParameter("model"));
				session.setAttribute("series", request.getParameter("series"));
				session.setAttribute("brand", request.getParameter("brand"));
				session.setAttribute("engine", request.getParameter("engine"));
				session.setAttribute("year", request.getParameter("year"));
				session.setAttribute("chassis", request.getParameter("chassis"));
				session.setAttribute("reg", request.getParameter("reg"));

				response.sendRedirect("customerAddBike.jsp");
			}

		} catch (SQLException e) {
			response.sendRedirect("commonError.jsp");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				response.sendRedirect("commonError.jsp");
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();

		try {
			con = DataBaseConnection.getConnection();

			String query = "SELECT * FROM bike WHERE username = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, (String) session.getAttribute("usercustomer"));
			rs = ps.executeQuery();

			if (rs.next()) {

				session.setAttribute("model", rs.getString("model"));
				session.setAttribute("series", rs.getString("series"));
				session.setAttribute("brand", rs.getString("brand"));
				session.setAttribute("engine", rs.getString("engine"));
				session.setAttribute("year", rs.getString("year"));
				session.setAttribute("chassis", rs.getString("chassis"));
				session.setAttribute("reg", rs.getString("reg"));

				response.sendRedirect("customerAddBike.jsp");
			}else {
				
				response.sendRedirect("customerAddBike.jsp");
			}

//				response.setContentType("text/html");
//				PrintWriter out = response.getWriter();
//				out.println("<html><body>");
//				out.println("<script type='text/javascript'>");
//				out.println("alert('You cannot add more than 1 bike');");
//				out.println("window.location.href = 'customerAddBike.jsp';");
//				out.println("</script>");
//				out.println("</body></html>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
