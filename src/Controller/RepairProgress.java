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
import model.Repair;
import model.User;

/**
 * Servlet implementation class RepairProgress
 */
@WebServlet("/RepairProgress")
public class RepairProgress extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DBConnection db;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepairProgress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String repair_no = request.getParameter("item");
		System.out.println(">>>doGet _ "+repair_no);

		HttpSession session = request.getSession();
		db = (DBConnection) session.getAttribute("db");
		List<Repair> list = db.getRepairProgressList(repair_no);
		request.setAttribute("repair_no", repair_no);
		session.setAttribute("reno", repair_no);
		request.setAttribute("item", list);
		RequestDispatcher rd = request.getRequestDispatcher("main/RepairProgressList.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String repair_no = (String) session.getAttribute("reno");
		String contents = request.getParameter("item.contents");
		String doday = request.getParameter("item.doday");
		System.out.println(repair_no+"||"+contents+"||"+doday+":"+repair_no.getClass());
		db.Add_RepairProgressline(Integer.parseInt(repair_no), contents, doday, user.getId());
		
		List<Repair> list = db.getRepairProgressList(repair_no+"");
		
		request.setAttribute("item", list);
		session.removeAttribute("reno");
		RequestDispatcher rd = request.getRequestDispatcher("main/RepairProgressList.jsp");
		rd.forward(request, response);
	}

}
