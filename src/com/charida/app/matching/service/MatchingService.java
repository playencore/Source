package com.charida.app.matching.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.matching.MatchingComponent;
import com.charida.app.matching.dto.MatchingDto;

@Service
public class MatchingService {
	@Resource
	MatchingComponent matchingComponent;
	
	//매칭실패
	public List<MatchingDto> matchingFail(String id){
		return matchingComponent.matchingFail(id);		
	}
	
	//매칭성공
	public List<MatchingDto> matchingSuccess(String id){
		return matchingComponent.matchingSuccess(id);
	}
	public List<MatchingDto> customerMatchingSearch(Map<String, Object> matchingMap){
		MatchingDto matchingDto = new MatchingDto();
		matchingDto.setStartDate((String)matchingMap.get("startDate"));
		matchingDto.setEndDate((String)matchingMap.get("endDate"));
		matchingDto.setId((String)matchingMap.get("id"));
		return matchingComponent.customerMatchingSearch(matchingDto);
	}
	public List<MatchingDto> supplierMatchingSearch(Map<String, Object> matchingMap){
		MatchingDto matchingDto = new MatchingDto();
		matchingDto.setStartDate((String)matchingMap.get("startDate"));
		matchingDto.setEndDate((String)matchingMap.get("endDate"));
		matchingDto.setId((String)matchingMap.get("id"));
		return matchingComponent.supplierMatchingSearch(matchingDto);
	}

}
