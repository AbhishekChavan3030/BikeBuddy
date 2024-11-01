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

@WebServlet("/customerUpdate")
public class CustomerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String user = (String) session.getAttribute("usercustomer");

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String dob = request.getParameter("dob");
		try {
			con = DataBaseConnection.getConnection();
			String query = "UPDATE customer SET FirstName=?, LastName=?, ContactNumber=?, Email=?, Address=?, dob=? WHERE username=?;";
			ps = con.prepareStatement(query);
			ps = con.prepareStatement(query);

			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, mobile);
			ps.setString(4, email);
			ps.setString(5, address);
			ps.setString(6, dob);

			ps.setString(7, user);
			PrintWriter out = response.getWriter();
			int i = ps.executeUpdate();
			if (i > 0) {
				out.println("Updated");
				session.setAttribute("fname", fname);
				session.setAttribute("lname", lname);
				session.setAttribute("mobile", mobile);
				session.setAttribute("email", email);
				session.setAttribute("address", address);
				session.setAttribute("dob", dob);
				
				
				response.sendRedirect("customerProfile.jsp");

			} else {
				out.println("Not Updated");


			}

		} catch (Exception e) {
			response.sendRedirect("commonError.jsp");
		}

	}

}