package com.charida.app.component.mail;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class MailComponent {
	public void sendMail(String email,String content) {
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");//25
		props.put("mail.smtp.starttls.enable", "true");
		
		Session mailSession = Session.getInstance(props, 
				new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("hompage1234", "hompage1!2@");
					}
				});
		
		MimeMessage msg = new MimeMessage(mailSession);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("hompage1234@gmail.com","WebMaster"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			msg.setSubject("회원 가입 인증 메일 입니다.", "UTF-8");
			msg.setText(content, "UTF-8");
			
			System.out.println("email : " + email);
			System.out.println("content : " + content);
			
			System.out.println("Component Send start");
			Transport.send(msg);
			System.out.println("Component Send end");
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
