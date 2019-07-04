package com.charida.app.login.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.service.TestService;

@Controller
public class LoginController {
	private final static String returnUrl = "/login/loginForm";
	
	@RequestMapping("/login/loginForm.do")
	public String home(Locale locale, Model model,HttpServletRequest req) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return returnUrl;
	}
}
