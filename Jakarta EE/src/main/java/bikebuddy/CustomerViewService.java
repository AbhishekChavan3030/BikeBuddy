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

@WebServlet("/viewMyServices")
public class CustomerViewService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<FetchBookings> fetchBookingsList = new ArrayList<>();
        HttpSession session = request.getSession();
        
        try {
            con = DataBaseConnection.getConnection();
            
            String query = "SELECT * FROM booking WHERE customer = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, (String) session.getAttribute("usercustomer"));
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                FetchBookings booking = new FetchBookings();
                
                booking.setCustomer(rs.getString("customer"));
                booking.setCfname(rs.getString("cfname"));
                booking.setClname(rs.getString("clname"));
                booking.setMechanic(rs.getString("mechanic"));
                booking.setMfname(rs.getString("mfname"));
                booking.setMlname(rs.getString("mlname"));
                booking.setCmobile(rs.getString("cmobile"));
                booking.setCemail(rs.getString("cemail"));
                booking.setMmobile(rs.getString("mmobile"));
                booking.setMemail(rs.getString("memail"));
                booking.setBooktype(rs.getString("booktype"));
                booking.setBike(rs.getString("bike"));
                booking.setBookingdate(rs.getString("bookingdate"));
                
                fetchBookingsList.add(booking);
            }
            session.setAttribute("FetchBookings", fetchBookingsList);
            
            response.sendRedirect("customerViewService.jsp");
        } catch (Exception e) {
        	response.sendRedirect("commonError.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
            	response.sendRedirect("commonError.jsp");
            }
        }
    }
}
