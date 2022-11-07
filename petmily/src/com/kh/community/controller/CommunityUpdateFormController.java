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
 * Servlet implementation class CommunityUpdateFormController
 */
@WebServlet("/updateForm.cm")
public class CommunityUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 게시글 수정폼 보여줌
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int type = Integer.parseInt(request.getParameter("type"));
		// System.out.println(cno + "." +type);
		Community c = new CommunityService().selectCommunity(cno, type);
		ArrayList<Attachment> list = new CommunityService().selectAttachment(cno);
		
		request.setAttribute("c", c);
		request.setAttribute("list", list);
		
		switch(type) {
		case 1 : request.getRequestDispatcher("views/community/adoptionReviewUpdateForm.jsp").forward(request, response); 
				 break; // 입양후기게시판
		case 2 : request.getRequestDispatcher("views/community/volunteerReviewUpdateForm.jsp").forward(request, response);
				 break; // 봉사후기게시판
		case 3 : request.getRequestDispatcher("views/community/volunteerRecrutimentUpdateForm.jsp").forward(request, response);
				 break; // 봉사모집게시판
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
