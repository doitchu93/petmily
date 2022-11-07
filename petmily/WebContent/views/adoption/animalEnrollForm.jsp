<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫밀리:보호동물 등록</title>
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
	margin-left : 20px;
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
                        <h2>보호동물 등록</h2>
                    </div> <!--intro-->
                    
                    <br><br>
                    <form id="animal-Form" enctype="multipart/form-data" action="<%=contextPath %>/insert.an" method="post">
                    <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
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
                                    <img class="img_AR" id="titleImg" src="<%=contextPath%>/resources/common/noImages.png">
	     						</div>
                               <div class="slide-box">
                                   <img class="img_AR" id="contentImg1" src="<%=contextPath%>/resources/common/noImages.png">
                               </div>
                               <div class="slide-box">
                                   <img class="img_AR" id="contentImg2" src="<%=contextPath%>/resources/common/noImages.png">
                               </div>
                               <div class="slide-box">
                                   <img class="img_AR" id="contentImg3" src="<%=contextPath%>/resources/common/noImages.png">
                               </div>
                               <div class="slide-box">
                                   <img class="img_AR" id="contentImg4" src="<%=contextPath%>/resources/common/noImages.png">
                               </div>
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
                                <input type="radio" value=1 name="categoryNo" checked> 개
                                <input type="radio" value=2 name="categoryNo"> 고양이
                                <input type="radio" value=3 name="categoryNo"> 기타
                            </td>
                        </tr>
                        <tr>
                            <th> 이름 </th>
                            <td>
                                <input type="text" name="animalName" required>
                            </td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td>
                                <input type="radio" value="M" name="gender" checked> 수컷
                                <input type="radio" value="F" name="gender"> 암컷
                            </td>
                        </tr>
                        <tr>
                            <th>중성화</th>
                            <td>
                                <input type="radio" value="Y" name="neuturalization" checked> 예
                                <input type="radio" value="N" name="neuturalization"> 아니오
                            </td>
                        </tr>
                        <tr>
                            <th>추정나이</th>
                            <td>
                            	<input type="number" name="animalAge" required style="width:100px"> 살
                            </td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td>
                            	<input type="text" name="weight" required style="width:250px"
                            	placeholder="숫자만 입력해주세요. 예시)3.5"> kg
                            </td>
                        </tr>
                        <tr>
                            <th>친화도</th>
                            <td style="width:200px">
                                <input type="number" name="friendly" required min="0" max="10" style="width:100px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            	<b>활발함</b>  <input type="number" name="active" required min="0" max="10" style="width:100px">
                            </td>
                        </tr>
                        <tr>
                            <th>사진첨부</th>
                            <td>
                            	<input type="file" name="file1" id="file1" required onchange="loadImg(this, 1)">
                            	<input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
                            	<input type="file" name="file3" id="file3" onchange="loadImg(this, 3)">
                            	<input type="file" name="file4" id="file4" onchange="loadImg(this, 4)">
                            	<input type="file" name="file5" id="file5" onchange="loadImg(this, 5)">
                            </td>
                        </tr>
                        <tr>
                            <th>입양여부</th>
                            <td>
                                <input type="radio" value="Y" name=adopted onclick="return(false)"> 입양완료
                                <input type="radio" value="N" name=adopted checked> 보호중
                            </td>
                        </tr>
                    </table>
                    </div> <!-- 폼 우측  --> 
                    </div> <!-- 폼상단전체 -->
                    <br><br><br>
                    <table style="margin-left:10px">
                    	<tr>
                    		<th>상세설명</th>          
                    	</tr>
                    	<tr>
                    		<td>
                    			<textarea name="description" style="width:1200px; height:200px" required></textarea>
                    		</td>          
                    	</tr>
                    </table>
                    <br><br>
                    
                    <div id="form-btn" align=center>
	                    <button type="button" onclick="history.back();">작성취소</button>
	                    <button type="submit">등록하기</button>
                    </div>
                    
                </form>
          	

            	</div><!--content-area-->
            
            
       	      </div><!--content2-->
         </div> <!--content-->
            
            <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
            <%@include file="../common/footer.jsp" %>
    </div> <!--wrap-->

</body>
</html>