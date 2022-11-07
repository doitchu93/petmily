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
 * Servlet implementation class GroupDetailController
 */
@WebServlet("/detail.gr")
public class GroupDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int groupNo = Integer.parseInt(request.getParameter("gno"));
		
		Groups group = new GroupService().selectGroup(groupNo);
		
		if(group != null) {
			
			request.setAttribute("g", group);
			request.getRequestDispatcher("views/groups/groupDetailView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "단체신청 글 조회 실패");
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
