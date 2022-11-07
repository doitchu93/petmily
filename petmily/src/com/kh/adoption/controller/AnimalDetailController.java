package com.kh.adoption.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.Animal;
import com.kh.common.model.vo.Attachment;

/**
 * Servlet implementation class AnimalDetailController
 */
@WebServlet("/detail.an")
public class AnimalDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 동물 상세조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		int animalNo = Integer.parseInt(request.getParameter("ano"));
		//System.out.println(animalNo);
		Animal a = new AdoptionService().selectAnimal(animalNo);
		
		ArrayList<Attachment> list = new AdoptionService().selectAttachmentList(animalNo);
		
		request.setAttribute("a", a);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/adoption/animalDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
