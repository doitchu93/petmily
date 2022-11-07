<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "com.kh.member.model.vo.Member" %>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<style>
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
        #content_1 > #user-area > p > a {
            
            color: black;

            text-decoration-line: none;
            
        }
        #content_1 > #user-area > li > a {
            
            color: black;

            text-decoration-line: none;
            
        }#content_1 > #admin-area > li > a {
            
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

        .file-label{
            border: 1px solid black;
        }
    </style>
</head>
<body>


    <div class="wrap">

        <%@ include file="/views/common/header.jsp" %>

        <% 
        
        String birthDate = loginUser.getBirthDate();
    	
    	String userNickname = loginUser.getUserNickname();
    		
    	String userClass = loginUser.getUserClass();

       // Attachment at = (Attachment)session.getAttribute("at");

        
        
        %>

        <hr>

        <div id="navigator">

            <div id="navi">
                <!-- 임시 내용 -->
                <a href="<%= contextPath %>">HOME</a> > 
                <a href="<%= contextPath %>/myPage.me">마이페이지</a> >
                <a href="<%= contextPath %>/profile.me">내 프로필 수정</a>
                
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
                        <li><a href="<%= contextPath %>/list.gr">단체 승인</a></li>
                        <li><a href="#">입양신청서</a></li>
                        <li><a href="<%= contextPath %>/list.as?cpage=1">1:1 문의내역</a></li>
                        
                    </div>
            <% } %>
            </div>
            <div id="content_2">
                <div id="content-area">
                	<div id="profile-area" align="center">
                        <form id="profile-form" enctype="multipart/form-data" action="<%= contextPath %>/updateProfile.me" method="post">

                            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">

                            <table>
                                <tr>
                                    <% if(at2 == null) { %> 
                                    <td><img src="<%= contextPath %>/resources/blank-profile-picture.png" id="profileImg" width="250px" height="250px"></td>
                                    <% } else { %>
                                    <td><img src="<%= contextPath %>/<%= at2.getFilePath()+at2.getChangeName() %>" id="profileImg" width="250px" height="250px"></td>
                                    <% } %>
                                    <td>
                                        <div>
                                            <p>닉네임<input type="text" name="nickname" value="<%= loginUser.getUserNickname() %>"></p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <label class="file-label" for="file">파일 첨부하기</label>
                            <input type="file" name="file" id="file" onchange="loadImg(this)" style="display: none;">
                            <br><br><br>
                            <button type="submit">적용하기</button>
                            <a href="<%= contextPath %>/myPage.me">취소하기</a>
                        </form>
                	</div>
                </div>
            </div>
        </div><!--content-->

        <br><!-- content영역과 footer영역 사이 띄우기-->

        <div id="footer">
        </div><!--footer-->
    </div>

    <script>

        function loadImg(inputFile){

            if(inputFile.files.length == 1){

                var reader = new FileReader();

                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e){

                    $("#profileImg").attr("src", e.target.result);

                }

            } else {

                $("#profileImg").attr("src", "<%= contextPath %>/resources/blank-profile-picture.png");

            }

        }

        $("#deleteFile").click(function(){
            $("#profileImg").attr("src", "<%= contextPath %>/resources/blank-profile-picture.png");
        })


    </script>
    
</body>
</html>