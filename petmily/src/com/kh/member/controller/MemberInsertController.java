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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
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
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		String userNickname = request.getParameter("userNickname");
		String userClass = request.getParameter("userClass");
		
		// 생년월일 가공
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String birthDate = year + "/" + month + "/" + date;
		
		// 휴대전화번호
		String phoneF = request.getParameter("phoneF");
		String phoneM = request.getParameter("phoneM");
		String phoneB = request.getParameter("phoneB");
		String phone = phoneF + "-" + phoneM + "-" + phoneB;
		
		// 주소
		String postcode = request.getParameter("postcode");
		String addressMain = request.getParameter("addressMain");
		String addressDetail = request.getParameter("addressDetail");
		String addressAdd = request.getParameter("addressAdd");
		
		// 입력 값 Member m에 담기
		Member m = new Member(userId, userPwd, userName, userNickname, birthDate, email, postcode, addressMain, addressDetail, addressAdd, phone, userClass);
		
		// Member m 전달, 처리 값 int result 받기
		int result = new MemberService().insertMember(m);
		
		if (result > 0) { // 회원가입 성공
			
			// 회원가입 완료 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/insertFin.me");
			
		} else { // 회원가입 실패
			
			HttpSession session = request.getSession();
			
			// 실패 메시지 얼럿 띄우고 회원가입 페이지로 이동
			session.setAttribute("alertMsg", "회원가입 실패, 다시 시도해주세요.");
			
			response.sendRedirect(request.getContextPath() + "/enrollForm.me");
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
