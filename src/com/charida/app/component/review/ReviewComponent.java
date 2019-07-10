package com.charida.app.component.review;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.review.dao.ReviewDao;
import com.charida.app.review.dto.ReviewDto;

@Component
public class ReviewComponent {
	
	@Resource
	ReviewDao reviewDao;
	
	public int setReview(ReviewDto reviewDto) {
		int result = reviewDao.insertReview(reviewDto);	
		
		return result;
	}
	public List<ReviewDto> getReviews() {
		return reviewDao.getReviews();
		
	}
}
