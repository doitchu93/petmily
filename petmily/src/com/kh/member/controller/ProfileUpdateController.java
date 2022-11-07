package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.controller.interListAnimal;
import com.kh.board.model.vo.Attachment2;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProfileUpdateController
 */
@WebServlet("/updateProfile.me")
public class ProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateController() {
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
			
			HttpSession session = request.getSession();
			
			String savePath = request.getServletContext().getRealPath("/resources");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userNo = multiRequest.getParameter("userNo");
			String nickname = multiRequest.getParameter("nickname");
			
			Attachment2 atOld = (Attachment2)session.getAttribute("at");
			
			String key = "file";
			
			Attachment2 at = new Attachment2();
			
			if(multiRequest.getOriginalFileName(key) != null) {
				
				
				at.setOriginName(multiRequest.getOriginalFileName(key));
				at.setChangeName(multiRequest.getFilesystemName(key));
				at.setFilePath("resources/");
				
				at.setFileLevel(1);
				
			}
			int result = 0;
			if(at.getOriginName() == null) {
				result = new MemberService().updateNickname(userNo, nickname);
				at = atOld;
			} else {
				result = new MemberService().updateProfile(userNo, nickname, at);
			}
			
			
			
			
			
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			String userPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
			
			Member loginUser = new MemberService().loginMember(userId, userPwd);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "프로필을 성공적으로 변경했습니다.");
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("at", at);
				
			}else {
				
				session.setAttribute("alertMsg", "프로필 변경에 실패했습니다. 다시 시도해주세요.");
				
			}
			
			response.sendRedirect(request.getContextPath()+"/myPage.me");
			
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
