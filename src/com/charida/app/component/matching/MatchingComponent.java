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
	
}
