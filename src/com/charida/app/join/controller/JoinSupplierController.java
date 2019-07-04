package com.charida.app.join.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.service.TestService;
import com.charida.app.join.service.JoinSupplierService;


@Controller
public class JoinSupplierController {
	
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	JoinSupplierService joinSupplierService ;
	
	@RequestMapping("/joinUser/joinSupplier.do")
	public String joinSupplier(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/joinUser/joinSupplier";
	}
	@RequestMapping("/joinUser/joinSupplierPro.do")
	public String joinSupplierPro(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, Object> si = new HashMap<String, Object>() ;
		
		
		return "/joinUser/joinSupplierPro";
	}
	
}
