package com.kh.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;

/**
 * Servlet implementation class CommunityDetailViewController
 */
@WebServlet("/detail.cm")
public class CommunityDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 게시글 상세조회
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		int result = new CommunityService().increaseCount(cno);
		if(result > 0) {			
			Community c = new CommunityService().selectCommunity(cno, type);
			ArrayList<Attachment> list = new CommunityService().selectAttachment(cno);
			
			request.setAttribute("c", c);
			request.setAttribute("list", list);
			
			switch(type) {
			case 1 : request.getRequestDispatcher("views/community/adoptionReviewDetail.jsp").forward(request, response); 
					 break; // 입양후기게시판
			case 2 : request.getRequestDispatcher("views/community/volunteerReviewDetail.jsp").forward(request, response);
					 break; // 봉사후기게시판
			case 3 : request.getRequestDispatcher("views/community/volunteerRecrutimentDetail.jsp").forward(request, response);
					 break; // 봉사모집게시판
			}
			
		}else {
			// 조회수 증가 실패 에러페이지
			System.out.println("조회수 증가 실패");
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
