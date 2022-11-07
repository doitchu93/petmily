package com.kh.ask.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ask.model.service.AskService;
import com.kh.ask.model.vo.Ask;
import com.kh.ask.model.vo.Reply;

/**
 * Servlet implementation class AdminAskUpdateFormCotroller
 */
@WebServlet("/adUpdateForm.as")
public class AdminAskUpdateFormCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAskUpdateFormCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int askNo = Integer.parseInt(request.getParameter("ano"));
		
		Reply r = new AskService().selectReply(askNo);
		Ask ask = new AskService().selectAsk(askNo);
		
		request.setAttribute("r", r);
		request.setAttribute("ask", ask);
		
		request.getRequestDispatcher("views/ask/adminAskUpdateReply.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
