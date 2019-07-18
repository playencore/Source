package com.charida.app.component.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.review.dao.ReviewDao;
import com.charida.app.review.dto.ReviewDto;
import com.charida.app.review.dto.ReviewFileDto;

@Component
public class ReviewComponent {
	
	@Resource
	ReviewDao reviewDao;
	
	public int insertReview(ReviewDto reviewDto) {
		int result = reviewDao.insertReview(reviewDto);	
		
		return result;
	}
	public int insertPicture(ReviewDto reviewDto) {
		int result = reviewDao.insertPicture(reviewDto);
		
		return result;
	}
	
	public List<ReviewDto> getReviews() {
		return reviewDao.getReviews();		
	}
	
	public List<ReviewDto> ownReview(String id) {
		return reviewDao.ownReview(id);
	}
	
	public List<MatchingDto>ableToReview(String id) {
		return reviewDao.ableToReview(id);
	}
	
	public MatchingDto modifyReview(String serv_id) {
		return reviewDao.modifyReview(serv_id);
	}
	public int deleteReview(String serv_id) {
		int result = reviewDao.deleteReview(serv_id);
		if(result == 0) {
			return 0;
		}else {
			return 1;
		}
	}
	
	public int modifyReviewPro(ReviewDto reviewDto) {
		int result = reviewDao.modifyReviewPro(reviewDto);
		if(result == 0) {
			return 0;
		}else {
			return 1;
		}		
	}

	public String getPictureMaxSeq(){
		return reviewDao.getPictureMaxSeq();
	}
	public int setPicture(Map<String, Object> listMap) {
		return reviewDao.setPicture(listMap);
	}
	public List<Integer> getfiles(String serv_id) {
		return reviewDao.getFiles(serv_id);
	}
}
