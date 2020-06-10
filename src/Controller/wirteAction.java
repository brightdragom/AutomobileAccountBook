package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnection;
import model.HousekeepingBook;


/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/writeAction")
public class wirteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnection db;
    public wirteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String t = request.getParameter("title");
		String c = request.getParameter("content");
		
		db = new DBConnection();
		
		if(db.login(t, c)) {
			request.setAttribute("title", t);
			request.setAttribute("content", c);
			RequestDispatcher rd = request.getRequestDispatcher("RefairCheck.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getHeader("referer")+"?error=1");		
		}
	}

}
