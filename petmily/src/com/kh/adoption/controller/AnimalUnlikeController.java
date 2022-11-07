package com.kh.adoption.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.AnimalInterestList;

/**
 * Servlet implementation class AnimalUnlikeController
 */
@WebServlet("/unlike.an")
public class AnimalUnlikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalUnlikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int animalNo = Integer.parseInt(request.getParameter("ano"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		AnimalInterestList unlike = new AnimalInterestList(userNo, animalNo);
		
		int result = new AdoptionService().deleteAnimalInterest(unlike);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "관심동물이 해제되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.an?ano="+animalNo);
		}else {
			request.getSession().setAttribute("alertMsg", "관심동물 삭제 실패");
			response.sendRedirect(request.getContextPath()+"/detail.an?ano="+animalNo);
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
