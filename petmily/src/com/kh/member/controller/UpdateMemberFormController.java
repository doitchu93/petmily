package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateMemberFormController
 */
@WebServlet("/updateForm.me")
public class UpdateMemberFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("views/member/updateMember.jsp").forward(request, response);
		
		HttpSession session = request.getSession();
		
//		String postcode = (String)session.getAttribute("postcode");
//		String addressMain = (String)session.getAttribute("addressMain");
//		String addressDetail = (String)session.getAttribute("addressDetail");
//		String addressAdd = (String)session.getAttribute("addressAdd");
//		
//		System.out.println(postcode);
//		System.out.println(addressMain);
//		System.out.println(addressDetail);
//		System.out.println(addressAdd);
//		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
