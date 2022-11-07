package com.kh.adoption.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.AnimalInterestList;

/**
 * Servlet implementation class AnimalLikeGetController
 */
@WebServlet("/getLike.an")
public class AnimalLikeGetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalLikeGetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int animalNo = Integer.parseInt(request.getParameter("animalNo"));
		
		response.setContentType("application/json; charset=UTF-8");
			
		ArrayList<AnimalInterestList> likeList = new AdoptionService().selectAnimalInterestList(animalNo);

		new Gson().toJson(likeList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
