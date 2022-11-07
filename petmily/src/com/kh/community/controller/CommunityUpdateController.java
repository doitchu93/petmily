package com.kh.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.community.model.service.CommunityService;
import com.kh.community.model.vo.Community;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CommunityUpdateController
 * 게시글 수정
 */
@WebServlet("/update.cm")
public class CommunityUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 게시글 수정
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/adoption_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int comNo = Integer.parseInt(multiRequest.getParameter("comNo"));
			//System.out.println(comNo);
			String userNo = multiRequest.getParameter("userNo");
			String title = multiRequest.getParameter("title");
			String summary = multiRequest.getParameter("summary");
			String content = multiRequest.getParameter("content");
			int type = Integer.parseInt(multiRequest.getParameter("comType"));
			
			Community c = new Community(comNo, userNo, title, summary, content, type);
			
			ArrayList<Attachment> list = new ArrayList();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				String originKey = "origenFileNo" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/adoption_upfiles/");
					
					if(multiRequest.getParameter(originKey)!=null) {
						at.setFileNo(Integer.parseInt(multiRequest.getParameter(originKey)));
						new File(savePath + multiRequest.getParameter(originKey)).delete();
					}
					if(i == -1) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}
			
			int result = new CommunityService().updateCommunity(c, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg","게시글이 수정되었습니다");
				response.sendRedirect(request.getContextPath() + "/detail.cm?cno=" + comNo + "&type=" + type);
	
			}else {
				request.setAttribute("alertMsg", "게시글 수정 실패");
				switch(type) {
				case 1 : request.getRequestDispatcher("views/community/adoptionReviewList.jsp").forward(request, response); 
					 	 break; // 입양후기게시판
				case 2 : request.getRequestDispatcher("views/community/volunteerReviewList.jsp").forward(request, response);
						 break; // 봉사후기게시판
				case 3 : request.getRequestDispatcher("views/community/volunteerRecruitmentList.jsp").forward(request, response);
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
