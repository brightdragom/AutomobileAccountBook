<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	//동작 안댐 수정해야됨
	out.println("<script>alert('안녕히 가세요!'); history.back();</script>");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
		System.out.println("session.invalidate() 실행 완료");
	%>	
	<script type="text/javascript">
		alert('logout successfully');
	</script>
	<%
		response.sendRedirect("/AutomobileAccountBook/login/index.jsp");
	%>
</body>
</html>