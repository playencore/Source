package com.charida.app.supplier.dao;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;
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
}
