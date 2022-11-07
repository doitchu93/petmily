package com.kh.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CommunityInsertController
 */
@WebServlet("/insert.cm")
public class CommunityInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 입양후기, 봉사하기(모집), 봉사후기 작성
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*120;
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			
			String savePath = application.getRealPath("/resources/community_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userNo = multiRequest.getParameter("userNo");
			String title = multiRequest.getParameter("title");
			String summary = multiRequest.getParameter("summary");
			String content = multiRequest.getParameter("content");
			int comType = Integer.parseInt(multiRequest.getParameter("comType"));
			
			Community c = new Community(userNo, title, summary, content, comType);
			
			ArrayList<Attachment> list = new ArrayList();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key)!=null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/community_upfiles/");
					
					if(i == 1) {
						at.setFileLevel(1); // 대표사진
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}
			
			int result = new CommunityService().insertCommunity(c, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글이 등록되었습니다");
				
				switch(comType) {
				case 1 : response.sendRedirect(request.getContextPath() + "/reviewlist.ad?cpage=1");
						break; // 입양후기게시판
				case 2 : response.sendRedirect(request.getContextPath() + "/reviewlist.vl?cpage=1");
						break; // 봉사후기게시판
				case 3 : response.sendRedirect(request.getContextPath() + "/main.vl?cpage=1");  
						break; // 봉사모집게시판
				}

				
			}else {
				if(!list.isEmpty()) {
					for(Attachment at : list) {
						new File(savePath + at.getChangeName()).delete();
					}
				}
				request.getSession().setAttribute("alertMsg", "게시글 작성 실패");
				switch(comType) {
				case 1 : request.getRequestDispatcher("views/community/adoptionReviewList.jsp").forward(request, response); 
						 break; // 입양후기게시판
				case 2 : request.getRequestDispatcher("views/community/volunteerReviewList.jsp").forward(request, response);
						 break; // 봉사후기게시판
				case 3 :  request.getRequestDispatcher("views/community/volunteerRecruitmentList.jsp").forward(request, response);
						 break; // 봉사모집게시판
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
