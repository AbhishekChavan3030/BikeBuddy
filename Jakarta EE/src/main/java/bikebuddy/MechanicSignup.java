package bikebuddy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/msignup")
public class MechanicSignup extends HttpServlet {

	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String dob= request.getParameter("dob");
		
		String uname = request.getParameter("username");
		String password= request.getParameter("password");
		
		PrintWriter out  = response.getWriter();
		out.println(fname);
		out.println(lname);
		out.println(mobile);
		out.println(email);
		out.println(address);
		out.println(dob);
		out.println(uname);
		out.println(password);
		
			
		try {
			con = DataBaseConnection.getConnection();
			String fetch = "select username, password from mechanic where username = ? and password = ?";
			ps = con.prepareStatement(fetch);
			ps.setString(1, uname);
			ps.setString(2, password);
			rs = ps.executeQuery();
			 
			if (rs.next()) {
				
				out.println("<script type=\"text/javascript\">");
                out.println("alert('Already register username please login');");
                out.println("location='mechanicLogin.jsp';");  
                out.println("</script>");

			}

			else {
				String insert = "insert into mechanic (FirstName, LastName, ContactNumber, Email, Address, UserName, Password,dob ) values(?,?,?,?,?,?,?,?);";
				ps = con.prepareStatement(insert);
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, mobile);
				ps.setString(4, email);
				ps.setString(5, address);
				ps.setString(6, uname);
				ps.setString(7, password);
				ps.setString(8, dob);
				
				int ra =ps.executeUpdate();
				
				if(ra>0) {
					response.sendRedirect("mechanicLogin.jsp");
				}else {
					response.sendRedirect("commonError.jsp");
				}
				
			   
			}
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                DataBaseConnection.closeConnection(con);
		} catch (Exception e) {
			response.sendRedirect("commanError.jsp");

		}

	}

}
