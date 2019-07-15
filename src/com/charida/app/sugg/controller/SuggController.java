package com.charida.app.sugg.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.controller.CommonController;
import com.charida.app.sugg.service.SuggService;

@Controller
public class SuggController extends CommonController{
	@Resource
	private SuggService suggService;
	
	@RequestMapping("/sugg/suggestions-list.do")
	public String onLoad(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getSession().getServletContext().getRealPath("/"));
		
		req.setAttribute("suggList", suggService.getList(getParameterMap(req,true))); 
		return "/sugg/suggestions-list";
	}
}
