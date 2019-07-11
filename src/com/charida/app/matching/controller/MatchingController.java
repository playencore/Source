package com.charida.app.matching.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.matching.service.MatchingService;


@Controller
public class MatchingController {
	@Resource
	MatchingService matchingService;

	//매칭실패######################################
	@RequestMapping("/customer/matchingFail.do")
	public String matchingFail(HttpServletResponse resp, HttpServletRequest req) {
		System.out.println(req.getParameter("aa"));
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		List<MatchingDto> matchingFail = matchingService.matchingFail();
		req.setAttribute("matchingFail", matchingFail);
		
		return "/customer/matchingFail";
	}
	
	//매칭성공#######################################
	@RequestMapping("/customer/matchingSuccess.do")
	public String matchingSuccess(HttpServletResponse resp, HttpServletRequest req) {
		System.out.println(req.getParameter("aa"));
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		List<MatchingDto> matchingSuccess = matchingService.matchingSuccess();
		req.setAttribute("matchingSuccess", matchingSuccess);
		
		return "/customer/matchingSuccess";
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
