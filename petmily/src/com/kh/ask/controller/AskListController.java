package com.kh.ask.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ask.model.service.AskService;
import com.kh.ask.model.vo.Ask;
import com.kh.ask.model.vo.Reply;
import com.kh.common.model.PageInfo;

/**
 * Servlet implementation class AskListController
 */
@WebServlet("/list.as")
public class AskListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//---------- 페이징 처리 ----------
		// 필요한 변수들
		int listCount; // 현재 게시판의 게시글 총 갯수 => BOARD로 부터 COUNT(*)활용(STATUS = 'Y')
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지) => request.getParameter("cpage");
		int pageLimit; // 페이지 하단에 보여질 때 페이징바의 최대 갯수 => 10개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 10개로 고정
		
		int maxPage; // 가장 마지막 페이지가 몇번 페이지 인지(총 페이지 갯수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수 
		
		// * listCount : 총 게시글 갯수
		listCount = new AskService().selectListCount();
		
		// * currentPage : 현재페이지(== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// * pageLimit : 페이징바의 페이지 최대 갯수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 10;
		
		// * maxPage : 가장 마지막 페이지가 몇 번 페이지인지(총 페이지 갯수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페에지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
		
		// startPage가 11이어서 endPage가 20이 들어갔는데
		// maxPage가 13이라면?
		// => endPage값을 maxPage값으로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 여기까지 총 7개의 변수를 만들었음!
		// 7개의 변수를 가지고 해당되는 범위에 따른 게시글 10개씩만 SELECT
		// Service단으로 토스 => 7개 나왔다 => VO 클래스에 만들어서 가공해서 넘기자
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Ask> askList = new AskService().selectList(pi);

		request.setAttribute("askList", askList);
		request.setAttribute("pi", pi);
		
		if(request.getParameter("no") != null) {
			int no = Integer.parseInt(request.getParameter("no"));
			int userListCount = new AskService().selectUserIdListCount(no);
			PageInfo userPi = new PageInfo(userListCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			request.setAttribute("userPi", userPi);
		}
		
		
//		ArrayList<Ask> askUserList = new AskService().selectUserIdList(pi, no);
//		request.setAttribute("askUserList", askUserList);
		
		request.getRequestDispatcher("/views/ask/askListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
