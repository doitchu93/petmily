package com.kh.common.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.service.AuthenticationService;
import com.kh.common.model.vo.Authentication;

import static com.kh.common.RandomCodeGenerator.*;

/**
 * Servlet implementation class MemberSendEmailController
 */
@WebServlet("/sendEmail.ac")
public class AjaxAuthenticaionSendEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAuthenticaionSendEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자가 입력한 이메일
		String inputEmail = request.getParameter("inputEmail");
		
		// 숫자, 영문 소문자, 대문자가 섞인 10자리 랜덤코드
		String randomCode = getRandomCode();
		
		Authentication list = new Authentication(inputEmail, randomCode);
		
		// 이메일을 보내는 계정
		String mailId = "petmily2022@gmail.com";
		
		// 구글 보안 앱 비밀번호
        String mailPwd = "tkboircepacbfgqu";
        
        // SMTP 서버 정보를 설정
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
        	
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailId, mailPwd);
            }
        });
        try {
        	
            MimeMessage msg = new MimeMessage(session);
            
            // 보내는 사람
            msg.setFrom(new InternetAddress(mailId));

            // 받는 사람
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(inputEmail)); 

            // 제목
            msg.setSubject("PETMILY 인증번호");

            // 내용
            msg.setText("안녕하세요. \n\n인증번호는 " + randomCode + " 입니다.\n\n감사합니다.");

            // 전송
            Transport.send(msg);
            System.out.println("인증번호 이메일 전송 성공");
            
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        int result = new AuthenticationService().insertAuthentication(list);
        
        response.setContentType("text/html; charset=UTF-8");
        
        response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
