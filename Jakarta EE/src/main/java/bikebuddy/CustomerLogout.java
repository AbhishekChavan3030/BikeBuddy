package bikebuddy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cLogout")
public class CustomerLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("usercustomer");
			session.invalidate();

			response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate()");
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			response.sendRedirect("commonError.jsp");
		}
	}

}
