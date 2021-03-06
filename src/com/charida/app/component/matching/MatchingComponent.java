package com.charida.app.component.matching;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.matching.dao.MatchingDao;
import com.charida.app.matching.dto.MatchingDto;

@Component
public class MatchingComponent {
	@Resource
	MatchingDao matchingDao;
	
	//매칭실패
	public List<MatchingDto> matchingFail(String id){
		return matchingDao.matchingFail(id);
	}
	//구매자 매칭성공
	public List<MatchingDto> matchingSuccess(String id){
		return matchingDao.matchingSuccess(id);
	}
	public List<MatchingDto> customerMatchingSearch(MatchingDto matchingDto){
		return matchingDao.customerMatchingSearch(matchingDto);
	}
	public List<MatchingDto> supplierMatchingSearch(MatchingDto matchingDto){
		return matchingDao.supplierMatchingSearch(matchingDto);
	}
	public List<MatchingDto> matchingFailAnswer(String serv_id){
		return matchingDao.matchingFailAnswer(serv_id);
	}
	public List<MatchingDto> supplierMatchingSuccess(String id){
		return matchingDao.supplierMatchingSuccess(id);
	}

}
