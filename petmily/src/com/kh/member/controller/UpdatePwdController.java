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
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String currentPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		// 값 가져오기
		
		String userNo = request.getParameter("userNo");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String checkPwd = request.getParameter("checkPwd");
		
	
		
		int result = new MemberService().updatePwd(userNo, userPwd, newPwd, checkPwd);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
			response.sendRedirect(request.getContextPath()+"/loginForm.me");
			
			session.removeAttribute("loginUser");
			
			
		} else {
			
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/updatePwdForm.me");
			
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
