package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.service.CommunityService;

/**
 * Servlet implementation class CommunityDeleteController
 */
@WebServlet("/delete.cm")
public class CommunityDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 게시글 삭제
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cno = Integer.parseInt(request.getParameter("cno"));
		int type = Integer.parseInt(request.getParameter("type"));
		int result = new CommunityService().deleteCommunity(cno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "삭제 완료");
			switch(type) {
			case 1 : response.sendRedirect(request.getContextPath() + "/reviewlist.ad?cpage=1"); 
					 break; // 입양후기게시판
			case 2 : response.sendRedirect(request.getContextPath() + "/reviewlist.vl?cpage=1");
					 break; // 봉사후기게시판
			case 3 : response.sendRedirect(request.getContextPath() + "/main.vl?cpage=1");
					 break; // 봉사모집게시판
			}
		}else {
			request.getSession().setAttribute("alertMsg", "삭제 실패");
			switch(type) {
			case 1 : request.getRequestDispatcher("views/community/adoptionReviewList.jsp").forward(request, response);
					 break; // 입양후기게시판
			case 2 : request.getRequestDispatcher("views/community/volunteerReviewList.jsp").forward(request, response);
					 break; // 봉사후기게시판
			case 3 : request.getRequestDispatcher("views/community/volunteerRecruitmentList.jsp").forward(request,response);
					 break; // 봉사모집게시판
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
