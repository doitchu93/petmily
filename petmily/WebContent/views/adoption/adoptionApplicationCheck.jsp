<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "com.kh.adoption.model.vo.Application" %>

<% Application ap = (Application)request.getAttribute("ap"); %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제출 확인</title>
    <style>
		#content_AR{width: 100%;}
        #intro{
            padding: 10px;
            background-color: lightgray;
        }
        #agreement-area{
            padding: 15px;
            background-color: rgb(255,217,135);
            border-radius: 15px;
        }
        #language-btn{
            width: 80px;
			border : 0;
            padding: 5px;
			border-radius : 5px;	
			color : white;
            margin-bottom: 7px;
            margin-right: 7px;
        }
        #submit-btn{
            width: 300px;
            border : 0;
            padding: 5px;
			border-radius : 5px;
            color: white;
            background-color: rgb(180, 149, 95);
        }
        #back-btn{
            width: 300px;
            border : 0;
            padding: 5px;
			border-radius : 5px;
            color: white;
            background-color: rgb(232,191,123);
        }
        td{
            width: 1000px;
            height: 70px;
        }
        td>input[type=text] {
            width: 1100px;
        }
        textarea{
            width: 1200px;
            height: 180px;
        }


    </style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
		<br><br>
	    <div class="wrap" style="padding:40px">
        <div id="content">
            <div id="content_AR">

                <div id="intro" style="text-align: center;">
                    <br><br>
                    <h1>입양 신청서가 접수되었습니다.</h1>
                    <br>
                    <p>
              
                        입양 신청 정보를 확인해주세요! <br>
                        제출 완료 버튼을 누르면 신청서가 최종 제출되며 정보 변경 및 확인이 불가합니다.<br>
      
                       <pre>
       Please check your adoption application information!
If you press the Submit Complete button, the application form will be finally submitted, and information cannot be changed or verified.
                       </pre>
                    

                    </p>
                    <br><br>
                </div> <!--intro-->  

                <br><br> 
                <p style="text-align:center"> <b>입양 신청 정보</b></p>
                <hr>
                    <table border="1px">
                        <tr>
                            <th width="300px">성함 (Name)</th>
                            <td> <%= ap.getName() %> </td>
                        </tr>
                        <tr>
                            <th>연락처(Phone Number)</th>
                            <td>  <%=ap.getPhone() %> </td>
                        </tr>
                        <tr>
                            <th>대체 연락처 <br> (Alternative Phone number)</th>
                            <td>  <%=ap.getSubPhone() %> </td>
                        </tr>
                        <tr>
                            <th>이메일주소(Mail)</th>
                            <td> <%=ap.getEmail() %></td>
                        </tr>
                        <tr>
                            <th>입양 희망 동물 (Pet Name)</th>
                            <td> <%=ap.getAnimalName() %></td>
                        </tr>
                    </table>

                <br><hr><br>
                <div id="agreement-area">
 
                    1. 입양 담당자가 순차적으로 검토 후 개별적으로 연락을 드립니다. <br>
                    2. 신청서 검토는 2주일 정도 소요됩니다.  <br>
                    3. 입양이 부적합하다고 판단되는 경우 또는 입양신청한 동물이 입양 완료 단계에 있는 경우에는 연락을 드리지 않습니다. <br>
                    4. 제출 완료 버튼을 누르면  메인페이지로 돌아가며 신청서 수정 또는 확인이 불가하오니 유의 바랍니다. <br>
                    
                </div> <!--div-agreement-->
                <br>
                <div id="agreement-area">
 
 
                    1. The person in charge of adoption will review it sequentially and contact you individually. <br>
                    2. It will take about two weeks to review the application form. <br>
                    3. We will not contact you if the adoption is deemed inappropriate or if the animal that has applied for adoption is in the stage of completion of adoption. <br>
                    4. Please note that if you press the Submit button, it will return to the main page and you cannot modify or check the application form <br>

                </div> <!--div-agreement-->

                <br><br><br>
                
               <form action="<%=contextPath %>/submitAp.ad" method="post">
                    <!--input hidden-->
                <input type="hidden" name="agreement" value="<%= ap.getAgreement() %>">
                
                <input type="hidden" name="applicantName" value="<%= ap.getName() %>">
  
				<input type="hidden" name="phone" value="<%= ap.getPhone() %>">
				
				<input type="hidden" name="subPhone" value="<%= ap.getSubPhone() %>">
				           
				<input type="hidden" name="email" value="<%= ap.getEmail() %>">
				
				<input type="hidden" name="gender" value="<%= ap.getGender()%>">
				
				<input type="hidden" name="age" value="<%= ap.getAge() %>">
				           
				<input type="hidden" name="address" value="<%= ap.getAddress() %>">
				          
				<input type="hidden" name="sns" value="<%= ap.getSns() %>">
				 
				<input type="hidden" name="job" value="<%= ap.getJob() %>">
				         
				<input type="hidden" name="maritalStatus" value="<%= ap.getMaritalStatus() %>">
				
				<input type="hidden" name="animalNo" value="<%=ap.getAnimalNo()%>">
				
				<input type="hidden" name="animalName" value="<%=ap.getAnimalName()%>">
                
                <input type="hidden" name="Q2" value="<%=ap.getQ2() %>">
                <input type="hidden" name="Q3" value="<%=ap.getQ3() %>">
                <input type="hidden" name="Q4" value="<%=ap.getQ4() %>">
                <input type="hidden" name="Q5" value="<%=ap.getQ5() %>">
                <input type="hidden" name="Q6" value="<%=ap.getQ6() %>">
                <input type="hidden" name="Q7" value="<%=ap.getQ7() %>">
                <input type="hidden" name="Q8" value="<%=ap.getQ8() %>">
                <input type="hidden" name="Q9" value="<%=ap.getQ9() %>">
                <input type="hidden" name="Q10" value="<%=ap.getQ10() %>">
                <input type="hidden" name="Q11" value="<%=ap.getQ11() %>">
                <input type="hidden" name="Q12" value="<%=ap.getQ12() %>">
                <input type="hidden" name="Q13" value="<%=ap.getQ13() %>">
                <input type="hidden" name="Q14" value="<%=ap.getQ14() %>">
                <input type="hidden" name="Q15" value="<%=ap.getQ15() %>">
                <input type="hidden" name="Q16" value="<%=ap.getQ16() %>">
                <input type="hidden" name="Q17" value="<%=ap.getQ17() %>">
                <input type="hidden" name="Q18" value="<%=ap.getQ18() %>">
                <input type="hidden" name="Q19" value="<%=ap.getQ19() %>">
                <input type="hidden" name="Q20" value="<%=ap.getQ20() %>">
                
                <input type="hidden" name="categoryNo" value=<%=ap.getCategoryNo() %>>
                

                   <div style="text-align: center;">
                    <button type="button" id="back-btn" onclick="history.back();">뒤로가기</button>
                    <button type="submit" id="submit-btn">제출하기</button>
                </div>

               </form>
            </div><!--content_AR-->
    
         </div> <!--content-->
         </div> <!--wrap-->

         <br><br>
         <%@include file="../common/footer.jsp" %>
</body>
</html>