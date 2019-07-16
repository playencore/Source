package com.charida.app.sugg.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.common.controller.CommonController;
import com.charida.app.sugg.service.SuggService;

@Controller
public class SuggController extends CommonController{
	@Resource
	private SuggService suggService;
	
	@RequestMapping("/sugg/suggestions-list.do")
	public String onLoad(HttpServletRequest req,HttpServletResponse resp) {
		
		req.setAttribute("suggList", suggService.getList(getParameterMap(req,true))); 
		return "/sugg/suggestions-list";
	}
	
	@RequestMapping("/sugg/getSuggestInfo.do")
	@ResponseBody
	public Map<String, Object> getSuggInfo(@RequestParam("suggId") String suggId){
		return suggService.getSuggInfo(suggId);
	}
}
