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

import com.charida.app.common.controller.CommonController;
import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dto.FoodDto;
import com.charida.app.supplier.dto.FoodStyleDto;
import com.charida.app.supplier.dto.ServiceAreaDto;
import com.charida.app.supplier.dto.ServiceTypeDto;
import com.charida.app.supplier.dto.SupplierDto;
import com.charida.app.supplier.service.SupplierService;

@Controller
public class SupplierController extends CommonController {
	
	protected Log log = LogFactory.getLog(TestService.class);

	@Resource
	SupplierService supplierService;

	@RequestMapping("/supplier/setfood.do")
	public String setFood(HttpServletRequest req, HttpServletResponse resp) {
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		List<FoodDto> foodList = supplierService.getFoodList(getParameterMap(req,true),req) ;
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
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		dto.setMem_id(mem_id);
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
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		FoodDto dto = new FoodDto();
		dto.setMem_id(mem_id);
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
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		
		List<Map<String,Object>> servlist = supplierService.getServiceList(mem_id);
		req.setAttribute("servlist", servlist);
		req.setAttribute("servlistsize", servlist.size());
		req.setAttribute("mem_id", mem_id);
		req.setAttribute("suppfoodlist", supplierService.getFoodListAll(mem_id));
		req.setAttribute("suppfoodlistsize", supplierService.getFoodListAll(mem_id).size());
		return "/supplier/servListForSuggest" ;
	}
	@RequestMapping("/supplier/servlistserch.do")
	@ResponseBody
	public Map<String,Object> searchServList(HttpServletRequest req, HttpServletResponse resp){
		Map<String,String> param = new HashMap<String, String>();
		param.put("stdate",req.getParameter("stdate") );
		param.put("eddate", req.getParameter("eddate")) ;
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		param.put("mem_id", mem_id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data",  supplierService.getSearchServList(param)) ;
		result.put("menulist",supplierService.getFoodListAll(mem_id) ) ;
		return result ;
	}
	@RequestMapping("/supplier/suggmenu.do")
	@ResponseBody
	public Map<String,String> setSuggest(HttpServletRequest req, HttpServletResponse resp){
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		JSONArray json = new JSONArray(req.getParameter("suggarr"));
		List<Object> list = json.toList() ;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mem_id", mem_id) ;
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
		String mem_id =  (String) req.getSession().getAttribute("session_id");
		List<SupplierDto> supplier_info = supplierService.supplier_info(mem_id);
		req.setAttribute("supplier_info", supplier_info);
		List<ServiceTypeDto> serviceType = supplierService.serviceType(mem_id);
		req.setAttribute("serviceType", serviceType);
		List<FoodStyleDto> foodStyle = supplierService.foodStyle(mem_id);
		req.setAttribute("foodStyle", foodStyle);
		List<ServiceAreaDto> serviceArea = supplierService.serviceArea(mem_id);
		req.setAttribute("serviceArea", serviceArea);
		req.setAttribute("mem_id", mem_id);
		return "/supplier/modifyDefaultInfo";
	}
	@RequestMapping("/supplier/modifyDefaultInfoPro.do")
	public String modifyDefaultInfoPro(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, String[]> supplierMap = req.getParameterMap();
		String supplierInfoFile[] = new String[3] ;
		for(int i = 1 ; i<4 ; i++) {
			if(req.getAttribute("file_id"+i)!=null) {
				supplierInfoFile[i-1] = Integer.toString((Integer)req.getAttribute("file_id"+i)) ;
			}
		}		
		supplierService.modifyinfo(supplierMap,supplierInfoFile);		
		
		return "redirect:/supplier/modifyDefaultInfo.do";
	}
	
	@RequestMapping("/joinuser/joinsupplier.do")
	public String joinSupplier(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/joinUser/joinSupplierForm";
	}
	
	@RequestMapping("/joinUser/joinMember.do")
	public String joinMember(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/joinUser/joinMemberForm";
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
