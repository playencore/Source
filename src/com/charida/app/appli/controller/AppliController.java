package com.charida.app.appli.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.appli.service.AppliService;
import com.charida.app.common.controller.CommonController;
import com.charida.app.common.service.TestService;

@Controller
public class AppliController extends CommonController{
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	private AppliService appliservice;
	
	// 1.구매자 입장에서 매칭 신청중인 건을 보는 페이지
	@RequestMapping("/service/cus-app-list.do")
	public String cusapp(HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("appliList", appliservice.getList(getParameterMap(req,true), req));
		return "/service/cus-app-list";
	}	
	// 2.매칭은 됐으나 결제가 되지 않은 건을 보는 페이지
	@RequestMapping("/service/cus-pay-list.do")
	public String cuspay(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-pay-list";
	}	
	// 3.결제는 됐으나 배송이 되지 않은 건을 보는 페이지
	@RequestMapping("/service/cus-deli-list.do")
	public String cusdeli(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-deli-list";
	}
}
