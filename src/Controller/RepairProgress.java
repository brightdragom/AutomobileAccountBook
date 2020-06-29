package Controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		User user = (User) session.getAttribute("user");

		int maxSize = 1024 * 1024 * 10;
		//SavePath(ex : /home/tour/web/ROOT/upload)
		String savePath = "C:\\Users\\Gwang\\Desktop\\AutomobileAccountBook\\WebContent\\upload";
		System.out.println("Save File Path > > " + savePath);
		String uploadFile = "";

		String newFileName = "";
		String repair_no = null, contents = null, doday = null;
		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fullpath = "";
		try {

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			repair_no = (String) session.getAttribute("reno");
			contents = multi.getParameter("item.contents");
			doday = multi.getParameter("item.doday");
			System.out.println(repair_no + "||" + contents + "||" + doday + ":");
		
			String realFolder = "";
			 String filename1 = "";
			 String encType = "euc-kr";
			 String savefile = "img";
			 ServletContext scontext = getServletContext();
			 realFolder = scontext.getRealPath(savefile);
			 
			 try{
				 Enumeration<?> files = multi.getFileNames();
			     String file1 = (String)files.nextElement();
			     filename1 = multi.getFilesystemName(file1);
			 } catch(Exception e) {
			  e.printStackTrace();
			 }
			 
			 fullpath ="upload\\" + filename1;
			 System.out.println("***************************");
			 System.out.println("***************************");
			 System.out.println("***************************");
			 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>"+fullpath);
			 System.out.println("***************************");
			 System.out.println("***************************");
			 System.out.println("***************************");
			 System.out.println("***************************");

		} catch (Exception e) {
			System.out.println("-------------------------------------------------------");
			e.printStackTrace();
		}
		System.out.println("");
		db.Add_RepairProgressline(Integer.parseInt(repair_no), contents, doday, user.getId(), fullpath);

		List<Repair> list = db.getRepairProgressList(repair_no + "");
		int i =0;
		System.out.println("----------------------");
		while(i < list.size()) {
			System.out.println("-"+list.get(i).getRepair_no()+"|"+list.get(i).getContents()+"|"+list.get(i).getImg()+"-");
			i++;
		}
		System.out.println("--------------------------");
		request.setAttribute("item", list);
		session.removeAttribute("reno");
		RequestDispatcher rd = request.getRequestDispatcher("main/RepairProgressList.jsp");
		rd.forward(request, response);
	}

}
