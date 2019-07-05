package com.charida.app.login.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.component.login.LoginComponent;
import com.charida.app.login.service.LoginService;

@Controller
public class LoginController {
	private final static String returnUrl = "/login/loginForm";
	
	@Resource
	LoginService loginService;
	@Resource
	LoginComponent loginComponent;


	
	@RequestMapping("/login/loginForm.do")
	public String home(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return returnUrl;
		
	}
	@RequestMapping("/login/loginCheck.do")
	public String loginPro(HttpServletRequest req,HttpServletResponse resp) throws IOException {
//		System.out.println(req.getParameter("id"));
//		System.out.println((String)req.getAttribute("id"));
		String id = req.getParameter("id") ; // Form에서 S넘어온 id 값.
		String passwd = req.getParameter("passwd");
		String session = loginComponent.authority(id);
		String name = loginComponent.name(id);
		
		int result = loginService.checkPasswd(id, passwd);
		if(result == 1) {
			req.getSession().setAttribute("authority", session);//세션등록
			req.getSession().setAttribute("name", name);
			return "/login/loginPro";
		}else if(result == -1) {
			req.setAttribute("test", -1);
			return "/login/loginForm";
		}else {
			req.setAttribute("test", 0);
			return "/login/loginForm";
		}
	}
	@RequestMapping("/login/logout.do")
	public String logoutPro(HttpServletRequest req,HttpServletResponse resp) {
			req.getSession().removeAttribute("authority");
			req.getSession().removeAttribute("name");
		return "/login/loginForm";
	}
}
