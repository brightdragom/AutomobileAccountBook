<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">

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
					$('#checkType').attr('class',
							'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	}
	function passwordCheckFunction(){
        var userPassword1 = $('#userPassword1').val();
        var userPassword2 = $('#userPassword2').val();
         
        if(userPassword1!=userPassword2){
            $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
        }
        else{
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
    height:auto;
}
</style>
<title>회원가입</title>
</head>


<body >
      
            <a class="navbar-brand" href="index.jsp">로그인</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
             
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg class="svg-inline--fa fa-user fa-w-14 fa-fw" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="user" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg>
                    <path fill="currentColor" d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"></path>
                    </svg>
                    
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="FindId.jsp">아이디 찾기</a><a class="dropdown-item" href="FindPw.jsp">비밀번호 찾기</a>
                </li>
            </ul>
        
 

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
						<button class="btn btn-primary" onclick="registerCheckFunction();"
							type="button">중복확인</button>
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

							<label class="btn btn-primary active"> <input
								type="radio" name="career" autocomplete="off" value="정비사" checked>정비사

							</label> <label class="btn btn-primary"> <input type="radio"
								name="career" autocomplete="off" value="운전자">운전자

							</label>

						</div>

					</div>

					<div class="form-group" style="text-align: center;">

						<div class="btn-group" data-toggle="buttons">

							<label class="btn btn-primary active"> <input
								type="radio" name="gender" autocomplete="off" value="M" checked>남자

							</label> <label class="btn btn-primary"> <input type="radio"
								name="gneder" autocomplete="off" value="F">여자

							</label>

						</div>

					</div>

					<div class="form-group">

						<h5 style="color: red;" id="passwordCheckMessage"></h5>

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
					<%if (messageType.equals("오류메세지"))
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



