package com.charida.app.category.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class CategoryDao extends CommonDao{
	
	public List<Map<String,Object>> getCodeList(){
		return sqlSession.selectList("Category.getCodeList");
	}
}