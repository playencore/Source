package com.charida.app.supplier.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.category.CategoryComponent;
import com.charida.app.component.join.JoinComponent;
import com.charida.app.component.serv.ApplicationComponent;
import com.charida.app.component.supplier.SupplierComponent;
import com.charida.app.member.dto.MemberDto;
import com.charida.app.supplier.dto.FoodDto;
import com.charida.app.supplier.dto.PermissionDto;
import com.charida.app.supplier.dto.SupplierDto;

@Service
public class SupplierService {
	
	@Resource
	SupplierComponent supplierComponent ;
	@Resource
	ApplicationComponent applicationComponent;
	@Resource
	CategoryComponent categoryComponent ;
	@Resource
	JoinComponent joinComponent;
	
	public int setSupplierTx(Map <String,String[]> supplierMap) {
		int result = 0 ;
		//crd_mem insert -----------------------------------------------------------------------------
		MemberDto memberDto = new MemberDto();
		memberDto.setMem_id(supplierMap.get("mem_id")[0]);
		memberDto.setPasswd(supplierMap.get("passwd")[0]);
		memberDto.setAuthority(supplierMap.get("authority")[0]);
		memberDto.setName(supplierMap.get("name")[0]);
		memberDto.setEmail(supplierMap.get("email")[0]);
		memberDto.setZipcode(supplierMap.get("zipcode")[0]);
		memberDto.setTel(supplierMap.get("tel")[0]);
		memberDto.setBirth_date(supplierMap.get("birth_date")[0]);
		memberDto.setAddress(supplierMap.get("address")[0]);
		memberDto.setAddress_detail(supplierMap.get("address_detail")[0]);
		memberDto.setJoin_date("sysdate");
		memberDto.setGender(supplierMap.get("gender")[0]);
		memberDto.setJob(supplierMap.get("job")[0]);
		result += joinComponent.setMember(memberDto) ;
		
		//crd_company insert-----------------------------------------------------------------------------------
		SupplierDto supplierDto = new SupplierDto() ;
		supplierDto.setMem_id(supplierMap.get("mem_id")[0]);
		supplierDto.setName(supplierMap.get("companyname")[0]);
		supplierDto.setRegist_num(Integer.parseInt(supplierMap.get("regist_num")[0]));
		supplierDto.setExplanation(supplierMap.get("explanation")[0]);
		supplierDto.setMaximum_seating(Integer.parseInt(supplierMap.get("maximum_seating")[0]));
		supplierDto.setMinimum_seating(Integer.parseInt(supplierMap.get("minimum_seating")[0]));
		supplierDto.setCert_file_id(Integer.parseInt( supplierMap.get("cert_file_id")[0] ));
		supplierDto.setTelegram_id("telegram");
		
		result += supplierComponent.setSupplier(supplierDto) ;
		
		//crd_service_type---------------------------------------------------------------------------------------
		String checkseq = supplierComponent.getServiceCategoryMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		int seq = Integer.parseInt(checkseq) ;
		Map<String, Object> listMap = supplierComponent.getCodeListMap("service", supplierMap.get("mem_id")[0], 
				seq, supplierMap.get("serviceCategory")) ;
		result += supplierComponent.setServiceCategoryType(listMap) ;
		
		//crd_food_Style----------------------------------------------------------------------------
		checkseq = supplierComponent.getFoodStyleMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		Map<String, Object> flistMap = supplierComponent.getCodeListMap("food", supplierMap.get("mem_id")[0], 
				seq, supplierMap.get("foodCategory")) ;
		result += supplierComponent.setFoodStyle(flistMap) ;
		
		//CRD_SERVICE_AREA------------------------------------------------------------------------------------
		checkseq = supplierComponent.getServiceLocationMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		Map<String, Object> alistMap = supplierComponent.getCodeListMap("area", supplierMap.get("mem_id")[0], 
				seq, supplierMap.get("serviceLocation")) ;
		result += supplierComponent.setServiceLocation(alistMap) ;
		
		//info picture -------------------------------------------------------------------------------------
		Map<String,Object> plistMap = new HashMap<String, Object>() ;
		List<Integer> list = new ArrayList<Integer>() ;
		for(int i = 0 ; i <supplierMap.get("supplierInfoFile").length ; i++ ) {
			String supplierinfoFile = supplierMap.get("supplierInfoFile")[i] ;
			if(supplierinfoFile!=null) {
				list.add(Integer.parseInt(supplierinfoFile)) ;
			}
		}
		checkseq = supplierComponent.getIntroFileMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		plistMap.put("mem_id",supplierMap.get("mem_id")[0]) ;
		plistMap.put("intro_seq", seq) ;
		plistMap.put("list",list) ;
		result += supplierComponent.setIntroFile(plistMap);
		
		//CRD_MEM_PERMISSION
		checkseq = supplierComponent.getMemPermissionMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		PermissionDto dto = new PermissionDto() ;
		dto.setMem_id(supplierMap.get("mem_id")[0]);
		dto.setDisallowance_reason("-");
		dto.setPermission_seq(seq);
		dto.setPermission_yn(0);
		result+=supplierComponent.setPermission(dto) ;
		
		return result ;
	}
	
	public String checkRegist_num(String regist_num) {
		int result = supplierComponent.checkRegist_num(regist_num) ;
		
		if(result == 0) {
			return "가입 가능한 업체입니다." ;
		}else {
			return "기존에 가입한 업체입니다. 확인해주세요." ;
		}
	}
////////////////////////////////////setfood	
	public String getFoodMaxSeq() {
		return supplierComponent.getFoodMaxSeq() ;
	}
	public int setFoodTx(FoodDto dto) {
		return supplierComponent.setFood(dto);
	}
	public List<FoodDto> getFoodList(String mem_id){
		return supplierComponent.getFoodList(mem_id) ;
	}
	
	public int deleteFoodTx(String menu_id) {
		int result = supplierComponent.deleteFood(menu_id);
		supplierComponent.updateMenuSeq(menu_id);
		return result ;
	}
	public int modifyMenu(FoodDto dto) {
		return supplierComponent.modifyMenu(dto) ;
	}
	/////////////////////////////////////////////////////////////////////////////
	public List<Map<String,Object>> getServiceList(){
		List<Map<String,Object>> servlist = new ArrayList<Map<String,Object>>();
		servlist = supplierComponent.getServiceList() ;
		for(Map<String, Object> serv : servlist ) {
			List<String> prefList =applicationComponent.getPrefList((String)serv.get("SERV_ID"),true);
			serv.put("PREFLIST", prefList);
			if("Y".equals(serv.get("DESSERT_YN")) || "Y".equals(serv.get("TABLEWARE_YN"))
					|| "Y".equals(serv.get("OTHER_ORDER_YN")) ){
				List<String> orderList
					= applicationComponent.getAddOrderList((String)serv.get("SERV_ID"));
				if("Y".equals(serv.get("DESSERT_YN"))) {
					serv.put("DRTLIST", categoryComponent.getNameList(orderList, categoryComponent.DESSERT));
				}
				if("Y".equals(serv.get("TABLEWARE_YN"))) {
					serv.put("TBWLIST", categoryComponent.getNameList(orderList, categoryComponent.TABLEWARE));
				}
				if("Y".equals(serv.get("OTHER_ORDER_YN"))) {
					serv.put("RTLLIST", categoryComponent.getNameList(orderList, categoryComponent.OTHER));
				}
			}
			String serv_type =  categoryComponent.getCodeName((String)serv.get("SERV_TYPE_CODE")) ;
			serv.put("SERV_TYPE", serv_type) ;
			String event_type = categoryComponent.getCodeName((String)serv.get("EVENT_TYPE_CODE"));
			serv.put("EVENT_TYPE",event_type) ;
		}
		return servlist; 
	}
	
	public List<Map<String, Object>> getSearchServList(Map<String, String> param){
		List<Map<String,Object>> serchServList = new ArrayList<Map<String,Object>>();
		serchServList = supplierComponent.getSearchServList(param) ;
		for(Map<String, Object> serv : serchServList ) {
			List<String> prefList =applicationComponent.getPrefList((String)serv.get("SERV_ID"),true);
			serv.put("PREFLIST", prefList);
			if("Y".equals(serv.get("DESSERT_YN")) || "Y".equals(serv.get("TABLEWARE_YN"))
					|| "Y".equals(serv.get("OTHER_ORDER_YN")) ){
				List<String> orderList
					= applicationComponent.getAddOrderList((String)serv.get("SERV_ID"));
				if("Y".equals(serv.get("DESSERT_YN"))) {
					serv.put("DRTLIST", categoryComponent.getNameList(orderList, categoryComponent.DESSERT));
				}
				if("Y".equals(serv.get("TABLEWARE_YN"))) {
					serv.put("TBWLIST", categoryComponent.getNameList(orderList, categoryComponent.TABLEWARE));
				}
				if("Y".equals(serv.get("OTHER_ORDER_YN"))) {
					serv.put("RTLLIST", categoryComponent.getNameList(orderList, categoryComponent.OTHER));
				}
			}
			String serv_type =  categoryComponent.getCodeName((String)serv.get("SERV_TYPE_CODE")) ;
			serv.put("SERV_TYPE", serv_type) ;
			String event_type = categoryComponent.getCodeName((String)serv.get("EVENT_TYPE_CODE"));
			serv.put("EVENT_TYPE",event_type) ;
	}
		return serchServList ;
	}
}









