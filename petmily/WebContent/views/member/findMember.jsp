<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int type = (int)session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMILY - 회원가입</title>
<style>

	/* 전체 페이지 크기 */
	#wrap {
		width: 1200px;
		height: auto;
		margin: 0 auto;
	}
	#find-member-page-area {
		background-color: rgb(255, 246, 218);
		height: 710px;
		display: flex;
	}
        
	/* find-member-page-area */
	#find-member-page-area a {text-decoration: none;}

	/* find-member-page-area > find-member-box-area */
	#find-member-box-area {
        margin-top: 40px;
        margin-left: auto;
        margin-right: auto;
    }

	/* find-member-box-title */
	#find-member-box-title {
		color: black;
		font-weight: bold;
		font-size: 23px;
        margin-bottom: 15px;
	}

	/* find-member-box-content */
	#find-member-box-content {
        border-top: 1px solid rgb(125, 125, 125);
		background-color: white;
		width: 850px;
		height: 495px;
	}
    #find-member-box-content-1 {
        width: 90%;
        height: 20%;
        font-size: 14px;
        line-height: 35px;
        margin: 0 auto;
        box-sizing: border-box;
		display: flex;
    }
	#find-member-box-content-1 > div {
        float: left;
        box-sizing: border-box;
		margin: auto;
    }
	.select-find-button > a {
		border-bottom: 7px solid rgb(232, 191, 123);
		color: black;
		font-size: 20px;
		font-weight: bold;
		padding: 15px 50px;
		cursor: pointer;
	}
	.unselect-find-button > a {
		color: rgb(125, 125, 125);
		font-size: 20px;
		font-weight: bold;
		padding: 15px 50px;
		cursor: pointer;
	}
	#find-member-form {
		width: 100%;
		height: 80%;
	}
	#find-member-form-wrap {
		width: 90%;
		height: 100%;
        margin: 0 auto;
        border-top: 1px solid rgb(125, 125, 125);
	}
    #find-member-form-wrap > div {
        float: left;
        box-sizing: border-box;
    }

    /* find-row 스타일 */
    .find-row {
        width: 100%;
        height: 70px;
        display: flex;
    }
    .find-row > div {
        float: left;
        box-sizing: border-box;
        margin: auto;
    }

    /* find-col-1 스타일 */
    .find-col-1 {
        font-size: 18px;
        font-weight: bold;
        width: 25%;
        height: 100%;
        padding-left: 30px;
        padding-top: 18px;
        background-color: rgb(243, 243, 243);
    }

    /* find-col-2 스타일 */
    .find-col-2 {
        width: 45%;
        padding-left: 20px;
    }
    .find-col-2 input {
        width: 292px;
        height: 34px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
    }

    /* find-col-2-type-1 스타일 - 생년월일, 휴대전화번호 부분에서 사용 */
    .find-col-2-type-1 > input {
        width: 80px;
        height: 34px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
        text-align: center;
    }
    .find-col-2-type-1 > select {
        width: 86px;
        height: 38px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
        text-align: center;
    }

    /* find-col-2-type-2  - 휴대전화번호 부분에서 사용 */
    .find-col-2-type-2 {
        width: 48%;
        padding-left: 20px;
    }

    /* find-col-3 */
    .find-col-3 {
        width: 30%;
        font-size: 12px;
    }
    .find-col-3-type-1 {
        width: 25%;
        font-size: 12px;
    }
    .find-col-3-type-2 {
        width: 27%;
        font-size: 12px;
        text-align: center;
    }

    /* dummy-row top, bottom */
    .dummy-row-top {
        width: 100%;
        height: 125px;
        display: flex;
    }
    .dummy-row-bottom {
        width: 100%;
        height: 130px;
        display: flex;
    }
	.dummy-row-top-pwd {
        width: 100%;
        height: 58px;
        display: flex;
    }
    .dummy-row-bottom-pwd {
        width: 100%;
        height: 58px;
        display: flex;
    }

    /* input, select 선택 시 테두리 변경 */
    #find-member-form-wrap input:focus, select:focus {
        border-color: rgb(232, 191, 123);
        outline: none;
    }

    /* input type number 숫자 증감 버튼 삭제 */
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    #find-member-form-wrap button {
		height: 38px;
		color: white;
		background-color: rgb(232, 191, 123);
		font-size: 12px;
		font-weight: bold;
		border: 1px solid rgb(155, 128, 82);
		border-radius: 5px;
		cursor: pointer;
	}

	/* find-member-box-tail */
    #find-member-box-tail {
        width: 340px;
        height: 45px;
        margin: 40px auto;
    }
    #find-member-box-tail-button-wrap {
        width: 100%;
        height: 100%;
        margin: 0 auto;
    }
    #find-member-box-tail-button-wrap > #previous-button {float: left;}
    #find-member-box-tail-button-wrap > #succeeding-button {float: right;}

    /* find-member-box-tail > 돌아가기, 회원가입 버튼 부분 */
	#find-member-box-tail-button-wrap button {
		width: 150px;
		height: 45px;
		color: white;
		font-size: 18px;
		font-weight: bold;
		border-radius: 5px;
        cursor: pointer;
	}
    #previous-button > button {
        background-color: rgb(190, 190, 190);
        border: 1px solid rgb(125, 125, 125);
    }
    #succeeding-button > button {
        background-color: rgb(232, 191, 123);
        border: 1px solid rgb(155, 128, 82);
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

		<% if (type == 0) { %>

		<div id="find-member-page-area">
			<div id="find-member-box-area">

				<div id="find-member-box-title">
					&nbsp;아이디&nbsp;&middot;&nbsp;비밀번호 찾기
				</div>

				<div id="find-member-box-content">
                    <div id="find-member-box-content-1">
                            <div class="select-find-button">
								<a href="<%= contextPath %>/find.me?type=0">아이디 찾기</a>
							</div>
                            <div class="unselect-find-button">
								<a href="<%= contextPath %>/find.me?type=1">비밀번호 찾기</a>
							</div>
                    </div>
					<form id="find-member-form" method="post" onsubmit="return checkAll();" action="/SemiProject/findId.me">
						<div id="find-member-form-wrap">

                            <div class="find-row dummy-row-top">
                                <div class="find-col-1"></div>
                                <div class="find-col-2"></div>
                                <div class="find-col-3"></div>
                            </div>

                            <!-- 이름 -->
                            <div class="find-row">
                                <div class="find-col-1">
                                    <span>이름</span>
                                </div>
                                <div class="find-col-2">
                                    <input type="text" name="userName" maxlength="20" onkeyup="checkName();" required>
                                </div>
                                <div class="find-col-3">
                                    <span name="checkNameResult"></span>
                                </div>
                            </div>

                            <!-- 휴대전화번호 -->
                            <div class="find-row">
                                <div class="find-col-1">
                                    <span>휴대전화번호</span>
                                </div>
                                <div class="find-col-2-type-1 find-col-2-type-2">
                                    <select name="phoneF" required>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="017">017</option>
                                        <option value="016">016</option>
                                        <option value="019">019</option>
                                    </select>
                                    &nbsp;
                                    &#45;
                                    &nbsp;
                                    <input type="number" name="phoneM" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" required>
                                    &nbsp;
                                    &#45;
                                    &nbsp;
                                    <input type="number" name="phoneB" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" required>
                                </div>
                                <div class="find-col-3-type-1 find-col-3-type-2">
                                    <span name="checkPhoneResult"></span>
                                </div>
                            </div>

                            <div class="find-row dummy-row-bottom">
                                <div class="find-col-1"></div>
                                <div class="find-col-2"></div>
                                <div class="find-col-3"></div>
                            </div>

						</div>
					</form>
				</div>

                <div id="find-member-box-tail">
                    <div id="find-member-box-tail-button-wrap">
                        <div id="previous-button">
                            <button type="button" onclick="location.href='<%= contextPath %>/loginForm.me'">돌아가기</button>
                        </div>
                        <div id="succeeding-button">
                            <button type="submit" form="find-member-form">아이디 확인</button>
                        </div>
                    </div>
                </div>

			</div>
		</div>

		<% } else if (type == 1) { %>

			<div id="find-member-page-area">
				<div id="find-member-box-area">
	
					<div id="find-member-box-title">
						&nbsp;아이디&nbsp;&middot;&nbsp;비밀번호 찾기
					</div>
	
					<div id="find-member-box-content">
						<div id="find-member-box-content-1">
								<div class="unselect-find-button">
									<a href="<%= contextPath %>/find.me?type=0">아이디 찾기</a>
								</div>
								<div class="select-find-button">
									<a href="<%= contextPath %>/find.me?type=1">비밀번호 찾기</a>
								</div>
						</div>
						<form id="find-member-form" method="post" onsubmit="return checkAll();" action="/SemiProject/findPwd.me">
							<div id="find-member-form-wrap">
	
								<div class="find-row dummy-row-top-pwd">
									<div class="find-col-1"></div>
									<div class="find-col-2"></div>
									<div class="find-col-3"></div>
								</div>
	
								<!-- 이름 -->
								<div class="find-row">
									<div class="find-col-1">
										<span>이름</span>
									</div>
									<div class="find-col-2">
										<input type="text" name="userName" maxlength="20" onkeyup="checkName();" required>
									</div>
									<div class="find-col-3">
										<span name="checkNameResult"></span>
									</div>
								</div>
	
								<!-- 휴대전화번호 -->
								<div class="find-row">
									<div class="find-col-1">
										<span>휴대전화번호</span>
									</div>
									<div class="find-col-2-type-1 find-col-2-type-2">
										<select name="phoneF" required>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="017">017</option>
											<option value="016">016</option>
											<option value="019">019</option>
										</select>
										&nbsp;
										&#45;
										&nbsp;
										<input type="number" name="phoneM" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" required>
										&nbsp;
										&#45;
										&nbsp;
										<input type="number" name="phoneB" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" required>
									</div>
									<div class="find-col-3-type-1 find-col-3-type-2">
										<span name="checkPhoneResult"></span>
									</div>
								</div>

                                <!-- 이메일 주소 -->
                                <div class="find-row">
                                    <div class="find-col-1">
                                        <span>이메일 주소</span>
                                    </div>
                                    <div class="find-col-2">
                                        <input type="text" name="email" maxlength="100" required>
                                    </div>
                                    <div class="find-col-3">
                                        <button type="button" onclick="sendEmail();">인증번호 받기</button>
                                    </div>
                                </div>

								<!-- 이메일 인증번호 -->
								<div class="find-row">
									<div class="find-col-1">
										<span>이메일 인증번호</span>
									</div>
									<div class="find-col-2">
										<input type="text" name="randomCode" maxlength="10" required>
									</div>
									<div class="find-col-3">
										<button type="button" onclick="checkRandomCode();">이메일 인증번호 확인</button>
									</div>
								</div>
	
								<div class="find-row dummy-row-bottom-pwd">
									<div class="find-col-1"></div>
									<div class="find-col-2"></div>
									<div class="find-col-3"></div>
								</div>
	
							</div>
						</form>
					</div>
	
					<div id="find-member-box-tail">
						<div id="find-member-box-tail-button-wrap">
							<div id="previous-button">
								<button type="button" onclick="location.href='<%= contextPath %>/loginForm.me'">돌아가기</button>
							</div>
							<div id="succeeding-button">
								<button type="submit" form="find-member-form">비밀번호 확인</button>
							</div>
						</div>
					</div>
	
				</div>
			</div>

		<% } %>
		
		<!-- footer -->
		<%@ include file="../common/footer.jsp" %>
		
	</div>

    <script>

        // 각각 조건들 확인용 flag
        var checkEmailFlag = false;
        var checkRandomCodeFlag = false;
        var checkNameFlag = false;
        var checkPhoneFlag = false;

        // 이름 조건 확인, 결과 출력
        function checkName() {
                
            var $userName = $("#find-member-form input[name=userName]");
            var $checkNameResult = $("#find-member-form span[name=checkNameResult]");
            var $regExp = /^[가-힣a-zA-Z]{2,20}$/;

            if (!$regExp.test($userName.val())) {
                        
                $checkNameResult.css('color', 'red');
                $checkNameResult.html('2~20자의 한글, 영문 소문자, 대문자만 입력 가능합니다.');

                checkNameFlag = false;
            }
            else {
                
                $checkNameResult.html('');

                checkNameFlag = true;
            }
            if ($userName.val() == '') {

                $checkNameResult.html('');

                checkNameFlag = false;
            }
        }
        
        // 휴대전화번호 조건 확인, 결과 출력
        function checkPhone() {

            var $phoneM = $("#find-member-form input[name=phoneM]").val();
            var $phoneB = $("#find-member-form input[name=phoneB]").val();
            var $checkPhoneResult = $("#find-member-form span[name=checkPhoneResult]");
            var $regExp = /^[0-9]{4}$/;

            if (!$regExp.test($phoneM) || !$regExp.test($phoneB)) {
                
                $checkPhoneResult.css('color', 'red');
                $checkPhoneResult.html('휴대전화번호를 전부 입력해주세요.');

                checkPhoneFlag = false;
            }
            if ($regExp.test($phoneM) && $regExp.test($phoneB)) {
                
                $checkPhoneResult.html('');

                checkPhoneFlag = true;
            }
            if ($phoneM == '' || $phoneB == '') {

                $checkPhoneResult.html('');

                checkPhoneFlag = false;
            }
        }

        // 이메일 사용자 체크, 이메일 발송
        function sendEmail() {
            
            var $userName = $("#find-member-form input[name=userName]");
            var $email = $("#find-member-form input[name=email]");
            var $randomCode = $("#find-member-form input[name=randomCode]");
            
            var $phoneF = $("#find-member-form select[name=phoneF]");
            var $phoneM = $("#find-member-form input[name=phoneM]");
            var $phoneB = $("#find-member-form input[name=phoneB]");
            var $phone = $phoneF.val() + "-" + $phoneM.val() + "-" + $phoneB.val();
            var $regExp = /^[0-9]{4}$/;

            checkEmailFlag = false;
            checkRandomCodeFlag = false;
            
            if (!$userName.val()) {
                
                alert('이름을 입력해주세요.');
                $userName.focus();

                checkEmailFlag = false;
            }
            if (!$regExp.test($phoneM.val())) {
                
                alert('휴대전화번호를 전부 입력해주세요.');
                $phoneM.focus();

                checkEmailFlag = false;
            }
            if (!$regExp.test($phoneB.val())) {
                
                alert('휴대전화번호를 전부 입력해주세요.');
                $phoneB.focus();

                checkEmailFlag = false;
            }
            if (!$email.val()) {
                
                alert('이메일 주소를 입력해주세요.');
                $email.focus();

                checkEmailFlag = false;
            }
            if ($userName.val() != "" && $email.val()  != "" && $phoneM.val() != "" && $phoneB.val() != "") {
                
                $.ajax({
    
                    url : "checkEmailFindPwd.me",
                    data : {
                        inputUserName : $userName.val(),
                        inputEmail : $email.val(),
                        inputPhone : $phone
                    },
                    success : function(result) {
                        
                        if (result == 0) {
                            
                            alert('입력하신 정보가 가입 정보와 일치하지 않습니다. \n다시 확인 후 시도해주세요.');
                            $email.focus();
    
                            checkEmailFlag = false;
                        }
                        if (result == 1) {
                            
                            $randomCode.val('');
                            $randomCode.css('background-color', 'white');
                            $randomCode.attr('readonly', false);
                            
                            $.ajax({
    
                                url : "sendEmail.ac",
                                data : {inputEmail : $email.val()},
                                success : function(result) {
                                    
                                    if (result == 0) {
                                        
                                        alert('인증번호 이메일을 발송하지 못했습니다.\n다시 시도해주세요.');
    
                                        checkEmailFlag = false;
                                    }
                                    if (result == 1) {
                                        
                                        alert('인증번호 이메일을 발송했습니다.\n10분내로 인증을 완료해주세요.');
    
                                        checkEmailFlag = true;
                                    }
                                },
                                error : function() {
    
                                    console.log('send email error');
    
                                    checkEmailFlag = false;
                                }
                            });
                        }
                    },
                    error : function() {
    
                        console.log('email check error');
    
                        checkEmailFlag = false;
                    }
                });
            }
        }

        // 인증번호 확인
        function checkRandomCode() {

            var $email = $("#find-member-form input[name=email]");
            var $randomCode = $("#find-member-form input[name=randomCode]");

            if (checkEmailFlag == true) {
                
                $.ajax({

                    url : "checkRandomCode.ac",
                    data : {
                        inputEmail : $email.val(),
                        inputRandomCode : $randomCode.val()
                    },
                    success : function(result) {
                        

                        if (result == 0) {
                            
                            alert('이메일 주소를 다시 확인해주세요.');
                            $email.focus();

                            checkRandomCodeFlag = false;
                        }
                        if (result == 1) {
                            
                            alert('인증 성공');
                            $randomCode.css('background-color', 'rgb(190, 190, 190)');
                            $randomCode.attr('readonly', true);

                            checkRandomCodeFlag = true;
                        }
                        if (result == 2) {
                            
                            alert('인증 시간이 초과되었습니다.\n다시 인증번호를 요청해주세요.');
                            $randomCode.val('');
                            $randomCode.focus();

                            checkRandomCodeFlag = false;
                        }
                        if (result == 3) {
                            
                            alert('인증번호가 일치하지 않습니다.');
                            $randomCode.focus();

                            checkRandomCodeFlag = false;
                        }
                        if (result == 4) {
                            
                            alert('이메일 주소를 입력해주세요.');
                            $email.focus();

                            checkRandomCodeFlag = false;
                        }
                        if (result == 5) {
                            
                            alert('인증번호를 입력해주세요.');
                            $randomCode.focus();

                            checkRandomCodeFlag = false;
                        }
                    },
                    error : function() {

                        console.log('randomcode check error');

                        checkRandomCodeFlag = false;
                    }
                });
            }
            if (checkEmailFlag == false) {
                
                alert('이메일 주소를 입력 후 인증번호 받기 버튼을 눌러주세요.');
                $email.focus();

                checkRandomCodeFlag = false;
            }
        }

        // input number type 글자수 제한 기능
        function inputNumberMaxLength(object) {

            if (object.value.length > object.maxLength) {
                
                object.value = object.value.slice(0, object.maxLength)
            }
        }

        // 각각의 조건들 조건에 안맞을 시 회원가입 버튼 누르면 얼럿으로 안내, 해당 input으로 이동
        function checkAll() {
            
            var findForm = document.getElementById('find-member-form');

            var $phoneM = $("#find-member-form input[name=phoneM]");
            var $phoneB = $("#find-member-form input[name=phoneB]");
            var $regExp = /^[0-9]{4}$/;
            
            if (checkNameFlag == false) {
	
                alert('이름을 조건에 맞게 작성해주세요.');
                findForm.userName.focus();
                
                return false;
            }
            if (checkPhoneFlag == false) {

                alert('휴대전화번호를 조건에 맞게 작성해주세요.');

                if (!$regExp.test($phoneM.val())) {

                    $phoneM.focus();
                }
                if (!$regExp.test($phoneB.val())) {

                    $phoneB.focus();
                }
                
                return false;
            }

            <% if (type == 0) { %>
            
	            if (checkEmailFlag == false) {
	
	                return true;
	            }
	            if (checkRandomCodeFlag == false) {
	
	                return true;
	            }
	            
            <% } else if (type == 1) { %>
            
                if (checkEmailFlag == false) {

                    alert('이메일 주소를 입력 후 인증번호 받기 버튼을 눌러주세요.');
                    findForm.email.focus();

                    return false;
                }
	            if (checkRandomCodeFlag == false) {
	
	                alert('이메일 인증을 완료해주세요.');
	                findForm.randomCode.focus();
	
	                return false;
	            }
	            
            <% } %>
            
            return true;
        }

    </script>

</body>
</html>