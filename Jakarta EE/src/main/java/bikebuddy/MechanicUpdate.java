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
@WebServlet("/updateInfo")
public class MechanicUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MechanicUpdate() {
        super();
       
    }
    
    Connection con =null;
    PreparedStatement ps= null;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		try {
			con= DataBaseConnection.getConnection();
			String query = "update mechanic set firstname = ? , lastname = ? , contactnumber =? , email =? , address =? , dob=? Where username = ?";
			HttpSession session = request.getSession();
			
			ps =con.prepareStatement(query);
			ps.setString(1, request.getParameter("fname"));
			ps.setString(2, request.getParameter("lname"));
			ps.setString(3, request.getParameter("mobile"));
			ps.setString(4, request.getParameter("email"));
			ps.setString(5, request.getParameter("add"));
			ps.setString(6, request.getParameter("dob"));
			ps.setString(7, (String)session.getAttribute("usermechanic"));
			
			int i = ps.executeUpdate();
			if(i>0) {
				session.setAttribute("fname", request.getParameter("fname"));
				session.setAttribute("lname", request.getParameter("lname"));
				session.setAttribute("mobile", request.getParameter("mobile"));
				session.setAttribute("email", request.getParameter("email"));
				session.setAttribute("address", request.getParameter("add"));
				session.setAttribute("dob", request.getParameter("dob"));

				
				response.sendRedirect("mechanicProfile.jsp");
			}
		
			
		}catch(Exception e) {
			response.sendRedirect("commonError.jsp");
		}
		
		
		
	}

}
