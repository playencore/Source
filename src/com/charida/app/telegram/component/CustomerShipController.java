package com.charida.app.telegram.component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.common.controller.CommonController;

@Controller
public class CustomerShipController extends CommonController  {
	
	@Resource
	CustomerShipService customerShipService ;
	
	@RequestMapping("/service/cus-deli-list.do")
	public String cusdeli(HttpServletRequest req,HttpServletResponse resp) {
		
		List<Map<String, Object>> result  = customerShipService.getShipServList(getParameterMap(req,true), req) ;
		req.setAttribute("result", result);
		return "/service/cus-deli-list";
	}
	
	@RequestMapping("/shipstatus/complete.do")
	@ResponseBody
	public Map<String,Object> shipStatusComplete(HttpServletRequest req,HttpServletResponse resp){
		String serv_id = req.getParameter("suggId") ;
		int result = customerShipService.updateStatusComplete(serv_id);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result) ;
		return resultMap ;
	}
	
}
