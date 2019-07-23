package com.charida.app.review.service;

import java.util.HashMap;
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
	//사진입력
	public int insertPictureTx(Map <String,String[]> pictureMap) {
		int result = 0;
		int seq = 0;
		Map<String,Object> pictureListMap = new HashMap<String, Object>();
		String checkseq = reviewComponent.getPictureMaxSeq();
		if(checkseq == null ) {
			checkseq = "0";
			seq = Integer.parseInt(checkseq);
			seq = 1;
		}else {
			seq = Integer.parseInt(checkseq);
		}
		for(int i = 0 ; i <pictureMap.get("servicePicture").length ; i++ ) {	// 0~6장까지 들어온다.
			String servicePicture = pictureMap.get("servicePicture")[i];
			if(servicePicture!=null) {
				int picture=Integer.parseInt(servicePicture);				
				pictureListMap.put("serv_id",pictureMap.get("serv_id")[0]);
				pictureListMap.put("file_seq", seq);
				pictureListMap.put("file_id",picture);
				result += reviewComponent.setPicture(pictureListMap);
				seq ++;
			} 
		}		
		return result;
	}
	
	public List<ReviewDto> getReviews() {
		List<ReviewDto> result =  reviewComponent.getReviews();
		for(int i = 0 ; i < result.size() ; i++) {
			//리뷰전체중 한개의 Dto
			ReviewDto review = result.get(i);
			//한 개의 후기에 해당하는 serv_id
			String serv_id = review.getServ_id();
			//한 개의 serv_id에 해당하는 file_id의 집합 리스트
			List<Integer> files = reviewComponent.getfiles(serv_id);
			// 해당번째의 Dto에 file_id 삽입
			review.setPicture(files);		
		}		
		return result;
	}
	
	public List<ReviewDto> ownReview(String id) {
		List<ReviewDto> result = reviewComponent.ownReview(id);
		for(int i = 0 ; i < result.size() ; i++) {
			ReviewDto review = result.get(i);
			String serv_id = review.getServ_id();
			List<Integer> files = reviewComponent.getfiles(serv_id);
			review.setPicture(files);	
		}				
		return result;
	}
	
	public List<MatchingDto> ableToReview(String id) {
		return reviewComponent.ableToReview(id);
	}
	
	public ReviewDto modifyReview(String serv_id) {
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
	public int deleteReview(String serv_id) {
		return reviewComponent.deleteReview(serv_id);
	}
	public int delpicture(String serv_id) {
		return reviewComponent.delpicture(serv_id);
	}
	
}
