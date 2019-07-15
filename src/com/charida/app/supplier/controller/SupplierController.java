package com.charida.app.supplier.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.supplier.service.SupplierService;

@Controller
public class SupplierController {
	
	@Resource
	SupplierService supplierService ;
	
	@RequestMapping("/supplier/setfood.do")
	public String setFood(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/supplier/setFood";
	}
	
}
