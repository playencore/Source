package com.charida.app.compenent.member;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.member.dao.MemberDao;
import com.charida.app.member.dto.MemberDto;

@Component
public class MemberComponent {
	
	@Resource
	MemberDao memberDao ;
	
	public MemberDto getMember(String mem_id) {
		return memberDao.selectMemberInfo(mem_id) ;
	}
	
	public int updateMemberInfo(MemberDto dto) {
		return memberDao.updateMemberInfo(dto) ;
	}
	public int getEmailYN(String email){
		return memberDao.selectEmailYN(email);
	}
	public List<String> getMemIdToEmail(String email){
		return memberDao.selectMemIdtoEamil(email) ;
	}
	public int getMemIdYN(String mem_id) {
		return memberDao.selectMemIdYN(mem_id) ;
	}
	public Map<String, Object> getEmail(String mem_id){
		return memberDao.selectEmail(mem_id) ;
	}
	public Map<String, Object> getPasswd(String mem_id){
		return memberDao.selectPasswd(mem_id);
	}
}
