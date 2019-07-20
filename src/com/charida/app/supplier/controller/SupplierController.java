package com.charida.app.supplier.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dto.FoodDto;
import com.charida.app.supplier.service.SupplierService;

@Controller
public class SupplierController {
	
	protected Log log = LogFactory.getLog(TestService.class);

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
		String mem_id =  (String) req.getSession().getAttribute("mem_id");
		if(mem_id == null || mem_id.equals("")) {
			mem_id = "test" ;
		}
		List<Map<String,Object>> servlist = supplierService.getServiceList("test");
		req.setAttribute("servlist", servlist);
		req.setAttribute("servlistsize", servlist.size());
		//세션 하면 이거 진행
		req.setAttribute("mem_id",  "test");
		req.setAttribute("suppfoodlist", supplierService.getFoodList("test"));
		req.setAttribute("suppfoodlistsize", supplierService.getFoodList("test").size());
		return "/supplier/servListForSuggest" ;
	}
	@RequestMapping("/supplier/servlistserch.do")
	@ResponseBody
	public Map<String,Object> searchServList(HttpServletRequest req, HttpServletResponse resp){
		Map<String,String> param = new HashMap<String, String>();
		param.put("stdate",req.getParameter("stdate") );
		param.put("eddate", req.getParameter("eddate")) ;
		String mem_id =  (String) req.getSession().getAttribute("mem_id");
		if(mem_id == null || mem_id.equals("")) {
			mem_id = "test" ;
		}
		param.put("mem_id", "test");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data",  supplierService.getSearchServList(param)) ;
		result.put("menulist",supplierService.getFoodList("test") ) ;
		return result ;
	}
	@RequestMapping("/supplier/suggmenu.do")
	@ResponseBody
	public Map<String,String> setSuggest(HttpServletRequest req, HttpServletResponse resp){
		JSONArray json = new JSONArray(req.getParameter("suggarr"));
		List<Object> list = json.toList() ;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mem_id", req.getParameter("mem_id")) ;
		param.put("per_bud", req.getParameter("per_bud"));
		param.put("menulist", list) ;
		int result = supplierService.setSuggestTx(param);
		Map<String, String> resultMap = new HashMap<String, String>();
		if(result ==  0) {
			resultMap.put("result", "제안중 오류가 발생했습니다. 다시시도해주세요.") ;
		}else {
			resultMap.put("result", "제안이 완료되었습니다.") ;
		}
		return resultMap;
	}
	@RequestMapping("/supplier/modifyDefaultInfo.do")
	public String supplierModifyDefaultInfo(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/supplier/modifyDefaultInfo";
	}
	
	
}
