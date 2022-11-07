package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxCheckEmailController
 */
@WebServlet("/checkEmailFindPwd.me")
public class AjaxCheckEmailFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckEmailFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력 값 가져오기
		String inputUserName = request.getParameter("inputUserName");
		String inputEmail = request.getParameter("inputEmail");
		String inputPhone = request.getParameter("inputPhone");
		
		// 입력 값 담기
		Member inputList = new Member();
		inputList.setUserName(inputUserName);
		inputList.setEmail(inputEmail);
		inputList.setPhone(inputPhone);
		
		int result = new MemberService().checkEmailFindPwd(inputList);
		
		response.setContentType("text/html; charset=UTF-8");
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
