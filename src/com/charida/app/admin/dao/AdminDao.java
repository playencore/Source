package com.charida.app.admin.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class AdminDao {
	
	@Resource
	SqlSession sqlSession;
	
	public List< Map<String, Object> > selectAllServList(){
		return sqlSession.selectList("Admin.allServList"); 
	}
	public List< Map<String, Object> > selectServToSugg(String serv_id){
		return sqlSession.selectList("Admin.allservToSugg",serv_id); 
	}
	public List< Map<String, Object> > selectChooseSuggMenu(String sugg_id){
		return sqlSession.selectList("Admin.choosesuggmenu",sugg_id); 
	}
	public Map<String, Object> selectServReview(String serv_id){
		return sqlSession.selectOne("Admin.servReview",serv_id) ;
	}
	public Map<String, Object> selectSupplierReviewAvgScore(String mem_id){
		return sqlSession.selectOne("Admin.supplierReviewAvgScore",mem_id) ;
	}
	public Map<String, Object> selectEventCodeName(String serv_id) {
		return sqlSession.selectOne("Admin.eventTypeName", serv_id);
	}
	public Map<String, Object> selectServCodeName(String serv_id) {
		return sqlSession.selectOne("Admin.servTypeName", serv_id);
	}
	
	public List<Map<String, Object>> selectDateServList(Map<String,Object> param){
		return sqlSession.selectList("Admin.dateServList",param) ;
	}
	
}
