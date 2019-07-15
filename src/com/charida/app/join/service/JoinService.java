package com.charida.app.join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.common.service.TestService;
import com.charida.app.component.join.JoinComponent;
import com.charida.app.member.dto.MemberDto;

// 회원가입을 위한 서비스계층
@Service
public class JoinService {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	JoinComponent joinComponent;
	
	// 아이디 중복 확인
	public String isOnly(String id){ 
		log.debug("joinService : isOnly(String id) >>>>>>>> " + id);
		int check = joinComponent.selectMemid(id);
		log.debug("checkid( 0:가입가능 , 1:가입불가 ) " + check);
		String result = "1";
		if( check == 1 ) {
			// 가입 불가 : 아이디 사용불가
			result = "1";
		} else if( check == 0 ) {
			// 가입 가능 : 아이디 사용가능
			result = "0";
		}
		return result;
	}
	// 회원가입
	public int joinMember(Map<String, Object> params) {
		MemberDto memberDto = new MemberDto();
		memberDto.setMem_id((String)params.get("mem_id"));
		memberDto.setPasswd((String)params.get("passwd"));
		memberDto.setAuthority((String)params.get("authority"));
		memberDto.setName((String)params.get("name"));
		memberDto.setEmail((String)params.get("email"));
		memberDto.setZipcode((String)params.get("zipcode"));
		memberDto.setTel((String)params.get("tel"));
		memberDto.setBirth_date((String)params.get("birth_date"));
		memberDto.setAddress((String)params.get("address"));
		memberDto.setAddress_detail((String)params.get("address_detail"));
		memberDto.setJoin_date((String)params.get("join_date"));
		memberDto.setGender((String)params.get("gender"));
		memberDto.setJob((String)params.get("job"));
		
//		memberDto.setMem_id("aaaaa1");
//		memberDto.setPasswd("aaaa");
//		memberDto.setAuthority("1");
//		memberDto.setName("호옹길도옹");
//		memberDto.setEmail("fullcontrolg@gmail.com");
//		memberDto.setZipcode("111222");
//		memberDto.setTel("010-1111-2222");
//		memberDto.setBirth_date("20101020");
//		memberDto.setAddress("서울시 서초구");
//		memberDto.setAddress_detail("123-23");
//		memberDto.setJoin_date("20201020");
//		memberDto.setGender("1");
//		memberDto.setJob("사장");
		
		log.debug("JoinService > joinComponent.setMember( memberDto ) 호출시작");
		int result = joinComponent.setMember( memberDto );
		if( result == 0 ) {
			log.debug("회원가입에 [실패]했습니다.");
		} else {
			log.debug("회원가입에 [성공]했습니다.");
		}
		return result;
	}
}
