package com.kh.groups.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.groups.model.service.GroupService;
import com.kh.groups.model.vo.Groups;

/**
 * Servlet implementation class GroupInsertController
 */
@WebServlet("/insert.gr")
public class GroupInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userName = request.getParameter("userName");
		String groupName = request.getParameter("groupName");
		String userPhone = request.getParameter("userPhone");
		String groupEnrollno = request.getParameter("groupEnrollno");
		String groupUrl = request.getParameter("groupUrl");
		String groupEtc = request.getParameter("groupEtc");
		
		Groups g = new Groups();
		g.setUserNo(userNo);
		g.setUserName(userName);
		g.setGroupName(groupName);
		g.setUserPhone(userPhone);
		g.setGroupEnrollno(groupEnrollno);
		g.setGroupUrl(groupUrl);
		g.setGroupEtc(groupEtc);
		System.out.println(g);

		int result = new GroupService().insertGroup(g);
		
		if(result > 0) {
			
			request.setAttribute("g", g);
			
			request.getSession().setAttribute("alertMsg", "단체 신청 등록");
			response.sendRedirect(request.getContextPath() + "/submit.gr");
		}else {
			request.setAttribute("errorMsg", "단체 신청 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
