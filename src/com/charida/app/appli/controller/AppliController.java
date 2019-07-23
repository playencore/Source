package com.charida.app.appli.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.appli.service.AppliService;
import com.charida.app.common.controller.CommonController;
import com.charida.app.common.service.TestService;

@Controller
public class AppliController extends CommonController{
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	private AppliService appliService;
	
	// 1-1.구매자 입장에서 매칭 신청중인 건을 보는 페이지(기본 정보 페이지)
	@RequestMapping("/service/cus-app-list.do")
	public String cusapp(HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("appliList", appliService.getList(getParameterMap(req,true), req));
		return "/service/cus-app-list";
	}
	// 1-2.구매자 입장에서 매칭 신청중인 건을 보는 페이지(상세 정보 페이지-js에서 호줄)
	@RequestMapping("/appli/getApplicationInfo.do")
	@ResponseBody
	public Map<String, Object> getAppliInfo(@RequestParam("appliId") String appliId) {
		log.debug("ctrler appliId : " + appliId);
		return appliService.getAppliInfo(appliId);
	} 
	
	// 2.매칭은 됐으나 결제가 되지 않은 건을 보는 페이지
	@RequestMapping("/service/cus-pay-list.do")
	public String cuspay(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-pay-list";
	}	
	// 3.결제는 됐으나 배송이 되지 않은 건을 보는 페이지
	//@RequestMapping("/service/cus-deli-list.do")
	public String cusdeli(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-deli-list";
	}
}
