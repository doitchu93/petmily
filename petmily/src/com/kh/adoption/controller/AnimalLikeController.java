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
 * Servlet implementation class AnimalLikeController
 */
@WebServlet("/like.an")
public class AnimalLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 관심동물등록
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int animalNo = Integer.parseInt(request.getParameter("ano"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
//		System.out.println(animalNo);
//		System.out.println(userNo);
		
		AnimalInterestList like = new AnimalInterestList(userNo, animalNo);
		
		
		int result = new AdoptionService().insertInterestList(like);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "관심동물 목록에 추가되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.an?ano="+animalNo);
		}else {
			request.getSession().setAttribute("alertMsg", "관심동물 등록이 실패하였습니다.");
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
