<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="DAO.*" %>



<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>아이디 찾기</title>

</head>

<%

   request.setCharacterEncoding("UTF-8");

   String name = request.getParameter("name");

   String phone1 = request.getParameter("phone");

   String phone2 = request.getParameter("phone1");

   String phone3 = request.getParameter("phone2");

   String phone = phone1+ "-" +phone2 + "-" + phone3;

   DBConnection db = new DBConnection();
   
   String id = db.findId(name, phone);

%>

<body>

   <form method="post" action="startPage.jsp">

<table width="1330px"  border="0"  height="430px" align="center"   >

   <tr>

    <td>

     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">

    <tr>

    <td>

     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >

      <%if(id!= null){ %>

      <tr>

       <td><%=name %>님의 아이디는</td>

      </tr>

      <tr>

      <td><h1><%=id %></h1>입니다.</td>

      </tr>

      </table>

    </td> 

    </tr>       

   <tr> 

    <td>

      <table width="150px"  align="center" border="0" style="margin-top:1%">

       <tr>

        <td><input type="submit" name="search" value="로그인하기" class="btn btn-primary">

       </tr>

      </table>

      <%} else{%>

      <tr>

      <td><%=name %>님!</td>

      </tr>

      <tr>

      <td><h1>가입정보가 없습니다.</h1></td>

      </tr>   

      </table>

    </td> 

    </tr>       

   <tr> 

    <td>

      <table width="150px"  align="center" border="0" style="margin-top:1%">

       <tr>

        <td><input type="button" value="회원가입하기" class="btn btn-primary" onclick="location.href='Register.jsp'"></td>

        <td><input type="button" value="로그인" class="btn btn-primary" onclick="location.href='index.jsp'"></td>

       </tr>

      </table>   

      <%} %>

      

     

     </td>

    </tr>

  </table>

 </td>

</tr>

</table>

</form>

</body>

</html>

