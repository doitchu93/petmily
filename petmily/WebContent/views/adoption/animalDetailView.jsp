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
<title>동물 상세보기</title>
<style>
		#content_AR{width: 100%;}
		#intro{
		    padding: 40px;
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
			margin-right : 0px;
			margin-left : 10px;
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
		
		#inform-button{
			border:0;
			outline:0;
			background-color:white;
			CURSOR:hand;
		}
		#like-btn, #likeOff-btn{
			border : 0;
			outline : 0;
			background-color : rgba(255, 255, 255, 0);
			CURSOR:hand;
		}
		th, td{
			text-align: left;
		}

</style>
</head>
<body>
    <%@include file="../common/header.jsp" %>
    	<%if(loginUser != null) {%>
    		<input type="hidden" id="userNo" value="<%=loginUser.getUserNo()%>">
	    <%} %>
	    
		<br><br>
	    <div class="wrap" style="width:1300px">
        <div id="content">
            <div id="content_AR">
                <div id="content-area">
                
                <div id="intro">
                    <h2>동물 상세보기</h2>
                </div> <!--intro-->
                
                <br><br>
                    <div id="animal-Information">
                   	<div id="animal-Information-1" style="overflow: hidden; width: 600px;">
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
                   	
					<script>
						
					function deleteOnClick() {
						if(confirm("정말 삭제하시겠습니까?")){
							location.href="<%=contextPath%>/delete.an?ano=<%=a.getAnimalNo()%>";
						}
					}
					
					</script>

					 <script>
						<%if(loginUser!=null){%>
						$.ajax({
							url : "getLike.an",
							data : {animalNo : <%=a.getAnimalNo()%>},
							type : "get",
							success : function(result){
								for(var i = 0; i < result.length; i++){
									if(result[i].userNo == <%=loginUser.getUserNo()%>){
										$("#like-btn").attr('id', 'likeOff-btn');
										$("#likeOff-btn").removeAttr("onclick");
										$("#likeOff-btn").attr('onclick', 'likeOffclick();');
										$("#likeOff-btn").attr('title', '관심등록 해제');
										$("#likeOff-btn").html("&#128152;")
									}
								}
							},
							error : function(){
								alert("관심유저 불러오기 실패");
							}
								
						});
						<%}%>
					</script>
					<script>
						
						function likeOnclick(){
							<%if(loginUser==null){%>
								alert("로그인 후 이용할 수 있는 서비스입니다.");
							<%} else {%>
								if(confirm("관심동물 목록에 추가하시겠습니까?")){
									location.href="<%=contextPath%>/like.an?ano=<%=a.getAnimalNo()%>&userNo=<%=loginUser.getUserNo()%>"
								}
							<%}%>				
						} 
						
							<%if(loginUser!=null){%>
							function likeOffclick(){
								if(confirm("관심동물 목록에서 삭제하시겠습니까?")){
									location.href="<%=contextPath%>/unlike.an?ano=<%=a.getAnimalNo()%>&userNo=<%=loginUser.getUserNo()%>"
								}
	
							}
							<%} %>

					</script>					

                    <div id="animal-Infomation-2">	
                    <table style="height:600px; align:left">
                    	<tr>
                    		<td>No.<%=a.getAnimalNo() %></td>
                    		 <% if(loginUser!=null && (loginUser.getUserNo() == a.getUserNo() || loginUser.getUserClass().equals("A"))) { %>
	                    		<td align="right">
									<a href="<%=contextPath %>/updateForm.an?ano=<%=a.getAnimalNo()%>"><button>수정하기</button></a>
									 <button id="delete-btn" onclick="deleteOnClick()">삭제하기</button>
								</td>
							<%} %>
                    	</tr>
           			    <tr>
							<td style="font-size:xxx-large;"><button type="button" id="like-btn" title="관심등록" onclick="likeOnclick();">❤</button></td>
							<th style="font-size:xxx-large;" id="animalNo"><%= a.getAnimalName() %></th>
                        </tr>
                        <tr>
                            <th width="80px">종 </th>
                            <td width="400px"> | <%=a.getCategoryNo() %></td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td> | 
                            	<%if(a.getGender().equals("M")){ %>
                            		수컷
                            	<%} else {%>
                            		암컷
                            	<%} %>
                            </td>
                        </tr>
                        <tr>
                            <th>중성화</th>
                            <td> | 
                            	<%if(a.getNeutralization().equals("Y")){ %>
                            		중성화(O)
                            	<%} else {%>
                            		중성화(X)
                            	<%} %>
                            
                            </td>
                        </tr>
                        <tr>
                            <th>추정나이</th>
                            <td> | <%=a.getAnimalAge() %> 살</td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td> | <%=a.getWeight() %> kg </td>
                        </tr>
						
                        <tr>
                            <th>친화도</th>
                            <td style="width:200px"> |
                            	<input type="button" id="inform-button" value="&#128226;"
                            		   title="친화도가 높을수록 사람을 좋아하고 잘 따릅니다">
                            	<progress value='<%=a.getFriendly() %>' max="10" style="width:80px"></progress>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                            	<b>활발함</b> |                             	
                            	<input type="button" id="inform-button" value="&#128226;"
                            		   title="활발함이 높을수록 주변 상황에 긍정적으로 빠르게 반응합니다">
                            	<progress value='<%=a.getActive() %>' max="10" style="width:80px"></progress>
                            </td>
                        </tr>
                        <tr>
                            <th>상세설명</th>
                            <th style="color:red;">
                                <% if(a.getAdopted().equals("Y")){ %>
                                	입양완료
                                <%}%>                         
                            </th>
                        </tr>
                        <tr>
                    		<td colspan="2" style="width:480px; height:270px; background-color:rgb(255,217,135); border:0px; vertical-align:top">              		
                    			<%=a.getDescription() %>
                    		</td>          
                        </tr>
                    </table>
                    <table>
                    	<tr>
                    		<td>
                    	    <div id=image-btn style='margin-left:200px'>
			                   	<button type="button" class="later">◀</button>
			                   	<%for(int i = 1; i <= list.size(); i++) {%>
			                   	<button type="button" class="imageView" value=<%= i %>>●</button>			                   		
			                   	<%} %>
			                   	<button type="button" class="next">▶</button>
		                    </div>
		                    </td>
                    	</tr>
                    </table>
                                       	<!--  사진 미리보기  -->
                   	<script>
                   		var nowImg = 6;
                   		
                   		$('.next').on('click', function(){
                   			
                   			if(nowImg <= 6*<%=(list.size()-1)%>){                   				
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
                   	
        
                    </div> <!-- 폼 우측  --> 
                    </div> <!-- 폼상단전체 -->

                    <br><br><br><br>
                    
                    <div id="form-btn" align=center>
	                    <button type="button" onclick="history.back();">뒤로가기</button>
	              		<% if(a.getAdopted().equals("N")){ %>
	              			<a href="<%=contextPath%>/application.ad?ano=<%=a.getAnimalNo()%>"><button type="button">입양 신청하기</button></a>                	
	                    <%} %>
                    </div>
                    


            	</div><!--content-area-->
            
            
       	      </div><!--content2-->
         </div> <!--content-->
            
            <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
			<%@include file="../common/footer.jsp" %>
    </div> <!--wrap-->

</body>
</html>