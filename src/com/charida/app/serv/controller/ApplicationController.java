package com.charida.app.serv.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

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
		//Map<String, String[]> params = req.getParameterMap();
		Map<String,Object> params = getParameterMap(req);
		
		//params.put("sessionId", new String[] {(String)req.getSession().getAttribute("id")});
		params.put("sessionId", (String)req.getSession().getAttribute("id"));
		applicationService.application(params);
		return "/service/result";
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
