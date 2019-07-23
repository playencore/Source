package com.charida.app.login.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.login.service.LoginService;

@Controller
public class LoginController {
	
	@Resource
	LoginService loginService;
	
	@RequestMapping("/login/loginForm.do")
	public String home(HttpServletRequest req,HttpServletResponse resp) {
		return "/login/loginForm";		
	}
	//로그인 체크
	@RequestMapping("/login/loginCheck.do")
	public String loginPro(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		String id = req.getParameter("id") ; // Form에서 S넘어온 id 값.
		String passwd = req.getParameter("passwd");
		String session = loginService.authority(id);
		String name = loginService.name(id);
		
		int result = loginService.checkPasswd(id, passwd);
		
		if(result == 1) {
			req.getSession().setAttribute("session_authority", session);
			req.getSession().setAttribute("session_name", name);
			req.getSession().setAttribute("session_id", id);
			return "/main";
		}else if(result == -1) {
			req.setAttribute("test", -1);
			return "/login/loginForm";
		}else {
			req.setAttribute("test", 0);
			return "/login/loginForm";
		}
	}
	@RequestMapping("/login/kakaoLogin.do")
	@ResponseBody
	public String kakaoLogin(@RequestParam("kakao_key")String kakao_key, HttpServletRequest req, HttpServletResponse resp) {
		int result = loginService.countKakaoId(kakao_key);	//카카오키를 카카오키와 비교하는 count문
				
		if(result == 1) {
			String id = loginService.getId(kakao_key);
			String session = loginService.authority(id);
			String name = loginService.name(id);
			req.getSession().setAttribute("session_authority", session);//세션등록
			req.getSession().setAttribute("session_name", name);
			req.getSession().setAttribute("session_id", id);
			return "/main.do";
		}else {
			req.setAttribute("kakao", 0);
			return "/login/loginForm.do?kakao=0";
		}
	}	
	@RequestMapping("/login/logout.do")
	public String logoutPro(HttpServletRequest req,HttpServletResponse resp) {
			req.getSession().removeAttribute("session_authority");//세션제거
			req.getSession().removeAttribute("session_name");
			req.getSession().removeAttribute("session_id");
		return "/main";
	}
}