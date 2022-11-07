<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int type = (int)session.getAttribute("type");
	String message = (String)session.getAttribute("message");
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
    #find-member-box-content-2 {
        width: 90%;
        height: 80%;
        margin: 0 auto;
        border-top: 1px solid rgb(125, 125, 125);
    }
    #find-member-box-content-2 > div {
        font-size: 20px;
        font-weight: bold;
        text-align: center;
        padding-top: 180px;
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

		<% if(type == 0) { %>

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
					<div id="find-member-box-content-2">
						<div><%= message %></div>
					</div>
				</div>

                <div id="find-member-box-tail">
                    <div id="find-member-box-tail-button-wrap">
                        <div id="previous-button">
                            <button type="button" onclick="location.href='<%= contextPath %>/find.me?type=0'">돌아가기</button>
                        </div>
                        <div id="succeeding-button">
                            <button type="submit" onclick="location.href='<%= contextPath %>/loginForm.me'">로그인</button>
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
						<div id="find-member-box-content-2">
                            <div><%= message %></div>
                        </div>
					</div>
	
					<div id="find-member-box-tail">
						<div id="find-member-box-tail-button-wrap">
							<div id="previous-button">
								<button type="button" onclick="location.href='<%= contextPath %>/find.me?type=1'">돌아가기</button>
							</div>
							<div id="succeeding-button">
								<button type="button" onclick="location.href='<%= contextPath %>/loginForm.me'">로그인</button>
							</div>
						</div>
					</div>
	
				</div>
			</div>

		<% } %>
		
		<!-- footer -->
		<%@ include file="../common/footer.jsp" %>
		
	</div>

</body>
</html>