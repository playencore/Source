package com.charida.app.appli.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.appli.service.AppliService;

@Controller
public class AppliController {
	@Resource
	private AppliService appliservice;
	// 구매자가 서비스를 신청한 일련의 과정을 선택해서 볼 수 있도록 해주는 페이지
	@RequestMapping("/service/cus-serv-status.do")
	public String customerhome(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-serv-status";
	}	
	// 구매자 입장에서 매칭 신청중인 건을 보는 페이지
	@RequestMapping("/service/cus-app-list.do")
	public String cusapp(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-app-list";
	}	
	// 매칭은 됐으나 결제가 되지 않은 건을 보는 페이지
	@RequestMapping("/service/cus-pay-list.do")
	public String cuspay(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-pay-list";
	}	
	// 결제는 됐으나 배송이 되지 않은 건을 보는 페이지
	@RequestMapping("/service/cus-deli-list.do")
	public String cusdeli(HttpServletRequest req,HttpServletResponse resp) {
		
		return "/service/cus-deli-list";
	}
}
