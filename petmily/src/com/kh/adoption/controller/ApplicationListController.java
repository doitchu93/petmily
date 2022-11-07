package com.kh.adoption.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.Animal;
import com.kh.adoption.model.vo.Application;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class ApplicationListController
 */
@WebServlet("/list.ap")
public class ApplicationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 입양신청서 목록 - 관리자
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; // 현재 일반게시판의 총 게시글 수
		int currentPage; // 현재 페이지(사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징 바의 최대 개수 
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 수
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new AdoptionService().selectApplicationListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 5;
		boardLimit = 10;		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
	
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,
				maxPage, startPage, endPage);
		
		// 게시글 가져오기
		ArrayList<Application> list = new AdoptionService().selectApplicationList(pi);

		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);	
		
		request.getRequestDispatcher("/views/adoption/applicationListForAdmin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
