package com.charida.app.sugg.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.charida.app.component.category.CategoryComponent;
import com.charida.app.component.pagination.PaginationInfo;
import com.charida.app.component.serv.ApplicationComponent;
import com.charida.app.component.sugg.SuggestionComponent;

@Service
public class SuggService {
	@Resource
	private SuggestionComponent suggestionComponent;
	@Resource
	private ApplicationComponent applicationComponent;
	@Resource
	private CategoryComponent categoryComponent;
	
	public List<Map<String,Object>> getList(Map<String, Object> parmas,HttpServletRequest req){
		String memId = (String)parmas.get("sessionId");
		int pageNo = 1;
		if(parmas.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)parmas.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		paging.setTotalRecordCount(suggestionComponent.getSuggListCount(memId));
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("memId", memId);
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());

		List<Map<String,Object>> suggList = suggestionComponent.getSuggList(listParam);
		
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
	
	public Map<String, Object> getSuggInfo(String suggId){
		Map<String, Object> result = suggestionComponent.getSuggInfo(suggId);
		
		if(result == null || result.isEmpty()) {
			return null;
		}
		
		List<Map<String,Object>> menuInfo = suggestionComponent.getSuggMenuInfo(suggId);
		result.put("menuInfo", menuInfo);
		
		if(result.get("SERV_TYPE_CODE") != null ) {
			String servCode = (String)result.get("SERV_TYPE_CODE");
			result.put("SERV_TYPE_NAME", categoryComponent.getCodeName(servCode));
		}
		
		if(result.get("EVENT_TYPE_CODE") != null ) {
			String eventCode = (String)result.get("EVENT_TYPE_CODE");
			result.put("EVENT_TYPE_NAME", categoryComponent.getCodeName(eventCode));
		}
		
		//선호메뉴
		List<String> prefList =applicationComponent.getPrefList((String)result.get("SERV_ID"),true);
		result.put("prefList", prefList);
		
		if("Y".equals(result.get("DESSERT_YN")) || "Y".equals(result.get("TABLEWARE_YN"))
				|| "Y".equals(result.get("OTHER_ORDER_YN")) ){
			List<String> orderList
				= applicationComponent.getAddOrderList((String)result.get("SERV_ID"));
			
			
			if("Y".equals(result.get("DESSERT_YN"))) {
				result.put("drtList", categoryComponent.getNameList(orderList, categoryComponent.DESSERT));
			}
			if("Y".equals(result.get("TABLEWARE_YN"))) {
				result.put("tbwList", categoryComponent.getNameList(orderList, categoryComponent.TABLEWARE));
			}
			if("Y".equals(result.get("OTHER_ORDER_YN"))) {
				result.put("rtlList", categoryComponent.getNameList(orderList, categoryComponent.OTHER));
			}
		}
		
		return result;
	}
}
