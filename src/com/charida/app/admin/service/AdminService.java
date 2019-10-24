package com.charida.app.admin.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.charida.app.component.admin.AdminComponent;
import com.charida.app.component.pagination.PaginationInfo;
import com.charida.app.component.supplier.SupplierComponent;

@Service
public class AdminService  {
	@Resource
	SupplierComponent supplierComponent;
	@Resource
	AdminComponent adminComponent ;

////////////////////////////////adminpage
	public List<Map<String, String>> getNotPerMissionSuppliers(Map<String, Object> params ,HttpServletRequest req) {
		int pageNo = 1;
		if(params.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)params.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		// 전체 사이즈 
		paging.setTotalRecordCount(supplierComponent.getNotPermissionSuppliersCount());
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());
		
		// 전체 알아보기 
		return supplierComponent.getNotPermissionSuppliers(listParam);
	}

////////////////////////////////////updatepermission 
	public String updatePermissionTx(Map<String, String[]> permissionMap) {
		int result = supplierComponent.updatePermission(permissionMap);
		int perresult = 3 ;
		if(permissionMap.get("permission_yn")[0].equals("1")) {
			perresult = supplierComponent.updatePermissionSup(permissionMap.get("mem_id")[0]); 
		}
		if (result == 0 || perresult == 0) {
			return "수정이 진행되지 않았습니다. 다시 확인해주세요.";
		} else {
			return "수정이 완료되었습니다.";
		}
	}
	public List<Object> getSerhchResult(Map<String, Object> params, HttpServletRequest req){
		if(params.get("searchCategory").equals("NAME") || params.get("searchCategory").equals("TEL")) {
			params.put("table","M");
		}else {
			params.put("table","C");
			if(params.get("searchCategory").equals("COMPANYNAME")){
				params.put("searchCategory","NAME") ;
			}
		}
		int pageNo = 1;
		if(params.get("pageNo")!= null && ! params.get("pageNo").equals("")) {
			pageNo = Integer.parseInt(((String)params.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		paging.setTotalRecordCount(supplierComponent.getSerchListCount(params));
		req.setAttribute("paging", paging);
		params.put("startNum", paging.getFirstRecordIndex());
		params.put("endNum", paging.getLastRecordIndex());
		
		return supplierComponent.getSerchList(params) ;
	}
	
	public List<Map<String,Object>> getInfoAll(){
		List<Map<String,Object>> allservlist = adminComponent.getAllServList();	// 종료된 모든 신청 가져오기 
		for(Map<String,Object> serv : allservlist) {		// 가져온 신청 하나 뽑아 인포 만들기
			String serv_id = (String)serv.get("SERV_ID") ;	
			Map<String, Object> ename = adminComponent.getEventName(serv_id);		// 이벤트 타입 코드를 이름으로 가져오기
			Map<String, Object> sname = adminComponent.getServName(serv_id);		// 서비스 타입 코드를 이름으로 가져오기
			serv.put("ETYPENAME", ename);
			serv.put("STYPENAME", sname);
			
			List<Map<String,Object>> sugglist = adminComponent.getAllServToSugg( serv_id ) ; // 제안들 가져오기
			serv.put("REVIEW", adminComponent.getServReview(serv_id) ) ;
			
			List<Map<String,Object>> priceRange = supplierComponent.getPriceRange( serv_id ); // 추천 가격대 가져오기
			int minprice = 0 ;
			int maxprice = 0 ;
			for(Map<String,Object> price : priceRange) {
				int classification = ((BigDecimal)price.get("CLASSIFICATION")).intValue() ;
				if(classification == 0) {
					minprice = ((BigDecimal)price.get("PREDICTIVE_PRICE")).intValue() ; 		// 추천 작은 가격
				}else {
					maxprice = ((BigDecimal)price.get("PREDICTIVE_PRICE")).intValue() ;		// 추천 높은 가격
				}
			}
			serv.put("MINPRICE", minprice) ;													// **추천 작은 가격 넣기
			serv.put("MAXPRICE",maxprice) ;													// **추천 높은 가격 넣기 
			String choosesugg = "" ;		// 채택한 제안 아이디 
			int sumreperbud = 0 ;
			for(Map<String,Object> sugg : sugglist) {
				if( ((String)sugg.get("CHOOSE_YN")).equals("Y") ){
					choosesugg = (String)sugg.get("SUGG_ID") ;	// 채택된 제안 아이디 
					serv.put("CHOOSEMENU", adminComponent.getChooseSuggMenu(choosesugg) ) ;	// **채택된 제안의 메뉴들 넣기
					// 채택 제안의 판매자의 review score 
					serv.put("REVIEWAVGSCORE", (Map<String,Object>)(adminComponent.getSupplierReviewAvgScore( (String)sugg.get("MEM_ID") )) ) ;
					serv.put("CHOOSESUGG",(Map<String,Object>)sugg) ;
					int perbud = ((BigDecimal)sugg.get("PER_BUD")).intValue() ;
					if(perbud >= minprice && perbud<= maxprice) {
						serv.put("PRICEFLAG","TRUE") ;										// ** 채택된 제안의 가격이 추천 가격대 안에 있으면 TRUE
						sumreperbud++ ;
					}else {
						serv.put("PRICEFLAG","FALSE") ;										// ** 채택된 제안의 가격이 추천 가격대 안에 없으면 FALSE
					}
				}else {
					int perbud = ((BigDecimal)sugg.get("PER_BUD")).intValue() ;
					if(perbud >= minprice && perbud<= maxprice) {
						sumreperbud++ ;
					}
				}
			}
			serv.put("RECOMMENDRATE",sumreperbud/sugglist.size()) ;							// ** 전체 신청중 추천 가격대에 가격 입력 비율 
			serv.put("SUGGCOUNT",sugglist.size()) ;											// ** 전체 신청 수 
		}
		
		return allservlist ;
	}
	
	public List<Map<String, Object>> getAnalysisGraph(Map<String, Object> params){
		List<Map<String,Object>> dateServList = adminComponent.getDateServList(params);	// 종료된 모든 신청 중 기한 내에 있는 것들
		Map<String,Object> value = new HashMap<String, Object>();
		int choosecount = 0 ;
		int choosePriceScoreSum = 0 ;
		int notchoosePriceScoreSum = 0 ;
		int truereviewCount = 0 ;
		int falsereviewCount = 0 ;
		
		for(Map<String, Object> serv : dateServList) {
			String serv_id = (String)serv.get("SERV_ID") ;
			List<Map<String,Object>> sugglist = adminComponent.getAllServToSugg( serv_id ) ;  // 제안 가져오기 
			List<Map<String,Object>> priceRange = supplierComponent.getPriceRange( serv_id ); // 추천 가격대 가져오기
			System.out.println("serv_id " + serv_id+"priceSize" + priceRange.size());
			int minprice = 0 ;
			int maxprice = 0 ;
			for(Map<String,Object> price : priceRange) {
				int classification = ((BigDecimal)price.get("CLASSIFICATION")).intValue() ;
				if(classification == 0) {
					minprice = ((BigDecimal)price.get("PREDICTIVE_PRICE")).intValue() ; 		// 추천 작은 가격
				}else {
					maxprice = ((BigDecimal)price.get("PREDICTIVE_PRICE")).intValue() ;		// 추천 높은 가격
				}
			}
			serv.put("MINPRICE",minprice );
			serv.put("MAXPRICE", maxprice) ;
			int truecount = 0 ;
			Map<String,Object> reivew = adminComponent.getServReview(serv_id) ;
			
			for(Map<String, Object> sugg : sugglist ) {
				System.out.println("perbud :" + ((BigDecimal)sugg.get("PER_BUD")).intValue() + "min : " +minprice +"max :" + maxprice );
				if( ((BigDecimal)sugg.get("PER_BUD")).intValue() >= minprice && ((BigDecimal)sugg.get("PER_BUD")).intValue() <= maxprice) {
					truecount++ ;
					if( ((String)sugg.get("CHOOSE_YN")).equals("Y") ){
						choosecount++ ;
						if( ! reivew.isEmpty() ) {
							choosePriceScoreSum += ((BigDecimal)reivew.get("PRICE_SCORE")).intValue() ;
							serv.put("SUGG_PER_BUD", ((BigDecimal)sugg.get("PER_BUD")).intValue() );
							serv.put("REVIEW_PRICE_SCORE",((BigDecimal)reivew.get("PRICE_SCORE")).intValue()) ;
							truereviewCount++ ;
						}
					}
				}else {
					if( ((String)sugg.get("CHOOSE_YN")).equals("Y") ){
						if( ! reivew.isEmpty() ) {
							notchoosePriceScoreSum += ((BigDecimal)reivew.get("PRICE_SCORE")).intValue() ;
							serv.put("SUGG_PER_BUD", ((BigDecimal)sugg.get("PER_BUD")).intValue() );
							serv.put("REVIEW_PRICE_SCORE",((BigDecimal)reivew.get("PRICE_SCORE")).intValue()) ;
							falsereviewCount++ ;
						}
					}
				}
			}
			serv.put("RECOMMENDRATE",(truecount/(double)sugglist.size())*100);
			System.out.println("truecount : "+truecount + "sugglistsize :" + (double)sugglist.size());
			
		}
		value.put("CHOOSECOUNT", choosecount) ;
		if(truereviewCount == 0 && falsereviewCount==0) {
			value.put("CHOOSEPRICESCOREAVG",0) ;
			value.put("NOTCHOOSEPRICESCOREAVG",0) ;
		}else {
			value.put("CHOOSEPRICESCOREAVG",choosePriceScoreSum/(double)truereviewCount) ;
			value.put("NOTCHOOSEPRICESCOREAVG",notchoosePriceScoreSum/(double)falsereviewCount) ;
		}
		dateServList.add(value) ;
		return dateServList ;
	}
	
}
