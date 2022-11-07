package com.kh.adoption.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.Application;

/**
 * Servlet implementation class ApplicationInsertController
 */
@WebServlet("/submitAp.ad")
public class ApplicationInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String agreement = request.getParameter("agreement");
		String name = request.getParameter("applicantName");
		String phone = request.getParameter("phone");
		String subPhone = request.getParameter("subPhone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String sns = request.getParameter("sns");
		String job = request.getParameter("job");
		String maritalStatus = request.getParameter("maritalStatus");
		int animalNo = Integer.parseInt(request.getParameter("animalNo"));
		String animalName = request.getParameter("animalName");
		
		String q2 = request.getParameter("Q2");
		String q3 = request.getParameter("Q3");
		String q4 = request.getParameter("Q4");
		String q5 = request.getParameter("Q5");
		String q6 = request.getParameter("Q6");
		String q7 = request.getParameter("Q7");
		String q8 = request.getParameter("Q8");
		String q9 = request.getParameter("Q9");
		String q10 = request.getParameter("Q10");
		String q11 = request.getParameter("Q11");
		String q12 = request.getParameter("Q12");
		String q13 = request.getParameter("Q13");
		String q14 = request.getParameter("Q14");
		String q15 = request.getParameter("Q15");
		String q16 = request.getParameter("Q16");
		String q17 = request.getParameter("Q17");
		String q18 = request.getParameter("Q18");
		String q19 = request.getParameter("Q19");
		String q20 = request.getParameter("Q20");
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo")); // 한글 800 영문 900
		//System.out.println(categoryNo);
		
		Application ap = new Application(agreement, name, phone, subPhone, email, gender, age, address,
										sns, job, maritalStatus, animalNo, animalName, q2, q3, q4, q5, q6, q7, q8, 
									q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, categoryNo);
		

		int result = new AdoptionService().insertApplication(ap);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "입양신청서가 접수되었습니다.");
			response.sendRedirect(request.getContextPath() + "/main.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "입양신청 실패");
			request.getRequestDispatcher("views/adoption/main.ad?cpage=1").forward(request, response);;
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
