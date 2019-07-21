package com.charida.app.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.compenent.member.MemberComponent;
import com.charida.app.member.dto.MemberDto;

@Service
public class MemberService {
	
	@Resource
	MemberComponent memberComponent ;
	
	public MemberDto getMember(String mem_id) {
		return memberComponent.getMember(mem_id);
	}
	
	public int updateMemeberInfo(MemberDto dto) {
		return memberComponent.updateMemberInfo(dto);
	}
	public int getEmailYN(String email){
		return memberComponent.getEmailYN(email);
	} 
	public List<String> getMemIdToEmail(String email){
		return memberComponent.getMemIdToEmail(email) ;
	}
	public Map<String, Object> getMemIdYN(String mem_id) {
		Map<String, Object> resultMap = new HashMap<String, Object>() ;
		int result =  memberComponent.getMemIdYN(mem_id) ;
		if(result == 0) {
			resultMap.put("result", "해당 ID가 존재하지 않습니다. 다시 확인해주세요.") ;
			resultMap.put("flag", result);
		}else {
			resultMap.put("result", "해당 ID의 이메일로 인증번호를 보냅니다.") ;
			resultMap.put("flag", result);
		}
		return resultMap;
	}
	public Map<String, Object> getEmail(String mem_id){
		return memberComponent.getEmail(mem_id);
	}
	public Map<String, Object> getPasswd(String mem_id){
		return memberComponent.getPasswd(mem_id);
	}
}
