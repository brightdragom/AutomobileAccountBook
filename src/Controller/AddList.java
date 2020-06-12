package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * Servlet implementation class AddList
 */
@WebServlet("/AddList")
public class AddList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		DBConnection db = (DBConnection) session.getAttribute("db");
		String date = (String) request.getParameter("item_list.todate");
		String contents = (String) request.getParameter("item_list.content");
		String cost = (String) request.getParameter("item_list.cost");
		String mileage = (String) request.getParameter("item_list.mileage");
		
		boolean result = db.Add_line(user, new AutoAccountList(null, date, contents, Integer.parseInt(cost), Integer.parseInt(mileage), user.getId()));
		if(result) {
			List<AutoAccountList> list = db.getHousekeepingList(user.getId());	//로그인 한 사람이 작성한 가계부 내용 가져오는 코드
			
			request.setAttribute("item_list", list);	
			
			RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
			rd.forward(request, response);	
		}else {
			//수정 요망
			response.sendRedirect(request.getHeader("referer")+"?error=1");	
		}
	}

}
