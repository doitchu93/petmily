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
 * Servlet implementation class UpdateMemberController
 */
@WebServlet("/update.me")
public class UpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		String userNickname = request.getParameter("userNickname");
		
		String phoneF = request.getParameter("phoneF");
		String phoneM = request.getParameter("phoneM");
		String phoneB = request.getParameter("phoneB");
		String phone = phoneF + "-" + phoneM + "-" + phoneB;
		
		if(phoneF == null) {
			phone = loginUser.getPhone();
		}
		
		String postcode = request.getParameter("postcode");
		String addressMain = request.getParameter("addressMain");
		String addressDetail = request.getParameter("addressDetail");
		String addressAdd = request.getParameter("addressAdd");
		
		
		Member m = new Member();
		m.setPhone(phone);
		m.setPostcode(postcode);
		m.setAddressMain(addressMain);
		m.setAddressDetail(addressDetail);
		m.setAddressAdd(addressAdd);
		
		int result = new MemberService().updateMember(userNo, userNickname, m);
		
		String userId = loginUser.getUserId();
		String userPwd = loginUser.getUserPwd();
		
		Member newLoginUser = new MemberService().loginMember(userId, userPwd);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "회원 정보 변경에 성공했습니다!");
			session.setAttribute("loginUser", newLoginUser);
			
			response.sendRedirect(request.getContextPath()+"/myPage.me");
			
		} else {
			
			session.setAttribute("alertMsg", "회원 정보 변경에 실패했습니다. 다시 시도해주세요.");
			
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
