package com.charida.app.review.controller;


import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.common.service.TestService;
import com.charida.app.review.dto.ReviewDto;
import com.charida.app.review.service.ReviewService;

@Controller
public class ReviewController {
	//private final static String returnUrl = "/review/reviewWriteForm";
	protected Log log = LogFactory.getLog(TestService.class);

	@Resource
	ReviewService reviewService;

	
	@RequestMapping("/review/reviewWrite.do")
	public String reviewWriteForm(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "/review/reviewWriteForm";
	}
	
	//후기작성
	@RequestMapping("/review/setReview.do")
	public String setReview(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		//model.addAttribute("serverTime", formattedDate );
		Map<String, Object> params =getParameterMap(req);
		params.put("mem_id",(String)req.getSession().getAttribute("session_id"));
		//mem_id가 아니라 서비스테이블의 serv_id 값을 가져와야한다. 서비스테이블 완성되면 추후 수정해야됨.
		reviewService.setReviewTx(params);
		// 파일이름 받아오기-------------
		req.getAttribute("servicePicture1");
		req.getAttribute("servicePicture2");
		req.getAttribute("servicePicture3");
		req.getAttribute("servicePicture4");
		req.getAttribute("servicePicture5");
		req.getAttribute("servicePicture6");
		
		//후기보기 추후에 Redirect 작업 해도됨
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		List<ReviewDto> reviews = reviewService.getReviews();
		//log.debug();
		req.setAttribute("reviews", reviews);
		req.setAttribute("reviewsSize", reviews.size());
		
		return "/review/review";
	}
	
	//후기보기
	@RequestMapping("/review/review.do")
	public String viewReview(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		List<ReviewDto> reviews = reviewService.getReviews();
		//log.debug();
		req.setAttribute("reviews", reviews);
		req.setAttribute("reviewsSize", reviews.size());
		
		return "/review/review";
	}
	
	@RequestMapping("/review/ownReview.do")
	public String ownReview(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/review/ownReview";
	}
	
	@RequestMapping("/review/ableToReview.do")
	public String ableToReview(HttpServletRequest req, HttpServletResponse resp) {
		
		return "review/ableToReview";
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