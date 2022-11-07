package com.kh.ask.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ask.model.service.AskService;

/**
 * Servlet implementation class AdminAskUpdateController
 */
@WebServlet("/adUpdate.as")
public class AdminAskUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAskUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int askNo = Integer.parseInt(request.getParameter("ano"));
		String newReplyContent = request.getParameter("replyContent");
		
		int result = new AskService().updateReply(askNo, newReplyContent);
		
		int upAskReply = new AskService().updateAskReply(askNo);
		
		if((result * upAskReply) > 0) {
			request.getSession().setAttribute("alertMsg", "답변 수정 완");
			response.sendRedirect(request.getContextPath() + "/detail.as?ano=" + askNo);
		}else {
			
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
