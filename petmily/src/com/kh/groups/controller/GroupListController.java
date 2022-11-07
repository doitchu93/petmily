package com.kh.groups.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ask.model.service.AskService;
import com.kh.common.model.PageInfo;
import com.kh.groups.model.service.GroupService;
import com.kh.groups.model.vo.Groups;

/**
 * Servlet implementation class GroupListController
 */
@WebServlet("/list.gr")
public class GroupListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD로 부터 COUNT(*)활용(STATUS = 'Y')
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지) => request.getParameter("cpage");
		int pageLimit; // 페이지 하단에 보여질 때 페이징바의 최대 갯수 => 10개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 10개로 고정
		
		int maxPage; // 가장 마지막 페이지가 몇번 페이지 인지(총 페이지 갯수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수 
		
		listCount = new GroupService().selectListCount();// * listCount : 총 게시글 갯수
		currentPage = Integer.parseInt(request.getParameter("cpage"));// * currentPage : 현재페이지(== 사용자가 요청한 페이지)
		pageLimit = 10;// * pageLimit : 페이징바의 페이지 최대 갯수
		boardLimit = 10;// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		maxPage = (int)Math.ceil((double)listCount / boardLimit);// * maxPage : 가장 마지막 페이지가 몇 번 페이지인지(총 페이지 갯수)
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		endPage = startPage + pageLimit - 1;// * endPage : 페에지 하단에 보여질 페이징바의 끝 수
		
		if(endPage > maxPage) {// => endPage값을 maxPage값으로 변경
			endPage = maxPage;
		}
		
		// 3) VO로 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Groups> gList = new GroupService().selectGroupList(pi);
		request.setAttribute("gList", gList);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/groups/groupListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
