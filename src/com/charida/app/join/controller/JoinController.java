package com.charida.app.join.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.common.service.TestService;
import com.charida.app.join.service.JoinService;
import com.charida.app.mail.service.MailService;

@Controller
public class JoinController {
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	private JoinService joinService;
	@Resource
	private MailService mailService;
	
	// 회원가입시 기본정보 입력받는 페이지(구매자, 판매자 공통)
	@RequestMapping(value="/joinuser/joinmember.do")
	public String dopageBasic(HttpServletRequest req,HttpServletResponse resp) {
		//model.addAttribute("serverTime", formattedDate );
		return "/join/joinmemberform";
	}

	@RequestMapping(value="/join/join-basic/checkid.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String serviceIdCheck(HttpServletRequest req,HttpServletResponse resp) {
		log.debug("JoinController > serviceIdCheck : 아이디중복확인 시작");
		String id = req.getParameter("id");
		// 아이디 중복 확인
		String result = joinService.isOnly(id);
		return result;
	}
	@RequestMapping("/join/join-end.do")
	public String dopageJoin(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/join/join-end";
	}
	// 이메일 전송
	@RequestMapping(value="/mail/send-mail.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public void serviceSendMail(HttpServletRequest req,HttpServletResponse resp) {
		String mail = req.getParameter("mail");
		String content = req.getParameter("content");
		// 이메일 전송
		mailService.sendMail(mail, content);
	}
	// 회원가입
	@RequestMapping(value="/join/join-result.do", produces = "text/plain; charset=utf-8")
	public String serviceJoinMember(HttpServletRequest req,HttpServletResponse resp) {
		log.debug("joinController > serviceJoinMember : " + "시작");
		String result = "";
		int req_result = joinService.joinMember( getParameterMap(req) );
		if(req_result == 0) {
			//실패페이지
			result = "";
		} else {
			//가입성공 페이지
			result = "login/loginForm";
		}
		log.debug("joinController > serviceJoinMember : " + "종료");
		return result;
	}
	public Map<String, Object> getParameterMap(HttpServletRequest req){
		Map<String, Object> params = new HashMap<String, Object>();
		Enumeration<String> keys= req.getParameterNames();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			if(key.indexOf("cb")!=-1 || key.indexOf("sb")!=-1) { //배열값
				params.put(key,req.getParameterValues(key));
			}else {
				params.put(key,req.getParameter(key));
			}
		}
		return params;
	}
	
}
