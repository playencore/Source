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
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.common.service.TestService;
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
		Map<String, String[]> supplierMap = req.getParameterMap();
		String cert_file_id[] = {Integer.toString((Integer)req.getAttribute("file_id1"))} ;
		String supplierInfoFile[] = new String[3] ;
		for(int i = 2 ; i<5 ; i++) {
			if(req.getAttribute("file_id"+i)!=null) {
				supplierInfoFile[i-2] = Integer.toString((Integer)req.getAttribute("file_id"+i)) ;
			}
		}
			
		supplierMap.put("cert_file_id",cert_file_id ) ;
		supplierMap.put("supplierInfoFile",supplierInfoFile) ;
		int result = supplierService.setSupplierTx(supplierMap) ;
		req.setAttribute("result", result);
		return "/joinUser/joinSupplierPro";
	}
	
	@RequestMapping("/joinUser/checkRegist_num.do")
	@ResponseBody
	public Map<String,Object> regist_numCheck(HttpServletRequest req, HttpServletResponse resp){
		
		String regist_num = req.getParameter("regist_num") ;
		String result = supplierService.checkRegist_num(regist_num);
		Map <String,Object> checkRegist_numMap = new HashMap<String, Object>();
		String color=null ;
		if(result.equals("가입 가능한 업체입니다.")) {
			color = "color:green" ;
		}else {
			color = "color:red" ;
		}
		
		
		checkRegist_numMap.put("result",result) ;
		checkRegist_numMap.put("color",color);
		
		return checkRegist_numMap ;
	}
	
}










