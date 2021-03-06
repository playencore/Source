package com.charida.app.review.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.matching.dto.MatchingDto;
import com.charida.app.review.dto.ReviewDto;

@Repository
public class ReviewDao {
	@Resource
	SqlSession sqlsession;
	
	public int insertReview(ReviewDto reviewDto) {
		int result = sqlsession.insert("Review.insertReview", reviewDto);		
		return result;
	}
	public int insertPicture(ReviewDto reviewDto) {
		return sqlsession.insert("Review.insertPicture", reviewDto);
	}	
	public List<ReviewDto> getReviews() {
		return sqlsession.selectList("Review.getReviews");
	}
	public List<Integer> getFiles(String serv_id){
		return sqlsession.selectList("Review.getFiles",serv_id);
	}
	public List<ReviewDto> ownReview(String id) {
		return sqlsession.selectList("Review.ownReview",id);
	}
	public List<MatchingDto> ableToReview(String id) {
		return sqlsession.selectList("Review.ableToReview",id);
	}
	public ReviewDto modifyReview(String serv_id) {
		return sqlsession.selectOne("Review.modifyReview",serv_id);
	}
	public int deleteReview(String serv_id) {
		return sqlsession.delete("Review.deleteReview",serv_id);
	}
	public int modifyReviewPro(ReviewDto reviewDto) {
		return sqlsession.update("Review.modifyReviewPro",reviewDto);
	}
	public String getServ_id() {
		return sqlsession.selectOne("Review.getServ_id");
	}
	public String getPictureMaxSeq() {
		return sqlsession.selectOne("Review.getPictureMaxSeq");
	}
	public int setPicture(Map<String, Object> listMap) {
		return sqlsession.insert("Review.setPicture",listMap);
	}
	public int delpicture(String serv_id) {
		return sqlsession.delete("Review.delpicture",serv_id);
	}

}
