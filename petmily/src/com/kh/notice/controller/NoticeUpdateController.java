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
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int noticeNo = Integer.parseInt(multiRequest.getParameter("noticeNo"));
			String noticeTitle = multiRequest.getParameter("noticeTitle");
			String noticeContent = multiRequest.getParameter("noticeContent");
		
			Notice notice = new Notice();
			notice.setNoticeNo(noticeNo);
			notice.setNoticeTitle(noticeTitle);
			notice.setNoticeContent(noticeContent);
			System.out.println("updateController notice : " + notice);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/notice_upfiles/");
				System.out.println("updateController at : " + at);
				
				// ??????????????? ?????? ?????? + ??????????????? ?????? ??????
				if(multiRequest.getParameter("originFileNo") != null) {
					// ?????? ????????? ????????? ??????
					// ?????? ????????? ?????? ????????????  at??? ?????? ???
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				} else {
					at.setRefNo(noticeNo);
				}
			}
		
			int result = new NoticeService().updateNotice(notice, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "?????? ?????? ???");
				response.sendRedirect(request.getContextPath() + "/detail.no?nno=" + noticeNo);
			} else {
				request.setAttribute("errorMsg", "?????? ?????? ??????");
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
