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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/mechanicBookings")
public class MechanicBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Booking> bookings = new ArrayList<>();

        try {
            con = DataBaseConnection.getConnection();
            if (con == null) {
                throw new Exception("Database connection is null");
            }

            String fetch = "SELECT * FROM booking WHERE mechanic = ?";
            ps = con.prepareStatement(fetch);
            ps.setString(1, (String) session.getAttribute("usermechanic"));
            rs = ps.executeQuery();

            while (rs.next()) {
                String customerName = rs.getString("cfname") + " " + rs.getString("clname");
                Booking booking = new Booking(
                    customerName,
                    rs.getString("booktype"),
                    rs.getString("cmobile"),
                    rs.getString("cemail"),
                    rs.getString("bike"),
                    rs.getString("bookingdate")
                );
                bookings.add(booking);
            }

            session.setAttribute("bookings", bookings);
            response.sendRedirect("mechanicBookings.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("commonError.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception ex) {
            	response.sendRedirect("commonError.jsp");
            }
        }
    }
}
