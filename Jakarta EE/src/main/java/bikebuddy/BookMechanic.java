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
@WebServlet("/bookMechanic")
public class BookMechanic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();

		String bike = ((String) session.getAttribute("brand") + " ")
                .concat((String) session.getAttribute("model") + " ")
                .concat((String) session.getAttribute("series") + " ")
                .concat((String) session.getAttribute("engine") + " ")
                .concat((String) session.getAttribute("year") + " ")
                .concat((String) session.getAttribute("chassis") + " ")
                .concat((String) session.getAttribute("reg"));
		
		if(bike==null) {
			bike="N/A";
		}
	
		try {
			
			con= DataBaseConnection.getConnection();
			String query = "insert into booking(customer ,cfname ,clname ,mechanic ,mfname ,mlname ,cmobile,cemail ,mmobile ,memail ,booktype ,bike,bookingdate ) "
					                 + "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			ps= con.prepareStatement(query);
			ps.setString(1, (String)session.getAttribute("usercustomer"));
			ps.setString(2, (String)session.getAttribute("fname"));
			ps.setString(3, (String)session.getAttribute("lname"));
			
			ps.setString(4, request.getParameter("mechanicId"));
			ps.setString(5, request.getParameter("mfname"));
			ps.setString(6, request.getParameter("mlname"));
			ps.setString(7, (String)session.getAttribute("mobile"));
			ps.setString(8, (String)session.getAttribute("email"));
			
			ps.setString(9, request.getParameter("mobile"));
			ps.setString(10, request.getParameter("email"));
			
			ps.setString(11, request.getParameter("specialization"));
			ps.setString(12, bike);
			ps.setDate(13, new java.sql.Date(System.currentTimeMillis()));
			
			
			int i = ps.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("customerHome.jsp");
			}else {
				response.sendRedirect("commonError.jsp");
				
			}
	
			
		}catch(Exception e) {
			response.sendRedirect("commonError.jsp");
		}
	}

}
