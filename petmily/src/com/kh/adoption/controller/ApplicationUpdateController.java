package com.kh.adoption.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;

/**
 * Servlet implementation class ApplicationUpdateController
 */
@WebServlet("/update.ap")
public class ApplicationUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 입양신청서 수정(신청상태) - 관리자
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int apno = Integer.parseInt(request.getParameter("apno"));
		String status = request.getParameter("status");
//		System.out.println(apno);
//		System.out.println(status);
		
		int result = new AdoptionService().updateApplication(apno, status);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "수정 완료");
			response.sendRedirect(request.getContextPath()+"/list.ap?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "수정 실패");
			response.sendRedirect(request.getContextPath()+"/detail.ap?apno="+apno);
			
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
