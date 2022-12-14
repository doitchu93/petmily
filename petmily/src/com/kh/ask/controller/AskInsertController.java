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
				
				// ??????????????? ?????? => VO ????????? ??????
				at = new Attachment();
				
				at.setOriginName(multiRequest.getOriginalFileName("upfile")); // ?????????
				
				// ???????????????
				// multiRequest.getFilesystemName("??????");
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				
				// ????????????
				at.setFilePath("resources/ask_upfiles");
			}
			
			int result = new AskService().insertAsk(ask, at);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "????????? ?????? ??????");
				response.sendRedirect(request.getContextPath() + "/list.as?cpage=1");
				
				
				
			}else { // ??????
				
				// ??????????????? ???????????? ??????????????? ?????? ???????????? ??????????????? ?????? ????????? ????????? ????????? ??????(???????????????)
				
				if(at != null) {
					// delete()?????? => ?????????????????? ?????? ?????? ?????? ??????
					new File(savePath + at.getChangeName()).delete();
				}
				
				request.setAttribute("errorMsg", "????????? ?????? ??????");
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
