package com.charida.app.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.review.ReviewComponent;
import com.charida.app.review.dto.ReviewDto;

@Service
public class ReviewService {
	@Resource
	ReviewComponent reviewComponent;

	public int setReviewTx(Map<String, Object> reviewMap) {
		int result = 0;
		
		//Review Insert
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setMem_id((String)reviewMap.get("mem_id"));
		reviewDto.setServ_root((String)reviewMap.get("servRoot"));
		reviewDto.setMenu_score((String)reviewMap.get("menuScore"));
		reviewDto.setPrice_score((String)reviewMap.get("priceScore"));
		reviewDto.setServ_score((String)reviewMap.get("serviceScore"));
		reviewDto.setRecommand((String)reviewMap.get("recommend"));
		reviewDto.setTitle((String)reviewMap.get("title"));
		reviewDto.setContent((String)reviewMap.get("content"));
		
		result += reviewComponent.setReview(reviewDto);
				
		return result;
	}
	
	public List<ReviewDto> getReviews() {
		return reviewComponent.getReviews();
		
	}
	
	
	
}
