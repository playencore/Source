package com.charida.app.telegram.component;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.charida.app.component.pagination.PaginationInfo;
import com.charida.app.component.sugg.SuggestionComponent;

@Service
public class CustomerShipService {
	
	@Resource
	CustomerShipComponent customerShipComponent ;
	
	@Resource
	SuggestionComponent suggestionComponent ;
	
	public List<Map<String, Object>> getShipServList(Map<String, Object> params, HttpServletRequest req){
		String mem_id = (String)params.get("sessionId");
		System.out.println("----------------mem_id" + mem_id);
		int pageNo = 1;
		if(params.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)params.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		paging.setTotalRecordCount(customerShipComponent.getServShipListCount(mem_id));
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("mem_id", mem_id);
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());

		List<Map<String,Object>> suggList = customerShipComponent.getShipServList(listParam);
		
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
		return suggList ;
	}
	
	public int updateStatusComplete(String serv_id) {
		return customerShipComponent.updateStatusComplete(serv_id) ;
	}
	
}
