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

@WebServlet("/viewpartorder")
public class CustomerPartOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("customerViewPartOrder.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<PartsOrderJava> orderList = new ArrayList<>();
        HttpSession session = request.getSession();

        String customer = (String) session.getAttribute("usercustomer");

        if (customer == null) {
            response.sendRedirect("customerLogin.jsp");
            return;
        }

        try (Connection con = DataBaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM partsorders WHERE customer = ?")) {

            ps.setString(1, customer);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PartsOrderJava partsOrder = new PartsOrderJava();
                    partsOrder.setUsername(rs.getString("username"));
                    partsOrder.setPartid(rs.getString("partid"));
                    partsOrder.setPartname(rs.getString("partname"));
                    partsOrder.setPartmodel(rs.getString("partmodel"));
                    partsOrder.setCustomer(rs.getString("customer"));

                    orderList.add(partsOrder);
                }
            }

            session.setAttribute("PartsOrderJavaList", orderList);
            

            doGet(request, response);

        } catch (Exception e) {
          
            response.sendRedirect("commonError.jsp");
        }
    }
}
