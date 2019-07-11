package com.charida.app.serv.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.charida.app.serv.service.ApplicationService;

@Controller
public class ApplicationController {
	@Resource
	private ApplicationService applicationService;
	
	@RequestMapping("/service/application.do")
	public String home(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/application";
	}
	
	/*
	 * @RequestMapping("/service/result.do") public String result(HttpServletRequest
	 * req,HttpServletResponse resp) { //Map<String, String[]> params =
	 * req.getParameterMap(); Map<String,Object> params = getParameterMap(req);
	 * 
	 * //params.put("sessionId", new String[]
	 * {(String)req.getSession().getAttribute("id")}); params.put("sessionId",
	 * (String)req.getSession().getAttribute("id")); String appid =
	 * applicationService.applicationTx(params); req.setAttribute("appid", appid);
	 * req.setAttribute( View.RESPONSE_STATUS_ATTRIBUTE,
	 * HttpStatus.TEMPORARY_REDIRECT); return "redirect:/service/resultFrom.do"; }
	 */
	@RequestMapping("/service/result.do")
	public RedirectView result(HttpServletRequest req,HttpServletResponse resp,RedirectAttributes attributes) {
		//Map<String, String[]> params = req.getParameterMap();
		Map<String,Object> params = getParameterMap(req);
		System.out.println(req.getSession().getAttribute("authority"));
		params.put("sessionId", (String)req.getSession().getAttribute("id"));
		String appId = applicationService.applicationTx(params);
		attributes.addAttribute("appId", appId);
		attributes.addFlashAttribute("appId2", appId);
		return new RedirectView("/service/resultFrom.do",false,true,true);
	}
//	@RequestMapping("/service/result.do")
//	public ModelAndView result(HttpServletRequest req,HttpServletResponse resp) {
//		Map<String,Object> params = getParameterMap(req);
//		
//		params.put("sessionId", (String)req.getSession().getAttribute("id"));
//		String appId = applicationService.applicationTx(params);
//		
//		ModelAndView mav = new ModelAndView();
//
//		RedirectView redirectView = new RedirectView(); // redirect url 설정
//		redirectView.addStaticAttribute("appId2", appId);
//		redirectView.setUrl("/service/resultFrom.do");
//		redirectView.setExposeModelAttributes(false);
//		mav.addObject("appId", appId);
//		mav.setView(redirectView);
//		
//		return mav;
//	}
	
	@RequestMapping("/service/resultFrom.do")
	public String resultForm(HttpServletRequest req,HttpServletResponse resp
			,@ModelAttribute("appId") String appId,ModelMap modelMap,Model model) {
		System.out.println("aa"+appId);
		System.out.println(modelMap.get("appId"));
		String bb =(String)modelMap.get("appId2");
		System.out.println(bb);
		if(bb!=null) req.setAttribute("appId2", bb);
		
		Iterator<String> aa = modelMap.keySet().iterator();
		while(aa.hasNext()) {
			String key = aa.next();
			System.out.println("111"+key);
			System.out.println(modelMap.get(key));
		}
		System.out.println(model.asMap());
		System.out.println(req.getAttribute("appId"));
		return "forward:/aa/bb.do";
	}
	
	@RequestMapping("/aa/bb.do")
	public String dd(HttpServletRequest req,HttpServletResponse resp
			,@ModelAttribute("appId") String appId,ModelMap modelMap,Model model) {
		System.out.println("aa"+appId);
		System.out.println(modelMap.get("appId"));
		String bb =(String)modelMap.get("appId2");
		System.out.println(bb);
		if(bb!=null) req.setAttribute("appId2", bb);
		
		Iterator<String> aa = modelMap.keySet().iterator();
		while(aa.hasNext()) {
			String key = aa.next();
			System.out.println("111"+key);
			System.out.println(modelMap.get(key));
		}
		System.out.println(model.asMap());
		System.out.println(req.getAttribute("appId"));///service/result
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
