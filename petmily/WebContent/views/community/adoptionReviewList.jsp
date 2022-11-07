<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.community.model.vo.Community, com.kh.common.model.vo.PageInfo" %>
<%
	ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫밀리 : 입양후기</title>
    <style>
		#content_AR{width: 100%;}
  
        .list-area{
            width: auto;
            margin: auto;
        }
    
 
        #intro{
            padding: 40px;
            background-color: lightgray;
            margin-left : 15px
        }
        #menu-area{
        	margin-left : 40px;
        }
		#intro-button{
			width : 300px;
			background-color: rgb(232, 191, 123);	
			border : 0;
			border-radius : 5px;	
			color : white;
		}
		#review-btn{
			width : 300px;
			background-color: rgb(180, 149, 95);
			border : 0;
			border-radius : 5px;	
			color : white;
		}
		#intro-button:hover, #review-btn:hover{
			background-color: rgb(255, 217, 135);
			color : rgb(155, 128, 82)
		}
		
		.paging-area>button{	
			border : 0;
			border-radius : 5px;	
			color : white;
			background-color: rgb(180, 149, 95);
		}
		.paging-area>button:hover{
			background-color: rgb(232, 191, 123);	
		}
		table{
			float: left;
			height: 400px;
			margin-left : 100px;
			margin-bottom : 45px;
		}
		.img_AR{
		width: 450px; height: 350px;
		padding : 10px
		}
		thead:hover{
		background-color: rgb(255, 217, 135);
		cursor:pointer;
		}


    </style>
</head>
<body>
		<%@include file="../common/header.jsp" %>
		<br><br>
	    <div class="wrap">
        <div id="content" style="width:1200px; height: 1400px;">
            <div id="content_AR">
                <div id="intro">			
                    <h2>입양후기</h2>
                    <p>
						펫밀리를 통해 입양하신 분들은 누구나! 입양후기를 올려주세요. <br>
						가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 <br>
						입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.
		            </p>
		             
                    <a href="<%= contextPath%>/main.ad?cpage=1"><button id="review-btn">입양하기</button></a>

                    &nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <button type="button" id="intro-button" onclick="writeReview()">입양후기 작성하기</button>
                     

                </div> <!--intro-->
				<script>
						
					function writeReview(){
						<%if(loginUser==null){%>
							alert("로그인 후 이용할 수 있는 서비스입니다.");
						<%} else {%>
							location.href="<%=contextPath%>/reviewForm.ad"
						<%}%>				
					} 
					
				</script>	

				<br><br>
                <div class="list-area">
                    
                    <% if(list.isEmpty()){ %>
                    	<h2>조회된 게시글이 없습니다.</h2>
                    <%} else {%>
                    	
                    	<% for(Community c : list) { %>	
						<table style="float:left">
						   <thead>
							   <tr>
								   <td style="width: 450px; height: 350px;">
									   <img class="img_AR" src = "<%=c.getTitleImg() %>">
									   <input type="hidden" id="cno" value="<%=c.getComNo()%>">
									   <input type="hidden" id="type" value="<%=c.getType()%>">
								   </td>
							   </tr>
						   </thead>
						   <tbody>
							   <tr>
								   <th>제목 | <%=c.getTitle() %></th>
							   </tr>
							   <tr>
								   <td>No.<%=c.getComNo() %> | <%=c.getUserNo() %> | <%=c.getCreateDate() %> | 👍 <%=c.getLikeCount() %> | 👁 <%=c.getViewCount() %> |</td>
							   </tr>
							   <tr>
								   <td>
										<%=c.getSummary() %>
								   </td>
							   </tr>
						   </tbody>
					   </table>
						<%} %>
					<%} %>	
          	   </div><!--list-area-->     
          	 <script>
				$(function(){
					$("thead").click(function(){
		
						var cno = $(this).children().children().children("input#cno").attr("value");
						var type = $(this).children().children().children("input#type").attr("value");
		
						// http://localhost:8002/SemiProject/detail.an?ano=15
		
						location.href="<%=contextPath%>/detail.cm?cno="+cno +"&type="+type;
					})
				})
			</script>
       	 </div><!--content_AR-->
            
       </div> <!--content-->
       
				<br><hr><br>
          	     <div align="center" class="paging-area">
   		    	  <% if(currentPage != 1){ %>
                   <button onclick="location.href='<%=contextPath%>/reviewlist.ad?cpage=<%=currentPage -1 %>'">&lt;</button>
               	  <%} %>
                  
		       	  <% for(int i = startPage; i <= endPage; i++) { %>
		            <% if(i != currentPage){ %>
		                <button onclick="location.href='<%=contextPath%>/reviewlist.ad?cpage=<%=i %>'"><%=i%></button>
		            <%} else { %>
		                <button disabled><%=i %></button>
		            <%} %>
		       	  <%} %>
		       	  
		        <% if(currentPage != maxPage){ %>
		            <button onclick="location.href='<%=contextPath%>/reviewlist.ad?cpage=<%=currentPage +1 %>'"> &gt; </button>
		        <%} %>
                </div> <!--페이징-->
                
                
            <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
			<%@include file="../common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</body>
</html>