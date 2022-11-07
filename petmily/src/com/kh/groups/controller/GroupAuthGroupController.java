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
 * Servlet implementation class GroupAuthGroupController
 */
@WebServlet("/authGroup.gr")
public class GroupAuthGroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupAuthGroupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		String authAllow = request.getParameter("auth");
		String groupNo = request.getParameter("gno");
		
		Groups group = new GroupService().selectGroup(Integer.parseInt(groupNo));
		
		
		if(authAllow.equals("allow")) {// 승인버튼을 눌렀을 때
			
			int authY = new GroupService().updateAuthAllow(groupNo);
			int authG = new GroupService().updateAuthGroup(userNo);

			if((authY * authG) > 0) {
				request.setAttribute("group", group);
				response.sendRedirect(request.getContextPath() + "/detail.gr?gno=" + groupNo);
			}
			
		} else {
			
			int authN = new GroupService().updateAuthReject(groupNo);
			
			if(authN > 0) {
				request.setAttribute("group", group);
				response.sendRedirect(request.getContextPath() + "/detail.gr?gno=" + groupNo);
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
