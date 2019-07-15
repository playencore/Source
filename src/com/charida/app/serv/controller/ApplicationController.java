package com.charida.app.serv.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.charida.app.common.controller.CommonController;
import com.charida.app.serv.service.ApplicationService;

@Controller
public class ApplicationController extends CommonController{
	@Resource
	private ApplicationService applicationService;
	
	@RequestMapping("/service/application.do")
	public String home(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/application";
	}

	@RequestMapping("/service/result.do")
	public RedirectView result(HttpServletRequest req,HttpServletResponse resp,RedirectAttributes attributes) {
		Map<String,Object> params = getParameterMap(req,true);

		String appId = applicationService.applicationTx(params);
		
		attributes.addAttribute("appId", appId);
		return new RedirectView("/service/resultFrom.do",false,true,true);
	}
	
	@RequestMapping("/service/resultFrom.do")
	public String resultForm(HttpServletRequest req,HttpServletResponse resp
			,@ModelAttribute("appId") String appId) {

		return "/service/result";
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
}
