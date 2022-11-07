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
<title>펫밀리 : 게시글 수정하기</title>
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


</style>
</head>
<body>
    <%@include file="../common/header.jsp" %>
    <br><br>
    <div class="wrap">
    <div id="content" style="width:1200px; height: 2200px;">
        <div id="content_AR">
            <div id="intro">			
                <h2>봉사하기 : 게시글 수정</h2>
            </div> <!--intro-->
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
            <div id=image-btn style='margin-left: 450px;'>
                <button type="button" class="later">◀</button>
                <button type="button" class="imageView" value=1>●</button>
                <button type="button" class="imageView" value=2>●</button>
                <button type="button" class="imageView" value=3>●</button>
                <button type="button" class="imageView" value=4>●</button>
                <button type="button" class="imageView" value=5>●</button>
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
            <div align="center">
                <form id="adoptionReview-form" enctype="multipart/form-data" action="<%=contextPath %>/update.cm" method="post">
                    <%if(loginUser != null) {%>
                   	 <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">
                   	 <input type="hidden" name = "comNo" value="<%=c.getComNo() %>">
                   	 <input type="hidden" name="comType" value="3"> <!-- 게시글타입 : 3 (봉사하기게시판) -->
                    <%} %>
                    <table>
                        <thead>
                            <tr>
                                <th width="100px">제목</th>
                                <td width="1000px"><input type="text" name="title" value="<%=c.getTitle() %>" style="width: 950px;"></td>
                            </tr>
                            <tr>
                                <th>요약</th>
                                 <td>
                                	<input type="text" name="summary" id="summary" value="<%=c.getSummary() %>" maxlength="100" style="width: 900px;" required>
                                	<span id="count">0</span>/100
                                </td>                          
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <input type="file" name="file1" id="file1" onchange="loadImg(this, 1)">
                                    <input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
                                    <input type="file" name="file3" id="file3" onchange="loadImg(this, 3)">
                                    <input type="file" name="file4" id="file4" onchange="loadImg(this, 4)">
                                    <input type="file" name="file5" id="file5" onchange="loadImg(this, 5)">
                                    <p style="color:red">새로운 사진을 첨부할 경우, 기존의 이미지는 모두 삭제됩니다.</p>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">내용</th>
                            </tr>
                            <tr>
                                <td colspan="2"><textarea name="content" style="width: 1050px; height: 500px;"><%=c.getContent() %></textarea></td>
                            </tr>
                        </tbody>
                    </table>
            		
            		 <script>
                    	$(function(){
                    		$('#summary').keyup(function(){
                    			$('#count').text($(this).val().length);
                    		})
                    	})
                    </script>
                    
                    <br><br>
                    <button type="button" onclick="history.back()"> 뒤로가기 </button>
                    <button type="submit"> 수정하기 </button>
                </form>
            </div>
            
        </div><!--content_AR-->
   </div> <!--content-->
        
        <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
        <%@include file="../common/footer.jsp" %>
</div> <!--wrap-->

</body>
</html>