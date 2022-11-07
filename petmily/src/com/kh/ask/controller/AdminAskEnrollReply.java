package com.kh.ask.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ask.model.service.AskService;
import com.kh.ask.model.vo.Ask;
import com.kh.ask.model.vo.Attachment;
import com.kh.ask.model.vo.Category;

/**
 * Servlet implementation class AdminAskEnrollReply
 */
@WebServlet("/enrollReply.as")
public class AdminAskEnrollReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAskEnrollReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int askNo = Integer.parseInt(request.getParameter("askNo"));
		Ask ask = new AskService().selectAsk(askNo);
		Attachment at = new AskService().selectAttachment(askNo);
		
		request.setAttribute("askNo", askNo);
		request.setAttribute("ask", ask);
		request.setAttribute("attachment", at);
		
		request.getRequestDispatcher("views/ask/adminAskEnrollReply.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
