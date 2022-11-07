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
 * Servlet implementation class GroupAuthController
 */
@WebServlet("/auth.gr")
public class GroupAuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupAuthController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String auth = request.getParameter("auth"); // allow 또는 reject
		String groupNo = request.getParameter("gno");
		
		Groups group = new GroupService().selectGroup(Integer.parseInt(groupNo));
		
		if(auth.equals("allow")) {// 승인버튼을 눌렀을 때
			
			int result = new GroupService().updateAuthAllow(groupNo);
			if(result > 0) {
				if(group.getGroupAuth().equals("X") || group.getGroupAuth().equals("N")) {
					
					request.setAttribute("group", group);
					response.sendRedirect(request.getContextPath() + "/detail.gr?gno=" + groupNo);
				}
			}
		} else { //
			
			int result = new GroupService().updateAuthReject(groupNo);
			
			if(result > 0) {
				if(group.getGroupAuth().equals("X") || group.getGroupAuth().equals("Y")) {
					
					request.setAttribute("group", group);
					response.sendRedirect(request.getContextPath() + "/detail.gr?gno=" + groupNo);
				}
			}
		}//if(auth.equals("allow"))
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
