package com.charida.app.login.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.auth.SNSLogin;
//import com.charida.app.auth.SnsValue;
import com.charida.app.component.login.LoginComponent;
import com.charida.app.login.dao.LoginDao;
import com.charida.app.login.service.LoginService;

@Controller
public class LoginController {
	//private final static String returnUrl = "";
	
	@Resource
	LoginService loginService;
	@Resource
	LoginComponent loginComponent;
	@Resource
	LoginDao loginDao;
	//@Resource
	//private SnsValue naverSns;

	
	@RequestMapping("/login/loginForm.do")
	public String home(Model model,HttpServletRequest req,HttpServletResponse resp) {
		
		//네이버로그인
//		SNSLogin  snsLogin = new SNSLogin(naverSns);
//		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
		
		return "/login/loginForm";
		
	}
	//로그인 체크
	@RequestMapping("/login/loginCheck.do")
	public String loginPro(HttpServletRequest req,HttpServletResponse resp) throws IOException {
//		System.out.println(req.getParameter("id"));
//		System.out.println((String)req.getAttribute("id"));
		String id = req.getParameter("id") ; // Form에서 S넘어온 id 값.
		String passwd = req.getParameter("passwd");
		String session = loginComponent.authority(id);
		String name = loginComponent.name(id);
		
		//카카오로그인이랑 일반로그인이랑 따로 처리해야 충돌이 일어나지 않는다. 수정요망!
		int result = loginService.checkPasswd(id, passwd);
		
		if(result == 1) {
			req.getSession().setAttribute("session_authority", session);//세션등록
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
	public String kakaoLogin(@RequestParam("kakao_key")String kakao_key, HttpServletRequest req, HttpServletResponse resp) {
		String id = loginDao.getId(kakao_key);
		int result = loginComponent.countKakaoId(id);
		String session = loginComponent.authority(id);
		String name = loginComponent.name(id);
		
		if(result == 1) {
			req.getSession().setAttribute("session_authority", session);//세션등록
			req.getSession().setAttribute("session_name", name);
			req.getSession().setAttribute("session_id", id);
			return "/main";
		}else {
			return "/login/loginForm";
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