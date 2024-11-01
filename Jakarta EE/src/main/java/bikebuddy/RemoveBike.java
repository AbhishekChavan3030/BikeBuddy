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

@WebServlet("/removeBike")
public class RemoveBike extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DataBaseConnection.getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("SET SQL_SAFE_UPDATES = 0");

            String remove = "DELETE FROM bike WHERE username = ?";
            ps = con.prepareStatement(remove);
            ps.setString(1, (String) session.getAttribute("usercustomer"));
            
            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("customerAddBike.jsp");
                
                session.setAttribute("model", null);
				session.setAttribute("series", null);
				session.setAttribute("brand", null);
				session.setAttribute("engine", null);
				session.setAttribute("year", null);
				session.setAttribute("chassis", null);
				session.setAttribute("reg", null);
            }else {
            	
            	response.sendRedirect("customerHome.jsp");
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
