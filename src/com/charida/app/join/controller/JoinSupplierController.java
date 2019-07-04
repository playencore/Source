package com.charida.app.join.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dto.SupplierDto;
import com.charida.app.supplier.service.SupplierService;


@Controller
public class JoinSupplierController {
	
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	SupplierService supplierService ;
	
	
	@RequestMapping("/joinUser/joinSupplier.do")
	public String joinSupplier(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/joinUser/joinSupplierForm";
	}
	@RequestMapping("/joinUser/joinSupplierPro.do")
	public String joinSupplierPro(HttpServletRequest req, HttpServletResponse resp) {
		
		SupplierDto supplierDto = new SupplierDto() ;
		supplierDto.setMem_id(req.getParameter("supplierId"));
		supplierDto.setRegist_num(Integer.parseInt(req.getParameter("supplierNum")));
		supplierDto.setExplanation(req.getParameter("supplierInfo"));
		supplierDto.setName(req.getParameter("supplierName"));
		supplierDto.setMaximum_seating(Integer.parseInt(req.getParameter("maxPeople")));
		supplierDto.setCert_file_id(111);
		supplierDto.setTelegram_id("telegram");
		
		int result = supplierService.setSupplier(supplierDto) ;
		req.setAttribute("result", result);
		
		return "/joinUser/joinSupplierPro";
	}
	
}
