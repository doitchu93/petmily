<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.notice.model.vo.Notice, com.kh.ask.model.vo.Attachment" %>
<%
	Notice notice = (Notice)request.getAttribute("notice");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	div {
		box-sizing: border-box;
	}
	
	.wrap {
		width: 1200px;
		height: 1600px;
		margin: auto;
	}
	
	.wrap>div {width: 100%;}
	
	#header {height: 10%;}
	#navigator {height: 3%;}
	#content {height: 77%;}
	#footer {height: 10%;}
	
	/* 세부 div 속성 */
	#header>div, #content>div {
		height: 100%;
		float: left;
	}
	/* 가로길이 */
	#header_1 {width: 20%;}
	#header_2 {width: 80%;}
	#content_1 {width: 20%;}
	#content_2 {width: 80%;}
	
	/*------------------- navigator 영역 --------------------*/
	#navigator {padding-top: 10px;}
	
	#navi {height: 100%;}
	
	#navi a {
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
	#content_2>#content-area {
		height: 100%;
		width: 100%;
		margin-left: 20px;
		/* background-color: floralwhite; */
	}
	/*------------------- content_2 영역의 테이블 영역 --------------------*/
	#table {
		text-align: center;
	}

	#table th { 
		background-color: burlywood;
	}

	#table-area {
		/* border: 1px solid black; */
		height: 50%;
		position: relative;
	}

	#button-area {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		margin-top: 80px;
	}

	#button-area > #backBtn{
		background-color: white;
		border-color: black;
		color: black;
	}

	#button-area > #submitBtn{
		background-color: burlywood;
		color: white;
	}
	/*------------------- footer 영역 --------------------*/
	#footer {
		background-color: gray;
	}
</style>
</head>
<body>

	<div class="wrap">
	
	<%@ include file="/views/common/header.jsp" %>
	
	
	<%
	
		String userClass = loginUser.getUserClass();
	%>
	
		<div id="navigator">

			<div id="navi">
				<!-- 임시 내용 -->
				<a href="#">HOME</a> > <a href="#">마이페이지</a> > <a href="#">내가 쓴
					글 조회</a>
			</div><!--navi-->

		</div><!--navigator-->

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
                    <li><a href="<%= contextPath %>/list.gr?cpage=1">단체 승인 내역</a></li>
                    <li><a href="<%= contextPath %>list.ap?cpage=1">입양신청서</a></li>
                    <li><a href="<%= contextPath %>/list.as?cpage=1">1:1 문의내역</a></li>
                    
                </div>
            <% } %>
            </div><!-- content_1 -->

			<div id="content_2">
				<div id="content-area">
					<h2>공지사항</h2>
					<br>
					
					<div id="table-area">
					
						<table class="table">
							<tr>
								<th width="200">제목</th>
								<td><%= notice.getNoticeTitle() %></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<% if(at.getFilePath() == null) { %>
										첨부파일 없음
									<% } else { %>
										<img width="200" height="200" src="<%= contextPath %>/<%= at.getFilePath() %>/<%= at.getChangeName() %>">
									<% } %>
								</td>
							</tr>
							<tr>
								<th>본문</th>
								<td><%= notice.getNoticeContent() %></td>
							</tr>
						</table>
						
						<div id="button-area">
							<% if(loginUser.getUserId().equals("admin")) { %>
								<button type="button" class="btn" id="backBtn" onclick="goToList()">목록</button>
								<button type="submit" class="btn" id="submitBtn" onclick="updateBtn();">수정</button>
								<button type="button" class="btn" id="submitBtn" onclick="deleteBtn();">삭제</button>
							<% } else { %>
								<button type="button" class="btn" 
									onclick="location.href='<%= contextPath %>/list.no'">목록</button>
							<% } %>
						</div>
						<script>
							function goToList(){
								location.href='<%= contextPath %>/list.no'
							}
							function updateBtn(){
								var updateUrl = "<%= contextPath %>/updateForm.no?nno=<%= notice.getNoticeNo() %>";
								location.href = updateUrl;
							}
							function deleteBtn(){
								var deleteUrl = "<%= contextPath %>/delete.no?nno=<%= notice.getNoticeNo() %>";
								location.href = deleteUrl;
							}
						</script>
							
												
					</div><!-- table-area -->
				</div><!-- content-area -->
			</div><!-- content_2 -->

		</div><!--content-->

		<div id="footer">
			<br><br><br><!-- content영역과 footer영역 사이 띄우기-->
       		<%@include file="../common/footer.jsp" %>
		</div><!--footer-->
		
	</div><!-- wrap -->
</body>
</html>