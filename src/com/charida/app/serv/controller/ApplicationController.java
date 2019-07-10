package com.charida.app.serv.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.serv.service.ApplicationService;

@Controller
public class ApplicationController {
	@Resource
	private ApplicationService applicationService;
	
	@RequestMapping("/service/application.do")
	public String home(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/application";
	}
	
	@RequestMapping("/service/result.do")
	public String result(HttpServletRequest req,HttpServletResponse resp) {
		
		applicationService.application(req.getParameterMap());
		
		return "/service/result";
	}
}
