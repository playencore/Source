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
	public List<MatchingDto> matchingFail(){
		return matchingDao.matchingFail();
	}
	//매칭성공
	public List<MatchingDto> matchingSuccess(){
		return matchingDao.matchingSuccess();
	}
	
}
