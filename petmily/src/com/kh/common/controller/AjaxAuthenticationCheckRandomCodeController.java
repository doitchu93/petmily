package com.kh.common.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.service.AuthenticationService;
import com.kh.common.model.vo.Authentication;

/**
 * Servlet implementation class AjaxAuthenticationCheckRandomCodeController
 */
@WebServlet("/checkRandomCode.ac")
public class AjaxAuthenticationCheckRandomCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAuthenticationCheckRandomCodeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자가 입력한 이메일
		String inputEmail = request.getParameter("inputEmail");
		
		// 사용자가 입력한 랜덤코드
		String inputRandomCode = request.getParameter("inputRandomCode");
		
		int result = 0;
		
		// 이메일 입력 값이 없을 때
		if (inputEmail == "" || inputEmail.contains(" ")) { 
			
			result = 4; // 이메일 주소를 입력해주세요.
			
			response.setContentType("text/html; charset=UTF-8");
	        
	        response.getWriter().print(result);
	    
	    // 인증번호 입력 값이 없을 때
		} else if (inputRandomCode == "") { 
			
			result = 5; // 인증번호를 입력해주세요.
			
			response.setContentType("text/html; charset=UTF-8");
	        
	        response.getWriter().print(result);
	        
	    // 인증번호 확인 결과
		} else { 
			
			Authentication resultList = new AuthenticationService().checkRandomCode(inputEmail);
			
			// 조회 결과 없음
			if (resultList == null) { 
				
				result = 0; // 이메일 주소를 다시 확인해주세요.
				
				response.setContentType("text/html; charset=UTF-8");
		        
		        response.getWriter().print(result);
			}
			
			// 조회 결과 있음
			if (resultList != null) { 
				
				// DB에 저장되어 있던 랜덤코드
				String randomCode = resultList.getRandomCode();
				
				// DB에 저장되어 있던 이메일 보낸 시간 (이메일 전송할 때 인증 테이블에 insert한 시간)
				Timestamp enrollDate = resultList.getEnrollDate();
				
				// 현재 시간
				Timestamp now = Timestamp.valueOf(LocalDateTime.now());
				
				// 이메일 보낸 시간 (enrollDate) + 10분 (인증 시간)
				Calendar cal = Calendar.getInstance();
				cal.setTime(enrollDate);
				cal.add(Calendar.MINUTE, 10);
				enrollDate.setTime(cal.getTime().getTime());
				
				// 랜덤코드가 일치한다면
				if (inputRandomCode.equals(randomCode)) { 
					
					// 현재시간이 enrollDate + 10분보다 이전이면
					if (now.before(enrollDate)) { 
						
						result = 1; // 인증번호 확인 성공
						
						response.setContentType("text/html; charset=UTF-8");
				        
				        response.getWriter().print(result);
					} else {
						
						result = 2; // 인증 시간 초과
						
						response.setContentType("text/html; charset=UTF-8");
				        
				        response.getWriter().print(result);
					}
				} else {
					
					result = 3; // 랜덤코드 불일치
					
					response.setContentType("text/html; charset=UTF-8");
			        
			        response.getWriter().print(result);
				}
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
