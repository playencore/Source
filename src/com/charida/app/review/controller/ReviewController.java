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
import org.springframework.web.bind.annotation.RequestParam;

import com.charida.app.common.service.TestService;
import com.charida.app.component.review.ReviewComponent;
import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.review.dao.ReviewDao;
import com.charida.app.review.dto.ReviewDto;
import com.charida.app.review.service.ReviewService;

@Controller
public class ReviewController {
	//private final static String returnUrl = "/review/reviewWriteForm";
	protected Log log = LogFactory.getLog(TestService.class);

	@Resource
	ReviewService reviewService;	
	@Resource
	ReviewComponent reviewComponent;
	@Resource
	ReviewDao reviewDao;
	//후기작성페이지 컨트롤러
	@RequestMapping("/review/reviewWrite.do")
	public String reviewWriteForm(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "/review/reviewWriteForm";
	}
	
	//후기작성처리
	@RequestMapping("/review/setReview.do")
	public String insertReview(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		//model.addAttribute("serverTime", formattedDate );
		String serv_id = reviewDao.getServ_id();
		Map<String, Object> params =getParameterMap(req);
		params.put("serv_id", serv_id);
		//params.put("mem_id",(String)req.getSession().getAttribute("session_id"));
		//mem_id가 아니라 서비스테이블의 serv_id 값을 가져와야한다. 서비스테이블 완성되면 추후 수정해야됨.
		reviewService.insertReviewTx(params);
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
		
		//후기보기페이지 리다이렉트
		List<ReviewDto> reviews = reviewService.getReviews();
		//log.debug();
		req.setAttribute("reviews", reviews);
		//req.setAttribute("reviewsSize", reviews.size());
		
		return "/review/review";
	}
	
	
	//후기보기
	@RequestMapping("/review/review.do")
	public String getReviews(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		List<ReviewDto> reviews = reviewService.getReviews();
		//log.debug();
		req.setAttribute("reviews", reviews);
		//req.setAttribute("reviewsSize", reviews.size());
		
		return "/review/review";
	}
	
	//특정구매자 후기 보기(id값 비교)
	@RequestMapping("/review/ownReview.do")
	public String ownReview(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");		
		
		String id = (String)req.getSession().getAttribute("session_id");
		List<ReviewDto> reviews = reviewService.ownReview(id);
		
		//log.debug();
		req.setAttribute("reviews", reviews);
		return "/review/ownReview";
	}
	
	//작성가능한 후기 목록
	@RequestMapping("/review/ableToReview.do")
	public String ableToReview(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		
		List<MatchingDto> reviews = reviewService.ableToReview();
		
		req.setAttribute("reviews", reviews);
		
		return "/review/ableToReview";
	}
	
	//리뷰수정시 작성폼에 기존데이터를 보내줌.
	@RequestMapping("/review/modifyReview.do")
	public String modifyReview(@RequestParam("serv_id")String serv_id, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		//String id = (String)req.getSession().getAttribute("session_id");
		//String serv_id = req.getParameter("serv_id");
		
		ReviewDto review = reviewService.modifyReview(serv_id);
		req.setAttribute("review", review);		
		return "/review/modifyReview";
	}
	
	//후기수정로직
	@RequestMapping("/review/modifyReviewPro.do")
	public String modifyReviewPro(@RequestParam("serv_id")String serv_id, HttpServletResponse resp, HttpServletRequest req) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");			
		
		int result = reviewComponent.modifyReviewPro(serv_id);
		
		if(result == 0) {
			req.setAttribute("modify", 0);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);		
			req.setAttribute("reviews", reviews);
			return "/review/ownReview";
		}else {
			req.setAttribute("modify", 1);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);		
			req.setAttribute("reviews", reviews);
			return "/review/ownReview";
		}
		
//		//ownView 리다이렉트
//		String id = (String)req.getSession().getAttribute("session_id");
//		List<ReviewDto> reviews = reviewService.ownReview(id);		
//		req.setAttribute("reviews", reviews);
//		return "/review/ownReview";
	}
	
	//리뷰삭제
	@RequestMapping("/review/deleteReview.do")
	public String deleteReview(@RequestParam("serv_id")String serv_id, HttpServletRequest req, HttpServletRequest resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		int result = reviewComponent.deleteReview(serv_id);
		
		if(result == 0) {	
			//삭제실패
			req.setAttribute("check", 0);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);		
			req.setAttribute("reviews", reviews);
			
			return "/review/ownReview";
		}else {
			//삭제성공
			req.setAttribute("check", 1);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);		
			req.setAttribute("reviews", reviews);
			
			return "/review/ownReview";
		}
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