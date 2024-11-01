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
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/searchParts")
public class SearchPart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("customerViewParts.jsp");
    }
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            con = DataBaseConnection.getConnection();

            String query = "SELECT * FROM parts";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            List<Parts> cpartlist = new ArrayList<>();

            while (rs.next()) {
                Parts cpart = new Parts();
                
                cpart.setMechanic(rs.getString("username"));
                cpart.setPartId(rs.getString("partid"));
                cpart.setPartName(rs.getString("partname"));
                cpart.setPartModel(rs.getString("partmodel"));
                cpart.setPartQuantity(rs.getString("partquantity"));

                cpartlist.add(cpart);
            }


            session.setAttribute("customerpartsList", cpartlist);

            doGet(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("commonError.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("commonError.jsp");
            }
        }
    }
}
