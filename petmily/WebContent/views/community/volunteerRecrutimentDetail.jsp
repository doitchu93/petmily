<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.community.model.vo.Community, com.kh.common.model.vo.Attachment" %>

<%
	Community c = (Community)request.getAttribute("c");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫밀리 : 봉사하기</title>
<style>
    #content_AR{width: 100%;}

    #intro{
        padding: 40px;
        background-color: lightgray;
        margin-left : 15px
    }
    .img_AR{
        height: 1100px;
        width: 1100px;
    }
    #review-img{
        height: 1100px;
        width: 1100px;
    }
    .slide-box{
        float: left;
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
    #review-content{
	    background-color : rgb(255, 217, 135);
	    border-radius : 5px;	
	    width : 1040px;
	    margin-left : 50px;
	    padding : 20px
    }
	#back-btn{
		width : 200px;
		background-color: rgb(232, 191, 123);	
		border : 0;
		border-radius : 5px;	
		color : white;
	}
	#back-btn:hover{
		background-color: rgb(255, 217, 135);

	}
	#like-btn{
		border : 0;
		outline : 0;
		background-color : rgba(255, 255, 255, 0);
		CURSOR:hand;
		font-size : xx-large;
	}


</style>
</head>
<body>
    <%@include file="../common/header.jsp" %>
    <br><br>
    <div class="wrap">
    <div id="content" style="width:1200px; height: 2200px;">
        <div id="content_AR">
            <div id="intro">			
                <h2>봉사하기</h2>
            </div> <!--intro-->
            <br><br>
            	<div style="width:1100px; margin-left : 50px">
	         	<% if(loginUser!=null && ((loginUser.getUserNickname().equals(c.getUserNo())) || loginUser.getUserClass().equals("A"))) { %>                  
					<a href="<%=contextPath %>/updateForm.cm?cno=<%=c.getComNo()%>&type=<%=c.getType() %>"><button>수정하기</button></a>
					 <button id="delete-btn" onclick="deleteOnClick()">삭제하기</button>					
            	</div>
				<%} %>
				<script>
					function deleteOnClick() {
						if(confirm("정말 삭제하시겠습니까?")){
							location.href="<%=contextPath%>/delete.cm?cno=<%=c.getComNo() %>&type=<%=c.getType() %>";
						}
					}
				</script>
            <hr>
            <div style="margin-left:50px;padding:10px">
	            <table>
	            	<tr>
	            		<th width="800px">
	            			<h3><%=c.getTitle() %></h3>
	            		<th>
	            		<td>
	            			No.<%=c.getComNo() %> | <%=c.getUserNo() %> | 👍 <%=c.getLikeCount() %> | 👁 <%=c.getViewCount() %> |
	            		</td>
	            	</tr>
	            </table>
            </div>        
            <hr>

			<br><br>
            <div id="review-img"style="overflow: hidden">
                <div class="slide-container" style="margin-left: 40px;">
                    <div class="slide-box">
                         <img class="img_AR" id="titleImg" src="<%=contextPath%>/<%=list.get(0).getFilePath()+list.get(0).getChangeName()%>">
                      </div>
					<% for(int i = 1; i < list.size(); i++){ %>	     						
                       <div class="slide-box">
                           <img class="img_AR" id="contentImg<%=i%>" src="<%=contextPath%>/<%=list.get(i).getFilePath()+list.get(i).getChangeName()%>">
                       </div>
					<%} %>
                </div>
            </div> <!--review-img : 이미지 미리보기-->         
            <!--이미지 버튼-->
                <div id=image-btn style='margin-left:470px'>
                  	<button type="button" class="later">◀</button>
                  	<%for(int i = 1; i <= list.size(); i++) {%>
                  	<button type="button" class="imageView" value=<%= i %>>●</button>			                   		
                  	<%} %>
                  	<button type="button" class="next">▶</button>
                  </div>
             <br><br>
            <!--  사진 미리보기  -->
            <script>
            var nowImg = 11;
            
            $('.next').on('click', function(){
                
                if(nowImg <= 55){                   				
                    $('.slide-container').css('transform','translateY(-' + nowImg + '00px)');
                    nowImg+=11
                }
            });
                                
            $('.later').on('click', function(){
                if(nowImg >= 11){                            				
                    nowImg -= 11;
                    $('.slide-container').css('transform','translateY(-' + nowImg + '00px)');
                    return;
                }
                
            });
            
            $(".imageView").on('click', function(){
                $('.slide-container').css('transform', 'translateY(-' + (this.value-1)*11 + '00px)')
            })
            
        </script>
        
  		<script>
			
			function likeOnclick(){	
				if(confirm("좋아요?")){
					location.href="<%=contextPath%>/updateLike.cm?cno=<%=c.getComNo() %>&type=<%=c.getType() %>";
				}	
			}

		</script>
		
        <div id=review-content>
        	<%=c.getContent() %>
        </div>
            <br>
            <hr>
            <div align="center" style="width : 1000px">
					<button type="button" id="back-btn" onclick="goList()">목록으로</button> | 
					<button id="like-btn" title="좋아요" onclick="likeOnclick();">👍</button> <b><%=c.getLikeCount() %></b>
            </div>
            <script>
            	function goList(){
            		location.href="<%=contextPath%>/main.vl?cpage=1";
            	}
            </script>
		            
        </div><!--content_AR-->
   </div> <!--content-->
        
        <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
        <%@include file="../common/footer.jsp" %>
</div> <!--wrap-->

</body>
</html>