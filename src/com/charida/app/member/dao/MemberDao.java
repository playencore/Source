package com.charida.app.member.dao;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;
import com.charida.app.member.dto.MemberDto;

@Repository
public class MemberDao {
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	SqlSession sqlSession;
	
	public int selectMember(String id) {
		log.debug("MemberDao > selectMember : SQL진행");
		return sqlSession.selectOne("Member.selectMemid", id);
	}
	
	public int insertMember( MemberDto member ) {
		log.debug("MemberDao > insertMember : SQL진행 : " + member );
		return sqlSession.insert("Member.insertMember", member );
	}
	
	public MemberDto selectMemberInfo(String mem_id) {
		return sqlSession.selectOne("Member.selectMemberInfo", mem_id) ;
	}
	
	public int updateMemberInfo(MemberDto dto) {
		return sqlSession.update("Member.updateMemberInfo", dto) ;
	}
	public int selectEmailYN(String email){
		return sqlSession.selectOne("Member.selectEmails", email);
	} 
	public List<String> selectMemIdtoEamil(String email){
		return sqlSession.selectList("Member.selectMemIdToEmail", email) ;
	}
	public int selectMemIdYN(String mem_id) {
		return sqlSession.selectOne("Member.selectMemIdYN", mem_id) ;
	}
	public Map<String, Object> selectEmail(String mem_id){
		return sqlSession.selectOne("Member.selectEmail",mem_id);
	}
	public Map<String, Object> selectPasswd(String mem_id){
		return sqlSession.selectOne("Member.selectPasswd",mem_id);
	}
}
