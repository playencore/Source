package com.charida.app.serv.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	@RequestMapping("/service/pay-list.do")
	public String resultForm(HttpServletRequest req) {
		req.setAttribute("payList", applicationService.getPayList(getParameterMap(req,true),req));
		return "/service/pay-list";
	}
	@RequestMapping("/service/getPayInfo.do")
	@ResponseBody
	public Map<String, Object> getPayInfo(@RequestParam("suggId") String suggId){
		return applicationService.getPayInfo(suggId);
	}
	@RequestMapping("/service/kakao-pay.do")
	@ResponseBody
	public Map<String, Object> getPayInfo(HttpServletRequest req){
		return applicationService.getPayPage(getParameterMap(req,true),req);
	}
	@RequestMapping("/service/kakao-approve.do")
	public String kakaoReq(@RequestParam("pg_token") String token
			,@SessionAttribute("partner_order_id")String servId
			,@SessionAttribute("session_id")String memId
			,@SessionAttribute("tid")String tid
			,ModelMap modelMap) {
		
		modelMap.addAttribute("approveInfo", applicationService.kakaoApproveTx(servId,memId,tid,token));
		return "/service/result-pay";
	}
}
