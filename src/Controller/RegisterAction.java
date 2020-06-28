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
			request.getSession().setAttribute("messageType", "�삤瑜�");
			request.getSession().setAttribute("messageContent", "紐⑤뱺 �궡�슜�쓣 �엯�젰 �븯�떆�삤");
			response.sendRedirect("login/Register.jsp");
			return;
		}
		if (!pw1.equals(pw2)) {
			request.getSession().setAttribute("messageType", "�삤瑜�");
			request.getSession().setAttribute("messageContent", "鍮꾨�踰덊샇媛� �꽌濡� �씪移섑븯吏� �븡�뒿�땲�떎.");
			response.sendRedirect("login/Register.jsp");
			return;
		}
		int result = new DBConnection().register(name, id, pw1, phone, email, career.equals("정비사") ? "T" : "D", addr, gender);
		if (result == 1) {
			request.getSession().setAttribute("messageType", "�꽦怨�");
			request.getSession().setAttribute("messageContent", "�쉶�썝媛��엯 �꽦怨�");
			response.sendRedirect("login/index.jsp");
			return;
		} else {
			request.getSession().setAttribute("messageType", "�삤瑜� 硫붿꽭吏�");
			request.getSession().setAttribute("messageContent", "�씠誘� 議댁옱 �빀�땲�떎.");
			response.sendRedirect("login/Register.jsp");
			return;
		}
	}

}