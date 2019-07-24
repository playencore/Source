package com.charida.app.appli.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.common.service.TestService;
import com.charida.app.component.appli.AppliComponent;
import com.charida.app.component.category.CategoryComponent;
import com.charida.app.component.pagination.PaginationInfo;

@Service
public class AppliService {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	private AppliComponent appliComponent;
	@Resource
	private CategoryComponent categoryComponent;
	
//	private final String errMsg = "데이터 갱신에 실패했습니다.";
	
	// 신청 기본정보에 필요한 정보를 조회해 옴
	public List<Map<String, Object>> getList(Map<String, Object> params, HttpServletRequest req){
		String memId = (String)params.get("sessionId");
		int pageNo = 1;
		if(params.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)params.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		paging.setTotalRecordCount(appliComponent.getAppliListCount(memId));
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("memId", memId);
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());
		
		List<Map<String, Object>> appliList = appliComponent.getAppliList(listParam);
		
		if(appliList != null) {
			for(Map<String, Object> appli : appliList) {
				if(appli.get("PER_BUD") != null) {
					String per_bud = ((BigDecimal)appli.get("PER_BUD")).toString();
					per_bud = appliComponent.formatByComma(per_bud);
					appli.remove("PER_BUD");
					appli.put("PER_BUD", per_bud);
				}
			}
		}
		return appliList;
	}
	
	// 신청 상세정보에 필요한 정보를 조회해 옴
	public Map<String, Object> getAppliInfo(String appliId){
		// 모든 신청정보 조회
		Map<String, Object> result = appliComponent.getAppliInfo(appliId);
		if(result == null || result.isEmpty()) {
			return null;
		}
		
		if(result.get("SERV_TYPE_CODE") != null ) {
			String servCode = (String)result.get("SERV_TYPE_CODE");
			result.put("SERV_TYPE_NAME", categoryComponent.getCodeName(servCode));
		}
		
		if(result.get("EVENT_TYPE_CODE") != null ) {
			String eventCode = (String)result.get("EVENT_TYPE_CODE");
			result.put("EVENT_TYPE_NAME", categoryComponent.getCodeName(eventCode));
		}
		result.put("suggInfo", getSuggInfo(appliId));
		return result;
	}
	// 주문번호(appliId)를 통하여 신청테이블(CRD_SERV_SUGG)의 모든 정보를 갖고옴
	public List<Map<String, Object>> getSuggInfo(String appliId){
		return appliComponent.getSuggInfo(appliId);
	}
	public int setStateAppSuggTx(String suggId, String total, String servId) {
		
		// 제안테이블 상태 변경(crd_serv_sugg)
		int result1 = appliComponent.setSuggState(suggId);
		// 신청테이블 상태 변경(crd_serv_app)
		int result2 = appliComponent.setAppState(suggId);
		Map<String, Object> totalAndServId = new HashMap<String, Object>();
		totalAndServId.put("total", total);
		totalAndServId.put("servId", servId);
		int result3 = appliComponent.addPayRow(totalAndServId);
		log.debug("result1 : " + result1);
		log.debug("result2 : " + result2);
		log.debug("result3 : " + result3);
		int result = result1 * result2 * result3;
		return result;
	}
	//결제대기 리스트
//	public List<Map<String, Object>> getWaitList(Map<String, Object> params, HttpServletRequset req) {
//		
//	}
}
