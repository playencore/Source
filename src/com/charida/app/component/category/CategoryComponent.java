package com.charida.app.component.category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.category.dao.CategoryDao;

@Component
public class CategoryComponent {
	public final String DESSERT = "DRT";
	public final String TABLEWARE = "TBW";
	public final String OTHER = "RTL";
	
	@Resource
	private CategoryDao categoryDao;
	
	private Map<String,Map<String, String>> codeMap = null;
	
	@PostConstruct
	private void init() {
		List<Map<String, Object>> codeList = categoryDao.getCodeList();
		
		if(codeList == null || codeList.size() == 0) {
			return;
		}
		codeMap = new HashMap<String, Map<String,String>>();
		String title = null;
		Map<String, String> subMap = null;
		
		for (int i = 0; i < codeList.size(); i++) {
			Map<String,Object> tempMap = codeList.get(i);
			
			Object obj = tempMap.get("CODE");
			if(obj == null) break;
			String code = (String)obj;
			
			if(code.indexOf("0000000")!= -1) {
				if(i != 0) {
					codeMap.put(title, subMap);
				}
				title = code;
				subMap = new HashMap<String, String>();
			}
			subMap.put(code, (String)tempMap.get("CODE_NAME"));
			
			if(codeList.size()-1 == i) {
				codeMap.put(title, subMap);
			}
		}
		
		System.out.println(codeMap);
	}
	
	public Map<String, String> getParentMap(String parentCode){
		return codeMap.get(parentCode);
	}
	
	public String getCodeName(String code) {
		if(code == null || "".equals(code)) {
			return null;
		}
		
		Map<String, String> parentMap = getParentMap(code.substring(0, 3) +"0000000");
		
		if(parentMap == null || parentMap.isEmpty()) {
			return null;
		}
		
		return parentMap.get(code);
	}
	
	public List<String> getNameList(List<String> codeList,String prefix){
		if(codeList == null || codeList.isEmpty() ||prefix == null) {
			return null;
		}
		
		List<String> nameList = null;
		List<String> targetList = new ArrayList<String>();
		for(String code : codeList) {
			if(code.indexOf(prefix) == -1) {
				continue;
			}
			targetList.add(code);
		}
		
		if(targetList.isEmpty()) {
			return null;
		}
		
		Map<String, String> parentMap = getParentMap(prefix +"0000000");
		
		if(parentMap == null ) {
			return null;
		}
		
		nameList = new ArrayList<String>();
		nameList.add(parentMap.get(prefix +"0000000"));
		for(String code : targetList) {
			nameList.add(parentMap.get(code));
		}
		
		return nameList;
	}
}
