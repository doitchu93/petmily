<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#enroll-member-page-area {
		background-color: rgb(255, 246, 218);
		height: auto;
		display: flex;
	}

	/* enroll-member-page-area */
	#enroll-member-page-area a {text-decoration: none;}

	/* enroll-member-page-area > enroll-member-box-area */
	#enroll-member-box-area {
        margin-top: 40px;
        margin-left: auto;
        margin-right: auto;
    }

	/* enroll-member-box-title */
	#enroll-member-box-title {
		color: black;
		font-weight: bold;
		font-size: 23px;
        margin-bottom: 15px;
	}

	/* enroll-member-box-content */
	#enroll-member-box-content {
        border-top: 1px solid rgb(125, 125, 125);
		background-color: white;
		width: 850px;
		height: 1100px;
	}
    #enroll-member-box-content-1 {
        width: 90%;
        height: 10%;
        font-size: 14px;
        line-height: 35px;
        margin: 0 auto;
        padding-top: 20px;
        padding-left: 10px;
        box-sizing: border-box;
    }
	#enroll-member-form {
		width: 100%;
		height: 90%;
	}
	#enroll-member-form-wrap {
		width: 90%;
		height: 100%;
        margin: 0 auto;
        border-top: 1px solid rgb(125, 125, 125);
	}
    #enroll-member-form-wrap > div {
        float: left;
        box-sizing: border-box;
    }

    /* enroll-row 스타일 */
    .enroll-row {
        width: 100%;
        height: 70px;
        display: flex;
    }
    .enroll-row > div {
        float: left;
        box-sizing: border-box;
        margin: auto;
    }

    /* enroll-col-1 스타일 */
    .enroll-col-1 {
        font-size: 18px;
        font-weight: bold;
        width: 25%;
        height: 100%;
        padding-left: 30px;
        padding-top: 18px;
        background-color: rgb(243, 243, 243);
    }

    /* enroll-col-2 스타일 */
    .enroll-col-2 {
        width: 45%;
        padding-left: 20px;
    }
    .enroll-col-2 input {
        width: 292px;
        height: 34px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
    }

    /* enroll-col-2-type-1 스타일 - 생년월일, 휴대전화번호 부분에서 사용 */
    .enroll-col-2-type-1 {
        width: 50%;
        padding-left: 20px;
    }
    .enroll-col-2-type-1 > input {
        width: 80px;
        height: 34px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
        text-align: center;
    }
    .enroll-col-2-type-1 > select {
        width: 86px;
        height: 38px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
        text-align: center;
    }

    /* enroll-col-2-type-2  - 휴대전화번호 부분에서 사용 */
    .enroll-col-2-type-2 {
        width: 48%;
        padding-left: 20px;
    }

    /* 주소 부분 스타일 */
    .address-row {
        width: 100%;
        height: 190px;
        margin: auto;
    }
    .enroll-col-2-type-3 {
        width: 75%;
        padding-left: 20px;
    }
    .enroll-col-2-type-3 > input {
        width: 250px;
        height: 34px;
        border-radius: 5px;
        border: none;
        border: 1px solid rgb(125, 125, 125);
    }

    /* enroll-col-3 */
    .enroll-col-3 {
        width: 30%;
        font-size: 12px;
    }
    .enroll-col-3-type-1 {
        width: 25%;
        font-size: 12px;
    }
    .enroll-col-3-type-2 {
        width: 27%;
        font-size: 12px;
        text-align: center;
    }

    /* dummy-row top, bottom */
    .dummy-row-top {
        width: 100%;
        height: 20px;
        display: flex;
    }
    .dummy-row-bottom {
        width: 100%;
        height: 79px;
        display: flex;
    }

    /* input, select 선택 시 테두리 변경 */
    #enroll-member-form-wrap input:focus, select:focus {
        border-color: rgb(232, 191, 123);
        outline: none;
    }

    /* input type number 숫자 증감 버튼 삭제 */
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    #enroll-member-form-wrap button {
		height: 38px;
		color: white;
		background-color: rgb(232, 191, 123);
		font-size: 12px;
		font-weight: bold;
		border: 1px solid rgb(155, 128, 82);
		border-radius: 5px;
		cursor: pointer;
	}

	/* enroll-member-box-tail */
    #enroll-member-box-tail {
        width: 340px;
        height: 45px;
        margin: 40px auto;
    }
    #enroll-member-box-tail-button-wrap {
        width: 100%;
        height: 100%;
        margin: 0 auto;
    }
    #enroll-member-box-tail-button-wrap > #previous-button {float: left;}
    #enroll-member-box-tail-button-wrap > #succeeding-button {float: right;}

    /* enroll-member-box-tail > 돌아가기, 회원가입 버튼 부분 */
	#enroll-member-box-tail-button-wrap button {
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

		<div id="enroll-member-page-area">
			<div id="enroll-member-box-area">

				<div id="enroll-member-box-title">
					&nbsp;회원가입
				</div>

				<div id="enroll-member-box-content">
                    <div id="enroll-member-box-content-1">
                            Petmily 사이트를 방문해주셔서 감사합니다.<br>
                            회원가입을 위해서 다음 정보를 입력 부탁드리겠습니다.
                    </div>
					<form id="enroll-member-form" method="post" onsubmit="return checkAll();" action="/SemiProject/insert.me">
						<div id="enroll-member-form-wrap">

                            <div class="enroll-row dummy-row-top">
                                <div class="enroll-col-1"></div>
                                <div class="enroll-col-2"></div>
                                <div class="enroll-col-3"></div>
                            </div>

                            <!-- 아이디 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>아이디</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="userId" maxlength="20" onkeyup="checkId();" required>
                                </div>
                                <div class="enroll-col-3">
                                    <span name="checkIdResult"></span>
                                </div>
                            </div>

                            <!-- 비밀번호 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>비밀번호</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="password" name="userPwd" maxlength="20" onkeyup="checkPwd();" required>
                                </div>
                                <div class="enroll-col-3">
                                    <span name="checkPwdResult"></span>
                                </div>
                            </div>

                            <!-- 비밀번호 확인 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>비밀번호 확인</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="password" name="matchPwd" maxlength="20" onkeyup="checkMatchPwd();" required>
                                </div>
                                <div class="enroll-col-3">
                                    <span name="checkMatchPwdResult"></span>
                                </div>
                            </div>

                            <!-- 이메일 주소 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>이메일 주소</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="email" maxlength="100" required>
                                </div>
                                <div class="enroll-col-3">
                                    <button type="button" onclick="sendEmail();">인증번호 받기</button>
                                </div>
                            </div>

                            <!-- 이메일 인증번호 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>이메일 인증번호</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="randomCode" maxlength="10" required>
                                </div>
                                <div class="enroll-col-3">
                                    <button type="button" onclick="checkRandomCode();">이메일 인증번호 확인</button>
                                </div>
                            </div>

                            <!-- 이름 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>이름</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="userName" maxlength="20" onkeyup="checkName();" required>
                                </div>
                                <div class="enroll-col-3">
                                    <span name="checkNameResult"></span>
                                </div>
                            </div>

                            <!-- 닉네임 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>닉네임</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="userNickname" maxlength="20" onkeyup="checkNickname();" required>
                                </div>
                                <div class="enroll-col-3">
                                    <span name="checkNicknameResult"></span>
                                </div>
                            </div>

                            <!-- 생년월일 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>생년월일</span>
                                </div>
                                <div class="enroll-col-2-type-1">
                                    <input type="number" name="year" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkYear();" required>&nbsp;년&nbsp;
                                    <select name="month" required>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>&nbsp;월&nbsp;
                                    <input type="number" name="date" maxlength="2" oninput="inputNumberMaxLength(this);" onkeyup="checkDate();" required>&nbsp;일
                                </div>
                                <div class="enroll-col-3-type-1"></div>
                            </div>

                            <!-- 휴대전화번호 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>휴대전화번호</span>
                                </div>
                                <div class="enroll-col-2-type-1 enroll-col-2-type-2">
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
                                <div class="enroll-col-3-type-1 enroll-col-3-type-2">
                                    <span name="checkPhoneResult"></span>
                                </div>
                            </div>

                            <!-- 주소 -->
                            <div class="enroll-row address-row">
                                <div class="enroll-col-1">
                                    <span>주소</span>
                                </div>
                                <div class="enroll-col-2-type-3">
                                    <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호" readonly required>
                                    &nbsp;<button onclick="sample6_execDaumPostcode();">우편번호 찾기</button><br><br>
                                    <input type="text" id="sample6_address" name="addressMain" placeholder="주소" readonly required><br><br>
                                    <input type="text" id="sample6_detailAddress" name="addressDetail" maxlength="50" placeholder="상세주소" required>
                                    <input type="text" id="sample6_extraAddress" name="addressAdd" placeholder="참고항목" readonly>
                                </div>
                            </div>

                            <!-- 회원등급(임시) -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>회원등급(임시)</span>
                                </div>
                                <div class="enroll-col-2">
                                    <select name="userClass">
                                        <option value="A">관리자</option>
                                        <option value="G">단체</option>
                                        <option value="P">일반</option>
                                    </select>
                                </div>
                                <div class="enroll-col-3"></div>
                            </div>

                            <div class="enroll-row dummy-row-bottom">
                                <div class="enroll-col-1"></div>
                                <div class="enroll-col-2"></div>
                                <div class="enroll-col-3"></div>
                            </div>

						</div>
					</form>
				</div>

                <!-- 돌아가기, 회원가입 버튼 -->
                <div id="enroll-member-box-tail">
                    <div id="enroll-member-box-tail-button-wrap">
                        <div id="previous-button">
                            <button onclick="history.back();">돌아가기</button>
                        </div>
                        <div id="succeeding-button">
                            <button type="submit" form="enroll-member-form">회원가입</button>
                        </div>
                    </div>
                </div>

			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="../common/footer.jsp" %>
		
    </div>

    <script>

        // 각각 조건들 확인용 flag
        var checkIdFlag = false;
        var checkPwdFlag = false;
        var checkMatchPwdFlag = false;
        var checkEmailFlag = false;
        var checkRandomCodeFlag = false;
        var checkNameFlag = false;
        var checkNicknameFlag = false;
        var checkYearFlag = false;
        var checkDateFlag = false;
        var checkPhoneFlag = false;
        
        // 아이디 조건 확인, 결과 출력
        function checkId() {

            var $userId = $("#enroll-member-form input[name=userId]");
            var $checkIdResult = $("#enroll-member-form span[name=checkIdResult]");
            var $regExp = /^[a-z\d_-]{4,20}$/;

            $.ajax({

                url : "checkId.me",
                data : {inputId : $userId.val()},
                success : function(result) {
                    
                    if (result < 1) {
                        
                        $checkIdResult.css('color', 'green');
                        $checkIdResult.html('사용 가능한 아이디 입니다.');

                        checkIdFlag = true;
                    }
                    if (result == 1) {

                        $checkIdResult.css('color', 'red');
                        $checkIdResult.html('중복되는 사용자가 있습니다.');

                        checkIdFlag = false;
                    } 
                    if (!$regExp.test($userId.val())) {
                        
                        $checkIdResult.css('color', 'red');
                        $checkIdResult.html('4~20자의 영문 소문자, 숫자, <br>특수기호 _ 와 - 만 사용 가능합니다.');

                        checkIdFlag = false;
                    }
                    if ($userId.val() == '') {

                        $checkIdResult.html('');

                        checkIdFlag = false;
                    }
                },
                error : function() {
                    
                    console.log('id check error');

                    checkIdFlag = false;
                }
            });
        }

        // 비밀번호 조건 확인, 결과 출력
        function checkPwd() {
            
            var $userPwd = $("#enroll-member-form input[name=userPwd]");
            var $checkPwdResult = $("#enroll-member-form span[name=checkPwdResult]");
            var $regExp = /^[a-zA-Z\d!@#$%^]{8,20}$/;
            
            if (!$regExp.test($userPwd.val())) {
                
                $checkPwdResult.css('color', 'red');
                $checkPwdResult.html('8~20자의 영문 소문자, 대문자, 숫자, <br>특수기호 ! @ # $ % ^ 만 <br>사용 가능합니다.');

                checkPwdFlag = false;
            }
            else {

                $checkPwdResult.css('color', 'green');
                $checkPwdResult.html('사용 가능한 비밀번호 입니다.');

                checkPwdFlag = true;
            }
            if ($userPwd.val() == '') {
                
                $checkPwdResult.html('');
                
                checkPwdFlag = false;
            }
        }
        
        // 비밀번호 확인 조건 확인, 결과 출력
        function checkMatchPwd() {
            
            var $matchPwd = $("#enroll-member-form input[name=matchPwd]");
            var $userPwd = $("#enroll-member-form input[name=userPwd]");
            var $checkMatchPwdResult = $("#enroll-member-form span[name=checkMatchPwdResult]");
            
            if ($matchPwd.val() == $userPwd.val()) {
                
                $checkMatchPwdResult.css('color', 'green');
                $checkMatchPwdResult.html('비밀번호가 일치합니다.');

                checkMatchPwdFlag = true;
            }
            else {
                
                $checkMatchPwdResult.css('color', 'red');
                $checkMatchPwdResult.html('비밀번호가 일치하지 않습니다.');
                
                checkMatchPwdFlag = false;
            }
            if ($matchPwd.val() == '') {

                $checkMatchPwdResult.html('');

                checkMatchPwdFlag = false;
            }
        }

        // 이메일 중복 체크, 이메일 발송
        function  sendEmail() {
            
            var $email = $("#enroll-member-form input[name=email]");
            var $randomCode = $("#enroll-member-form input[name=randomCode]");
            
            checkEmailFlag = false;
            checkRandomCodeFlag = false;

            $.ajax({

                url : "checkEmail.me",
                data : {inputEmail : $email.val()},
                success : function(result) {
                    
                    if (result == 1) {
                        
                        alert('중복되는 사용자가 있습니다.');
                        $email.focus();

                        checkEmailFlag = false;
                    }
                    if (result == 2) {
                        
                        alert('이메일 주소를 입력해주세요.');
                        $email.focus();

                        checkEmailFlag = false;
                    }
                    if (result == 0) {
                        
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

        // 인증번호 확인
        function checkRandomCode() {

            var $email = $("#enroll-member-form input[name=email]");
            var $randomCode = $("#enroll-member-form input[name=randomCode]");
            
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
        
        // 이름 조건 확인, 결과 출력
        function checkName() {
            
            var $userName = $("#enroll-member-form input[name=userName]");
            var $checkNameResult = $("#enroll-member-form span[name=checkNameResult]");
            var $regExp = /^[가-힣a-zA-Z]{2,20}$/;

            if (!$regExp.test($userName.val())) {
                        
                $checkNameResult.css('color', 'red');
                $checkNameResult.html('2~20자의 한글, 영문 소문자, 대문자만 사용 가능합니다.');
                
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

        // 닉네임 조건 확인, 결과 출력
        function checkNickname() {

            var $userNickname = $("#enroll-member-form input[name=userNickname]");
            var $checkNicknameResult = $("#enroll-member-form span[name=checkNicknameResult]");
            var $regExp = /^[가-힣a-z\d_-]{2,20}$/;

            $.ajax({

                url : "checkNickname.me",
                data : {inputNickname : $userNickname.val()},
                success : function(result) {
                    
                    if (result < 1) {
                        
                        $checkNicknameResult.css('color', 'green');
                        $checkNicknameResult.html('사용 가능한 닉네임 입니다.');

                        checkNicknameFlag = true;
                    }
                    if (result == 1) {

                        $checkNicknameResult.css('color', 'red');
                        $checkNicknameResult.html('중복되는 사용자가 있습니다.');

                        checkNicknameFlag = false;
                    } 
                    if (!$regExp.test($userNickname.val())) {
                        
                        $checkNicknameResult.css('color', 'red');
                        $checkNicknameResult.html('2~20자의 한글, 영문 소문자, 숫자, <br>특수기호 _ 와 - 만 사용 가능합니다.');

                        checkNicknameFlag = false;
                    }
                    if ($userNickname.val() == '') {

                        $checkNicknameResult.html('');

                        checkNicknameFlag = false;
                    }
                },
                error : function() {

                    console.log('nickname check error');

                    checkNicknameFlag = false;
                }
            });
        }

        // 생년월일 조건 확인, 결과 출력
        // 년
        function checkYear() {
            
            var $year = $("#enroll-member-form input[name=year]");
            var $regExp = /^(1[9]|2[0])\d\d$/;

            if (!$regExp.test($year.val()) || $year.val() > 2022) {
                        
                checkYearFlag = false;
            }
            else {

                checkYearFlag = true;
            }
            if ($year.val() == '') {

                checkYearFlag = false;
            }
        }
        // 월
        function checkDate() {
            
            var $date = $("#enroll-member-form input[name=date]").val();
            var $month = $("#enroll-member-form select[name=month]").val();
            var $year = $("#enroll-member-form input[name=year]").val();
            var $regExp = /^[0-9]{1,2}$/;
            
            if (!$regExp.test($date)) {

                checkDateFlag = false;
            }
            else {

                if ($month == 1 || $month == 3 || $month == 5 || $month == 7 || $month == 8 || $month == 10 || $month == 12) {
                    
                    if ($date > 31) {

                        checkDateFlag = false;
                    }
                    else {

                        checkDateFlag = true;
                    }
                }
                if ($month == 4 || $month == 6 || $month == 9 || $month == 11) {
                    
                    if ($date > 30) {

                        checkDateFlag = false;
                    }
                    else {

                        checkDateFlag = true;
                    }
                }
                // 2월 윤년 체크
                if ($month == 2) {
                    
                    // 입력한 년도가 4로 나눠질 때 - 윤년
                    if ($year % 4 == 0) {

                        // 입력한 년도가 4로 나눠지고 100으로도 나눠질 때 - 윤년 아님
                        if ($year % 100 == 0) {

                            // 입력한 년도가 4, 100으로 나눠지고 400으로도 나눠질 때 - 윤년
                            if ($year % 400 == 0) {

                                if ($date > 29) {

                                    checkDateFlag = false;
                                }
                                else {

                                    checkDateFlag = true;
                                }
                            } else {
                                
                                if ($date > 28) {

                                    checkDateFlag = false;
                                }
                                else {

                                    checkDateFlag = true;
                                }
                            }
                        }
                        else {
                            
                            if ($date > 29) {
                                
                                checkDateFlag = false;
                            }
                            else {

                                checkDateFlag = true;
                            }
                        }
                    }
                    else {

                        if ($date > 28) {

                            checkDateFlag = false;
                        }
                        else {

                            checkDateFlag = true;
                        }
                    }
                }
            }
        }

        // 휴대전화번호 조건 확인, 결과 출력
        function checkPhone() {

            var $phoneF = $("#enroll-member-form select[name=phoneF]").val();
            var $phoneM = $("#enroll-member-form input[name=phoneM]").val();
            var $phoneB = $("#enroll-member-form input[name=phoneB]").val();
            var $phone = $phoneF + "-" + $phoneM + "-" + $phoneB;
            var $checkPhoneResult = $("#enroll-member-form span[name=checkPhoneResult]");
            var $regExp = /^[0-9]{4}$/;

            $.ajax({

                url : "checkPhone.me",
                data : {inputPhone : $phone},
                success : function(result) {
                    
                    if (result < 1) {
                        
                        $checkPhoneResult.css('color', 'green');
                        $checkPhoneResult.html('사용 가능한 휴대전화번호 입니다.');

                        checkPhoneFlag = true;
                    }
                    if (result == 1) {

                        $checkPhoneResult.css('color', 'red');
                        $checkPhoneResult.html('중복되는 사용자가 있습니다.');

                        checkPhoneFlag = false;
                    }
                    if (!$regExp.test($phoneM) || !$regExp.test($phoneB)) {
                        
                        $checkPhoneResult.css('color', 'red');
                        $checkPhoneResult.html('휴대전화번호를 전부 입력해주세요.');

                        checkPhoneFlag = false;
                    }
                    if ($phoneM == '' || $phoneB == '') {

                        $checkPhoneResult.html('');

                        checkPhoneFlag = false;
                    }
                },
                error : function() {

                    console.log('phone check error');

                    checkPhoneFlag = false;
                }
            });
        }

        // input number type 글자수 제한 기능
        function inputNumberMaxLength(object) {
            
            if (object.value.length > object.maxLength) {
                
                object.value = object.value.slice(0, object.maxLength)
            }
        }

        // 각각의 조건들 조건에 안맞을 시 회원가입 버튼 누르면 얼럿으로 안내, 해당 input으로 이동
        function checkAll() {
            
            var enrollForm = document.getElementById('enroll-member-form');
            
            if (checkIdFlag == false) {

                alert('아이디를 조건에 맞게 작성해주세요.');
                enrollForm.userId.focus();

                return false;
            }
            if (checkPwdFlag == false) {

                alert('비밀번호를 조건에 맞게 작성해주세요.');
                enrollForm.userPwd.focus();

                return false;
            }
            if (checkMatchPwdFlag == false) {
                
                alert('비밀번호가 일치하지 않습니다.');
                enrollForm.matchPwd.focus();
                
                return false;
            }
            if (checkEmailFlag == false) {

                alert('이메일 주소를 조건에 맞게 작성해주세요.');
                enrollForm.email.focus();

                return false;
            }
            if (checkRandomCodeFlag == false) {

                alert('이메일 인증을 완료해주세요.');
                enrollForm.randomCode.focus();

                return false;
            }
            if (checkNameFlag == false) {

                alert('이름을 조건에 맞게 작성해주세요.');
                enrollForm.userName.focus();
                
                return false;
            }
            if (checkNicknameFlag == false) {

                alert('닉네임을 조건에 맞게 작성해주세요.');
                enrollForm.userNickname.focus();
                
                return false;
            }
            if (checkYearFlag == false) {

                alert('생년월일을 다시 확인해주세요.');
                enrollForm.year.value = '';
                enrollForm.year.focus();

                return false;
            }
            if (checkDateFlag == false) {

                alert('생년월일을 다시 확인해주세요.');
                enrollForm.date.value = '';
                enrollForm.date.focus();

                return false;
            }
            if (checkPhoneFlag == false) {

                alert('휴대전화번호를 조건에 맞게 작성해주세요.');
                enrollForm.phone.focus();
                
                return false;
            }

            return true;
        }

    </script>

    <!-- Daum 우편번호 서비스 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>

        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }

    </script>

</body>
</html>