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
	public List<MatchingDto> matchingFail(String id){
		return sqlsession.selectList("Matching.matchingFail",id);
	}
	
	//구매자 매칭성공
	public List<MatchingDto> matchingSuccess(String id){
		return sqlsession.selectList("Matching.matchingSuccess",id);
	}
	//판매자 매칭성공
	public List<MatchingDto> supplierMatchingSuccess(String id){
		return sqlsession.selectList("Matching.supplierMatchingSuccess",id);
	}
	public List<MatchingDto> customerMatchingSearch(MatchingDto matchingDto){
		return sqlsession.selectList("Matching.customerMatchingSearch",matchingDto);
	}
	public List<MatchingDto> supplierMatchingSearch(MatchingDto matchingDto){
		return sqlsession.selectList("Matching.supplierMatchingSearch",matchingDto);
	}


}
