<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.groups.model.vo.Groups" %>
<%@ page import = "com.kh.common.model.PageInfo" %>
<%@ page import= "com.kh.member.model.vo.Member" %>
<%
	ArrayList<Groups> gList = (ArrayList<Groups>)request.getAttribute("gList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단체 신청 내역</title>
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
	
	#button-area {
		text-align: center;
	}
	
	.paging-area button:hover { /*페이징 버튼 hover*/
		background-color: burlywood;
	}
	/*------------------- content_2 영역의 테이블 영역 --------------------*/
	
	#table-area{
		height: 50%;
	}
	#table {
		text-align: center;
	}

	#table th { 
		background-color: wheat;
	}

	/*------------------- footer 영역 --------------------*/
	#footer {
		background-color: gray;
	}

	/*------------------- askListView.jsp에만 추가한 거 --------------------*/
	
	#content-header > div{
		height: 60px;
		float: left;
	}
	#content-header1{
		width: 50%;
	}
	#content-header2{
		border: solid 1px black;
		width: 50%;
		text-align: right;
		padding-top: 20px;
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
					<div id="content-header">
					
						<div id="content-header1">
							<h2>단체 신청 내역</h2>
						</div>
						
					</div><!--content-header-->

					<div id="table-area">

						<% if (loginUser.getUserId().equals("admin")) { %>
						
							<table class="table table-hover" id="table">
								<thead>
									<tr>
										<th width="100">글번호</th>
										<th width="200">신청일자</th>
										<th width="350">단체명</th>
										<th width="200">신청인</th>
										<th>승인상태</th>
									</tr>
								</thead>
								<tbody>
									<% for(Groups g : gList) { %>
										<tr>
											<td><%= g.getGroupNo() %></td>
											<td><%= g.getCreateDate() %></td>
											<td><%= g.getGroupName() %></td>
											<td><%= g.getUserName() %></td>
											
											<% if (g.getGroupAuth().equals("X")){ %>
												<td style="color:gray">대기</td>
											<% } else if(g.getGroupAuth().equals("Y")){ %>
												<td style="color:blue">승인</td>
											<% } else { %>
												<td style="color:red">반려</td>
											<% } %>
										
										</tr>
									<% } %>
								</tbody>
							</table>
							
						<% } else { %>
							<a href="#">관리자만 접근할 수 있는 페이지</a>
						<% } %>
						
						
						
						<script>
							$(function(){
								$("#table>tbody>tr").click(function(){
									var gno = $(this).children().eq(0).text();
									//console.log(gno);
									location.href = "<%= contextPath %>/detail.gr?gno=" + gno;
								})
							})
						</script>
					
					</div><!--table-area-->
					
					<div align="center" class="paging-area">
							<% if(currentPage != 1) { %> <!-- 페이징바에서 <를 담당 -->
								<button class="btn" onclick="location.href='<%= contextPath %>/list.gr?cpage=<%= currentPage - 1 %>'"> &lt; </button>
							<% } %>
							
							<% for(int i = startPage; i <= endPage; i++) { %>
								<% if(i != currentPage) { %>
									<button class="btn" onclick="location.href='<%= contextPath %>/list.gr?cpage=<%= i %>'"><%= i %></button>
								<% } else { %>
									<button class="btn" disabled><%= i %></button>
								<% } %>
							<% } %>
							
							<% if(currentPage != maxPage) { %>
								<button class="btn" onclick="location.href='<%= contextPath %>/list.gr?cpage=<%= currentPage + 1 %>'"> &gt; </button>
							<% } %>
						</div><!-- paging-area -->
					
					
				</div><!-- content-area -->
			</div><!-- content_2 -->

		</div><!--content-->

		<div id="footer">
			<br><br><br><!-- content영역과 footer영역 사이 띄우기-->
       		<%@include file="../common/footer.jsp" %>
		</div><!--footer-->
	</div>

</body>
</html>