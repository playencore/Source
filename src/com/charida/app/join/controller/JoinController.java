package com.charida.app.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	
	@RequestMapping("/join/join-main.do")
	public String home(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "/join/join-main";
	}
	@RequestMapping(value="/join/cus-main.do")
	public String d(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/join/cus-main";
	}
	
}
