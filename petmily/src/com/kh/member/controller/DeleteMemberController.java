package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberController
 */
@WebServlet("/delete.me")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//인코딩
		request.setCharacterEncoding("UTF-8");
		
		
		
		//값
		
		HttpSession session = request.getSession();
		
		String userPwd = request.getParameter("userPwd");
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		
		// 서비스
		int result = new MemberService().deleteMember(userId, userPwd);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "정상적으로 탈퇴되었습니다.");
			session.removeAttribute("loginUser");
			
			
		} else {
			
			session.setAttribute("alertMsg", "회원 탈퇴를 실패했습니다. 다시 시도해주세요.");
			
		}
		
		response.sendRedirect(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
