<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMILY - 로그인</title>
<style>

	/* 전체 페이지 크기 */
	#wrap {
		width: 1200px;
		height: auto;
		margin: 0 auto;
	}
	#login-page-area {
		background-color: rgb(255, 246, 218);
		height: 710px;
		display: flex;
	}

	/* login-page-area */
	#login-page-area a {text-decoration: none;}

	/* login-page-area > login-box-area */
	#login-box-area {margin: auto;}

	/* login-box-title */
	#login-box-title {
		color: black;
		font-weight: bold;
		font-size: 23px;
	}

	/* login-box-content */
	#login-box-content {
		border: 5px solid rgb(232, 191, 123);
		background-color: white;
		width: 500px;
		height: 290px;
	}
	#login-form {
		width: 100%;
		height: 100%;
		display: flex;
	}
	#login-form-wrap {
		width: 400px;
		height: 210px;
		margin: auto;
		text-align: center;
	}
	#login-form-wrap > div {margin-bottom: 10px;}

	/* login-box-content > 아이디, 비밀번호 입력 부분 */
	.input-border {
		background-color: white;
		width: 398px;
		height: 43px;
		border: 1px solid rgb(125, 125, 125);
		border-radius: 5px;
		display: flex;
	}
	.input-border > .input-icon {
		width: 11%;
		height: 100%;
		margin-top: 4px;
	}
	.input-border > .input-wrap {
		width: 89%;
		height: 100%;
		margin-top: 2px;
	}
	.input-border img {
		height: 80%;
	}
	.input-border input {
		width: 95%;
		height: 90%;
		font-size: 18px;
		border: none;
		background: transparent;
		outline: none;
	}

	/* login-box-content > 로그인 상태 유지, 아이디, 비밀번호 찾기 부분 */
	#login-box-mini-menu {height: 45px;}
	#login-box-mini-menu > div {
		float: left;
		box-sizing: border-box;
	}
	#stay-logged-in-1 > input {
		width: 20px;
		height: 20px;
		margin-left: 0;
	}
	#stay-logged-in-2 {
		width: 177px;
		height: 27px;
		color: rgb(125, 125, 125);
		font-size: 13px;
		text-align: left;
		margin-top: 4px;
	}
	#login-box-find-menu {
		width: 50%;
		height: 27px;
		text-align: right;
		margin-top: 2px;
	}
	#login-box-find-menu > a {
		color: rgb(155, 128, 82);
		font-weight: bold;
	}

	/* login-box-content > 로그인 버튼 부분 */
	#login-form-wrap button {
		width: 400px;
		height: 45px;
		color: white;
		background-color: rgb(232, 191, 123);
		font-size: 20px;
		font-weight: bold;
		border: 1px solid rgb(155, 128, 82);
		border-radius: 5px;
		cursor: pointer;
	}

	/* login-box-tail */
	#login-box-tail {
		color: rgb(125, 125, 125);
		font-weight: bold;
		text-align: center;
		margin-top: 40px;
	}
	#login-box-tail > a {
		color: rgb(155, 128, 82);
		font-weight: bold;
	}
	
</style>
</head>
<body>

	<div id="wrap">
	
		<!-- header -->
		<%@ include file="../common/header.jsp" %>
		
		<!-- content -->
		<script>

            // 로그인 상태로 접근 제한
            $(document).ready(function(){
            
                var loginUser = "<%= loginUser %>";

                if (loginUser != 'null') {
                    
                    alert('로그인한 상태에서는 \n해당 페이지에 접근할 수 없습니다.');
                    history.back();
                }
            });

        </script>

		<div id="login-page-area">
			<div id="login-box-area">

				<div id="login-box-title">
					&nbsp;로그인
				</div>

				<div id="login-box-content">
					<form id="login-form" method="post" action="/SemiProject/login.me">
						<div id="login-form-wrap">

							<!-- 아이디 입력 부분 -->
							<div class="login-input">
								<div class="input-border">
									<div class="input-icon">
										<img src="<%= contextPath %>/resources/login-id-picture.png">
									</div>
									<div class="input-wrap">
										<input class="input" type="text" name="userId" placeholder="아이디" required>
									</div>
								</div>
							</div>

							<!-- 비밀번호 입력 부분 -->
							<div class="login-input">
								<div class="input-border">
									<div class="input-icon">
										<img src="<%= contextPath %>/resources/login-pwd-picture.png">
									</div>
									<div class="input-wrap">
										<input class="input" type="password" name="userPwd" placeholder="비밀번호" required>
									</div>
								</div>
							</div>

							
							<div id="login-box-mini-menu">

								<!-- 로그인 상태 유지 -->
								<div id="stay-logged-in-1">
									<input type="checkbox" name="" id="">
								</div>
								<div id="stay-logged-in-2">
									&nbsp;로그인 상태 유지
								</div>

								<!-- 아이디 찾기, 비밀번호 찾기 -->
								<div id="login-box-find-menu">
									<a href="<%= contextPath %>/find.me?type=0">아이디 찾기</a>
									&nbsp;<a href="<%= contextPath %>/find.me?type=1">비밀번호 찾기</a>
								</div>
							</div>

							<!-- 로그인 버튼 -->
							<div>
								<button type="submit">로그인</button>
							</div>

						</div>
					</form>
				</div>

				<!-- 회원가입 버튼 -->
				<div id="login-box-tail">
					아직 회원이 아니신가요?
					&nbsp;
					<a href="<%= contextPath %>/enrollForm.me">회원가입</a>
				</div>

			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="../common/footer.jsp" %>
		
	</div>

	<script>

		// 아이디, 비밀번호 input 선택 시 테두리 색 변경
		var input = document.getElementsByClassName('input');

		for (let i = 0; i < input.length; i++) {
			
			input[i].onfocus = function(){
				var inputBorder = this.parentNode.parentNode;
				inputBorder.style.borderColor = "rgb(232, 191, 123)";
			}

			input[i].onblur = function(){
				var inputBorder = this.parentNode.parentNode;
				inputBorder.style.borderColor = "rgb(125, 125, 125)";
			}
		}

	</script>
		
</body>
</html>