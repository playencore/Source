package com.charida.app.matching.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.matching.MatchingComponent;
import com.charida.app.matching.dto.MatchingDto;

@Service
public class MatchingService {
	@Resource
	MatchingComponent matchingComponent;
	
	//매칭실패
	public List<MatchingDto> matchingFail(){
		return matchingComponent.matchingFail();		
	}
	
	//매칭성공
	public List<MatchingDto> matchingSuccess(){
		return matchingComponent.matchingSuccess();
	}
}
