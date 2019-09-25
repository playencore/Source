package com.charida.app.serv.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.charida.app.component.category.CategoryComponent;
import com.charida.app.component.pagination.PaginationInfo;
import com.charida.app.component.payment.PaymentComponent;
import com.charida.app.component.serv.AddOrderComponent;
import com.charida.app.component.serv.ApplicationComponent;
import com.charida.app.component.serv.PreferComponent;
import com.charida.app.component.sugg.SuggestionComponent;

@Service
public class ApplicationService {
	@Resource
	private ApplicationComponent applicationComponent;
	@Resource
	private AddOrderComponent addOrderComponent;
	@Resource
	private PreferComponent preferComponent;
	@Resource
	private SuggestionComponent suggestionComponent;
	@Resource
	private CategoryComponent categoryComponent;
	@Resource
	private PaymentComponent paymentComponent;
	@Resource
	private DataSourceTransactionManager transactionManager;
	private static final Log log = LogFactory.getLog(ApplicationService.class);
	
	public String applicationTx(Map<String,Object>params) {
		//신청번호 발번
		String appId = applicationComponent.makeAppId();
		log.debug("신청번호 : " + appId);
		
		printParams(params);
		
		//데이터 포맷
		Map<String, Object> appEntity = applicationComponent.getAppEntity(params);
		appEntity.put("serv_id", appId);
		
		//CRD_SERV_APP INSERT
		applicationComponent.insertDatas(appEntity);
		int seq = 1;
		
		
		// 선호 메뉴
//		String[] menus = (String[])params.get("cb_menu_type"); 
//		for(String menu:menus) { 
//			log.debug(menu);
//			preferComponent.insertPreferMenu(appId, menu, seq++);
//		}
		String[] menuL = (String[]) params.get("cb_menu_typeL");
		String[] menuM = (String[]) params.get("cb_menu_typeM");
		String[] menuS = (String[]) params.get("cb_menu_typeS");
		
		String menus = Arrays.toString(menuL) + Arrays.toString(menuM) + Arrays.toString(menuS);
		
		log.debug(menus);
		preferComponent.insertPreferMenu(appId, menus, seq);
		
		seq = 1;
		
		
		//디저트 추가주문
		if("Y".equals(appEntity.get("dessert_yn"))) {
			String[] desserts = (String[])params.get("cb_dessert_type");
			for(String dessert:desserts) {
				addOrderComponent.insertOrder(appId,dessert, seq++);
			}
		}
		//식기류 추가주문
		if("Y".equals(appEntity.get("tableware_yn"))) {
			String[] tablewares = (String[])params.get("cb_tableware");
			for(String tableware:tablewares) {
				addOrderComponent.insertOrder(appId,tableware, seq++);
			}
		}
		//기타 대여품
		if("Y".equals(appEntity.get("other_order_yn"))) {
			String[] addtions = (String[])params.get("cb_addtion");
			for(String addtion:addtions) {
				addOrderComponent.insertOrder(appId,addtion, seq++);
			}
		}
		
		//3. 끝
		return appId;
	}
	public List<Map<String,Object>> getPayList(Map<String, Object> parmas,HttpServletRequest req){
		String memId = (String)parmas.get("sessionId");
		int pageNo = 1;
		if(parmas.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)parmas.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		paging.setTotalRecordCount(applicationComponent.getPayListCount(memId));
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("memId", memId);
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());

		List<Map<String,Object>> payList = applicationComponent.getPayList(listParam);
		
		if(payList != null) {
			for(Map<String,Object> item : payList) {
				
				if(item.get("PER_BUD") != null) {
					String per_bud = ((BigDecimal)item.get("PER_BUD")).toString();
					item.remove("PER_BUD");
					item.put("PER_BUD", applicationComponent.formatByComma(per_bud));
					
					if(item.get("PARTICIPANT") != null) {
						int partic = ((BigDecimal)item.get("PARTICIPANT")).intValue();
						partic = partic * Integer.parseInt(per_bud);
						item.put("AMOUNT", applicationComponent.formatByComma(Integer.toString(partic)));
					}
				}
			}
		}
		return payList;
	}
	public Map<String, Object> getPayInfo(String suggId){
		Map<String, Object> result = getDefaultInfo(suggId);
		
		if(result == null || result.isEmpty()) {
			return null;
		}
		result.put("payInfos", paymentComponent.getWaitPayInfo((String)result.get("SERV_ID")));
		
		return result;
	}
	
	public Map<String, Object> getDefaultInfo(String suggId){
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
	public Map<String, Object> getPayPage(Map<String, Object> params,HttpServletRequest req){
		URL url= null;
		Map<String, Object> result = null;
		
		//TODO DB테이블로 변경할 것
		req.getSession().setAttribute("partner_order_id", (String)params.get("servId"));
	    //DB테이블로 변경할 것
	    
		try {
			url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setRequestProperty("Authorization", " KakaoAK 1b0b33bb582f263e0560a45d2b2147d1");
	        conn.setDoOutput(true);
	        String initData ="cid=TC0ONETIME"
	        		+ "&partner_order_id="+(String)params.get("servId")
	        		+ "&partner_user_id="+(String)params.get("sessionId")
	        		+ "&item_name="+URLEncoder.encode("케이터링 서비스", "UTF-8")
	        		+ "&quantity=1"
	        		+ "&total_amount="+(String)params.get("amount")
	        		+ "&tax_free_amount=0"
	        		/*+ "&approval_url=http://192.168.103.65:8070/kakaoAPI/pop.jsp"
	        		+ "&cancel_url=http://192.168.103.65:8070/kakaoAPI/pop.jsp"
	        		+ "&fail_url=http://192.168.103.65:8070/kakaoAPI/pop.jsp";*/
		        + "&approval_url=http://localhost:8080/service/kakao-approve.do"
		        + "&cancel_url=http://localhost:8080/service/kakao-approve.do"
		        + "&fail_url=http://localhost:8080/service/kakao-approve.do";
	        System.out.println(initData);
	        DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
	        wr.writeBytes(initData);
	        wr.flush();
	        wr.close();
	        
	        //conn.getOutputStream().write(param.getBytes());
	        
	        int responseCode = conn.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	        }
	        
	        String inputLine= null;
	        StringBuffer sb = new StringBuffer();
	        while((inputLine = br.readLine()) != null) { // response 출력
	        	sb.append(inputLine);
	        	System.out.println(inputLine);
	        }
	        
	        JSONObject json = new JSONObject(sb.toString());
	        Iterator<String> keys =json.keys();
	        result = new HashMap<String, Object>();
	
	        while(keys.hasNext()) {
	        	String key = keys.next();
	        	System.out.println(key);
				if(key.equals("tid")) {
					result.put(key, json.getString(key)); 
					req.getSession().setAttribute("tid", json.getString(key));
				}else if(key.equals("next_redirect_pc_url")) {
					result.put(key,json.getString(key)); 
				}else if(key.equals("created_at")) { 
					result.put(key,json.getString(key)); 
				}
				 
	        }
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
        return result;
	}
	public Map<String, Object> kakaoApproveTx(String servId,String memId,String tid,String token) {
		URL url = null; 
		JSONObject json = null;
		Map<String,Object> result= null;
		int responseCode = 400;
		try {
			
			url = new URL("https://kapi.kakao.com/v1/payment/approve");
	
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setRequestProperty("Authorization", " KakaoAK 1b0b33bb582f263e0560a45d2b2147d1");
	        conn.setDoOutput(true);
	        String params ="cid=TC0ONETIME"
	        		+ "&partner_order_id="+servId
	        		+ "&partner_user_id="+memId
	        		+ "&tid="+tid
	        		+ "&pg_token="+token;
	        DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
	        wr.writeBytes(params);
	        wr.flush();
	        wr.close();
	        
	        //conn.getOutputStream().write(param.getBytes());
	        
	        responseCode = conn.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"utf-8"));
	        }
	        
	        String inputLine= null;
	        StringBuffer sb = new StringBuffer();
	        while((inputLine = br.readLine()) != null) { // response 출력
	        	sb.append(inputLine);
	        }
	        
	        json = new JSONObject(sb.toString());

		} catch (MalformedURLException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		result = new HashMap<String, Object>();
		result.put("code",responseCode);
		if(responseCode != 200) {
			return result;
		}
		int amount = json.getJSONObject("amount").getInt("total");
		
		//TODO 실패했을 떄 결제는되었지만 DB에 안들어감
		//실패 관리 테이블 만들것
		int update = paymentComponent.updatePayment(amount, "kakao", servId);
		if(update ==1){
			applicationComponent.updateProgress(servId, "STU0040001");
		}else {
			//롤백처리
			//transactionManager.rollback(status);
		}
		result.put("amount", amount);
		result.put("approved_at", json.get("approved_at"));
		
		return result;
	}
	public void printParams(Map<String,Object>params) {
		Iterator<String> keys =	params.keySet().iterator();
		
		while(keys.hasNext()) {
			String key = keys.next();
			Object value = params.get(key);
			
			if(value instanceof String[]) {
				for(String item:(String[])value) {
					log.debug(key +" : " +item);
				}
			}else {
				log.debug(key +" : " +(String)value);
			}
		}
	}
}
