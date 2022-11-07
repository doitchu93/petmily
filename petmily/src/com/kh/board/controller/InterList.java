package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.adoption.model.vo.Animal;
import com.kh.board.model.service.BoardService;
import com.kh.member.model.vo.Member;
//import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class InterList
 */
@WebServlet("/interList.bo")
public class InterList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InterList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 값 받아옴
		
		HttpSession session = request.getSession();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Animal> listAN = new BoardService().selectInterListAN(userNo);
		
		//ArrayList<Product> listPR = new BoardService().selectInterListPR(userNo);
		
		session.setAttribute("interListAN", listAN);
		//session.setAttribute("interListPR", listPR);
		
		response.sendRedirect("views/board/InterList.jsp");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
