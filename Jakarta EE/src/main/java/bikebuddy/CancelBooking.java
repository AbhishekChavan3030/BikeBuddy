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

@WebServlet("/cancelBooking")
public class CancelBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("customerViewService.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DataBaseConnection.getConnection();

            String query = "DELETE FROM booking WHERE customer = ? AND cfname = ? AND clname = ? AND mfname = ? AND mlname = ? "
                         + "AND cmobile = ? AND cemail = ? AND mmobile = ? AND memail = ? AND booktype = ? AND bike = ? "
                         + "AND bookingdate = ?";

            ps = con.prepareStatement(query);
            ps.setString(1, (String) session.getAttribute("usercustomer"));
            ps.setString(2, request.getParameter("cfname"));
            ps.setString(3, request.getParameter("clname"));
            ps.setString(4, request.getParameter("mfname"));
            ps.setString(5, request.getParameter("mlname"));
            ps.setString(6, request.getParameter("cmobile"));
            ps.setString(7, request.getParameter("cemail"));
            ps.setString(8, request.getParameter("mmobile"));
            ps.setString(9, request.getParameter("memail"));
            ps.setString(10, request.getParameter("booktype"));
            ps.setString(11, request.getParameter("bike"));
            ps.setString(12, request.getParameter("bookingdate"));

            int rs = ps.executeUpdate();
            if (rs > 0) {
                doGet(request, response); 
            } else {
                response.sendRedirect("commonError.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
