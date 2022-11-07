package com.kh.adoption.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.Application;

/**
 * Servlet implementation class ApplicationDetailViewController
 * 입양신청서 상세보기 - 관리자
 */
@WebServlet("/detail.ap")
public class ApplicationDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int apno = Integer.parseInt(request.getParameter("apno"));
		//System.out.println(apno);
		
		Application a = new AdoptionService().selectApplicationDetail(apno);
		
		request.setAttribute("a", a);

		if(a.getCategoryNo() == 800) {
			request.getRequestDispatcher("views/adoption/applicationDetailViewKor.jsp").forward(request, response);;			
		} else if(a.getCategoryNo() == 900) {
			request.getRequestDispatcher("views/adoption/applicationDetailViewEng.jsp").forward(request, response);;						
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
