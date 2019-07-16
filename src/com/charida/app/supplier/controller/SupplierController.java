package com.charida.app.supplier.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.supplier.dto.FoodDto;
import com.charida.app.supplier.service.SupplierService;

@Controller
public class SupplierController {

	@Resource
	SupplierService supplierService;

	@RequestMapping("/supplier/setfood.do")
	public String setFood(HttpServletRequest req, HttpServletResponse resp) {
		
		List<FoodDto> foodList = supplierService.getFoodList("test") ;
		req.setAttribute("foodList", foodList);
		req.setAttribute("listsize", foodList.size());
		return "/supplier/setFood";
	}

	@RequestMapping("/supplier/setfoodPro.do")
	public String setFoodPro(HttpServletRequest req, HttpServletResponse resp) {
		
		String maxSeq = supplierService.getFoodMaxSeq() ;
		if(maxSeq == null || maxSeq.equals("")) {
			maxSeq = "0" ;
		}
		int menu_id = Integer.parseInt(maxSeq) +1 ;
		FoodDto dto = new FoodDto();
		dto.setMem_id(req.getParameter("mem_id"));
		dto.setMenu_id(menu_id);
		dto.setName(req.getParameter("name"));
		dto.setExplanation(req.getParameter("explanation"));
		dto.setFile_id((Integer)req.getAttribute("file_id1"));
		dto.setWeight(Integer.parseInt(req.getParameter("weight")));
		
		int result = supplierService.setFoodTx(dto);
		req.setAttribute("result", result);
		
		return "/supplier/setFoodPro";
	}
	@ResponseBody
	@RequestMapping("/supplier/fooddelete.do")
	public String deletefood(HttpServletRequest req, HttpServletResponse resp) {
		
		String menu_id  = req.getParameter("menu_id");
		int result = supplierService.deleteFoodTx(menu_id) ;
		if(result == 0) {
			return "삭제에 실패했습니다" ;
		}else {
			return "삭제에 성공했습니다" ;
		}
		
	}
	@RequestMapping("/supplier/modifymenu.do")
	public String modifyMenu(HttpServletRequest req, HttpServletResponse resp) {
		
		FoodDto dto = new FoodDto();
		dto.setMem_id(req.getParameter("mmem_id"));
		dto.setMenu_id(Integer.parseInt(req.getParameter("mmenu_id")));
		dto.setName(req.getParameter("mname"));
		dto.setExplanation(req.getParameter("mexplanation"));
		dto.setFile_id((Integer)req.getAttribute("file_id1"));
		dto.setWeight(Integer.parseInt(req.getParameter("mweight")));
		
		int result = supplierService.modifyMenu(dto);
		req.setAttribute("result", result);
		
		return "/supplier/modifyMenu";
	}
	
	@RequestMapping("/supplier/servlistforsuggest.do")
	public String suggestListForSuggest(HttpServletRequest req, HttpServletResponse resp) {
		List<Map<String,Object>> servlist = supplierService.getServiceList();
		req.setAttribute("servlist", servlist);
		req.setAttribute("servlistsize", servlist.size());
		return "/supplier/servListForSuggest" ;
	}
	@RequestMapping("/supplier/servlistserch.do")
	@ResponseBody
	public List<Map<String,Object>> searchServList(HttpServletRequest req, HttpServletResponse resp){
		Map<String,String> param = new HashMap<String, String>();
		param.put("stdate",req.getParameter("stdate") );
		param.put("eddate", req.getParameter("eddate")) ;
		return supplierService.getSearchServList(param);
	}
	
	
}
