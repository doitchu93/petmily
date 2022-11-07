package com.kh.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.service.mainService;
import com.kh.community.model.vo.Community;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class test
 */
@WebServlet("/main")
public class mainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Community> adoptionReviewList = new mainService().selectAdoptionReview();
		ArrayList<Community> volunteerReviewList = new mainService().selectVolunteerReview();
		ArrayList<Notice> noticeList = new mainService().selectNotice();
		
		request.setAttribute("adoptionReviewList", adoptionReviewList);
		request.setAttribute("volunteerReviewList", volunteerReviewList);
		request.setAttribute("noticeList", noticeList);
		
		request.getRequestDispatcher("views/common/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
