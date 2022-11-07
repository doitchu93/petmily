<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.adoption.model.vo.*, java.util.ArrayList, com.kh.common.model.vo.PageInfo" %>
<%
	ArrayList<Animal> list = (ArrayList<Animal>)request.getAttribute("list");
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
<title>입양하기</title>
    <style>
		#content_AR{width: 100%;}
        .img_AR{
            width: 320px;
            height: 320px;
            padding: 10px;
        }
    
        .outer{
            background-color: coral;
            color : white;
            width: 1000px;
            height: 1000px;
            margin: auto;
            margin-top: 50px;
        }
    
        .list-area{
            width: auto;
            margin: auto;
        }
    
        .thumbnail{
            width: 330px;
            display: inline-block;
            margin: 13px;
        }
    
        .thumbnail>img:hover{
            cursor:pointer;
            background-color: rgb(255,217,135);
        }

        table{
            margin-left:20px;
            margin-bottom : 20px;
        }
        #adoptionInform, #intro{
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
		
		#like-btn{
			border : 0;
			outline : 0;
			background-color : rgba(255, 255, 255, 0);
			CURSOR:hand;
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

    </style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
		<br><br>
	    <div class="wrap">
        <div id="content" style="width:1200px">
            <div id="content_AR">
                <div id="intro">			
                    <% if(loginUser != null && loginUser.getUserClass().equals("A")) { %>
                    <!-- 관리자 임시버튼 -- 입양신청서확인게시판 이동 -->
                    <a href="<%= contextPath%>/list.ap?cpage=1"><button>입양신청서 목록(관리자)</button></a>
                    
                    <%} %>  
                    <h2>입양하기</h2>
                    <p>
						펫숍 쇼윈도에 진열된 동물의 이면에는 또 다른 생명의 고통이 있을 수 있습니다. <br>
						입양은 가장 실천적인 동물구호 활동입니다. 가족을 기다리는 동물들, 사지말고 입양하세요.
		            </p>

                    <a href="#adoptionInform"><button id="intro-button">입양 절차 안내</button></a>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="<%= contextPath%>/reviewlist.ad?cpage=1"><button id="review-btn">입양후기</button></a>
                    
                    <% if(loginUser != null && !loginUser.getUserClass().equals("P")) { %>
                     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <!-- 단체/관리자만 -->
                    <a href="<%= contextPath%>/enrollForm.an"><button id="intro-button">보호동물 등록</button></a>
                    
                    <%} %>    
                    
                    
                    
                </div> <!--intro-->

				<br><br>
                <div class="list-area" align="center">
                   
                    <% if(list.isEmpty()){ %>
                    	<h2>조회된 게시글이 없습니다.</h2>
                    <%} else {%>
                    	
                    	<% for(Animal a : list) { %>	
		                  <div class="thumbnail" align="center">
	                    	<div class="animalNo" value="<%=a.getAnimalNo()%>" style="display:none"></div> <!-- 동물번호 숨겨서 가져옴 > 상세조회 위함 -->
		                        <img class="img_AR" src=<%=a.getTitleImg() %> alt="동물">		                      
		                        <table align="left">
		                            <tr>
		                                <th width="200px" style="text-align: left; font-size:xx-large"><%= a.getAnimalName() %></th>
		                                
	                                	<td width="45" style="color:red;">
											<button type="button" id="like-btn" title="관심등록"></button>																														
	                                	</td>
	                                	
		                                <th width="45" style="font-size:large; color:red;" align="right">            
			                                <% if(a.getAdopted().equals("Y")){ %>
			                                	입양완료
			                                <%}%>                                	
		                                </th>
		                                
		                            </tr>
		                            <tr>
		                                <td style="font-size:small"><%=a.getCategoryNo() %></td>
		                            </tr>
		                            <tr>
		                                <td style="font-size:small">
				                            <% if(a.getGender().equals("M")){ %>
				                            	수컷
				                            <%} else{%>
				                            	암컷
				                            <%} %>
	
			                                <% if(a.getNeutralization().equals("Y")){ %>
			                                	(중성화 O)
			                                <%} else {%>
			                                	(중성화 X)
			                                <%} %>
		                                
		                                </td>
		                            </tr>
		                            <tr>
		                                <td style="font-size:small"><%=a.getAnimalAge() %> 살 / <%=a.getWeight() %> kg</td>
		                            </tr>
		                        </table>
		                 </div> <!--동물--> 
                 		<%} %>
                    <%} %>
          
                <br><br>
                <div align="center" class="paging-area">
   		    	  <% if(currentPage != 1){ %>
                   <button onclick="location.href='<%=contextPath%>/main.ad?cpage=<%=currentPage -1 %>'">&lt;</button>
               	  <%} %>
                  
		       	  <% for(int i = startPage; i <= endPage; i++) { %>
		            <% if(i != currentPage){ %>
		                <button onclick="location.href='<%=contextPath%>/main.ad?cpage=<%=i %>'"><%=i%></button>
		            <%} else { %>
		                <button disabled><%=i %></button>
		            <%} %>
		       	  <%} %>
		       	  
		        <% if(currentPage != maxPage){ %>
		            <button onclick="location.href='<%=contextPath%>/main.ad?cpage=<%=currentPage +1 %>'"> &gt; </button>
		        <%} %>
                </div> <!--페이징-->
                
      <script>
		$(function(){
			$(".thumbnail>img").click(function(){

				var ano = $(this).parent().children('div.animalNo').attr("value");

				// http://localhost:8002/SemiProject/detail.an?ano=15

				location.href="<%=contextPath%>/detail.an?ano="+ano;
			})
		})
	</script>

            </div><!--list-area-->
            
            <br><br>
            
            <div id="adoptionInform">
                <h2>입양 절차</h2>
		                입양신청서 작성 후 입양상담까지는 약 2-4주가 소요됩니다. <br><br>
		    
		                입양 상담은 선별된 분에 한하여 담당 활동가와 전화를 통해 진행되는 점 참고해 주세요.<br><br>
		    
		               <b>입양 전 확인해주세요</b><br>
		    
		                펫밀리의 입양원칙에 동의하시는 분들만 입양신청이 가능합니다.<br>
		                입양 동물은 반드시 중성화 수술을 해주셔야 하며, 동의하지 않을 경우 입양신청이 어렵습니다.<br>
		                입양신청 서식에 모든 정보를 등록해 주셔야 상담이 진행됩니다.<br>
		                맞음비는 위기동물 치료비, 반려동물보호 복지 활동에 전액 사용됩니다.<br>
		                가족 구성원 전체의 동의를 얻지 않은 경우나 미성년자의 입양신청은 어렵습니다.<br>
		                개 입양 시 마당견으로의 반려는 불가능합니다.<br>
		                고양이 입양 시 외출냥이, 산책냥이로의 반려는 불가능합니다.<br>
		                임시보호 시 입양과 동일한 절차로 진행됩니다.<br>
            </div> <!--입양절차-->
            
          
       	 </div><!--content2-->
       </div> <!--content-->
            
            <br><br><br><!-- content영역과 footer영역 사이 띄우기-->
			<%@include file="../common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>