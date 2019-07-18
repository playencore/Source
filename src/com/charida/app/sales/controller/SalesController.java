package com.charida.app.sales.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesController {
	@RequestMapping("/sales/sales-management.do")
	public String onLoad(HttpServletRequest req) {
		
		return "/sales/sales-management";
	}
}
