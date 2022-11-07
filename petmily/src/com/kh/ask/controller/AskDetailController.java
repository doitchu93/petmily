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
import com.kh.ask.model.vo.Reply;

/**
 * Servlet implementation class AskDetailController
 */
@WebServlet("/detail.as")
public class AskDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get인코딩 x
		int askNo = Integer.parseInt(request.getParameter("ano"));
		
		int result = new AskService().increaseCount(askNo);
		
		if(result > 0) {
			
			Ask ask = new AskService().selectAsk(askNo);
			Reply reply = new AskService().selectReply(askNo);
			
			Attachment at = new AskService().selectAttachmentList(askNo);
			
			request.setAttribute("ask", ask);
			request.setAttribute("at", at);
			request.setAttribute("reply", reply);
			
			request.getRequestDispatcher("views/ask/askDetailView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "문의글 상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
