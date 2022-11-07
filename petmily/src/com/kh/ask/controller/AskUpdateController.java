package com.kh.ask.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.ask.model.service.AskService;
import com.kh.ask.model.vo.Ask;
import com.kh.ask.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AskUpdateController
 */
@WebServlet("/update.as")
public class AskUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		// POST
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		String askCategory = request.getParameter("askCategory");
		int askNo = Integer.parseInt(request.getParameter("ano"));
		String askTitle = request.getParameter("askTitle");
		String askContent = request.getParameter("askContent");
		
		// 가공
		Ask ask = new Ask();
		ask.setAskCategory(askCategory);
		ask.setAskNo(askNo);
		ask.setAskTitle(askTitle);
		ask.setAskContent(askContent);
		
		// Service
		int result = new AskService().updateAsk(ask);
		
		// 응답페이지
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의글을 수정하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.as?ano=" + askNo);
		}else {
			request.setAttribute("errorMsg", "문의글 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		*/
		
		// POST
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			 		
			int maxSize = 1024 * 1024 * 10;
			
			// 전달된 파일을 저장시킬 서버폴더의 물리적인 경로를 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/ask_upfiles/");
			
			// 전달된 파일명 수정 후 서버에 업로드
			// MultiRequest 객체를 생성함으로써 서버에 파일이 내려받아짐
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//
			// 값 뽑기
			int askNo = Integer.parseInt(multiRequest.getParameter("ano"));
			String askCategory = multiRequest.getParameter("askCategory");
			String askTitle = multiRequest.getParameter("askTitle");
			String askContent = multiRequest.getParameter("askContent");
					
			// 가공
			Ask ask = new Ask();
			ask.setAskNo(askNo);
			ask.setAskCategory(askCategory);
			ask.setAskTitle(askTitle);
			ask.setAskContent(askContent);
			
			// 실제 첨부파일이 있을 경우에만 객체 생성 / 없으면  null
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/ask_upfiles/");
				// => 여기까지는 새롭에 업로드한 새로운 첨부파일에 대한 내용
				
				// 첨부파일이 있을 경우  + 원본파일도 있을 경우
				
				if(multiRequest.getParameter("originFileNo") != null) {
					
					// 기존 파일이 존재했다
					// 기존파일에 대한 파일번호 at에 담을 것 
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존에 서버에 존재했던 첨부파일 삭제
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				}else {
					// 새롭게 첨부파일이 넘어왔지만 기존 파일이 없을 경우 => INSERT
					// + 어느 게시글의 첨부파일인지 askNo (REF_NO)
					at.setRefNo(askNo);
				}
			}
			
			// 4. Service단
			// 경우에 따라서 모두 한개의 트랜잭션으로 묶어야함
			// Service단 작성 전 경우의 수 처리
			// case 1 : 새로운 첨부파일 X => ask, null => ASK UPDATE
			// case 2 : 새로운 첨부파일 O, 기존 첨부파일 O => ASK UPDATE, ATTACHMENT UPDATE
			// case 3 : 새로운 첨부파일 O, 기존 첨부파일 X => ASK UPDATE, ATTACHMENT INSERT
			
			int result = new AskService().updateAsk(ask, at);
			
			// 5) 응답
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "문의글을 수정하였습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.as?ano=" + askNo);
			}else {
				request.setAttribute("errorMsg", "문의글 수정 실패");
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
