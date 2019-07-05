package com.charida.app.login.controller;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.service.TestService;
import com.charida.app.login.service.LoginService;

@Controller
public class LoginController {
	private final static String returnUrl = "/login/loginForm";
	
	@Resource
	LoginService loginService;


	
	@RequestMapping("/login/loginForm.do")
	public String home(Locale locale, Model model,HttpServletRequest req) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return returnUrl;
		
	}
	@RequestMapping("/login/loginCheck.do")
	public String loginPro(Locale locale, Model model,HttpServletRequest req) {
//		System.out.println(req.getParameter("id"));
//		System.out.println((String)req.getAttribute("id"));
		String id = req.getParameter("id") ; // Form에서 S넘어온 id 값.
		String passwd = req.getParameter("passwd");
		

		int result = loginService.checkPasswd(id, passwd);
		if(result == 1) {
			req.getSession().setAttribute("id", 1);//세션등록
			return "/login/loginPro";
		}else {
			return "/login/loginForm";
		}
	}
}
