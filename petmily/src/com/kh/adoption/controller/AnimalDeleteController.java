package com.kh.adoption.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;

/**
 * Servlet implementation class AnimalDeleteController
 */
@WebServlet("/delete.an")
public class AnimalDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 동물 삭제
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int animalNo = Integer.parseInt(request.getParameter("ano"));
		int result = new AdoptionService().deleteAnimal(animalNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg","삭제 완료");
			response.sendRedirect(request.getContextPath()+"/main.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "삭제 실패");
			request.getRequestDispatcher("views/adoption/adoptionMain.jsp").forward(request, response);
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
