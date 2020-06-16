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
@WebServlet("/wirteAction")
public class writeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public writeAction() {
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
		String no = (String) request.getParameter("repair.no");
		String contents = (String) request.getParameter("repair.content");
		String technician = (String) request.getParameter("repair.technician");
		String date = (String) request.getParameter("repair.todate");
		
		boolean result = db.Add_line(user, new AutoAccountList(null, date, contents, Integer.parseInt(no), Integer.parseInt(technician), user.getId()));
		if(result) {
			List<AutoAccountList> list = db.getHousekeepingList(user.getId());	//濡쒓렇�씤 �븳 �궗�엺�씠 �옉�꽦�븳 媛�怨꾨� �궡�슜 媛��졇�삤�뒗 肄붾뱶
			
			request.setAttribute("repairCheck", list);	
			
			RequestDispatcher rd = request.getRequestDispatcher("main/RepairCheck.jsp");
			rd.forward(request, response);	
		}else {
			//�닔�젙 �슂留�
			response.sendRedirect(request.getHeader("referer")+"?error=1");	
		}
	}

}