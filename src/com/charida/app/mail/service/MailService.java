package com.charida.app.mail.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.mail.MailComponent;

@Service
public class MailService {
	@Resource
	MailComponent mailComponent;

	public void sendMail(String mail, String content) {
		
		mailComponent.sendMail(mail, content);
		
	}
}
