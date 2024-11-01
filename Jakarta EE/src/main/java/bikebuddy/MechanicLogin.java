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

@WebServlet("/mlogin")
public class MechanicLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            con = DataBaseConnection.getConnection();
            String query = "SELECT * FROM mechanic WHERE username=? AND password=?";
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("usermechanic", name);
                session.setAttribute("fname", rs.getString("FirstName"));
                session.setAttribute("lname", rs.getString("LastName"));
                session.setAttribute("mobile", rs.getString("contactnumber"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("dob", rs.getString("dob"));

                String bookingCountQuery = "SELECT COUNT(*) FROM booking WHERE mechanic = ?";
                PreparedStatement psBookingCount = con.prepareStatement(bookingCountQuery);
                psBookingCount.setString(1, name);
                ResultSet rsBookingCount = psBookingCount.executeQuery();
                if (rsBookingCount.next()) {
                    int bookingCount = rsBookingCount.getInt(1);
                    session.setAttribute("bookingCount", bookingCount);
                }

                String partCountQuery = "SELECT COUNT(*) FROM parts WHERE username = ?";
                PreparedStatement psPartCount = con.prepareStatement(partCountQuery);
                psPartCount.setString(1, name);
                ResultSet rsPartCount = psPartCount.executeQuery();
                if (rsPartCount.next()) {
                    int partCount = rsPartCount.getInt(1);
                    session.setAttribute("partCount", partCount);
                }

                response.sendRedirect("mechanicHome.jsp");
            } else {
                response.sendRedirect("mechanicLogin.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("commonError.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
