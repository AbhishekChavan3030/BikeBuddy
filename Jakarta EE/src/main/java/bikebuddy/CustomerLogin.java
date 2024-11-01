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


@WebServlet("/clogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		try {
			con = DataBaseConnection.getConnection();
			String query =  "select * from customer where username=? and password =?";
			
			
			ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, pass);
			rs = ps.executeQuery();
	

			if(rs.next()){	
				HttpSession session= request.getSession();
				session.setAttribute("usercustomer", name);
				
				
				session.setAttribute("fname", rs.getString("FirstName"));
				session.setAttribute("lname", rs.getString("LastName"));
				session.setAttribute("mobile", rs.getString("contactnumber"));
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("address", rs.getString("address"));
				session.setAttribute("dob", rs.getString("dob"));

				response.sendRedirect("customerHome.jsp");
			}	
			else {
				response.sendRedirect("customerLogin.jsp");
			}
			    DataBaseConnection.closeConnection(con);
                if (rs != null) rs.close();
                if (ps != null) ps.close();

		} catch (Exception e) {
			response.sendRedirect("commanError.jsp");

		}

	}

}
