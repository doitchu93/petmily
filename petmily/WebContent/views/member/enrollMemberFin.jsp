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
		height: 710px;
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
        color: black;
		font-weight: bold;
		font-size: 20px;
        text-align: center;
        line-height: 495px;
		width: 850px;
		height: 495px;
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
                    회원가입이 완료되었습니다.
				</div>

                <div id="enroll-member-box-tail">
                    <div id="enroll-member-box-tail-button-wrap">
                        <div id="previous-button">
                            <button type="button" onclick="location.href='<%= contextPath %>'">돌아가기</button>
                        </div>
                        <div id="succeeding-button">
                            <button type="button" onclick="location.href='<%= contextPath %>/loginForm.me'">로그인</button>
                        </div>
                    </div>
                </div>

			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="../common/footer.jsp" %>
		
	</div>

</body>
</html>