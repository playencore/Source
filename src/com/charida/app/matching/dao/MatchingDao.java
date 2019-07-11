package com.charida.app.matching.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.matching.dto.MatchingDto;

@Repository
public class MatchingDao {	
	@Resource
	SqlSession sqlsession;
	
	//매칭실패
	public List<MatchingDto> matchingFail(){
		return sqlsession.selectList("Matching.matchingFail");
	}
	
	//매칭성공
	public List<MatchingDto> matchingSuccess(){
		return sqlsession.selectList("Matching.matchingSuccess");
	}

}
