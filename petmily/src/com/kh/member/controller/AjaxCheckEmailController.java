package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxCheckEmailController
 */
@WebServlet("/checkEmail.me")
public class AjaxCheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String inputEmail = request.getParameter("inputEmail");
		
		int result = 0;
		
		if (inputEmail == "" || inputEmail.contains(" ")) { // 이메일 입력 값이 없을 때
			
			result = 2;
	        
	        response.setContentType("text/html; charset=UTF-8");
	        
	        response.getWriter().print(result);
		} else { // 이메일 입력 값이 있을 때
			
			result = new MemberService().checkEmail(inputEmail);
			
			response.setContentType("text/html; charset=UTF-8");
			
			response.getWriter().print(result);
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
