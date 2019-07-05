package com.charida.app.join.controller;

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

@Controller
public class JoinController {
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	private JoinService joinService;
	
	
	
	// 회원가입에 사용할 플렛폼 선택 페이지(1=일반, 2=카카오, 3=네이버)
	@RequestMapping(value="/join/join-select-platformtype.do")
	public String platformtype(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/join/join-select-platformtype";
	}
	
	// 회원가입에서 회원의 가입유형 선택 페이지(1=구매자, 2=판매자)
	@RequestMapping("/join/join-select-membertype.do")
	public String membertype(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/join/join-select-membertype";
	}
	
	@RequestMapping("/join/join-start.do")
	public String start(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "/join/join-start";
	}
	
	// 회원가입시 기본정보 입력받는 페이지(구매자, 판매자 공통)
	@RequestMapping(value="/join/join-basic.do")
	public String basic(HttpServletRequest req,HttpServletResponse resp) {
		return "/join/join-basic";
	}
	
	@RequestMapping(value="/join/join-basic/checkid.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String ableidCheck(HttpServletRequest req,HttpServletResponse resp) {
		String id = req.getParameter("id");
		// 아이디 중복 확인
		String result = joinService.isOnly(id);
		return result;
	}
	
	@RequestMapping("/join/join-end.do")
	public String join(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/join/join-end";
	}
	@RequestMapping("/join/join-detail.do")
	public String detail(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/join/join-detail";
	}
	
	// error code page
	@RequestMapping("/join/join-error.do")
	public String error(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/join/join-error";
	}
	
}
