package com.charida.app.sugg.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.charida.app.common.controller.CommonController;
import com.charida.app.sugg.service.SuggService;

@Controller
public class SuggController extends CommonController{
	@Resource
	private SuggService suggService;
	
	@RequestMapping("/sugg/suggestions-list.do")
	public String onLoad(HttpServletRequest req,HttpServletResponse resp) {
		
		req.setAttribute("suggList", suggService.getList(getParameterMap(req,true),req)); 
		return "/sugg/suggestions-list";
	}
	
	@RequestMapping("/sugg/getSuggestInfo.do")
	@ResponseBody
	public Map<String, Object> getSuggInfo(@RequestParam("suggId") String suggId){
		return suggService.getSuggInfo(suggId);
	}
	
	@RequestMapping("/sugg/getWaitInfo.do")
	@ResponseBody
	public Map<String, Object> getWaitInfo(@RequestParam("suggId") String suggId){
		return suggService.getWaitInfo(suggId);
	}
	@RequestMapping("/sugg/getShippingInfo.do")
	@ResponseBody
	public Map<String, Object> getShippingInfo(@RequestParam("suggId") String suggId){
		return suggService.getShippingInfo(suggId);
	}
	@RequestMapping("/sugg/waiting-payment.do")
	public String onload(HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("waitList", suggService.getWaitList(getParameterMap(req,true),req)); 
		return "/sugg/waiting-payment";
	}
	
	@RequestMapping("/sugg/preparing-service.do")
	public String getPreparingList( HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("preparingList", suggService.getPreparingList(getParameterMap(req,true),req)); 
		return "/sugg/preparing-service";
	}
	@RequestMapping(value="/sugg/start-shipping.do")
	public RedirectView startShipping(HttpServletRequest req,RedirectAttributes attr) {
		String msg = suggService.startShippingTx(getParameterMap(req,false));
		attr.addFlashAttribute("msg", msg);
		return new RedirectView("/sugg/shipping-list.do");
	}
	@RequestMapping("/sugg/cmplt-shipping.do")
	public RedirectView cmpltShipping(HttpServletRequest req,RedirectAttributes attr) {
		String msg = suggService.cmpltShippingTx(getParameterMap(req,false));
		System.out.println(msg);
		attr.addFlashAttribute("msg", msg);
		return new RedirectView("/sugg/shipping-list.do");
	}
	
	@RequestMapping("/sugg/shipping-list.do")
	public String shippingList(HttpServletRequest req,@ModelAttribute("msg") String sendMsg) {
		System.out.println(sendMsg);
		if(sendMsg != null) {
			req.setAttribute("msg", sendMsg);
		}
		req.setAttribute("shippingList", suggService.getShippingList(getParameterMap(req,true),req)); 
		return "/sugg/shipping-list";
	}
	
	
	/*
	 * @RequestMapping(value="/sugg/startShipping.do") public String
	 * startShipping(HttpServletRequest req) { String msg =
	 * suggService.startShippingTx(getParameterMap(req,false));
	 * req.setAttribute("url", "/sugg/preparing-service.do");
	 * req.setAttribute("msg", msg); return "/common/redirect-page"; }
	 */
}
