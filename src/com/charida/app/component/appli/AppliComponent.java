package com.charida.app.component.appli;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.charida.app.appli.dao.AppliDao;
import com.charida.app.common.service.TestService;

@Component
public class AppliComponent {
	protected Log log = LogFactory.getLog(AppliComponent.class);
	@Resource
	private AppliDao appliDao;
	
	public List<Map<String, Object>> getAppliList(Map<String, Object> param) {
		return appliDao.getAppliList(param);
	}
	public int getAppliListCount(String appli_id) {
		return appliDao.getAppliListCount(appli_id);
	}
	
	// 주문번호(appliId)를 통하여 신청테이블(CRD_SERV_APP)의 모든 정보를 갖고옴
	public Map<String, Object> getAppliInfo(String appliId){
		Map<String, Object> appliInfo = appliDao.getAppliInfo(appliId);
		
		if(appliInfo == null || appliInfo.isEmpty()) {
			return null;
		}
		if(appliInfo.get("PER_BUD") == null) {
			return appliInfo;
		}
		
		String per_bud = ((BigDecimal)appliInfo.get("PER_BUD")).toString();
		per_bud = formatByComma(per_bud) ;
		appliInfo.remove("PER_BUD");
		appliInfo.put("PER_BUD", per_bud);
		return appliInfo;
	}
	// 주문번호(appliId)를 통하여 신청테이블(CRD_SERV_SUGG)의 모든 정보를 갖고옴
	public List<Map<String, Object>> getSuggInfo(String appliId){
		return appliDao.getSuggInfo(appliId);
	}
	public int setSuggState(String suggId){
		log.debug("setSuggState >> suggId : " + suggId);
		return appliDao.setSuggState(suggId);
	}
	public int setSuggFail(String servId, String suggId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servId", servId);
		params.put("suggId", suggId);
		return appliDao.setSuggFail(params);
	}
	public int setAppState(String suggId){
		log.debug("setAppState >> suggId : " + suggId);
		return appliDao.setAppState(suggId);
	}
	public int addPayRow(Map<String, Object> totalAndServId) {
		return appliDao.addPayRow(totalAndServId);
	}
	
	public String formatByComma(String str) {
		return str.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	}
	public List<Map<String, Object>> getMenuInfo(String suggId) {
		return appliDao.getMenuInfo(suggId);
	}
	public List<Map<String, Object>> getReviewAvgScoreList(Map<String, Object> param) {
		return appliDao.getReviewAvgScoreList(param);
	}
	public List<Map<String, Object>> getPriceandLabel(String servId) {
		return appliDao.getPriceandLabel(servId);
	}
}
