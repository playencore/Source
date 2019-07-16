package com.charida.app.component.sugg;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.sugg.dao.SuggestionDao;

@Component
public class SuggestionComponent {
	@Resource
	private SuggestionDao suggestionDao;
	
	public List<Map<String, Object>> getSuggList(String sugg_id){
		return suggestionDao.getSuggList(sugg_id);
	}
	public List<Map<String, Object>> getSuggMenuInfo(String sugg_id){
		List<Map<String, Object>> results = suggestionDao.getSuggMenuInfo(sugg_id);
		
		if(results == null || results.size() == 0) {
			return null;
		}
		
		return results;
	}
	public Map<String, Object> getSuggInfo(String sugg_id){
		Map<String, Object> suggInfo = suggestionDao.getSuggInfo(sugg_id);
		
		if(suggInfo == null || suggInfo.isEmpty()) {
			return null;
		}
		
		if(suggInfo.get("PER_BUD") == null) {
			return suggInfo;
		}
		
		String per_bud = ((BigDecimal)suggInfo.get("PER_BUD")).toString();
		per_bud = formatByComma(per_bud) ;
		suggInfo.remove("PER_BUD");
		suggInfo.put("PER_BUD", per_bud);
		
		return suggInfo;
	}
	public String formatByComma(String str) {
		return str.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	}
}
