package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DBConnection;
import DAO.DBConnection.*;
@WebServlet("/RegisterAction")
public class RegisterAction extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String part = request.getParameter("part");
		String addr = request.getParameter("addr");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		if(id == null || id.equals("") || pw == null || pw.equals("" ) || phone == null || phone.equals("") ||
				email == null || email.equals("") || part == null || part.equals("") || addr == null || addr.equals("")
				|| name == null || name.equals("") ||  gender == null || gender.equals(gender)){
			request.getSession().setAttribute("messageType", "오류");
			request.getSession().setAttribute("messageType", "모든 내용을 입력 하시오");
			response.sendRedirect("main/Register.jsp");
			return;
		}
		int result = new DBConnection().register(id, pw, phone, email, part, addr, name, gender);
		if (result == 1) {
			request.getSession().setAttribute("messageType", "성공");
			request.getSession().setAttribute("messageType", "회원가입 성공");
			response.sendRedirect("main/Register.jsp");
			return;
		} else {
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageType", "이미 존재 합니다.");
			response.sendRedirect("main/Register.jsp");
			return;
		}
	}
	
	
}

