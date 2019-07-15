package com.charida.app.sugg.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.sugg.SuggestionComponent;

@Service
public class SuggService {
	@Resource
	private SuggestionComponent suggestionComponent;
	public List<Map<String,Object>> getList(Map<String, Object> parmas){
		List<Map<String,Object>> suggList = suggestionComponent.getSuggList((String)parmas.get("sessionId"));
		
		if(suggList != null) {
			for(Map<String,Object> sugg : suggList) {
				
				if(sugg.get("PER_BUD") != null) {
					String per_bud = ((BigDecimal)sugg.get("PER_BUD")).toString();
					per_bud = suggestionComponent.formatByComma(per_bud) ;
					sugg.remove("PER_BUD");
					sugg.put("PER_BUD", per_bud);
				}
			}
		}
		
		//제안 ---> 제안 대기 및 실패 리스트--> 결제 리스트 --> 서비스 준비 --> 배송중
		//1. 판매자 아이디로 제안 테이블에 조회( 대기중,신청단계에서 채택실패 ) -이면 진행중 N 불채택 Y 채택
		//2. 서비스 아이디로 신청테이블조회
		
		return suggList;
	}
}
