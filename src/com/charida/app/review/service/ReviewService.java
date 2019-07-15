package com.charida.app.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.review.ReviewComponent;
import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.review.dto.ReviewDto;

@Service
public class ReviewService {
	@Resource
	ReviewComponent reviewComponent;

	public int insertReviewTx(Map<String, Object> reviewMap) {
		int result = 0;
		
		//Review Insert
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setServ_id((String)reviewMap.get("serv_id"));
		reviewDto.setServ_root((String)reviewMap.get("servRoot"));
		reviewDto.setMenu_score((String)reviewMap.get("menuScore"));
		reviewDto.setPrice_score((String)reviewMap.get("priceScore"));
		reviewDto.setServ_score((String)reviewMap.get("serviceScore"));
		reviewDto.setRecommand((String)reviewMap.get("recommend"));
		reviewDto.setTitle((String)reviewMap.get("title"));
		reviewDto.setContent((String)reviewMap.get("content"));
		
		result += reviewComponent.insertReview(reviewDto);
				
		return result;
	}
	
	public List<ReviewDto> getReviews() {
		return reviewComponent.getReviews();
		
	}
	
	public List<ReviewDto> ownReview(String id) {
		return reviewComponent.ownReview(id);
	}
	
	public List<MatchingDto> ableToReview() {
		return reviewComponent.ableToReview();
	}
	
	public MatchingDto modifyReview(String serv_id) {
		return reviewComponent.modifyReview(serv_id);
	}
	
	public int modifyReviewPro(Map<String, Object> reviewMap) {
		int result = 0;
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setServ_id((String)reviewMap.get("serv_id"));
		reviewDto.setServ_root((String)reviewMap.get("servRoot"));
		reviewDto.setMenu_score((String)reviewMap.get("menuScore"));
		reviewDto.setPrice_score((String)reviewMap.get("priceScore"));
		reviewDto.setServ_score((String)reviewMap.get("serviceScore"));
		reviewDto.setRecommand((String)reviewMap.get("recommend"));
		reviewDto.setTitle((String)reviewMap.get("title"));
		reviewDto.setContent((String)reviewMap.get("content"));
		
		result += reviewComponent.modifyReviewPro(reviewDto);
				
		return result;
	}
	
//	public int deleteReview(String serv_id) {
//		int result = reviewComponent.deleteReview(serv_id);
//		
//		return result;
//	}
	
	
}
