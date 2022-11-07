<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.notice.model.vo.Notice" %>
<%@ page import= "com.kh.member.model.vo.Member" %>
<%
	ArrayList<Notice> nList = (ArrayList<Notice>)request.getAttribute("nList");
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
	div {
		box-sizing: border-box;
		/* border: 1px solid darkolivegreen; */
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
	}
	/*------------------- content_2 영역의 헤더 영역 --------------------*/

	#content-header2 button { /*공지사항 등록*/
		background-color: burlywood;
		border-color: none;
		color: white;
		
	}
	/*------------------- content_2 영역의 테이블 영역 --------------------*/
	
	#table-area{
		height: 50%;
		/* background-color: rebeccapurple; */
	}
	#table {
		text-align: center;
	}

	#table th { 
		/* background-color: rgb(255, 217, 135); */
		background-color: wheat;
	}
	/*------------------- footer 영역 --------------------*/
	#footer {
		background-color: gray;
	}
	/*------------------- noticeListView.jsp에만 추가한 거 --------------------*/
	
	#content-header > div{
		height: 60px;
		float: left;
	}
	#content-header1{
		width: 50%;
	}
	#content-header2{
		width: 50%;
		text-align: right;
		padding-top: 10px;
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
			
			<% if (loginUser != null ){ %> <!-- 로그인유저 아니면 이 걍 나가리인 페이지 -->
				<div id="content-area">
					<div id="content-header">
					
						<div id="content-header1">
							<h2>공지사항</h2>
						</div>
						
						<% if(loginUser.getUserId().equals("admin")) { %>
							<div id="content-header2">
								<button  class="btn" onclick="noticeBtn();">공지사항 등록</button>
							</div> 
						<% } %>
						
						<script>
							function noticeBtn(){
								var noticeUrl = "<%= contextPath %>/enrollForm.no"
								location.href=noticeUrl;
							}
						</script>
						
					</div><!--content-header-->

					<div id="table-area">
					
						<table class="table table-hover" id="table">
							<thead>
								<tr>
									<th width="70">글번호</th>
									<th width="70">작성일</th>
									<th width="300">제목</th>
									<th width="70">조회수</th>
								</tr>
							</thead>
							
							<tbody>
								<!-- 관리자는 공지사항작성 버튼 보여주기 -->
								<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
									<% for(Notice n : nList) { %>
										<tr>
											<td><%= n.getNoticeNo() %></td>
											<td><%= n.getCreateDate() %></td>
											<td><%= n.getNoticeTitle() %></td>
											<td><%= n.getCount() %></td>
										</tr>
									<% }%>
									
								<% } else if(loginUser != null) { %>
									<% for(Notice n : nList) { %>
										<tr>
											<td><%= n.getNoticeNo() %></td>
											<td><%= n.getCreateDate() %></td>
											<td><%= n.getNoticeTitle() %></td>
											<td><%= n.getCount() %></td>
										</tr>
									<% }%>
								<% } %>
							</tbody>
						</table>
						
						<br>
						

	
						<!-- paging-area 부분 -->






					</div><!--table-area-->

					<script>
						$(function(){
							$("#table>tbody>tr").click(function(){
								var nno = $(this).children().eq(0).text();
								location.href = "<%= contextPath %>/detail.no?nno=" + nno;
							})
						})
					</script>
					
				</div><!-- content-area -->
				
				<% } else { %>
					<a href="<%= contextPath %>/loginForm.me">로그인하기</a>
				<% } %>
				
			</div><!-- content_2 -->

		</div><!--content-->

		<div id="footer">
			<br><br><br><!-- content영역과 footer영역 사이 띄우기-->
       		<%@include file="../common/footer.jsp" %>
		</div><!--footer-->
	</div>

</body>
</html>