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
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String career = request.getParameter("career");
		String addr = request.getParameter("addr");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		if (id == null || id.equals("") || pw1 == null || pw1.equals("") || phone == null || phone.equals("")
				|| email == null || email.equals("") || career == null || career.equals("") || addr == null
				|| addr.equals("") || name == null || name.equals("") || gender == null || gender.equals("")) {
			request.getSession().setAttribute("messageType", "Erro");
			request.getSession().setAttribute("messageContent", "Please enter all the contents.");
			response.sendRedirect("login/Register.jsp");
			return;
		}
		if (!pw1.equals(pw2)) {
			request.getSession().setAttribute("messageType", "Erro");
			request.getSession().setAttribute("messageContent", "Passwords do not match.");
			response.sendRedirect("login/Register.jsp");
			return;
		}
		int result = new DBConnection().register(name, id, pw1, phone, email, career.equals("정비사") ? "T" : "D", addr, gender);
		if (result == 1) {
			request.getSession().setAttribute("messageType", "Successfully");
			request.getSession().setAttribute("messageContent", "Success in signing up as a member");
			response.sendRedirect("login/index.jsp");
			return;
		} else {
			request.getSession().setAttribute("messageType", "ErroMessage");
			request.getSession().setAttribute("messageContent", "It already exists.");
			response.sendRedirect("login/Register.jsp");
			return;
		}
	}

}