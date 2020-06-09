<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta name="viewport" content="width=device-width" initial-scale="1">


<link rel="stylesheet" href="css/bootstrap.min.css">

<title>회원가입</title>

</head>

<body>

	
	<!-- 로그인 폼 -->

	<div class="container">

		<div class="col-lg-4"></div>

		<div class="col-lg-4">


			<div class="jumbotron" style="padding-top: 20px;">

				<!-- 로그인 정보를 숨기면서 전송post -->

				<form method="post" action="joinAction.jsp">

					<h3 style="text-align: center;">회원가입</h3>


					<div class="form-group">


						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">

					</div>

					<div class="form-group" style="text-align: center;">
						<button id="idChkBtn" class="btn btn-primary"
							onclick="registerCheck">중복확인</button>
					</div>

					<div class="form-group">

						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">

					</div>

					<div class="form-group">

						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">

					</div>

					<div class="form-group">

						<input type="text" class="form-control"
							placeholder="이메일 ex) kooaas@daum.net" name="userEmail"
							maxlength="50">

					</div>

					<div class="form-group">

						<input type="text" class="form-control"
							placeholder="전화번호 ex) 01038879849" name="userPhone"
							maxlength="50">

					</div>

					<div class="form-group">

						<input type="text" class="form-control" placeholder="주소"
							name="userAddr" maxlength="50">

					</div>

					<div class="form-group" style="text-align: center;">

						<div class="btn-group" data-toggle="buttons">

							<label class="btn btn-primary active"> <input
								type="radio" name="userGender" autocomplete="off" value="남자"
								checked>남자

							</label> <label class="btn btn-primary"> <input type="radio"
								name="userGender" autocomplete="off" value="여자">여자

							</label>

						</div>

					</div>

					<div class="form-group" style="text-align: center;">

						<div class="btn-group" data-toggle="buttons">

							<label class="btn btn-primary active"> <input
								type="radio" name="userGender" autocomplete="off" value="정비사"
								checked>정비사

							</label> <label class="btn btn-primary"> <input type="radio"
								name="userPart" autocomplete="off" value="운전자">운전자

							</label>

						</div>

					</div>





					<input type="submit" class="btn btn-primary form-control"
						value="회원가입">





				</form>

			</div>

		</div>

	</div>





	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>
	<%
	
		String messageContent = null;
		if(session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		
		String messageType = null;
		if(session.getAttribute("messageContent") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) {
	%>

	<div class="modal fade" id="messageModel" tabindex="-1" role="dialog" aria-hidden="true">  
		<div class="vertical-aligment-helper">
			<div class="modal-content <% if (messageType.equals("오류메세지")) out.println("panel-warning"); else out.println("panel-sucess"); %>">
				<div class="modal-header panel-headding">
					<button type="button" class="close" data-dismiss="model">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="model-title">
						<%= messageType %>
					</h4>
				</div>
				<div class="modal-body">
					<%= messageContent %>
				</div>
				<div class="model-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%		
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	
</body>

</html>



