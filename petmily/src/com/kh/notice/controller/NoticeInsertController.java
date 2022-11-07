package com.kh.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.ask.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String noticeTitle = multiRequest.getParameter("noticeTitle");
			String noticeContent = multiRequest.getParameter("noticeContent");
			
			Notice notice = new Notice();
			notice.setNoticeTitle(noticeTitle);
			notice.setNoticeContent(noticeContent);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) { // upfile이 null이 아니라면 == 있다면 => VO객체로 가공
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile")); //원본명
				at.setChangeName(multiRequest.getFilesystemName("upfile")); //수정파일명
				at.setFilePath("resources/notice_upfiles"); //파일경로
			} 
			
			int result = new NoticeService().insertNotice(notice, at);
			System.out.println(at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항 등록 성공");
				response.sendRedirect(request.getContextPath() + "/list.no");
			} else {
				
				if(at != null) { //첨부파일이 있었는데 실패했다면 서버에서 삭제
					new File(savePath + at.getChangeName()).delete(); //삭제하려는 파일 객체 생성
				}
				request.setAttribute("errorMsg", "공지사항 등록 실패");
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
