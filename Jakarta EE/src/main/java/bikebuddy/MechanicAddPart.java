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

@WebServlet("/addpartdb")
public class MechanicAddPart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection con = null;
    PreparedStatement ps= null;
    HttpSession session = null;
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			con= DataBaseConnection.getConnection();
			String query  =  "INSERT INTO parts (username, partid, partname,partmodel, partquantity) values (?,?,?,?,?)";
			ps= con.prepareStatement(query);
			
			session = request.getSession();
			
			
			ps.setString(1, (String)session.getAttribute("usermechanic"));
			ps.setString(2, request.getParameter("partid"));
			ps.setString(3, request.getParameter("partname"));
			ps.setString(4, request.getParameter("partmodel"));
			ps.setString(5, request.getParameter("partquantity"));
			
			int i = ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("mechanicParts.jsp");
			}
			else {
				response.sendRedirect("mechanicParts.jsp");				
			}
			
			
		}catch(Exception e) {
			response.sendRedirect("commonError.jsp");
			}
		}

}
