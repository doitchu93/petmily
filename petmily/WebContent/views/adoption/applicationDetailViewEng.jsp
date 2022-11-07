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
        height: 5000px;
        margin: auto;
    }
    .wrap-ap > div{width: 100%;}
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
        height: 73%;
        background-color: lightgray;

        /* 사용자영역 표시 - 지우기*/
        font-size: 30px;
        text-align: center;
        padding-top: 150px;
    }
    #content_1 > #br{
        height: 2%;
    }
    #content_1 > #admin-area{
        height: 25%;
        background-color: lightgray;

        /* 관리자영역 표시 - 지우기*/
        font-size: 30px;
        text-align: center;
        padding-top: 40px;
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
/*------------------- content_2 영역 --------------------*/
    #content_2 > #content-area{
        height: 100%;
        margin-left: 20px;
        background-color: floralwhite;
    }
/*------------------- footer 영역 --------------------*/

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
                <div id="user-area" style="font-size:15px;">
                    <!-- 사용자만 보이는 영역-->
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
                </div>
                <div id="br">
                    <!-- 사용자영역과 관리자영역 사이 공간-->
                </div>
                <div id="admin-area">
                    <!-- 관리자가 볼 수 있는 영역-->
                    관리자 영역
                </div>
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
                                <th width="200px">1. Name</th>
                                <td>| <%=a.getName() %></td>
                            </tr>
                            <tr>
                                <th>2. Phone number</th>
                                <td>| <%=a.getPhone() %></td>
                            </tr>
                            <tr>
                                <th>3. Alternative Phone number</th>
                                <td>| <%=a.getSubPhone() %></td>
                            </tr>
                            <tr>
                                <th>4. Email</th>
                                <td>| <%=a.getEmail() %></td>
                            </tr>
                            <tr>
                                <th>5. Gender</th>                              
                                <%if(a.getGender().equals("M")) {%>
                                <td>| Male</td>
                                <%}else{ %>
                                <td>| Female</td>
                                <%} %>
                            </tr>
                            <tr>
                                <th>6. Age</th>
                                <td>| <%=a.getAge() %></td>
                            </tr>
                            <tr>
                                <th>7. Home Address</th>
                                <td>| <%=a.getAddress() %></td>
                            </tr>
                            <tr>
                                <th>8. SNS</th>
                                <td>| <%=a.getSns() %></td>
                            </tr>
                            <tr>
                                <th>9. Occupation</th>
                                <td>| <%=a.getJob() %></td>
                            </tr>
                            <tr>
                                <th>10. Marital Status</th>
                                <%if(a.getMaritalStatus().equals("N")) {%>
                                <td>| No</td>
                                <%}else{ %>
                                <td>| Yes</td>
                                <%} %>
                            </tr>
                        </table>
                        <br>
                        <hr><br>
                    <b> 입양 질문</b> <br><br>
                    <div class="adoption-qudstion">

                        1. Name of the pet you'd like to adopt <br>
                        <input type="text" name="animalName" style="width:900px; margin-top: 15px;" value="<%=a.getAnimalName() %>" readonly><br><br><br>

                        2. If you don't have a specific pet in mind for adoption, please provide a brief description of the kind of pet you are hoping for <br>
                        <textarea name="Q2" readonly><%=a.getQ2() %></textarea> <br><br><br>

                        3. Why do you wish to adopt a pet? <br>
                        <textarea name="Q3"readonly><%=a.getQ3() %></textarea> <br><br><br>

                        4. Please provide a brief introduction of any people (or pets) who live with you. <br>
                        <textarea name="Q4"readonly><%=a.getQ4() %></textarea> <br><br><br>

                        5. Do the people who live with you agree with your decision to adopt a pet? <br>
                        <textarea name="Q5"readonly><%=a.getQ5() %></textarea> <br><br><br>

                        6. Have you ever had a pet before? <br>
                        <textarea name="Q6"readonly><%=a.getQ6() %></textarea> <br><br><br>

                        7. What kind of pet did you have? <br>
                        <textarea name="Q7"readonly><%=a.getQ7() %></textarea> <br><br><br>

                        8. What happened to the pet? <br>
                        <textarea name="Q8"readonly><%=a.getQ8() %></textarea> <br><br><br>

                        9. What kind of building do you live in? <br>
                        <textarea name="Q9"readonly><%=a.getQ9() %></textarea> <br><br><br>

                        10. If you live in rented housing, has the landlord provided permission for a pet? <br>
                        <textarea name="Q10"readonly><%=a.getQ10() %></textarea> <br><br><br>

                        11. What are your plans for a pet in the event that you move house or move overseas? <br>
                        <textarea name="Q11"readonly><%=a.getQ11() %></textarea> <br><br><br>

                        12. What are your plans for a pet in the event of family changes such as marriage, pregnancy, or childbirth? <br>
                        <textarea name="Q12"readonly><%=a.getQ12() %></textarea> <br><br><br>

                        13. At the time of adoption, adopters are required to pay 70,000 KRW. This fee goes towards the costs of rescue, treatment and housing of homeless animals.
                            <br>(Foster carers are exempt.) Do you agree to this payment? <br>
                        <textarea name="Q13"readonly><%=a.getQ13() %></textarea> <br><br><br>

                        14. PETMILY requires that all adopted pets be neutered. Do you agree to arrange and pay for this procedure? <br>
                        <textarea name="Q14"readonly><%=a.getQ14() %></textarea> <br><br><br>


                        15. Have you worked with any animal welfare related organizations? Please provide the names of any such organizations you know of. <br>
                        >> <%=a.getQ15() %>
                          <br><br>


                    </div>
         
                    </div>
                </div> <!--content-area-->
            </div> <!--content-2-->
        </div><!--content-->
        
    </div>
    <%@include file="../common/footer.jsp" %>

</body>
</html>