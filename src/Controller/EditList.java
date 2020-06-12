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
import javax.servlet.http.HttpSession;

import DAO.DBConnection;
import model.AutoAccountList;
import model.User;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/Edit")
public class EditList extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DBConnection db = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditList() {
    	
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String line_no = request.getParameter("item.line_no");
    	String todate = request.getParameter("item.todate");
    	String contents = request.getParameter("item.content");
    	int cost = Integer.parseInt(request.getParameter("item.cost"));
    	int mileage = Integer.parseInt(request.getParameter("item.cost"));
    	String writer = request.getParameter("item.writer");
    	
    	AutoAccountList aac = new AutoAccountList(line_no, todate,contents,cost,mileage,writer);
    	HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		db = (DBConnection) session.getAttribute("db");
		boolean result = db.editLine(aac);
		
		if(result) {
			System.out.println(">>>>Edit Success<<<<");
			List<AutoAccountList> list = db.getHousekeepingList(user.getId());	//로그인 한 사람이 작성한 가계부 내용 가져오는 코드
			
			request.setAttribute("item_list", list);
			RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
			rd.forward(request, response);
		}else {
			System.out.println(">>>>Edit fail<<<<");
			RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
			rd.forward(request, response);
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		db = (DBConnection) session.getAttribute("db");
		String line_no = request.getParameter("item_list");
		AutoAccountList line_info = db.findLine(line_no);
		
		request.setAttribute("item", line_info);
		RequestDispatcher rd = request.getRequestDispatcher("main/Edit.jsp");
		rd.forward(request, response);
	}


}
