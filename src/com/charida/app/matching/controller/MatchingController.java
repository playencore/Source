package com.charida.app.matching.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.charida.app.matching.dao.MatchingDao;
import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.matching.service.MatchingService;


@Controller
public class MatchingController {
	@Resource
	MatchingService matchingService;
	@Resource
	MatchingDao matchingDao;

	//구매자 매칭실패리스트
	@RequestMapping("/customer/matchingFail.do")
	public String customerMatchingFail(HttpServletResponse resp, HttpServletRequest req) {
		System.out.println(req.getParameter("aa"));
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		String id = (String)req.getSession().getAttribute("session_id");
		
		List<MatchingDto> matchingFail = matchingService.matchingFail(id);
		req.setAttribute("matchingFail", matchingFail);
		
		return "/customer/matchingFail";
	}
	//구매자 재신청
	@RequestMapping("/customer/application.do")
	public String reApplication(@RequestParam("serv_id")String serv_id, HttpServletRequest req, HttpServletResponse resp) {
		List<MatchingDto> matchingFailAnswer = matchingDao.matchingFailAnswer(serv_id);
		req.setAttribute("matchingFailAnswer", matchingFailAnswer);
		return "/service/reApplication";
	}
	
	//구매자 완료리스트
	@RequestMapping("/customer/matchingSuccess.do")
	public String customerMatchingSuccess(HttpServletResponse resp, HttpServletRequest req) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		String id = (String)req.getSession().getAttribute("session_id");
		List<MatchingDto> matchingSuccess = matchingService.matchingSuccess(id);
		req.setAttribute("matchingSuccess", matchingSuccess);
		
		return "/customer/matchingSuccess";
	}
	
	//판매자 완료리스트
	@RequestMapping("/supplier/matchingSuccess.do")
	public String supplierMatchingSuccess(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		String id = (String)req.getSession().getAttribute("session_id");
		List<MatchingDto> matchingSuccess = matchingDao.supplierMatchingSuccess(id);
		req.setAttribute("matchingSuccess", matchingSuccess);

		return "/supplier/matchingSuccess";
	}
	
	//구매자 종료서비스 날짜별 검색
	@RequestMapping("/customer/matchingSearch.do")
	public String customerMatchingSearch(HttpServletRequest req, HttpServletResponse resp) {
		String startDate = (String)req.getParameter("serv_date1");
		String endDate = (String)req.getParameter("serv_date2");		
		String id = (String)req.getSession().getAttribute("session_id");
		
		Map<String, Object> params =getParameterMap(req);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("id", id);
		List<MatchingDto> customerMatchingSearch 
			= matchingService.customerMatchingSearch(params);
		req.setAttribute("matchingSuccess", customerMatchingSearch);

		
		return "/customer/matchingSuccess";
	}
	//판매자 종료서비스 날짜별 검색
	@RequestMapping("/supplier/matchingSearch.do")
	public String supplierMatchingSearch(HttpServletRequest req, HttpServletResponse resp) {
		String startDate = (String)req.getParameter("serv_date1");
		String endDate = (String)req.getParameter("serv_date2");		
		String id = (String)req.getSession().getAttribute("session_id");
		
		Map<String, Object> params =getParameterMap(req);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("id", id);
		List<MatchingDto> supplierMatchingSearch 
			= matchingService.supplierMatchingSearch(params);
		req.setAttribute("matchingSuccess", supplierMatchingSearch);
		
		return "/supplier/matchingSuccess";
	}
	
	public Map<String, Object> getParameterMap(HttpServletRequest req){
		Map<String, Object> params = new HashMap<String, Object>();
		Enumeration<String> keys= req.getParameterNames();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			if(key.indexOf("cb")!=-1 || key.indexOf("sb")!=-1) { //배열값
				params.put(key,req.getParameterValues(key));
			}else {
				params.put(key,req.getParameter(key));
			}
		}
		return params;
	}
}
