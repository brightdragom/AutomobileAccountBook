<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
body {
	background-color: #70bfe4;
}

.container {
	margin-top: 15%;
}

.container-fluid {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
</style>

<script type="text/javascript">
	function registerCheckFunction() {
		var id = $('#id').val();
		$.ajax({
			type : 'POST',
			url : '/AutomobileAccountBook/UserRegisterCheckServlet',
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					$('#checkMessage').html('사용할 수 있는 아이디 입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없습니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	}
	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();

		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
</script>
<style>
.vertical-alignment-helper {
	display: table;
	height: 100%;
	width: 100%;
	pointer-events: none;
}

.vertical-align-center {
	display: table-cell;
	vertical-align: middle;
	pointer-events: none;
}

.modal-content {
	width: inherit;
	height: inherit;
	margin: 0 auto;
	pointer-events: none;
}

.navbar-brand {
	display: inline-block;
	padding-top: 0.3125rem;
	padding-bottom: 0.3125rem;
	margin-right: 1rem;
	font-size: 1.25rem;
	line-height: inherit;
	white-space: nowrap;
	height: auto;
}
</style>
<title>회원가입</title>
</head>
<body>
	<!-- 로그인 폼 -->
	<div class="container" style="padding-top: 2.5%;">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form Action="/AutomobileAccountBook/RegisterAction" method="post">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" id="id"
							name="id" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<button class="btn btn-primary"
							style="color: #fff; background-color: #70bfe4; border-color: #70bfe4;"
							onclick="registerCheckFunction();" type="button">중복확인</button>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							id="userPassword1" name="pw1" maxlength="20"
							onkeyup="passwordCheckFunction();">
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="재 확인 비밀번호" id="userPassword2" name="pw2"
							maxlength="20" onkeyup="passwordCheckFunction();">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="name" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="이메일 ex) kooaas@daum.net" name="email" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="전화번호 ex) 01038879849" name="phone" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소"
							name="addr" maxlength="50">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"
								>
								<input type="radio" name="career" autocomplete="off" value="정비사"
								checked>정비사
							</label> <label class="btn btn-primary"
								>
								<input type="radio" name="career" autocomplete="off" value="운전자">운전자
							</label>
						</div>
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active" ><!-- style="color: #fff; background-color: #70bfe4; border-color: #70bfe4;" -->
								<input type="radio" name="gender" autocomplete="off" value="M"checked>남자
							</label> 
							<label class="btn btn-primary" ><!-- style="color: #fff; background-color: #a3dae8; border-color: #a3dae8;" -->
								<input type="radio" name="gneder" autocomplete="off" value="F">여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<h5 style="color: red;" id="passwordCheckMessage"></h5>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						style="color: #fff; background-color: #70bfe4; border-color: #70bfe4;"
						value="회원가입">
					<div class="card-footer text-center">
						<div class="small">
							<br>
							<a href="index.jsp">Have an account? Go to login</a>
						</div>
						<div
							class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
							<a class="small" href="FindId.jsp">Forgot ID?</a>&nbsp;&nbsp;<a
								class="small" href="FindPw.jsp">Forgot Password?</a>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	<!-- 빈칸일 경우 오류 메세지 출력   -->
	<%
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}

		String messageType = null;
		if (session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) {
	%>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div
					class="modal-content
					<%if (messageType.equals("ErroMessage"))
					out.println("panel-warning");
				else
					out.println("panel-sucess");%>">
					<div class="modal-header panel-headding">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="model-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="model-footer" align="right">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
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
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="model-title">확인 메세지</h4>
					</div>
					<div class="modal-body" id="checkMessage"></div>
					<div class="model-footer" align="right">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



