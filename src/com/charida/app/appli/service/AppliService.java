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
import com.charida.app.component.pagination.PaginationInfo;

@Service
public class AppliService {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	private AppliComponent appliComponent;
	
	private final String errMsg = "데이터 갱신에 실패했습니다.";
	
	
	public List<Map<String, Object>> getList(Map<String, Object> params, HttpServletRequest req){
		String memId = (String)params.get("sessionId");
		int pageNo = 1;
		if(params.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)params.get("pageNo")));
		}
		log.debug("1/4");
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		paging.setTotalRecordCount(appliComponent.getAppliListCount(memId));
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("memId", memId);
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());
		
		log.debug("2/4");
		List<Map<String, Object>> appliList = appliComponent.getAppliList(listParam);
		log.debug("3/4");
		
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
		log.debug("4/4");
		return appliList;
	}
	
	//결제대기 리스트
//	public List<Map<String, Object>> getWaitList(Map<String, Object> params, HttpServletRequset req) {
//		
//	}
}