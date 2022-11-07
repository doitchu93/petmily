<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.adoption.model.vo.Animal" %>

<%
	Animal a = (Animal)request.getAttribute("a");
%>      
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양신청서</title>
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
		<br><br><br><br>
	    <div class="wrap" style="padding: 40px;">
        <div id="content">
            <div id="content_AR">
                <button type="button" id="language-btn" disabled style="background-color: rgb(180, 149, 95);">KOR</button>
                <a href="<%=contextPath%>/applicationEng.ad?ano=<%=a.getAnimalNo()%>">
                	<input type="button" value="ENG" id="language-btn" style="background-color: rgb(232,191,123);">
                </a>
                <div id="intro" style="text-align: center;">
                    <br><br>
                    <h1>입양 신청</h1>
                    <p>
                        	<br>
				                        평생 책임질 준비 되셨나요?<br>
				                        구조된 동물들에게 입양은 마지막 기회이자 유일한 희망입니다<br>

                    </p>
                    <br><br>
                </div> <!--intro-->  
                <br><br> 
                <p style="text-align:center"> <b>입양 신청서</b></p>
                <hr>

               <form action="<%=contextPath %>/checkApplication.ad" method="post">
               <input type="hidden" name="categoryNo" value="800">
                    <div id="agreement-area">
                        ➕ <b>개인정보 수집 및 이용에 대한 동의</b> <br>
                        1. 수집하는 개인정보의 항목: 성명, 주소, 이메일, 휴대전화번호<br>
                        2. 개인정보의 수집,이용 목적: 본 서명의 목적에 맞는 펫밀리의 캠페인에 활용하고, 추후 전개되는 바에 대한 소식을 전달하기 위함<br>
                        3. 개인정보의 보유 및 이용기간: 5년(관계법령에서 정한 일정한 기간<br>
                        <b>* 펫밀리는 법률에서 정하는 경우를 제외하고는 귀하의 동의 없이 개인정보를 제3자에게 제공하지 않습니다.</b> <br>
                        ✔ 개인정보 이용에 동의합니다. <br><br>

                        ➕ <b>입양 서약</b> <br>
                        1. 본인(이하 '입양인'이라 합니다.)은 '펫밀리(이하 '단체'라 합니다.)를 통하여 반려동물(이하 '입양동물'이라 합니다.)을 입양함에 있어 입양동물이 자연사하는 시점까지 책임 있는 보호자로서 입양동물에게 최적의 환경과 보살핌을 제공할 것이며 최선을 다하여 입양동물을 보호할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        2. 입양인은 입양인이나 혹은 가족을 포함한 제 3자의 고의 또는 과실로 인하여 입양동물에 대한 학대행위가 발생하거나 입양동물이 양도, 매매, 유기, 유실된 경우에는 단체로부터의 어떠한 민, 형사상의 처벌에도 이의를 제기하지 않고 따르는데 동의합니다. 입양인은 입양동물이 양도, 매매, 유기, 유실된 경우에 그 즉시로 단체에 통지할 의무를 지니며 입양동물을 되찾기 위한 노력에 최선을 다하여 협조할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        3. 입양인은 입양동물에게 양질의 사료와 깨끗한 물을 공급하고, 적합하고 적절한 운동, 질병에 대한 예방접종, 정기 건강검진을 시행하는 등, 꼭 필요한 복지를 제공할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        4. 만일 입양동물이 질병에 걸렸을 때 입양인은 신속하게 필요한 수의학적 치료를 받게 하고 성실하게 그 치료에 임할 것이며 만일 입양동물의 완치가 불가능하고 그 고통이 극심한 경우에는 이를 단체에 통지하고 단체와의 협의 하에 대안을 강구하여야 하며 임의로 처리해서는 안 됩니다. 입양인은 입양동물이 자연사한 경우에도 즉시 이 사실을 단체에 통지할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        5. 입양인은 상시 입양동물에게 입양인의 연락처가 기재된 이름표를 반드시 착용시켜야 하며 만일 입양인의 연락처가 변경되거나 주거지의 변동사항이 있을 시에는 즉시 단체에 이에 대한 정보를 통지할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        6. 입양인은 입양 후 단체에서 시행하는 입양동물의 모니터링을 위한 전화 또는 방문에 응할 것이며 단체가 입양동물의 면회나 사진을 요구할 시 언제든지 이에 협조할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        7. 입양인은 단체의 입양동물 중성화수술 방침에 동의하며, 입양 전에 미리 중성화수술이 시행될 수 없는 경우에는 입양동물의 건강상태가 양호하고 그 연령이 수술하기에 적합한 조건이 갖추어지는 즉시로 중성화수술을 시행하고 이에 대한 사실을 즉시 단체에 통지하며 중성화수술 전이라 할지라도 그 어떠한 경우에도 입양동물을 교배하지 않을 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                        8. 입양인은 개인적인 사유로 파양을 하는 경우에는, 반드시 단체에게 통보해야 하며 임의대로 재입양할 수 없습니다. 또한, 단체에게 입양비 반환을 청구할 수 없습니다. <br>
                        ✔동의합니다. <br>
                        9. 입양인은 입양 후에도, 만일 단체에서 입양인이 입양동물을 돌볼 여건과 환경이 적합하지 않다고 판단하여 입양동물의 반환을 요구하는 경우에는 이에 이의를 제기하지 않고 적극 협조할 의무가 있습니다. <br>
                        ✔동의합니다. <br>
                    </div> <!--div-agreement-->
                    <b>입양인은 이하에 서명함으로써 상기의 조항에 동의하며, 입양인이 상기의 조항을 위반 시에는 단체의 어떠한 처벌조치에도 이의를 제기함이 없이 따를 것을 서약합니다.</b>
                    <br><input type="radio" name="agreement" value="Y" checked required> 상기 내용에 모두 동의합니다. 
                    <input type="radio" name="agreement" value="N"> 동의하지 않습니다.
                    <br><br>
                   
                    <hr><br>
                    <b>개인 정보</b> <br><br>
                        <table class="personal-inform">
                            <tr>
                                <th width="350px">1. 성함</th>
                                <td><input type="text" name="applicantName" required></td>
                            </tr>
                            <tr>
                                <th>2. 연락처</th>
                                <td><input type="text" name="phone" required></td>
                            </tr>
                            <tr>
                                <th>3. 대체 <br> 연락처</th>
                                <td><input type="text" name="subPhone" required></td>
                            </tr>
                            <tr>
                                <th>4. 이메일 <br> 주소</th>
                                <td><input type="email" name="email" style="width: 1100px;" required></td>
                            </tr>
                            <tr>
                                <th>5. 성별</th>
                                <td>
                                    <input type="radio" name="gender" value="M" checked> 남성
                                    <input type="radio" name="gender" value="F"> 여성
                                </td>
                            </tr>
                            <tr>
                                <th>6. 나이</th>
                                <td><input type="number" name="age" style="width: 1100px;" required></td>
                            </tr>
                            <tr>
                                <th>7. 주소</th>
                                <td><textarea name="address" style="width: 1100px;" required></textarea></td>
                            </tr>
                            <tr>
                                <th>8. SNS 주소</th>
                                <td><input type="text" name="sns" required></td>
                            </tr>
                            <tr>
                                <th>9. 직업</th>
                                <td><input type="text" name="job" required></td>
                            </tr>
                            <tr>
                                <th>10. 결혼여부</th>
                                <td>
                                    <input type="radio" name="maritalStatus" value="Y">예
                                    <input type="radio" name="maritalStatus" value="N" checked>아니오
                                </td>
                            </tr>
                        </table>
                        <br>
                        <hr><br>
                    <b> 입양 질문</b> <br><br>
                    <div class="adoption-qudstion">
                        <input type="hidden" name="animalNo" value="<%=a.getAnimalNo()%>">

                        1. 입양을 희망하는 동물의 이름을 적어주세요 <br>
                        <input type="text" name="animalName" style="width:1200px; margin-top: 15px;" value="<%=a.getAnimalName()%>" readonly><br><br><br>

                        2. 입양하기를 희망하는 아이가 없을 경우 앞으로 입양하고자 하는 아이에 대하여 간단히 설명하여 주시기 바랍니다. <br>
                        <textarea name="Q2"></textarea> <br><br><br>

                        3. 입양을 결정하시기까지 얼마나 오랜 시간을 고민하셨나요? <br>
                        <textarea name="Q3"></textarea> <br><br><br>

                        4. 입양을 원하시는 가장 큰 이유는 무엇인가요? <br>
                        <textarea name="Q4"></textarea> <br><br><br>

                        5. 가족 구성원은 몇 명인가요? 구성원을 소개해주세요. <br>
                        <textarea name="Q5"></textarea> <br><br><br>

                        6. 입양결정에 가족 모두 동의하십니까? <br>
                        <textarea name="Q6"></textarea> <br><br><br>

                        7. 키우고 계신 반려동물이 있나요? 있다면 소개해주세요. <br>
                        <textarea name="Q7"></textarea> <br><br><br>

                        8. 키우던 반려동물을 개인 사정으로 포기한 경험이 있으신가요? 이유는 무엇인가요? <br>
                        <textarea name="Q8"></textarea> <br><br><br>

                        9. 주거의 형태는? <br>
                        <textarea name="Q9"></textarea> <br><br><br>

                        10. 정원이 있다면 담이나 울타리가 되어있나요? 되어있다면 높이는 얼마나 되나요? <br>
                        <textarea name="Q10"></textarea> <br><br><br>

                        11. 임대한 주택의 경우 집주인의 동의를 얻으셨나요? <br>
                        <textarea name="Q11"></textarea> <br><br><br>

                        12. 소음이나 위생 등으로 인한 이웃과의 마찰로 입양동물의 양육이 불가능해질 경우 어떻게 하실건가요? <br>
                        <textarea name="Q12"></textarea> <br><br><br>

                        13. 이사 또는 해외로 이주 시 반려동물의 거취문제에 대해 어떻게 생각하나요? <br>
                        <textarea name="Q13"></textarea> <br><br><br>

                        14. 앞으로 결혼, 임신, 출산 등 가족의 변화가 있는 경우 반려동물의 거취문제에 대해 어떻게 생각하나요? <br>
                        <textarea name="Q14"></textarea> <br><br><br>


                        15. 입양 시 유기동물의 구조와 치료, 보호비로 사용되는 일정 금액의 맞음비 10만원을 납부해주셔야 합니다. 동의하십니까? <br>
                            (임시보호 제외) <br>
                        <input type="radio" name="Q15" value="Y" style="margin-top: 15px;" checked>예
                        <input type="radio" name="Q15" value="N">아니오<br><br><br>

                        16. 입양하신 동물은 카라의 중성화수술 시행 방침에 따라, 반드시 중성화수술을 해주셔야 합니다. 이에 동의하십니까? <br>
                        <input type="radio" name="Q16" value="Y" style="margin-top: 15px;" checked>예
                        <input type="radio" name="Q16" value="N">아니오<br><br><br>

                        17. 입양 후 모니터링을 위한 전화연락이나 방문, 인스타그램 가입 및 게시물 공유에 동의하십니까? <br>
                        <input type="radio" name="Q17" value="Y" style="margin-top: 15px;" checked> 예
                        <input type="radio" name="Q17" value="N"> 아니오<br><br><br>

                        18. 동물 관련 활동경험이 있으신가요? 또는 평소 알고 있던 동물단체들이 있다면 아는대로 적어주세요. <br>
                        <textarea name="Q18"></textarea> <br><br><br>

                        19. 길고양이에게 밥을 주신 적이 있으신가요? 유기동물 구조 경험이 있으신가요? <br>
                        <input type="radio" name="Q19" value="Y" style="margin-top: 15px;" checked>예
                        <input type="radio" name="Q19" value="N">아니오<br><br><br>

                        20. 입양희망 동물에 대해 어떻게 알게 되셨나요? (예시 : 네이버블로그, 기사, 페이스북, 트위터, 인스타그램 등) <br>
                        <textarea name="Q20"></textarea> <br><br><br>

                    </div>
         

                    <br><br>
                    <div style="text-align: center;">
                        <button type="submit" id="submit-btn">입양 신청하기</button>
                    </div>

               </form>

            </div><!--content_AR-->
         </div> <!--content-->
         </div> <!--wrap-->
         <br><br>
         <%@include file="../common/footer.jsp" %>
</body>
</html>