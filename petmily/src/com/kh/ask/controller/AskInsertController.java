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
 * Servlet implementation class AskInsertController
 */
@WebServlet("/insert.as")
public class AskInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/ask_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String askCategory = multiRequest.getParameter("askCategory");
			String askTitle = multiRequest.getParameter("askTitle");
			String askContent = multiRequest.getParameter("askContent");
			String askWriter = multiRequest.getParameter("userName");
			String userNo = multiRequest.getParameter("userNo");
			
			Ask ask = new Ask();
			ask.setAskCategory(askCategory);
			ask.setAskTitle(askTitle);
			ask.setAskContent(askContent);
			ask.setAskWriter(askWriter);
			ask.setUserNo(Integer.parseInt(userNo));
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				// 첨부파일이 있다 => VO 객체로 가공
				at = new Attachment();
				
				at.setOriginName(multiRequest.getOriginalFileName("upfile")); // 원본명
				
				// 수정파일명
				// multiRequest.getFilesystemName("키값");
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				
				// 파일경로
				at.setFilePath("resources/ask_upfiles");
			}
			
			int result = new AskService().insertAsk(ask, at);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath() + "/list.as?cpage=1");
				
				
				
			}else { // 실패
				
				// 첨부파일이 있었는데 실패했다면 이미 업로드된 첨부파일을 굳이 서버에 보관할 필요는 없다(용량만차지)
				
				if(at != null) {
					// delete()호출 => 삭제시키고자 하는 파일 객체 생성
					new File(savePath + at.getChangeName()).delete();
				}
				
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
