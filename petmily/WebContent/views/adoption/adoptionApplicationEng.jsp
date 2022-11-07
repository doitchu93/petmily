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
<title>Adoption Application</title>
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
            width: 1200px;
            height: 70px;
        }
        td>input[type=text] {
            width: 1100px;
        }
        textarea {
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
                <a href="<%=contextPath%>/application.ad?ano=<%=a.getAnimalNo()%>">
                	<input type="button" value="KOR" id="language-btn" style="background-color: rgb(232,191,123);">
                </a>
                <button type="button" id="language-btn" disabled style="background-color: rgb(180, 149, 95);">ENG</button>
                <div id="intro" style="text-align: center;">
                    <br><br>
                    <h1>ADOPTION APPLICATION</h1>
                    <p>
                        <br>
                        Dont' Buy, Adopt!<br>

                    </p>
                    <br><br>
                </div> <!--intro-->  
                <br><br> 
                <p style="text-align:center"> <b>Adoption Application</b></p>
                <hr>

               <form action="<%=contextPath %>/checkApplication.ad" method="post">
               		<input type="hidden" name="categoryNo" value="900">
                    <div id="agreement-area">
                        
                        1. I (hereafter referred to as 'Adopter') agree to adopt a companion animal (hereafter referred to as “Adopted Animal”) through PETMILY (hereafter referred to as the “Organization”) and provide the best environment and care of which I am capable as a responsible guardian until the natural death of the Adopted Animal. <br>
                        2. If the Adopted Animal is transferred, sold, stolen, or lost through the intentional or unintentional abuse or neglect by the Adopter or any relevant third parties, including family members, the Adopter agrees not to contest any civil or criminal penalties brought forth by the Organization. In the event that the Adopted Animal is transferred, sold, stolen, or lost, the Adopter agrees that the Adopter must notify the Organization immediately and cooperate fully to reclaim the Adopted Animal. <br>
                        3. The Adopter agrees to provide all necessary welfare for the Adopted Animal, including the provision of good quality feed and clean water, suitable and appropriate exercise, vaccination against diseases, and regular health checkups. <br>
                        4. Should the Adopted Animal fall ill, the Adopter will promptly arrange for veterinary treatment and provide other necessary care. If the Adopted Animal cannot be cured and its suffering is severe, the Adopter agrees not to act on their own accord but to notify and discuss alternative options with the Organization. The Adopter agrees to notify the Organization immediately even if the Adopted Animal dies of natural causes. <br>
                        5. The Adopted Animal must, at all times, wear a name badge which includes the contact information of the Adopter. Furthermore, the Adopter agrees to notify the Organization immediately of any changes in contact information or place of residence. <br>
                        6. For the purposes of the Organization monitoring the Adopted Animal, the Adopter agrees to receive calls and/or visits from the Organization, and to cooperate with requests for visits or photographs of the Adopted Animal. <br>
                        7. The Adopter agrees to the neutering policy of the Organization. If the Adopted Animal cannot be neutered prior to adoption, the Adopter will arrange for the Adopted Animal to be neutered as soon as the Adopted Animal is in good health and of an appropriate age for the surgery. The Adopter agrees to notify the Organization of the surgery. The Adopter agrees that the Adopted Animal will not be used for breeding under any circumstance prior to the surgery. <br>
                        8. Should the Adopter be unable to continue caring for the Adopted Animal for personal reasons, the Adopter will notify the Organization and will not arrange for re-adoption at their own discretion. Furthermore, the Adopter will not request a refund of the adoption fee. <br>
                        9. Should the Organization find that the care and environment provided to the Adopted Animal by the Adopter is unsuitable at any time after the adoption, the Adopter agrees to return the Adopted Animal to the Organization, and to cooperate fully without objections. <br>

                    </div> <!--div-agreement-->
                    <b>The Adopter agrees to the above clauses, and in the event that the Adopter violates any of the above provisions, the Adopter pledges to cooperate with any consequent punitive action taken by the Organization.</b>
                    <br><input type="radio" name="agreement" value="Y" checked required> I agree to all of the above. 
                    <input type="radio" name="agreement" value="N"> disagree
                    <br><br>
                    <hr><br>
                    <b>PERSONAL INFORMATION</b> <br><br>
                        <table class="personal-inform">
                            <tr>
                                <th width="300px">1. Name</th>
                                <td><input type="text" name="applicantName" required></td>
                            </tr>
                            <tr>
                                <th>2. Phone number</th>
                                <td><input type="text" name="phone" required></td>
                            </tr>
                            <tr>
                                <th>3. Alternative Phone number</th>
                                <td><input type="text" name="subPhone" required></td>
                            </tr>
                            <tr>
                                <th>4. Email</th>
                                <td><input type="email" name="email" style="width: 1100px;" required></td>
                            </tr>
                            <tr>
                                <th>5. Gender</th>
                                <td>
                                    <input type="radio" name="gender" value="M" checked> Male
                                    <input type="radio" name="gender" value="F"> Female
                                </td>
                            </tr>
                            <tr>
                                <th>6. Age</th>
                                <td><input type="number" name="age" style="width: 1100px;" required></td>
                            </tr>
                            <tr>
                                <th>7. Home Address</th>
                                <td><textarea name="address" style="width: 1100px;" required></textarea></td>                     
                            </tr>
                            <tr>
                                <th>8. SNS</th>
                                <td><input type="text" name="sns" required></td>
                            </tr>
                            <tr>
                                <th>9. Occupation</th>
                                <td><input type="text" name="job" required></td>
                            </tr>
                            <tr>
                                <th>10. Marital Status</th>
                                <td>
                                    <input type="radio" name="maritalStatus" value="Y">Yes
                                    <input type="radio" name="maritalStatus" value="N" checked>No
                                </td>
                            </tr>
                        </table>
                        <br>
                        <hr><br>
                    <b> QUESTION</b> <br><br>
                    <div class="adoption-qudstion">
                        <input type="hidden" name="animalNo" value="<%=a.getAnimalNo()%>">

                        1. Name of the pet you'd like to adopt <br>
                        <input type="text" name="animalName" value="<%=a.getAnimalName()%>" readonly style="width:1200px; margin-top: 15px;"><br><br><br>

                        2. If you don't have a specific pet in mind for adoption, please provide a brief description of the kind of pet you are hoping for <br>
                        <textarea name="Q2"></textarea> <br><br><br>

                        3. Why do you wish to adopt a pet? <br>
                        <textarea name="Q3"></textarea> <br><br><br>

                        4. Please provide a brief introduction of any people (or pets) who live with you. <br>
                        <textarea name="Q4"></textarea> <br><br><br>

                        5. Do the people who live with you agree with your decision to adopt a pet? <br>
                        <textarea name="Q5"></textarea> <br><br><br>

                        6. Have you ever had a pet before? <br>
                        <textarea name="Q6"></textarea> <br><br><br>

                        7. What kind of pet did you have? <br>
                        <textarea name="Q7"></textarea> <br><br><br>

                        8. What happened to the pet? <br>
                        <textarea name="Q8"></textarea> <br><br><br>

                        9. What kind of building do you live in? <br>
                        <textarea name="Q9"></textarea> <br><br><br>

                        10. If you live in rented housing, has the landlord provided permission for a pet? <br>
                        <textarea name="Q10"></textarea> <br><br><br>

                        11. What are your plans for a pet in the event that you move house or move overseas? <br>
                        <textarea name="Q11"></textarea> <br><br><br>

                        12. What are your plans for a pet in the event of family changes such as marriage, pregnancy, or childbirth? <br>
                        <textarea name="Q12"></textarea> <br><br><br>

                        13. At the time of adoption, adopters are required to pay 70,000 KRW. This fee goes towards the costs of rescue, treatment and housing of homeless animals. <br> (Foster carers are exempt.) Do you agree to this payment? <br>
                        <textarea name="Q13"></textarea> <br><br><br>

                        14. PETMILY requires that all adopted pets be neutered. Do you agree to arrange and pay for this procedure? <br>
                        <textarea name="Q14"></textarea> <br><br><br>

                        15. Have you worked with any animal welfare related organizations? Please provide the names of any such organizations you know of. <br>
                        <textarea name="Q15"></textarea> <br><br><br>
  						
  						
                    </div>
                    <br><br>  
                    <div style="text-align: center;">
                        <button type="submit" id="submit-btn">SUBMIT</button>
                    </div>

               </form>

            </div><!--content_AR-->
            
         </div> <!--content-->
         </div> <!--wrap-->
         <br><br>
         <%@include file="../common/footer.jsp" %>
</body>
</html>