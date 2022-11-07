<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.adoption.model.vo.Animal, com.kh.common.model.vo.Attachment" %>    
<%
	Animal a = (Animal)request.getAttribute("a");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫밀리:보호동물 수정</title>
<style>
#content_AR{width: 100%;}
#intro{
    padding: 10px;
    background-color: lightgray;
}
    
.img_AR{
	width : 600px; height : 600px; padding : 10px;
}
.slide-container {
  width: 600px;
  height:600px;
}
.slide-box {
  width: 100%;
  float: left;
}
.slide-box img {
  width: 100%;
} 
#animal-information{
	width : 1200px;
	align : center;
}
#animal-Information-1, #animal-Information-2{
	height : 600px;
	width : 600px;
	float : left;
}
#image-btn > button{
	border : 0;
	outline : 0;
	background-color : white;
	color : rgb(232,191,123);
}
#image-btn > button:hover{
	color : rgb(155,128,82);
}
input[type='radio']:checked{
	accent-color : rgb(155,128,82);
}

</style>
</head>
<body>
    <%@include file="../common/header.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_AR">
                <div id="content-area">
                    
                    <div id="intro">
                        <h2>보호동물 수정</h2>
                    </div> <!--intro-->
                    
                    <br><br>
                    <form id="animal-Form" enctype="multipart/form-data" action="<%=contextPath %>/update.an" method="post">
                    <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                    <input type="hidden" name="animalNo" value="<%=a.getAnimalNo()%>">
                    <div id=image-btn style='margin-left:200px'>
	                   	<button type="button" class="later">◀</button>
	                   	<button type="button" class="imageView" value=1>●</button>
	                   	<button type="button" class="imageView" value=2>●</button>
	                   	<button type="button" class="imageView" value=3>●</button>
	                   	<button type="button" class="imageView" value=4>●</button>
	                   	<button type="button" class="imageView" value=5>●</button>
	                   	<button type="button" class="next">▶</button>
                    </div>
                    <div id="animal-Information">
                   	<div id="animal-Information-1" style="overflow: hidden">
                           <div class="slide-container">
                               <div class="slide-box">
                                    <img class="img_AR" id="titleImg" src="<%=contextPath%>/<%=list.get(0).getFilePath()+list.get(0).getChangeName()%>">
	     						</div>
	     						<% for(int i = 1; i < list.size(); i++){ %>	     						
	                               <div class="slide-box">
	                                   <img class="img_AR" id="contentImg<%=i%>" src="<%=contextPath%>/<%=list.get(i).getFilePath()+list.get(i).getChangeName()%>">
	                               </div>
	     						<%} %>
                           </div>
                   	</div>

                   	
                   	<!--  사진 미리보기  -->
                   	<script>
                   		var nowImg = 6;
                   		
                   		$('.next').on('click', function(){
                   			
                   			if(nowImg <= 30){                   				
	                   			$('.slide-container').css('transform','translateY(-' + nowImg + '00px)');
	                   			nowImg+=6
                   			}
                   		});
    					               		
                   		$('.later').on('click', function(){
                   			if(nowImg >= 6){                            				
                   				nowImg -= 6;
                   				$('.slide-container').css('transform','translateY(-' + nowImg + '00px)');
                   				return;
                   			}
                   			
                   		});
                   		
                   		$(".imageView").on('click', function(){
                   			$('.slide-container').css('transform', 'translateY(-' + (this.value-1)*6 + '00px)')
                   		})
                   		
                   	</script>
                   	
 				<script>
                
                	function loadImg(inputFile, num){
               		  if (inputFile.files.length == 1) {
               			    var reader = new FileReader();
               				reader.readAsDataURL(inputFile.files[0]);
               			    reader.onload = function(e) {
               			    	
    							switch(num){
								case 1 : $("#titleImg").attr("src", e.target.result); break;
								case 2 : $("#contentImg1").attr("src", e.target.result); break;
								case 3 : $("#contentImg2").attr("src", e.target.result); break;
								case 4 : $("#contentImg3").attr("src", e.target.result); break;
								case 5 : $("#contentImg4").attr("src", e.target.result); break;
								};
							};
						}
						else{
							switch(num){
									case 1 : $("#titleImg").attr("src", "<%=contextPath%>/resources/common/noImages.png"); break;
									case 2 : $("#contentImg1").attr("src", "<%=contextPath%>/resources/common/noImages.png"); break;
									case 3 : $("#contentImg2").attr("src", "<%=contextPath%>/resources/common/noImages.png"); break;
									case 4 : $("#contentImg3").attr("src", "<%=contextPath%>/resources/common/noImages.png"); break;
									case 5 : $("#contentImg4").attr("src", "<%=contextPath%>/resources/common/noImages.png"); break;
							};
						};
                	}
                </script>
                   	
                    <div id="animal-Infomation-2">	
                    <table style="height:600px;">
                       
                        <tr>
                            <th width="80px">종 </th>
                            <td width="500px">                            	
                                <input type="radio" value=1 name="categoryNo"> 개
                                <input type="radio" value=2 name="categoryNo"> 고양이
                                <input type="radio" value=3 name="categoryNo"> 기타
                            </td>
                        </tr>
                        <tr>
                            <th> 이름 </th>
                            <td>
                                <input type="text" name="animalName" value="<%=a.getAnimalName() %>" required>
                            </td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td>
                                <input type="radio" value="M" name="gender"> 수컷
                                <input type="radio" value="F" name="gender"> 암컷
                            </td>
                        </tr>
                        <tr>
                            <th>중성화</th>
                            <td>
                                <input type="radio" value="Y" name="neuturalization"> 예
                                <input type="radio" value="N" name="neuturalization"> 아니오
                            </td>
                        </tr>
                        <tr>
                            <th>추정나이</th>
                            <td>
                            	<input type="number" name="animalAge" value="<%=a.getAnimalAge() %>" required style="width:100px"> 살
                            </td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td>
                            	<input type="text" name="weight" required style="width:250px"
                            	placeholder="숫자만 입력해주세요. 예시)3.5" value="<%=a.getWeight()%>"> kg
                            </td>
                        </tr>
                        <tr>
                            <th>친화도</th>
                            <td style="width:200px">
                                <input type="number" name="friendly" required min="0" max="10" style="width:100px" value="<%=a.getFriendly()%>">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            	<b>활발함</b>  <input type="number" name="active" required min="0" max="10" style="width:100px" value="<%=a.getActive()%>">
                            </td>
                        </tr>
                        <tr>
                            <th>사진첨부</th>
                            <td>
                            	<p style="color:red">새로운 사진을 첨부할 경우, 기존의 이미지는 모두 삭제됩니다.</p>
                            	<input type="file" name="file1" id="file1" onchange="loadImg(this, 1)">
                            	<input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
                            	<input type="file" name="file3" id="file3" onchange="loadImg(this, 3)">
                            	<input type="file" name="file4" id="file4" onchange="loadImg(this, 4)">
                            	<input type="file" name="file5" id="file5" onchange="loadImg(this, 5)">
	                            
	             	            <%for(int i = 0; i < list.size(); i++){ %>	
                            		<input type="hidden" name="originFileNo<%=i+1 %>" value="<%=list.get(i).getFileNo()%>">
                            		<input type="hidden" name="originFileName<%=i+1 %>" value="<%=list.get(i).getChangeName()%>">
                            	<%} %>
                            </td>
                        </tr>
                        <tr>
                            <th>입양여부</th>
                            <td>
                                <input type="radio" value="Y" name=adopted> 입양완료
                                <input type="radio" value="N" name=adopted> 보호중
                            </td>
                        </tr>
                    </table>
                    </div> <!-- 폼 우측  --> 
                    </div> <!-- 폼상단전체 -->
                    <br><br><br>
                    <table>
                    	<tr>
                    		<th>상세설명</th>          
                    	</tr>
                    	<tr>
                    		<td>
                    			<textarea name="description" style="width:1200px; height:200px" required> <%=a.getDescription() %> </textarea>
                    		</td>          
                    	</tr>
                    </table>
                    <br><br>
                    
                    <div id="form-btn" align=center>
	                    <button type="button" onclick="history.back();">수정취소</button>
	                    <button type="submit">수정하기</button>
                    </div>
                    
                </form>
                
          	        <script>
                		switch("<%=a.getCategoryNo()%>"){
	                		case "개" : $('input:radio[name="categoryNo"]:input[value="1"]').prop("checked", true); break;
	                		case "고양이" : $('input:radio[name="categoryNo"]:input[value="2"]').prop("checked", true); break;
	                		case "기타" : $('input:radio[name="categoryNo"]:input[value="3"]').prop("checked", true); break;
                		} 

           				 $('input:radio[name="gender"]:input[value="<%=a.getGender()%>"]').prop("checked", true);
           				 
           				 $('input:radio[name="neuturalization"]:input[value="<%=a.getNeutralization()%>"]').prop("checked", true);
           				 
           				 $('input:radio[name="adopted"]:input[value="<%=a.getAdopted()%>"]').prop("checked", true);
	                	                             			
                	</script>
          	

            	</div><!--content-area-->
            
            
       	      </div><!--content2-->
         </div> <!--content-->
            
            <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
			<%@include file="../common/footer.jsp" %>
    </div> <!--wrap-->

</body>
</html>