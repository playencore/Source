package com.charida.app.supplier.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dto.FoodDto;
import com.charida.app.supplier.dto.PermissionDto;
import com.charida.app.supplier.dto.SupplierDto;

@Repository
public class SupplierDao {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	SqlSession sqlSession;
	
	public int insertSupplier(SupplierDto supplierDto) {	
		return sqlSession.insert("Supplier.insertSupplier",supplierDto);
	}
	
	public int checkRegist_num(String regist_num) {
		int regist_numb = Integer.parseInt(regist_num.trim());
		log.debug("-----"+regist_numb+"------");
		return sqlSession.selectOne("Supplier.checkSupplierNum", regist_numb) ;
	}
	//crd_serviceType
	public String selectServiceCategoryMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectServiceCategoryMaxSeq",mem_id);
	}	
	public int insertServiceCategoryType(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertServiceCategoryType", listMap) ;
	}
	//crd_FoodStyle
	public String selectFoodStyleMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectFoodStyleMaxSeq",mem_id);
	}	
	public int insertFoodStyle(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertFoodStyle", listMap) ;
	}
	//crd_service_location
	public String selectServiceLocationMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectServiceLocationMaxSeq",mem_id);
	}	
	public int insertServiceLocation(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertServiceLocation", listMap) ;
	}
	//CRD_INTRO_FILE
	public String selectIntroFileMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectIntroFileMaxSeq",mem_id);
	}
	public int insertIntroFile(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertIntroFile", listMap) ;
	}
	//CRD_MEM_PERMISSION
	public String selectMemPermissionMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectMemPermissionMaxSeq",mem_id);
	}
	public int insertPermission(PermissionDto dto) {
		return sqlSession.insert("Supplier.insertPermission",dto) ;
	}
	////////////////////////////////////getsuppliers 
	public List<SupplierDto> selectSuppliers(){
		return sqlSession.selectList("Supplier.selectSuppliers") ;
	}
	public SupplierDto selectSupplier(String mem_id) {
		return sqlSession.selectOne("Supplier.selectSupplier", mem_id) ;
	}
	public List<Map<String, String>> selectNotPermissionSuppliers(){
		return sqlSession.selectList("Supplier.selectNotPermissionSuppliers") ;
	} 
	/////////////////////////////updatePermission
	public int updatePermission(Map<String,String[]> permission) {
		return sqlSession.update("Supplier.updatePermission",permission) ;
	}
	
	public List<Object> selectSearchList(Map<String,String> paramMap){
		return sqlSession.selectList("Supplier.selectSerchList",paramMap);
	}
	////////////////////////////////////////set menu
	public String selectFoodMaxSeq() {
		return sqlSession.selectOne("Supplier.selectFoodMaxSeq") ;
	}
	
	public int insertFood(FoodDto dto) {
		return sqlSession.insert("Supplier.insertFood", dto) ;
	}
	public List<FoodDto> selectFoodList(String mem_id){
		return sqlSession.selectList("Supplier.selectFoodList", mem_id) ;
	}
	public int deleteFood(String menu_id) {
		return sqlSession.delete("Supplier.deleteFood", menu_id) ;
	}
	public void updateMenuSeq(String menu_id) {
		sqlSession.update("Supplier.updateFoodSeq", menu_id) ;
	}
	public int modifyMenu(FoodDto dto) {
		return sqlSession.update("Supplier.modifyMenu", dto) ;
	}
	////////////////////////////////////////////////////
	public List<Map<String,Object>> selectServiceList(String mem_id){
		return sqlSession.selectList("Supplier.selectServiceList",mem_id) ;
	}
	public List<Map<String, Object>> selectSearchServList(Map<String, String> param){
		return sqlSession.selectList("Supplier.selectSearchServList", param) ;
	}
	////////////////////////////////////////////제안
	public int insertSuggest(Map<String, Object> param) {
		return sqlSession.insert("Supplier.insertSuggest", param) ;
	}
	public String getSuggMenuMaxSeq(String sugg_id) {
		return sqlSession.selectOne("Supplier.selectSerSuggMaxSeq", sugg_id);
	}
	public int insertServSuggMenu(Map<String, Object> menuparam) {
		return sqlSession.insert("Supplier.insertServSuggMenu", menuparam) ;
	}

}
