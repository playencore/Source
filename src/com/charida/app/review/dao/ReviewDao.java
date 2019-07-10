package com.charida.app.review.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.review.dto.ReviewDto;

@Repository
public class ReviewDao {
	@Resource
	SqlSession sqlsession;
	
	public int insertReview(ReviewDto reviewDto) {
		int result = sqlsession.insert("Review.insertReview", reviewDto);
		
		return result;
	}
	
	public List<ReviewDto> getReviews() {
		return sqlsession.selectList("Review.getReviews");
	}

}
