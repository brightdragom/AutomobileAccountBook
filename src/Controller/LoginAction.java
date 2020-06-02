package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnection;


/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		System.out.println("id : "+id+"\t pw : "+pw);
		DBConnection db = new DBConnection();
		
		if(db.login(id, pw)) {
			request.setAttribute("user_id", id);
			request.setAttribute("user_pw", pw);
			RequestDispatcher rd = request.getRequestDispatcher("testMainjsp.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getHeader("referer")+"?error=1");		
		}
	}

}
