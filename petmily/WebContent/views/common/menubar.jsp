<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	// 성공 / 경고메세지 뽑기
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : alertMsg = null
	// 서비스 요청 후 성공 시 : alertMsg = 메시지문구
	
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : menubar.jsp가 로딩될 때 null
	// 로그인 후 : menubar.jsp가 로딩될 때 로그인한 회원의 정보가 담겨있음

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
</head>
<body>

	<script>
	// script태그 내에서도 스크립틀릿과 같은 jsp요소가 사용 가능
	
	var msg = "<%= alertMsg %>"; // '메세지문구' / null
	
	if(msg != "null"){
		alert(msg);
		
		// session에 들어있는 alertMsg키값에 대한 밸류는 지워줘야함!!!
		// 왜냐? menubar.jsp가 로딩될 때마다 매번 alert이 뜸 화남
 		// => XX.removeAttribute("키값");
 		<% session.removeAttribute("alertMsg"); %>
	}
	</script>


</body>
</html>