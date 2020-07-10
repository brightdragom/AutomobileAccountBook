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
import model.RepairCheck;
import model.User;

/**
 * Servlet implementation class AddRepair
 */
@WebServlet("/AddRepair")
public class AddRepair extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Tests");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		DBConnection db = (DBConnection) session.getAttribute("db");
		String driver_id = (String) request.getParameter("item_list.driver_id");
		String contents = (String) request.getParameter("item_list.contents");
		String start_time = (String) request.getParameter("item_list.start_time");
		String expect_time = (String) request.getParameter("item_list.expect_time");
		String technician_id = user.getId();
		String technician_name = user.getName();
		String finish_time = new String("0000-00-00");
		int cost = 0;
		
		RepairCheck rc = db.createRepairCheck(driver_id, contents, technician_id, technician_name, start_time, expect_time, finish_time, cost);
		boolean result = db.Add_Repairline(rc);
		if(result) {
			List<RepairCheck> item = db.getRepairList(user);	//로그인 한 사람이 작성한 가계부 내용 가져오는 코드
			
			request.setAttribute("item", item);	
			
			RequestDispatcher rd = request.getRequestDispatcher("main/RepairList.jsp");
			rd.forward(request, response);	
		}else {
			//수정 요망
			response.sendRedirect(request.getHeader("referer")+"?error=1");	
		}
	}

}
