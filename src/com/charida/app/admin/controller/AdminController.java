package com.charida.app.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.admin.service.AdminService;
import com.charida.app.common.controller.CommonController;
import com.charida.app.common.service.TestService;
import com.charida.app.supplier.service.SupplierService;

@Controller
public class AdminController extends CommonController {
	
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	SupplierService supplierService ;
	@Resource
	AdminService adminService;
	
	@RequestMapping("/admin/notPermissionList.do")
	public String manageSupplier(HttpServletRequest req, HttpServletResponse resp) {
		
		List<Map<String, String>> notPermissionSuppliers = adminService.getNotPerMissionSuppliers(getParameterMap(req,true),req) ;
		req.setAttribute("notPermissionSuppliers", notPermissionSuppliers);
		req.setAttribute("listsize", notPermissionSuppliers.size());
		return "/admin/notPermissionList";
	}
	
	@RequestMapping("/admin/updatepermissionSupplier.do")
	public String updatePermission(HttpServletRequest req, HttpServletResponse resp) {
		String result = adminService.updatePermissionTx(req.getParameterMap());
		req.setAttribute("result", result);
	
		return "/admin/updateSupplierPermission";
	}
	@RequestMapping("/admin/supplierSearch.do")
	public String supplierSerch(HttpServletRequest req, HttpServletResponse resp) {
		return "/admin/supplierSearch";
	}
	
	@RequestMapping("/admin/serchsupplierajax.do")
	@ResponseBody
	public List<Object> searchSupplierAjax(HttpServletRequest req, HttpServletResponse resp){
		return  adminService.getSerhchResult(getParameterMap(req,true), req);
	}
	
	// feedback - ana
	@RequestMapping("/admin/appAnalysis.do")
	public String AppAnalsysis(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("ALLSERVINFO", adminService.getInfoAll());
		return "/admin/appAnalysis" ;
	}
	
	
}
