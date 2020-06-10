package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnection;
import model.AutoAccountList;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class EditList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DBConnection db = new DBConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditList() {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*String line_no = request.getParameter("item_list");
		HousekeepingBook hkb = db.findLine(line_no);
		
		request.setAttribute("hkb", hkb);
		System.out.println("set dis");
		RequestDispatcher rd = request.getRequestDispatcher("fix_test.jsp");
		rd.forward(request, response);*/
		
		String[] values = request.getParameterValues("item_list");	//line_no
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("fix_test.jsp");
		rd.forward(request, response);
		
	}


}
