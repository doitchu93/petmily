<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.community.model.vo.Community, com.kh.notice.model.vo.Notice" %>
<%
	ArrayList<Community> adoptionReviewList = (ArrayList<Community>)request.getAttribute("adoptionReviewList");
	ArrayList<Community> volunteerReviewList = (ArrayList<Community>)request.getAttribute("volunteerReviewList");
	ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMILY - 메인</title>
<style>

	/* 전체 페이지 크기 */
	#wrap {
		width: 1200px;
		height: auto;
		margin: 0 auto;
	}

	/* content */
	/* content > content-area-1 */
	#content-area-1 {height: 400px;}
	
	/* content > content-area-2 */
	#content-area-2 {
		background-color: rgb(255, 246, 218);
		height: 530px;
	}
	#content-area-2 > div {
		height: 100%;
		float: left;
	}
	#content-2-1 {width: 700px;}
	#adopt-review-board {
		height: 500px;
		margin-top: 20px;
		margin-left: 20px;
	}
	#adopt-review-board > a {
		color: black;
		font-size: 20px;
		font-weight: bold;
		text-decoration: none;
	}

	#content-2-2 {width: 500px;}
	#notice-review-board {
		height: 275px;
		margin-top: 20px;
		margin-left: 20px;
		margin-right: 20px;
	}
	#notice-review-board > a {
		color: black;
		font-size: 20px;
		font-weight: bold;
		text-decoration: none;
	}
	#adopt-volunteer-button {
		height: 235px;
		display: flex;
	}
	#adopt-volunteer-button > div {
		background-color: white;
		width: 460px;
		height: 195px;
		margin: auto;
	}

	/* content > content-area-3 */
	#content-area-3 {
		background-color: rgb(243, 243, 243);
		height: 360px;
	}
	#content-3-1 {
		width: 100%;
		height: 100%;
		display: flex;
	}
	#volunteer-review-board {
		padding-top: 20px;
		padding-left: 20px;
		padding-right: 20px;
		width: 100%;
		
	}
	#volunteer-review-board > div {
		display: flex;
	}
	
	#volunteer-review-board > a {
		color: black;
		font-size: 20px;
		font-weight: bold;
		text-decoration: none;
	}

	/* 입양후기 관련 */
	.adopt-review-board-wrap {
		width: 136px;
		height: 212px;
		float: left;
		margin-top: 15px;
		margin-left: 17px;
		margin-right: 17px;
	}
	.adopt-review-board-wrap:hover {
		cursor: pointer;
	}
	.adopt-review-board-wrap > div {
		margin-top: 6px;
	}
	.adopt-review-board-image {
		width: 136px;
		height: 136px;
	}
	.adopt-review-board-title {
		font-weight: bold;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.adopt-review-board-content {
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: 12px;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
	.adopt-review-board-no {
		display: none;
	}

	/* 봉사후기 관련 */
	.volunteer-review-board-wrap {
		width: 255px;
		height: 260px;
		float: left;
		margin-top: 30px;
		margin-left: 17px;
		margin-right: 17px;
	}
	.volunteer-review-board-wrap:hover {
		cursor: pointer;
	}
	.volunteer-review-board-wrap > div {
		margin-top: 6px;
	}
	.volunteer-review-board-image {
		width: 255px;
		height: 160px;
	}
	.volunteer-review-board-title {
		font-weight: bold;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.volunteer-review-board-content {
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: 12px;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
	}
	.volunteer-review-board-no {
		display: none;
	}

	/* 공지사항 관련 */
	.notice-table {
		width: 460px;
		table-layout: fixed;
		border-collapse: collapse;
	}
	.notice-table tr {
		border-bottom: 1px solid black;
		height: 38px;
	}
	.notice-table tr:hover {
		font-weight: bold;
		cursor: pointer;
	}
	.notice-table .notice-table-no {
		display: none;
	}
	.notice-table .notice-table-title {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 80%;
	}
	.notice-table .notice-table-date {
		width: 20%;
	}

	#adopt-volunteer-button {
		text-align: center;
		
	}
	#adopt-volunteer-button > div > div {
		margin-top: 8px;
	}
	#adopt-volunteer-button > div > div > hr {
		width: 420px;
	}

</style>
</head>
<body>

	<div id="wrap">

		<!-- header -->
		<%@ include file="header.jsp" %>

		<!-- content -->
		<div id="content">

			<div id="content-area-1">
				<div>
					<img src="<%= contextPath %>/resources/banner-picture.png" alt="">
				</div>
			</div>

			<div id="content-area-2">
				<div id="content-2-1">
					<div id="adopt-review-board">
						<a href="<%= contextPath %>/reviewlist.ad?cpage=1">입양후기</a> <hr>

						<% if(adoptionReviewList.isEmpty()) { %>

							<p>등록된 입양후기 게시글이 없습니다.</p>

						<% } else { %>

							<% for(Community c : adoptionReviewList) { %>

								<div class="adopt-review-board-wrap">
									<img class="adopt-review-board-image" src="<%= c.getTitleImg() %>">
									<div class="adopt-review-board-no">
										<%= c.getComNo() %>
									</div>
									<div class="adopt-review-board-title">
										<%= c.getTitle() %>
									</div>
									<div class="adopt-review-board-content">
										<%= c.getSummary() %>
									</div>
								</div>

							<% } %>

						<% } %>
						
					</div>
				</div>
				<div id="content-2-2">
					<div id="notice-review-board">
						<a href="<%= contextPath %>/list.no">공지사항</a> <hr>
						<table class="notice-table">
							<tbody>

								<% if(noticeList.isEmpty()) { %>

									<p>등록된 공지사항 게시글이 없습니다.</p>

								<% } else { %>
		
									<% for(Notice n : noticeList) { %>
		
										<tr>
											<td class="notice-table-no"><%= n.getNoticeNo() %></td>
											<td class="notice-table-title"><%= n.getNoticeTitle() %></td>
											<td class="notice-table-date"><%= n.getCreateDate() %></td>
										</tr>
										
									<% } %>
		
								<% } %>

							</tbody>
						</table>
					</div>
					<div id="adopt-volunteer-button">
						<div>
							<div>
								<a href="<%= contextPath %>/main.ad?cpage=1">
									<img src="<%= contextPath %>/resources/adopt-picture.png" width="90%">
								</a>
							</div>
							<div>
								<hr>
							</div>
							<div>
								<a href="<%= contextPath %>/main.vl?cpage=1">
									<img src="<%= contextPath %>/resources/volunteer-picture.png" width="90%">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="content-area-3">
				<div id="content-3-1">
					<div id="volunteer-review-board">
						<a href="<%= contextPath %>/reviewlist.vl?cpage=1">봉사후기</a>
						<div>

							<% if(volunteerReviewList.isEmpty()) { %>

								<p>등록된 봉사후기 게시글이 없습니다.</p>
	
							<% } else { %>
	
								<% for(Community c : volunteerReviewList) { %>
	
									<div class="volunteer-review-board-wrap">
										<img class="volunteer-review-board-image" src="<%= c.getTitleImg() %>">
										<div class="volunteer-review-board-no">
											<%= c.getComNo() %>
										</div>
										<div class="volunteer-review-board-title">
											<%= c.getTitle() %>
										</div>
										<div class="volunteer-review-board-content">
											<%= c.getSummary() %>
										</div>
									</div>
	
								<% } %>
	
							<% } %>

						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- footer -->
		<%@ include file="footer.jsp" %>

	</div>

	<script>
        $(function(){

            $(".adopt-review-board-wrap").click(function(){

                var cno = $(this).children().eq(1).text();

                location.href="<%= contextPath %>/detail.cm?cno=" + cno + "&type=1";
            });

			$(".volunteer-review-board-wrap").click(function(){

				var cno = $(this).children().eq(1).text();

				location.href="<%= contextPath %>/detail.cm?cno=" + cno + "&type=2";
			});
			<%if(loginUser != null){%>
			$(".notice-table>tbody>tr").click(function(){

				var nno = $(this).children().eq(0).text();

				location.href="<%= contextPath %>/detail.no?nno=" + nno;
			});
			<%} else {%>
			$(".notice-table>tbody>tr").click(function(){
				alert("로그인 후 이용할 수 있는 서비스입니다.");		
			});
			<%}%>


        })
    </script>

</body>
</html>