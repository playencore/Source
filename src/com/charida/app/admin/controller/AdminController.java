package com.charida.app.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.service.SupplierService;

@Controller
public class AdminController {
	
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	SupplierService supplierService ;
	
	
	@RequestMapping("/admin/manageSupplier.do")
	public String manageSupplier(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/admin/supplierManage";
	}
}
