package com.charida.app.component.sugg;

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
	public String formatByComma(String str) {
		return str.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	}
}
