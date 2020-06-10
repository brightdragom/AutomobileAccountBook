package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnection;
import model.AutoAccountList;


/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnection db;
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		System.out.println("id : "+id+"\t pw : "+pw);
		db = new DBConnection();
		
		if(db.login(id, pw)) {
			List<AutoAccountList> list = db.getHousekeepingList(id);
			System.out.println("list Size : "+list.size());
			request.setAttribute("user_id", id);
			request.setAttribute("user_pw", pw);
			request.setAttribute("item_list", list);
			request.setAttribute("db", db);
			RequestDispatcher rd = request.getRequestDispatcher("housekeepingBook_view.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getHeader("referer")+"?error=1");		
		}
		
	}

}
