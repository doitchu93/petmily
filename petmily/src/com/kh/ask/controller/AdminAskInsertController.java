package com.kh.ask.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ask.model.service.AskService;
import com.kh.ask.model.vo.Reply;

/**
 * Servlet implementation class AdminAskInsertController
 */
@WebServlet("/adInsert.as")
public class AdminAskInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAskInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int askNo = Integer.parseInt(request.getParameter("askNo"));
		String replyContent = request.getParameter("replyContent");
		
		Reply r = new Reply();
		r.setRefRepno(askNo);
		r.setReplyContent(replyContent);
		
		int inResult = new AskService().insertReply(r);
		int upAskReply = new AskService().updateAskReply(askNo);
		
		if((inResult * upAskReply) > 0) {
			
			int upResult = new AskService().updateReply(askNo, replyContent); 
			
			int result = inResult * upResult;
			
			if(result > 0) {
				request.setAttribute("alertMsg", "답변이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.as?ano=" + askNo);
			}else {
				request.setAttribute("errorMsg", "답변 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
