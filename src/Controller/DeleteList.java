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
 * Servlet implementation class DeleteList
 */
@WebServlet("/Delete")
public class DeleteList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] line_no = request.getParameterValues("item_list");
		if(line_no.equals(null)) {
			RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
			rd.forward(request, response);
		}
		System.out.println(line_no.length);
		HttpSession session = request.getSession();
		DBConnection db = (DBConnection) session.getAttribute("db");
		User user = (User)session.getAttribute("user");
		for(int i = 0; i < line_no.length; i++) {
			System.out.println("POST>>>"+line_no[i]+"<<<<");
			boolean result = db.deleteLine(line_no[i]);
			if(result) {
				System.out.println("delete success >> "+line_no[i]+"<<");
			}
		}
		List<AutoAccountList> list = db.getHousekeepingList(user.getId());	//로그인 한 사람이 작성한 가계부 내용 가져오는 코드
		
		request.setAttribute("item_list", list);
		RequestDispatcher rd = request.getRequestDispatcher("main/housekeepingBook_view.jsp");
		rd.forward(request, response);
	}

}
