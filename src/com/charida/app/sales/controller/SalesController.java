package com.charida.app.sales.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.charida.app.common.controller.CommonController;
import com.charida.app.sales.service.SalesService;

@Controller
public class SalesController extends CommonController{
	@Resource
	private SalesService salesService;
	
	@RequestMapping("/sales/sales-management.do")
	public String onLoad(HttpServletRequest req) {
		
		return "/sales/sales-management";
	}
	@RequestMapping("/sales/sales-management/graph.do")
	@ResponseBody
	public List<Map<String, Object>> getGraph(
			 @SessionAttribute("session_id")String memId
			,@RequestParam("startDate")String startDate
			,@RequestParam("endDate")String endDate
			,@RequestParam("colCondition")String colCondition){

		return salesService.getSaleList(memId,startDate,endDate,colCondition);
	}
	@RequestMapping("/sales/sales-management/table.do")
	@ResponseBody
	public List<Map<String, Object>> getTable(
			 @SessionAttribute("session_id")String memId
			,@RequestParam("startDate")String startDate
			,@RequestParam("endDate")String endDate){

		return salesService.getsaleInfo(memId, startDate, endDate);
	}
}
