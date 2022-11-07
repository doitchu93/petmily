<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member, com.kh.board.model.vo.Attachment2" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String contextPath = request.getContextPath();
	Attachment2 at2 = (Attachment2)session.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	/* header */
	#header {height: 100px;}
	#header > div {
		height: 100%;
		float: left;
		box-sizing: border-box;
	}
	#header a {text-decoration: none;}

	/* header > login-area */
	#logo-area {
		width: 250px;
		text-align: center;
	}
	#logo {
		width: 200px;
		margin: auto;
		margin-top: 10px;
	}
	#logo > a {
		color: rgb(232, 191, 123);
		font-size: 50px;
		font-weight: bold;
	}

	/* header > menubar-area */
	#menubar-area {
		width: 660px;
		padding-top: 60px;
		text-align: center;
	}
	#menubar {margin-right: 10px;}
	#menubar > a {
		color: black;
		font-size: 23px;
		font-weight: bold;
		margin-left: 35px;
		margin-right: 35px;
	}
	#menubar > a:hover {color: rgb(155, 128, 82);}

	/* header > login-area */
	#login-area {width: 290px;}
	#login-area > div {box-sizing: border-box;}
	#login-info {
		width: 100%;
		height: 60px;
		color: black;
		font-size: 18px;
		font-weight: bold;
		text-align: left;
		display: flex;
	}
	#login-info > div {
		height: 100%;
		line-height: 57.33px;
		float: left;
	}
	#profile {
		width: 22%;
		display: flex;
		margin-left: 10px;
	}
	#profile > img {
		border: 1px solid rgb(125, 125, 125);
		border-radius: 70%;
		margin: auto;
		width : 43px;
		height : 43px;
	}
	#user-class {
		width: 30%;
		text-align: center;
	}
	#user-nickname {
		width: 48%;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	#login-menu {text-align: center;}
	#login-menu > a {color: rgb(125, 125, 125);}
	
	
</style>
</head>
<body>
	
	<script>
	
		// 얼럿 띄우기(공용)
		var msg = "<%= alertMsg %>";
		
		if (msg != "null") {

			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
		
	</script>

	<!-- header -->
	<div id="header">

		<!-- 로고 -->
		<div id="logo-area">
			<div id="logo">
				<a href="<%= contextPath %>">PETMILY</a>
			</div>
		</div>

		<!-- 메인메뉴 -->
		<div id="menubar-area">
			<div id="menubar">
				<a href="<%=contextPath%>/main.ad?cpage=1">입양하기</a>
				<a href="<%=contextPath%>/main.vl?cpage=1">봉사하기</a>
				<a href="">굿즈샵</a>
				<% if(loginUser!=null){ %>
					<a href="<%=contextPath%>/list.as?cpage=1">고객센터</a>
				<%} else{ %>
					<a onclick="loginBlock()">고객센터</a>			
				<%} %>
				
			</div>
		</div>
		
		<script>
			function loginBlock(){
				alert("로그인 후 이용할 수 있는 서비스입니다.");
			}
		
		</script>
		
		
		<!-- 로그인 상태에 보여지는 login-area -->
		<% if(loginUser != null) { %>
		
			<div id="login-area">

				<!-- 로그인 정보 표시(프로필 사진, 회원등급, 닉네임) -->
				<div id="login-info">

					<!-- 프로필 사진 -->
					<div id="profile">
                        <% if(at2 == null) { %>
                        <img class="profileImg" src="<%= contextPath %>/resources/blank-profile-picture.png" height="70%">
                        <% } else { %>
                        <img class="profileImg" src="<%= contextPath %>/<%= at2.getFilePath()+at2.getChangeName() %>" height="70%">
                        <% } %>
                    </div>


					<!-- 회원등급 -->
					<div id="user-class">
						<% 
							String userClass = "";
						
							switch (loginUser.getUserClass()) {
							
								case "A" : userClass = "관리자"; break;
								case "G" : userClass = "단체"; break;
								case "P" : userClass = "일반"; break;
							}
						%>
						[<%= userClass %>]
					</div>

					<!-- 닉네임 -->
					<div id="user-nickname">
						<%= loginUser.getUserNickname() %>
					</div>
					
				</div>

				<!-- 로그인 시 보여지는 login-menu -->
				<div id="login-menu">
					<a href="<%= contextPath %>">HOME</a>
					&nbsp;&nbsp;&vert;&nbsp;&nbsp;
					<a href="<%= contextPath %>/myPage.me">마이페이지</a>
					&nbsp;&nbsp;&vert;&nbsp;&nbsp;
					<a href="<%= contextPath %>/logout.me">로그아웃</a>
				</div>

			</div>
			
		<!-- 비회원 상태에 보여지는 login-area -->
		<% } else { %>
		
			<div id="login-area">

				<!-- 로그인 정보 표시(비회원이라 내용 없음) -->
				<div id="login-info">
					<div id="profile-picture"></div>
					<div id="user-nickname"></div>
				</div>

				<!-- 비회원 시 보여지는 login-menu -->
				<div id="login-menu">
					<a href="<%= contextPath %>">HOME</a>
					&nbsp;&nbsp;&vert;&nbsp;&nbsp;
					<a href="<%= contextPath %>/enrollForm.me">회원가입</a>
					&nbsp;&nbsp;&vert;&nbsp;&nbsp;
					<a href="<%= contextPath %>/loginForm.me">로그인</a>
				</div>

			</div>
			
		<% } %>

	</div>

</body>
</html>