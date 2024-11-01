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
import java.sql.Statement;
@WebServlet("/removepartdb")
public class RemovePart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
    PreparedStatement ps= null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		try {
            con = DataBaseConnection.getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("SET SQL_SAFE_UPDATES = 0");

            String remove = "DELETE FROM parts WHERE username = ? AND partid =?";
            ps = con.prepareStatement(remove);
            ps.setString(1, (String) session.getAttribute("usermechanic"));
            ps.setString(2, request.getParameter("partid"));
            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("mechanicParts.jsp");  
            }else {
            	response.sendRedirect("mechanicHome.jsp");
            }
            stmt.execute("SET SQL_SAFE_UPDATES = 1");  
        } catch (Exception e) {
        	response.sendRedirect("commonError.jsp");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
            	response.sendRedirect("commonError.jsp");
            }
        }
    }
}
