package com.kh.adoption.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.adoption.model.service.AdoptionService;
import com.kh.adoption.model.vo.Animal;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AnimalUpdateController
 */
@WebServlet("/update.an")
public class AnimalUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/adoption_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int animalNo = Integer.parseInt(multiRequest.getParameter("animalNo"));
			String categoryNo = multiRequest.getParameter("categoryNo");
			String animalName = multiRequest.getParameter("animalName");
			String gender = multiRequest.getParameter("gender");
			String neutralization = multiRequest.getParameter("neuturalization");
			int animalAge = Integer.parseInt(multiRequest.getParameter("animalAge"));
			double weight = Double.parseDouble(multiRequest.getParameter("weight"));
			int friendly = Integer.parseInt(multiRequest.getParameter("friendly"));
			int active = Integer.parseInt(multiRequest.getParameter("active"));
			String adopted = multiRequest.getParameter("adopted");
			String description = multiRequest.getParameter("description");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			Animal a = new Animal(animalNo, categoryNo, animalName, gender, neutralization, animalAge, 
		              weight, friendly, active, adopted, description, userNo);			
			
			ArrayList<Attachment> list = new ArrayList();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				String originKey = "originFileNo" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) { // 첨부 파일이 있는 경우
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/adoption_upfiles/");
				
					if(multiRequest.getParameter(originKey)!=null) {
						at.setFileNo(Integer.parseInt(multiRequest.getParameter(originKey)));
						new File(savePath + multiRequest.getParameter(originKey)).delete();
					}
					
					if(i == 1) {
						at.setFileLevel(1);
					} else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}// for

			// case 1 : 새로운 첨부파일 x => a, null =>  UPDATE
			// case 2 : 새로운 첨부파일 O, 기존 첨부파일 O => ANIMAL UPDATE, ATTACHMENT UPDATE
			
			int result = new AdoptionService().updateAnimal(a, list);
			
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg","게시글이 수정되었습니다");
				response.sendRedirect(request.getContextPath()+"/detail.an?ano="+animalNo);
			}else {
				request.setAttribute("alertMsg", "게시글 수정 실패");
				request.getRequestDispatcher("views/adoption/animalDetailView.jsp").forward(request, response);
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
