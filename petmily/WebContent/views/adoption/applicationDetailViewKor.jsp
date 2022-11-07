<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.adoption.model.vo.Application" %>  
<%
	Application a = (Application)request.getAttribute("a");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫밀리 : 입양신청서(관리자)</title>
<style>
    div{
        box-sizing: border-box;
        /* border: 1px solid darkolivegreen; */
    }
    .wrap-ap{
        width: 1200px;
        height: 5500px;
        margin: auto;
    }
    .wrap-ap > div{width: 100%;}
    #header{height: 10%;} 
    #navigator{height: 3%;}
    #content{height: 77%;}

    /* 세부 div 속성 */
    #header > div, #content > div{
        height: 100%;
        float: left;
    }
    /* 가로길이 */

    #content_1{width: 20%;}
    #content_2{width: 80%;}

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
        height: 5200px;
        margin-left: 20px;
        background-color: floralwhite;
    }
    
    td{
        width: 800px;
        height: 70px;
    }
    td>input[type=text] {
        width: 800px;
    }
    textarea{
        width: 900px;
        height: 180px;
    }
</style>
</head>
<body>
    <%@include file="../common/header.jsp" %>
    <div class="wrap-ap">
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
                <a href="#">HOME</a> > 
                <a href="#">관리자</a> >
                <a href="#">입양신청서</a>
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
                        <li><a href="#">1:1 문의하기</a></li>
                        <li><a href="#">단체 신청</a></li>
                        <li><a href="#">문의 내역</a></li>
                       
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
                            <li><a href="#">1:1 문의하기</a></li>
                            <li><a href="#">문의 내역</a></li>
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
                        <li><a href="#">1:1 문의하기</a></li>
                        <li><a href="#">단체 신청</a></li>
                        <li><a href="#">문의 내역</a></li>
                </div>
                <div id="admin-area">
                    <!-- 관리자가 볼 수 있는 영역-->
                    <p>관리자 메뉴</p>
                        <li><a href="#">상품 등록</a></li>
                        <li><a href="#">상품 주문내역</a></li>
                        <li><a href="#">단체 승인</a></li>
                        <li><a href="#">입양신청서</a></li>
                        <li><a href="#">1:1 문의내역</a></li>
                    
                </div>
            <% } %>
            </div>
            <div id="content_2">
                <div id="content-area">
                    <h2>입양신청서</h2>
                    <hr>
                    <table>
                        <tr>  
                            <td>
                                <b>개인정보/입양 동의 여부</b> : 
                                <%if(a.getAgreement().equals("Y")) {%>
                                	동의함
                                <%} else{%>
                                	동의안함
                                <%} %>
                            </td>
                            <td align="right">
                                <form action="<%=contextPath %>/update.ap" method="post">
                                    <input type="hidden" name="apno" value="<%=a.getApNo() %>">
                                   	 No.<%=a.getApNo() %> | <%=a.getApDate() %> | 확인상태
                                    <select name="status">
                                    	<%if(a.getStatus().equals("Y")){ %>
	                                        <option value="Y" selected>확인완료</option>
	                                        <option value="N">대기중</option>                                 	
                                    	<%} else{%>
	                                        <option value="Y">확인완료</option>                                    	
	                                        <option value="N" selected>대기중</option>
                                    	<%} %>
                                    </select>
                                    <button type="submit">수정</button>
                                </form>
                            </td>
                        </tr>
                    </table>         
            
                    <hr>
                        <table class="personal-inform">
                            <tr>
                                <th width="200px">1. 성함</th>
                                <td>| <%=a.getName() %></td>
                            </tr>
                            <tr>
                                <th>2. 연락처</th>
                                <td>| <%=a.getPhone() %></td>
                            </tr>
                            <tr>
                                <th>3. 대체 연락처</th>
                                <td>| <%=a.getSubPhone() %></td>
                            </tr>
                            <tr>
                                <th>4. 이메일 주소</th>
                                <td>| <%=a.getEmail() %></td>
                            </tr>
                            <tr>
                                <th>5. 성별</th>                              
                                <%if(a.getGender().equals("M")) {%>
                                <td>| 남성</td>
                                <%}else{ %>
                                <td>| 여성</td>
                                <%} %>
                            </tr>
                            <tr>
                                <th>6. 나이</th>
                                <td>| <%=a.getAge() %></td>
                            </tr>
                            <tr>
                                <th>7. 주소</th>
                                <td>| <%=a.getAddress() %></td>
                            </tr>
                            <tr>
                                <th>8. SNS 주소</th>
                                <td>| <%=a.getSns() %></td>
                            </tr>
                            <tr>
                                <th>9. 직업</th>
                                <td>| <%=a.getJob() %></td>
                            </tr>
                            <tr>
                                <th>10. 결혼여부</th>
                                <%if(a.getMaritalStatus().equals("N")) {%>
                                <td>| 미혼</td>
                                <%}else{ %>
                                <td>| 기혼</td>
                                <%} %>
                            </tr>
                        </table>
                        <br>
                        <hr><br>
                    <b> 입양 질문</b> <br><br>
                    <div class="adoption-qudstion">

                        1. 입양을 희망하는 동물의 이름을 적어주세요 <br>
                        <input type="text" name="animalName" style="width:900px; margin-top: 15px;" value="<%=a.getAnimalName() %>" readonly><br><br><br>

                        2. 입양하기를 희망하는 아이가 없을 경우 앞으로 입양하고자 하는 아이에 대하여 간단히 설명하여 주시기 바랍니다. <br>
                        <textarea name="Q2" readonly><%=a.getQ2() %></textarea> <br><br><br>

                        3. 입양을 결정하시기까지 얼마나 오랜 시간을 고민하셨나요? <br>
                        <textarea name="Q3"readonly><%=a.getQ3() %></textarea> <br><br><br>

                        4. 입양을 원하시는 가장 큰 이유는 무엇인가요? <br>
                        <textarea name="Q4"readonly><%=a.getQ4() %></textarea> <br><br><br>

                        5. 가족 구성원은 몇 명인가요? 구성원을 소개해주세요. <br>
                        <textarea name="Q5"readonly><%=a.getQ5() %></textarea> <br><br><br>

                        6. 입양결정에 가족 모두 동의하십니까? <br>
                        <textarea name="Q6"readonly><%=a.getQ6() %></textarea> <br><br><br>

                        7. 키우고 계신 반려동물이 있나요? 있다면 소개해주세요. <br>
                        <textarea name="Q7"readonly><%=a.getQ7() %></textarea> <br><br><br>

                        8. 키우던 반려동물을 개인 사정으로 포기한 경험이 있으신가요? 이유는 무엇인가요? <br>
                        <textarea name="Q8"readonly><%=a.getQ8() %></textarea> <br><br><br>

                        9. 주거의 형태는? <br>
                        <textarea name="Q9"readonly><%=a.getQ9() %></textarea> <br><br><br>

                        10. 정원이 있다면 담이나 울타리가 되어있나요? 되어있다면 높이는 얼마나 되나요? <br>
                        <textarea name="Q10"readonly><%=a.getQ10() %></textarea> <br><br><br>

                        11. 임대한 주택의 경우 집주인의 동의를 얻으셨나요? <br>
                        <textarea name="Q11"readonly><%=a.getQ11() %></textarea> <br><br><br>

                        12. 소음이나 위생 등으로 인한 이웃과의 마찰로 입양동물의 양육이 불가능해질 경우 어떻게 하실건가요? <br>
                        <textarea name="Q12"readonly><%=a.getQ12() %></textarea> <br><br><br>

                        13. 이사 또는 해외로 이주 시 반려동물의 거취문제에 대해 어떻게 생각하나요? <br>
                        <textarea name="Q13"readonly><%=a.getQ13() %></textarea> <br><br><br>

                        14. 앞으로 결혼, 임신, 출산 등 가족의 변화가 있는 경우 반려동물의 거취문제에 대해 어떻게 생각하나요? <br>
                        <textarea name="Q14"readonly><%=a.getQ14() %></textarea> <br><br><br>


                        15. 입양 시 유기동물의 구조와 치료, 보호비로 사용되는 일정 금액의 맞음비 10만원을 납부해주셔야 합니다. 동의하십니까? <br>
                            (임시보호 제외) <br>
                          <%if(a.getQ15().equals("Y")){ %>
                               	> 예
                          <%} else{%>
								> 아니오
                          <%} %>
                          <br><br>

                        16. 입양하신 동물은 카라의 중성화수술 시행 방침에 따라, 반드시 중성화수술을 해주셔야 합니다. 이에 동의하십니까? <br>
                          <%if(a.getQ16().equals("Y")){ %>
                               	> 예
                          <%} else{%>
								> 아니오
                          <%} %>
                          <br><br>

                        17. 입양 후 모니터링을 위한 전화연락이나 방문, 인스타그램 가입 및 게시물 공유에 동의하십니까? <br>
                          <%if(a.getQ17().equals("Y")){ %>
                               	> 예
                          <%} else{%>
								> 아니오
                          <%} %>
                          <br><br>

                        18. 동물 관련 활동경험이 있으신가요? 또는 평소 알고 있던 동물단체들이 있다면 아는대로 적어주세요. <br>
                        <textarea name="Q18"readonly><%=a.getQ18() %></textarea> <br><br><br>

                        19. 길고양이에게 밥을 주신 적이 있으신가요? 유기동물 구조 경험이 있으신가요? <br>
                          <%if(a.getQ19().equals("Y")){ %>
                               	> 예
                          <%} else{%>
								> 아니오
                          <%} %>
                          <br><br>

                        20. 입양희망 동물에 대해 어떻게 알게 되셨나요? (예시 : 네이버블로그, 기사, 페이스북, 트위터, 인스타그램 등) <br>
                        <textarea name="Q20"readonly><%=a.getQ20() %></textarea> <br><br><br>

                    </div>
                    </div>
                </div> <!--content-area-->
            </div> <!--content-2-->
        </div><!--content-->
    </div>
    <%@include file="../common/footer.jsp" %>

</body>
</html>