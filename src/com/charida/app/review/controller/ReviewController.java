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
import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.review.dto.ReviewDto;
import com.charida.app.review.service.ReviewService;

@Controller
public class ReviewController {
	protected Log log = LogFactory.getLog(TestService.class);

	@Resource
	ReviewService reviewService;	

	//후기작성페이지 컨트롤러
	@RequestMapping("/review/reviewWrite.do")
	public String reviewWriteForm(@RequestParam("serv_id")String serv_id,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		req.setAttribute("serv_id", serv_id);
		
		return "/review/reviewWriteForm";
	}
	
	//후기작성처리
	@RequestMapping("/review/setReview.do")
	public String insertReview(@RequestParam("serv_id")String serv_id,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(req.getParameter("aa"));
		Map<String, Object> params = getParameterMap(req);
		params.put("serv_id", serv_id);
		reviewService.insertReviewTx(params);
		
		// 파일이름 받아오기-----------------------------------------
		Map<String,String[]> pictureMap = req.getParameterMap();
		String servicePicture[] = new String[6] ;
		for(int i = 1 ; i<7 ; i++) {
			if(req.getAttribute("file_id"+i)!=null) {
				servicePicture[i-1] = Integer.toString((Integer)req.getAttribute("file_id"+i)) ;
			}
		}
		pictureMap.put("servicePicture", servicePicture);		
		reviewService.insertPictureTx(pictureMap);
		
		//후기보기 추후에 Redirect 작업 해도됨
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		//후기보기페이지 리다이렉트
		String id = (String)req.getSession().getAttribute("session_id");
		List<ReviewDto> reviews = reviewService.ownReview(id);
		req.setAttribute("reviews", reviews);
		
		return "redirect:/review/ownReview.do";
	}	
	
	//후기보기
	@RequestMapping("/review/review.do")
	public String getReviews(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		List<ReviewDto> reviews = reviewService.getReviews();
		req.setAttribute("reviews", reviews);
		
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
		req.setAttribute("reviews", reviews);
		return "/review/ownReview";
	}
	
	//작성가능한 후기 목록
	@RequestMapping("/review/ableToReview.do")
	public String ableToReview(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		String id = (String)req.getSession().getAttribute("session_id");
		
		List<MatchingDto> reviews = reviewService.ableToReview(id);
		
		req.setAttribute("reviews", reviews);
		
		return "/review/ableToReview";
	}
	
	//리뷰수정시 작성폼에 기존데이터를 보내줌.
	@RequestMapping("/review/modifyReview.do")
	public String modifyReview(@RequestParam("serv_id")String serv_id, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		req.setAttribute("serv_id", serv_id);
		ReviewDto review = reviewService.modifyReview(serv_id);
		List<Integer> pictures = reviewService.getfiles(serv_id);
		req.setAttribute("pictures", pictures);
		req.setAttribute("review", review);
		return "/review/modifyReview";
	}
	
	//후기수정로직
	@RequestMapping("/review/modifyReviewPro.do")
	public String modifyReviewPro(@RequestParam("serv_id")String serv_id, HttpServletResponse resp, HttpServletRequest req) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");	
		Map<String, Object> params =getParameterMap(req);
		params.put("serv_id", serv_id);		
		int result = reviewService.modifyReviewPro(params);
//		int delpicture = reviewService.delpicture(serv_id);
		
		//사진수정 (기존사진을 지우기 덮어씀)
		Map<String,String[]> pictureMap = req.getParameterMap();
		String servicePictures[] = new String[6] ;
		for(int i = 1 ; i<7 ; i++) {
			if(req.getAttribute("file_id"+i)!=null) {
				servicePictures[i-1] = Integer.toString((Integer)req.getAttribute("file_id"+i)) ;
			}
		}
		reviewService.modifyPictureTx(pictureMap,servicePictures,serv_id);
		
		
		if(result == 0) {
			req.setAttribute("modify", 0);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);
			req.setAttribute("reviews", reviews);
			return "redirect:/review/ownReview.do";
		}else{
			req.setAttribute("modify", 1);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);
			req.setAttribute("reviews", reviews);
			return "redirect:/review/ownReview.do";
		}
		
	}
	
	//리뷰삭제
	@RequestMapping("/review/deleteReview.do")
	public String deleteReview(@RequestParam("serv_id")String serv_id, HttpServletRequest req, HttpServletRequest resp) {
		req.getSession().getAttribute("session_id");
		req.getSession().getAttribute("session_name");
		req.getSession().getAttribute("session_authority");
		
		int result = reviewService.deleteReview(serv_id);
		
		if(result == 0) {	
			//삭제실패
			req.setAttribute("check", 0);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);		
			req.setAttribute("reviews", reviews);
			
			return "rediret:/review/ownReview.do";
		}else {
			//삭제성공
			req.setAttribute("check", 1);
			String id = (String)req.getSession().getAttribute("session_id");
			List<ReviewDto> reviews = reviewService.ownReview(id);		
			req.setAttribute("reviews", reviews);
			
			return "redirect:/review/ownReview.do";
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