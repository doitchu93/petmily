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

    /* dummy-row top, bottm */
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

    div{
            box-sizing: border-box;
            /* border: 1px solid darkolivegreen; */
        }
        .wrap{
            width: 1200px;
            height: 1600px;
            margin: auto;
        }
        .wrap > div{width: 100%;}
        #header{height: 10%;} 
        #footer{height: 10%;}
        #navigator{height: 3%;}
        #content{height: 77%;}

        /* 세부 div 속성 */
        #header > div, #content > div{
            height: 100%;
            float: left;
        }
        /* 가로길이 */
        #header_1{width: 20%;}
        #header_2{width: 80%;}

        #content_1{width: 20%;}
        #content_2{width: 80%;}
/*------------------- header_1 영역 --------------------*/
        #header_1{
            /* 영역 표시용 : 지우기 */
            background-color: floralwhite;
            color: sandybrown;
            text-align: center;
            font-size: 20px;
            font-weight: 900;
            padding-top: 50px;
        }
/*------------------- header_2 영역 --------------------*/
        #header_2 > #login-area{
            text-align: right;
            height: 20%;
        }
        #header_2 > #login-area a{
            color: black;
            text-decoration: none;
            font-size: 15px;
        }
        #header_2 > #menubar{
            height: 80%;
            padding: 50px;
            text-align: center;
        }
        /* #header_2 > #menubar a{
            color: rgb(155, 128, 82);
            text-decoration: none;
            font-size: 50px;
            font-weight: bold;
        } */
        #header_2 > #menubar > pre a{
            color: rgb(155, 128, 82);
            text-decoration: none;
            font-size: 30px;
            font-weight: bold;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        #header_2 > #menubar :hover{
            color: orange;
        }
/*------------------- navigator 영역 --------------------*/
        #navigator{padding-top: 10px;}
        #navi{height: 100%;}
        #navi a{
            color: black;
            text-decoration: none;
            font-size: 15px; 
            font-weight: bold;
        }
/*------------------- content_1 영역 --------------------*/
        #content_1 > #user-area{
            height: 47%;
            background-color: lightgray;

            /* 사용자영역 표시 - 지우기*/
            font-size: 16px;
            padding-top: 1%;
            padding-left: 5%;
            
        }
        #content_1 > #user-area > p{
            
            font-size: 17px;
            font-weight: bold;
            
        }
        #content_1 > #user-area > li > a {
            
            color: black;

            text-decoration-line: none;
            
        }
        #content_1 > #user-area > p > a {
            
            color: black;

            text-decoration-line: none;
            
        }
        #content_1 > #admin-area > li > a {
            
            color: black;

            text-decoration-line: none;
            
        }
        #content_1 > #br{
            height: 2%;
        }
        #content_1 > #admin-area{
            height: 25%;
            background-color: lightgray;

            /* 관리자영역 표시 - 지우기*/
            font-size: 16px;
            padding-top: 3%;
            padding-left: 5%;
            
        }
/*------------------- content_2 영역 --------------------*/
        #content_2 > #content-area{
            height: 100%;
            margin-left: 20px;
            background-color: floralwhite;
        }
        
/*------------------- footer 영역 --------------------*/
        #footer{
            background-color: gray;
        }
	
</style>
</head>
<body>

	<div id="wrap">
	
		<!-- header -->
		<%@ include file="../common/header.jsp" %>

        <% 
        
        String birthDate = loginUser.getBirthDate();
    	
    	String userNickname = loginUser.getUserNickname();
    		
    	String userClass = loginUser.getUserClass();

        String phoneB = (String)session.getAttribute("phoneB");
        String phoneF = (String)session.getAttribute("phoneF");
        String phoneM = (String)session.getAttribute("phoneM");

        String postcode = (String)session.getAttribute("postcode");
        String addressMain = (String)session.getAttribute("addressMain");
        String addressDetail = (String)session.getAttribute("addressDetail");
        String addressAdd = (String)session.getAttribute("addressAdd");
        
        %>

        <hr>
		
        <div id="navigator">

            <div id="navi">
                <!-- 임시 내용 -->
                <a href="<%= contextPath %>">HOME</a> > 
                <a href="<%= contextPath %>/myPage.me">마이페이지</a> >
                <a href="<%= contextPath %>/updateForm.me">회원 정보 수정</a>
                
            </div><!--navi-->

        </div><!--navigator-->

        <!-- content -->

        <div id="content">
            <div id="content_1">
                <% if(!(userClass.equals("A"))) { %>
                    <div id="user-area">
                        <!-- 사용자만 보이는 영역-->
                        <% if(userClass.equals("P")) { %>
                            <p>회원 정보 관리</p>
                            <li><a href="<%= contextPath %>/profile.me">내 프로필 수정</a></li>
                            <li><a href="<%= contextPath %>/updateForm.me">회원 정보 수정</a></li>
                            <li><a href="<%= contextPath %>/updatePwdForm.me">비밀번호 변경</a></li>
                            <li><a href="<%= contextPath %>/deletePage.me">회원 탈퇴</a></li>
                           
                           <p>내가 쓴 글 조회</p>
                            <li><a href="<%= contextPath %>/adoptComment.bo">입양 후기 게시글 조회</a></li>
                           
                           <p>굿즈샵</p>
                            <li><a href="#">장바구니</a></li>
                            <li><a href="#">구매내역/배송조회</a></li>
                            <li><a href="#">내가 쓴 리뷰 조회</a></li>
                           
                           <p><a href="<%= contextPath %>/interList.bo">관심 목록</a></p>
                            <li><a href="<%= contextPath %>/interListAN.bo">관심 등록 동물 보기</a></li>
                            <li><a href="<%= contextPath %>/interListPR.bo">관심 등록 굿즈 보기</a></li>
                           
                           <p>고객센터</p>
                               <li><a href="<%= contextPath %>/list.no">공지사항</a></li>
                            <li><a href="<%= contextPath %>/list.as?cpage=1">1:1 문의하기</a></li>
                            <li><a href="<%= contextPath %>/enrollForm.gr">단체 신청</a></li>
                            <li><a href="<%= contextPath %>/list.as?cpage=1">문의 내역</a></li>
                           
                        <%  } else { %>
                            
                            <p>회원 정보 관리</p>
                            <li><a href="<%= contextPath %>/profile.me">내 프로필 수정</a></li>
                            <li><a href="<%= contextPath %>/updateForm.me">회원 정보 수정</a></li>
                            <li><a href="<%= contextPath %>/updatePwdForm.me">비밀번호 변경</a></li>
                            <li><a href="<%= contextPath %>/deletePage.me">회원 탈퇴</a></li>
                           
                            <p><a href="<%= contextPath %>/myPost.bo">내가 쓴 글 조회</a> </p>
                            <li><a href="<%= contextPath %>/volunteerRecruit.bo">봉사 활동 모집글 조회</a></li>
                            <li><a href="<%= contextPath %>/volunteerComment.bo">봉사 후기 게시글 조회</a></li>
                            <li><a href="<%= contextPath %>/animalPost.bo">동물 등록 게시글 조회</a></li>
                           
                            <p>굿즈샵</p>
                            <li><a href="#">장바구니</a></li>
                            <li><a href="#">구매내역/배송조회</a></li>
                           
                            <p><a href="<%= contextPath %>/interList.bo">관심 목록</a></p>
                            <li><a href="<%= contextPath %>/interListAN.bo">관심 등록 동물 보기</a></li>
                            <li><a href="<%= contextPath %>/interListPR.bo">관심 등록 굿즈 보기</a></li>
                           
                            <p>고객센터</p>
                            <li><a href="<%= contextPath %>/list.no">공지사항</a></li>
                            <li><a href="<%= contextPath %>/list.as?cpage=1">1:1 문의하기</a></li>
                            <li><a href="<%= contextPath %>/enrollForm.gr">단체 신청</a></li>
                            <li><a href="<%= contextPath %>/list.as?cpage=1">문의 내역</a></li>
                           </ul>
                        <% } %>
                        
                    </div>
                    <div id="br">
                        <!-- 사용자영역과 관리자영역 사이 공간-->
                    </div>
                <% } else { %>
                    <div id="user-area">
                        <p>회원 정보 관리</p>
                            <li><a href="<%= contextPath %>/profile.me">내 프로필 수정</a></li>
                            <li><a href="<%= contextPath %>/updateForm.me">회원 정보 수정</a></li>
                            <li><a href="<%= contextPath %>/deletePage.me">회원 탈퇴</a></li>
                           
                           <p>내가 쓴 글 조회</p>
                            <li><a href="<%= contextPath %>/adoptComment.bo">입양 후기 게시글 조회</a></li>
                           
                           <p>굿즈샵</p>
                            <li><a href="#">장바구니</a></li>
                            <li><a href="#">구매내역/배송조회</a></li>
                            <li><a href="#">내가 쓴 리뷰 조회</a></li>
                           
                           <p><a href="<%= contextPath %>/interList.bo">관심 목록</a></p>
                            <li><a href="<%= contextPath %>/interListAN.bo">관심 등록 동물 보기</a></li>
                            <li><a href="<%= contextPath %>/interListPR.bo">관심 등록 굿즈 보기</a></li>
                           
                           <p>고객센터</p>
                            <li><a href="<%= contextPath %>/list.no">공지사항</a></li>
                            <li><a href="<%= contextPath %>/list.as?cpage=1">1:1 문의하기</a></li>
                            <li><a href="<%= contextPath %>/enrollForm.gr">단체 신청</a></li>
                            <li><a href="<%= contextPath %>/list.as?cpage=1">문의 내역</a></li>
                    </div>
                    <div id="admin-area">
                        <!-- 관리자가 볼 수 있는 영역-->
                        <p>관리자 메뉴</p>
                        <li><a href="<%= contextPath %>/list.no">공지사항</a></li>
                        <li><a href="#">상품 등록</a></li>
                        <li><a href="#">상품 주문내역</a></li>
                        <li><a href="<%= contextPath %>/list.gr">단체 승인</a></li>
                        <li><a href="#">입양신청서</a></li>
                        <li><a href="<%= contextPath %>/list.as?cpage=1">1:1 문의내역</a></li>
                        
                    </div>
            <% } %>
            </div>
            <div id="content_2">

		<div id="enroll-member-page-area">
			<div id="enroll-member-box-area">

				<div id="enroll-member-box-title">
					&nbsp;회원 정보 수정
				</div>

				<div id="enroll-member-box-content">
                    <div id="enroll-member-box-content-1">
                            Petmily 사이트를 방문해주셔서 감사합니다.<br>
                            변경할 정보를 입력해주세요.
                    </div>
					<form id="enroll-member-form" method="post" onsubmit="return checkAll();" action="/SemiProject/update.me">
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
                                    <input type="text" name="userId" maxlength="20" value="<%= loginUser.getUserId() %>" readonly>
                                </div>
                                <div class="enroll-col-3">
                                    <span name="checkIdResult"></span>
                                </div>
                            </div>


                            <!-- 이메일 주소 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>이메일 주소</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="email" value="<%= loginUser.getEmail() %>" readonly required>
                                </div>
                                <div class="enroll-col-3">
                                </div>
                            </div>


                            <!-- 이름 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>이름</span>
                                </div>
                                <div class="enroll-col-2">
                                    <input type="text" name="userName" maxlength="20" value="<%= loginUser.getUserName() %>" readonly>
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
                                    <input type="text" name="userNickname" maxlength="20" onkeyup="checkNickname();" value="<%= userNickname %>" required>
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
                                    <input type="text" name="year" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkYear();" value="<%= loginUser.getBirthDate() %>" readonly>
                                    
                                </div>
                                <div class="enroll-col-3-type-1"></div>
                            </div>

                            <script>

                                var phone = "<%= loginUser.getPhone() %>"
                                console.log(phone);

                                var phones = phone.split('-');
                                
                                $(document).ready(function(){
                                    $("#phoneF").attr("placeholder", phones[0])
                                    $("#phoneM").attr("placeholder", phones[1])
                                    $("#phoneB").attr("placeholder", phones[2])
                                   
                                })

                            </script>

                            <!-- 휴대전화번호 -->
                            <div class="enroll-row">
                                <div class="enroll-col-1">
                                    <span>휴대전화번호</span>
                                </div>
                                <div class="enroll-col-2-type-1 enroll-col-2-type-2">
                                    <input type="number" id="phoneF" name="phoneF" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" value="" placeholder="">
                                  <!--  <select name="phoneF" required>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="017">017</option>
                                        <option value="016">016</option>
                                        <option value="019">019</option>
                                    </select>  -->
                                    &nbsp;
                                    &#45;
                                    &nbsp;
                                    <input type="number" id="phoneM" name="phoneM" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" value="" placeholder="">
                                    &nbsp;
                                    &#45;
                                    &nbsp;
                                    <input type="number" id="phoneB" name="phoneB" maxlength="4" oninput="inputNumberMaxLength(this);" onkeyup="checkPhone();" value="" placeholder="">
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
                                    <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호" value="<%= loginUser.getPostcode() %>" readonly required>
                                    &nbsp;<button onclick="sample6_execDaumPostcode();">우편번호 찾기</button><br><br>
                                    <input type="text" id="sample6_address" name="addressMain" placeholder="주소" value="<%= loginUser.getAddressMain() %>" readonly required><br><br>
                                    <input type="text" id="sample6_detailAddress" name="addressDetail" placeholder="상세주소" value="<%= loginUser.getAddressDetail() %>" required>
                                    <input type="text" id="sample6_extraAddress" name="addressAdd" placeholder="참고항목" value="<%= loginUser.getAddressAdd() %>" readonly>
                                </div>
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
                            <button type="submit" form="enroll-member-form">변경하기</button>
                        </div>
                    </div>
                </div>

			</div>
		</div>
    </div>
		<!-- footer -->
		<%@ include file="../common/footer.jsp" %>
		
        <script>

            // 각각 조건들 확인용 flag
            var checkIdFlag = false;
            var checkPwdFlag = false;
            var checkMatchPwdFlag = false;
            var checkNameFlag = false;
            var checkNicknameFlag = false;
            var checkYearFlag = false;
            var checkDateFlag = false;
            var checkPhoneFlag = false;
            
            // 아이디 조건 확인, 결과 출력
            function checkId(){

                var $userId = $("#enroll-member-form input[name=userId]").val();
                var $checkIdResult = $("#enroll-member-form span[name=checkIdResult]");
                var $regExp = /^[a-z\d_-]{4,20}$/;

                $.ajax({
                    url : "checkId.me",
                    data : {inputId : $userId},
                    success : function(result){
                        
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
                        if (!$regExp.test($userId)) {
                            
                            $checkIdResult.css('color', 'red');
                            $checkIdResult.html('4~20자의 영문 소문자, 숫자, <br>특수기호 _ 와 - 만 사용 가능합니다.');

                            checkIdFlag = false;
                        }
                        if ($userId == '') {

                            $checkIdResult.html('');

                            checkIdFlag = false;
                        }
                    },
                    error : function(){

                        console.log('id check error');
                    },
                });
            }

            // 비밀번호 조건 확인, 결과 출력
            function checkPwd() {
                
                var $userPwd = $("#enroll-member-form input[name=userPwd]").val();
                var $checkPwdResult = $("#enroll-member-form span[name=checkPwdResult]");
                var $regExp = /^[a-zA-Z\d!@#$%^]{8,20}$/;

                if (!$regExp.test($userPwd)) {
                            
                    $checkPwdResult.css('color', 'red');
                    $checkPwdResult.html('8~20자의 영문 소문자, 대문자, 숫자, <br>특수기호 ! @ # $ % ^ 만 <br>사용 가능합니다.');

                    checkPwdFlag = false;
                }
                else {

                    $checkPwdResult.css('color', 'green');
                    $checkPwdResult.html('사용 가능한 비밀번호 입니다.');

                    checkPwdFlag = true;
                }
                if ($userPwd == '') {

                    $checkPwdResult.html('');

                    checkPwdFlag = false;
                }
            }

            // 비밀번호 확인 조건 확인, 결과 출력
            function checkMatchPwd() {

                var $matchPwd = $("#enroll-member-form input[name=matchPwd]").val();
                var $userPwd = $("#enroll-member-form input[name=userPwd]").val();
                var $checkMatchPwdResult = $("#enroll-member-form span[name=checkMatchPwdResult]");

                if ($matchPwd == $userPwd) {
                    
                    $checkMatchPwdResult.css('color', 'green');
                    $checkMatchPwdResult.html('비밀번호가 일치합니다.');

                    checkMatchPwdFlag = true;
                }
                else {
                    
                    $checkMatchPwdResult.css('color', 'red');
                    $checkMatchPwdResult.html('비밀번호가 일치하지 않습니다.');

                    checkMatchPwdFlag = false;
                }
                if ($matchPwd == '') {

                    $checkMatchPwdResult.html('');

                    checkMatchPwdFlag = false;
                }
            }

            // 이름 조건 확인, 결과 출력
            function checkName() {
                
                var $userName = $("#enroll-member-form input[name=userName]").val();
                var $checkNameResult = $("#enroll-member-form span[name=checkNameResult]");
                var $regExp = /^[가-힣a-zA-Z]{2,20}$/;

                if (!$regExp.test($userName)) {
                            
                    $checkNameResult.css('color', 'red');
                    $checkNameResult.html('2~20자의 한글, 영문 소문자, 대문자만 사용 가능합니다.');

                    checkNameFlag = false;
                }
                else {

                    $checkNameResult.html('');

                    checkNameFlag = true;
                }
                if ($userName == '') {

                    $checkNameResult.html('');

                    checkNameFlag = false;
                }
            }

            // 닉네임 조건 확인, 결과 출력
            function checkNickname(){

                var $userNickname = $("#enroll-member-form input[name=userNickname]").val();
                var $checkNicknameResult = $("#enroll-member-form span[name=checkNicknameResult]");
                var $regExp = /^[가-힣a-z\d_-]{2,20}$/;

                $.ajax({
                    url : "checkNickname.me",
                    data : {inputNickname : $userNickname},
                    success : function(result){
                        
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
                        if (!$regExp.test($userNickname)) {
                            
                            $checkNicknameResult.css('color', 'red');
                            $checkNicknameResult.html('2~20자의 한글, 영문 소문자, 숫자, <br>특수기호 _ 와 - 만 사용 가능합니다.');

                            checkNicknameFlag = false;
                        }
                        if ($userNickname == '') {

                            $checkNicknameResult.html('');

                            checkNicknameFlag = false;
                        }
                    },
                    error : function(){

                        console.log('nickname check error');
                    },
                });
            }

            // 생년월일 조건 확인, 결과 출력
            // 년
            function checkYear() {
                
                var $year = $("#enroll-member-form input[name=year]").val();
                var $regExp = /^(1[9]|2[0])\d\d$/;

                if (!$regExp.test($year) || $year > 2022) {
                            
                    checkYearFlag = false;
                }
                else {

                    checkYearFlag = true;
                }
                if ($year == '') {

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

            function checkPhone(){

                var $phoneF = $("#enroll-member-form input[name=phoneF]").val();
                var $phoneM = $("#enroll-member-form input[name=phoneM]").val();
                var $phoneB = $("#enroll-member-form input[name=phoneB]").val();
                var $phone = $phoneF + "-" + $phoneM + "-" + $phoneB;
                var $checkPhoneResult = $("#enroll-member-form span[name=checkPhoneResult]");
                var $regExp = /^[0-9]{4}$/;

                $.ajax({
                    url : "checkPhone.me",
                    data : {inputPhone : $phone},
                    success : function(result){
                        
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
                    error : function(){

                        console.log('phone check error');
                    },
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


                if (checkNicknameFlag == false) {

                    alert('닉네임을 조건에 맞게 작성해주세요.');
                    enrollForm.userNickname.focus();
                    
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

	</div>

</body>
</html>