package com.charida.app.appli.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.common.kafkalog.KafkaLog;
import com.charida.app.component.appli.AppliComponent;
import com.charida.app.component.category.CategoryComponent;
import com.charida.app.component.pagination.PaginationInfo;

@Service
public class AppliService {
	protected Log log = LogFactory.getLog(AppliService.class);
	@Resource
	private AppliComponent appliComponent;
	@Resource
	private CategoryComponent categoryComponent;
	@Resource
	private KafkaLog kafkaLog;
	private final SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
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
	public int setStateAppSuggTx(String suggId, String total, String servId,String memId) {
		
		// 제안테이블 성공건 상태 변경(crd_serv_sugg)
		int result1 = appliComponent.setSuggState(suggId);
		
		// 제안테이블 실패건 상태 변경
		int result2 = appliComponent.setSuggFail(servId, suggId);
		
		// 신청테이블 채택성공으로 상태 변경(crd_serv_app)
		int result3 = appliComponent.setAppState(suggId);
		
		Map<String, Object> totalAndServId = new HashMap<String, Object>();
		totalAndServId.put("total", total);
		totalAndServId.put("servId", servId);
		
		// 결제테이블 등록
		int result4 = appliComponent.addPayRow(totalAndServId);
		log.debug("result1 : " + result1);
		log.debug("result3 : " + result3);
		log.debug("result4 : " + result4);
		int result = result1 * result2 * result3 * result4;
		
		List<Map<String, Object>> priceAndLabel = appliComponent.getPriceandLabel(servId);
		//채택가 찾기
		int pickPrice = 0;
		for(Map<String, Object> row : priceAndLabel) {
			String label = (String)row.get("LABEL");
			if("Y".equals(label)) {
				pickPrice = ((BigDecimal)row.get("SUGGPRICE")).intValue();
				break;
			}
		}
		
		//로그데이터 생성
		for(Map<String, Object> info : priceAndLabel) {
			int appPrice = ((BigDecimal)info.get("APPPRICE")).intValue();
			int suggPrice = ((BigDecimal)info.get("SUGGPRICE")).intValue();
			double price = suggPrice / (appPrice *1.0);
			// 0 == 채택가 미만, 1 == 채택가, 2 == 채택가 초과, -1 이상값
			int label = -1;
			if(suggPrice>pickPrice) {
				label = 2;
			}else if(suggPrice<pickPrice) {
				label = 0;
			}else {
				label = 1;
			}
			String msg ="{\"createdAt\":\""+dateFormat.format(Calendar.getInstance().getTime())
						+"\",\"userId\":\""+memId
						+"\",\"data\":{\"type\":\"sugg\",\"appId\":\""+servId
						+"\",\"suggPrice\":\""+suggPrice
						+"\",\"label\":\""+label
						+"\",\"priceRespon\":"+price+"}}";
			
			kafkaLog.createLog(msg);
			
		}
		
		return result;
	}
	public List<Map<String, Object>> getMenuInfo(String suggId) {
		return appliComponent.getMenuInfo(suggId);
	}
	
	public List<Map<String, Object>> getReviewAvgScore(String suggIdList){
		log.debug("비교하기버튼 시작 >>");
		final String MONTH = "30";
		Map<String, Object> listParam = new HashMap<String, Object>();
		
		listParam.put("daterange", MONTH);			//조회기간 MONTH=30
		listParam.put("suggidlist", suggIdList);		//제안번호리스트 ex) 'S190730-0001/333333','S190730-0001/1010','S190730-0001/111'
		List<Map<String, Object>> avgScoreList = appliComponent.getReviewAvgScoreList(listParam);
		
		if(avgScoreList != null) {
			// 최근 MONTH일 동안 후기가 없음
			for(Map<String, Object> avgSocore : avgScoreList) {
				if(avgSocore.get("PER_BUD") != null) {
					String per_bud = ((BigDecimal)avgSocore.get("PER_BUD")).toString();
					per_bud = appliComponent.formatByComma(per_bud);
					avgSocore.remove("PER_BUD");
					avgSocore.put("PER_BUD", per_bud);
				}
			}
		}
		log.debug("비교하기버튼 종료 <<");
		return avgScoreList;
	}
}
