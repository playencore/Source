package com.charida.app.component.supplier;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dao.SupplierDao;
import com.charida.app.supplier.dto.CodeDto;
import com.charida.app.supplier.dto.FoodDto;
import com.charida.app.supplier.dto.FoodStyleDto;
import com.charida.app.supplier.dto.PermissionDto;
import com.charida.app.supplier.dto.ServiceAreaDto;
import com.charida.app.supplier.dto.ServiceTypeDto;
import com.charida.app.supplier.dto.SupplierDto;

@Component
public class SupplierComponent {
	
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	SupplierDao supplierDao;

	// crd_company
	public int setSupplier(SupplierDto supplierDto) {

		int result = supplierDao.insertSupplier(supplierDto);

		return result;
	}
	

	// crd_service_Type
	public String getServiceCategoryMaxSeq(String mem_id) {
		return supplierDao.selectServiceCategoryMaxSeq(mem_id);
	}

	public int setServiceCategoryType(Map<String, Object> listMap) {
		return supplierDao.insertServiceCategoryType(listMap);
	}
	public int del_service_type(String mem_id) {
		return supplierDao.del_service_type(mem_id);
	}

	// crd_food_Style
	public String getFoodStyleMaxSeq(String mem_id) {
		return supplierDao.selectFoodStyleMaxSeq(mem_id);
	}

	public int setFoodStyle(Map<String, Object> listMap) {
		return supplierDao.insertFoodStyle(listMap);
	}
	public int del_food_style(String mem_id) {
		return supplierDao.del_food_style(mem_id);
	}

	// crd_service_location
	public String getServiceLocationMaxSeq(String mem_id) {
		return supplierDao.selectServiceLocationMaxSeq(mem_id);
	}

	public int setServiceLocation(Map<String, Object> listMap) {
		return supplierDao.insertServiceLocation(listMap);
	}
	public int del_service_area(String mem_id) {
		return supplierDao.del_service_area(mem_id);
	}

	// CRD_INTRO_FILE
	public String getIntroFileMaxSeq(String mem_id) {
		return supplierDao.selectIntroFileMaxSeq(mem_id);
	}

	public int setIntroFile(Map<String, Object> listMap) {
		return supplierDao.insertIntroFile(listMap);
	}
	public int del_picture(String mem_id) {
		return supplierDao.del_picture(mem_id);
	}

	// CRD_MEM_PERMISSION
	public String getMemPermissionMaxSeq(String mem_id) {
		return supplierDao.selectMemPermissionMaxSeq(mem_id);
	}

	public int setPermission(PermissionDto dto) {
		return supplierDao.insertPermission(dto);
	}
	
	public int updatePermissionSup(String mem_id) {
		return supplierDao.updatePermissionSup(mem_id);
	}

	public int checkRegist_num(String regist_num) {
		int result = 0;

		result = supplierDao.checkRegist_num(regist_num);

		return result;
	}

	public Map<String, Object> getCodeListMap(String code_name, String mem_id, int seqStartNum, String[] code) {
		Map<String, Object> listMap = new HashMap<String, Object>();
		List<CodeDto> list = new ArrayList<CodeDto>();
		if (code_name.equals("service")) {
			for (int i = 0; i < code.length; i++) {
				CodeDto codeDto = new ServiceTypeDto();
				codeDto.setMem_id(mem_id);
				codeDto.setSeq(seqStartNum++);
				codeDto.setCode(code[i]);
				list.add(codeDto);
			}
		} else if (code_name.equals("area")) {
			for (int i = 0; i < code.length; i++) {
				CodeDto codeDto = new ServiceAreaDto();
				codeDto.setMem_id(mem_id);
				codeDto.setSeq(seqStartNum++);
				codeDto.setCode(code[i]);
				list.add(codeDto);
			}
		} else if (code_name.equals("food")) {
			for (int i = 0; i < code.length; i++) {
				CodeDto codeDto = new FoodStyleDto();
				codeDto.setMem_id(mem_id);
				codeDto.setSeq(seqStartNum++);
				codeDto.setCode(code[i]);
				list.add(codeDto);
			}
		}
		listMap.put("list", list);
		return listMap;
	}
////////////////////////////////////////////////supplier 승인

	public List<SupplierDto> getSuppliers() {
		return supplierDao.selectSuppliers();
	}
	public SupplierDto getSupplier(String mem_id) {
		return supplierDao.selectSupplier(mem_id);
	}

	public List<Map<String, String>> getNotPermissionSuppliers() {
		return supplierDao.selectNotPermissionSuppliers();
	}

	public int updatePermission(Map<String, String[]> permission) {
		return supplierDao.updatePermission(permission);
	}

	public List<Object> getSerchList(Map<String, String> paramMap) {
		return supplierDao.selectSearchList(paramMap);
	}
///////////////////////////////메뉴 넣기 
	public String getFoodMaxSeq(){
		return supplierDao.selectFoodMaxSeq();
	}
	public int setFood(FoodDto dto) {
		return supplierDao.insertFood(dto) ;
	}
	public List<FoodDto> getFoodList(String mem_id){
		return supplierDao.selectFoodList(mem_id) ;
	}
	public int deleteFood(String menu_id) {
		return supplierDao.deleteFood(menu_id);
	}
	public void updateMenuSeq( String menu_id) {
		supplierDao.updateMenuSeq(menu_id);
	}
	public int modifyMenu(FoodDto dto) {
		return supplierDao.modifyMenu(dto) ;
	}
	////////////////////////////////////////////////
	public List<Map<String,Object>> getServiceList(String mem_id){
		return supplierDao.selectServiceList(mem_id) ;
	}
	public List<Map<String, Object>> getSearchServList(Map<String, String> param){
		return supplierDao.selectSearchServList(param) ;
	}
	//////////////////////////////제안하기
	public int setSuggest(Map<String, Object> param) {
		return supplierDao.insertSuggest(param);
	}
	public String getSuggMenuMaxSeq(String sugg_id) {
		return supplierDao.getSuggMenuMaxSeq(sugg_id);
	}
	public int setSuggMenu(Map<String, Object> param) {
		String smaxseq = getSuggMenuMaxSeq((String)param.get("sugg_id")) ;
		if(smaxseq == null || smaxseq.equals("")) {
			smaxseq = "0" ;
		}
		int maxseq = Integer.parseInt(smaxseq) ;
		Map<String, Object> menu = null ;
		int menuresult = 0 ;
		for(Object menus : (ArrayList<Object>)param.get("menulist")) {
			menu = new HashMap<String, Object>() ;
			List<Object> menuinfo = (List<Object>)menus ;
			menu.put("sugg_id", param.get("sugg_id"));
			menu.put("menu_seq", maxseq);
			menu.put("name", menuinfo.get(0));
			menu.put("weight", menuinfo.get(1));
			menu.put("explanation", menuinfo.get(2));
			menu.put("file_id",menuinfo.get(3));
			menuresult += supplierDao.insertServSuggMenu(menu);
			maxseq++;
		}
		
		return menuresult ;
	}
	public List<Integer> getfiles(String id) {
		return supplierDao.getFiles(id);
	}
	
	public int modifySupplier(SupplierDto supplierDto) {
		return supplierDao.modifySupplier(supplierDto);
	}
	public List<ServiceTypeDto> serviceType(String mem_id){
		return supplierDao.serviceType(mem_id);
	}	
	public List<FoodStyleDto> foodStyle(String mem_id){
		return supplierDao.foodStyle(mem_id);
	}	
	public List<ServiceAreaDto> serviceArea(String mem_id){
		return supplierDao.serviceArea(mem_id);
	}
	
	/////////////////////////////////////////////////////////////////////tel
	public String getAllRegist_num(String text){
		List<Map<String, Object>> resultmap = supplierDao.selectAllRegist_num() ;
		
		for(Map<String, Object> reamp : resultmap) {
			if(reamp.get("REGIST_NUM").equals(text)) {
				return "존재하는 사업자 등록 번호입니다" ;
			}
		}
		
		return "존재 하지 않은 사업자 등록번호 입니다." ;
	}
	public int updateTelegram(String mem_id , long chatId) {
		String chat_id = Long.toString(chatId) ;
		return supplierDao.updateTelegram(mem_id,chat_id);
	}
}
