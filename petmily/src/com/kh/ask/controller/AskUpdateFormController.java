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
 * Servlet implementation class AskUpdateController
 */
@WebServlet("/updateForm.as")
public class AskUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 카테고리 가져오기
		ArrayList<Category> list = new AskService().selectCategoryList();
		
		// 해당 글 번호 뽑기
		int askNo = Integer.parseInt(request.getParameter("ano"));
		
		// 글 번호에 해당하는 ask테이블의 행 조회
		Ask ask = new AskService().selectAsk(askNo);
		
		// 글 번호에 해당하는 첨부파일 Attachment테이블의 행 조회
		Attachment at = new AskService().selectAttachment(askNo);
		
		//값 넘기기
		request.setAttribute("list", list);
		request.setAttribute("ask", ask);
		request.setAttribute("at", at);
		
		//포워딩
		request.getRequestDispatcher("views/ask/askUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
