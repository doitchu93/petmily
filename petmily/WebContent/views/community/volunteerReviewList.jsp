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
<title>펫밀리 : 봉사후기</title>
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
                    <h2>봉사후기</h2>
                    <p>
						“도움이 필요한 곳, 펫밀리 봉사대가 갑니다!” <br>
						전국에는 우리가 잘 알지 못하는 유기동물 사설보호소들이 많습니다. 지자체에서 운영하는 시보호소와는 달리, 사설보호소는 개인의 비정기적인 후원금으로 운영되고 있습니다. <br>
						펫밀리봉사대의 첫 번째 목적은 보호소 환경을 개선하고 개체 수를 감소시켜 보호소의 원활한 운영을 돕거나, 보호소를 폐쇄할 수 있도록 돕는 것입니다. 두 번째 목적은 사설보호소의 존재와 현실을 대중에게 알려 유기동물 문제에 대한 관심을 환기하고 나아가 유기동물의 발생을 막는 것입니다. 
		            </p>
		             
                    <a href="<%= contextPath%>/main.vl?cpage=1"><button id="review-btn">봉사하기</button></a>

                    &nbsp;&nbsp;&nbsp;&nbsp;
                    
					<%if(loginUser != null && !loginUser.getUserClass().equals("P")){ %> 
                    <button type="button" id="intro-button" onclick="writeReview()">봉사후기 작성하기</button>
                    <%}%> 

                </div> <!--intro-->
				<script>
						
					function writeReview(){

							location.href="<%=contextPath%>/reviewForm.vl"
						
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