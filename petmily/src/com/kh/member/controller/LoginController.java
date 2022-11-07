package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.vo.Attachment2;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST > UTF-8로 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 입력 값 가져오기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 입력 값 전달, 처리 값 Member loginUser 받기
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		int userNo = loginUser.getUserNo();

        Attachment2 at = new MemberService().selectAttachment(userNo);
		HttpSession session = request.getSession();
		
		if(loginUser.getUserId() == null) { // 로그인 실패
			
			// 실패 메시지 얼럿 띄우고 다시 로그인 페이지로 이동
			session.setAttribute("alertMsg", "회원 정보가 일치하지 않습니다.");
			
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		} else { // 로그인 성공
			
			// 성공 메시지 얼럿 띄우고 메인 페이지로 이동, 로그인 정보(loginUser) 전달
			session.setAttribute("alertMsg", "펫밀리 방문을 환영합니다.");
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("at", at);
			response.sendRedirect(request.getContextPath());
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
