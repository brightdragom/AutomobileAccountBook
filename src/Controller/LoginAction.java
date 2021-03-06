package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DBConnection;
import model.AutoAccountList;
import model.User;


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

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(user != null) {
			
			List<AutoAccountList> list = db.getHousekeepingList(user.getId());	//로그인 한 사람이 작성한 가계부 내용 가져오는 코드
			
			request.setAttribute("item_list", list);
			session.setAttribute("db", db);
			RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getHeader("referer")+"?error=1");		
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		System.out.println("id : "+id+"\t pw : "+pw);
		db = new DBConnection();
		User user = db.login(id, pw);
		if(user != null) {
			
			List<AutoAccountList> list = db.getHousekeepingList(id);	//로그인 한 사람이 작성한 가계부 내용 가져오는 코드
			
			request.setAttribute("item_list", list);			
			//세션 등록
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			session.setAttribute("db", db);
			RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getHeader("referer")+"?error=1");		
		}
		
	}

}
