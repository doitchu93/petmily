package com.kh.adoption.controller;

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

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.Animal;
import com.kh.common.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AnimalInsertController
 */
@WebServlet("/insert.an")
public class AnimalInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 동물등록
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*120;
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			
			String savePath = application.getRealPath("/resources/adoption_upfiles/");
			
			MultipartRequest multiRequest 
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String categoryNo = multiRequest.getParameter("categoryNo");
			String animalName = multiRequest.getParameter("animalName");
			String gender = multiRequest.getParameter("gender");
			String neutralization = multiRequest.getParameter("neuturalization");
			int animalAge = Integer.parseInt(multiRequest.getParameter("animalAge"));
			double weight = Double.parseDouble(multiRequest.getParameter("weight"));
			int friendly = Integer.parseInt(multiRequest.getParameter("friendly"));
			int active = Integer.parseInt(multiRequest.getParameter("active"));
			String description = multiRequest.getParameter("description");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			Animal a = new Animal(categoryNo, animalName, gender, neutralization, animalAge, 
					              weight, friendly, active, description, userNo);
			 
			ArrayList<Attachment> list = new ArrayList();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/adoption_upfiles/");
				
				if(i == 1) {
					at.setFileLevel(1);
				} else {
					at.setFileLevel(2);
				}
				
				list.add(at);
				}
			}
			
			int result = new AdoptionService().insertAnimal(a, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "등록되었습니다");
				response.sendRedirect(request.getContextPath() + "/main.ad?cpage=1");
			}
			else {
				if(!list.isEmpty()) {
					for(Attachment at : list) {
						new File(savePath + at.getChangeName()).delete();						
					}
				}
				request.getSession().setAttribute("alertMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/adoption/main.ad?cpage=1").forward(request, response);;
				
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
