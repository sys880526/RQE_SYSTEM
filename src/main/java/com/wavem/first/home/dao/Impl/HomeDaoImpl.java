package com.wavem.first.home.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wavem.first.home.dao.HomeDao;

@Repository("HomeDao")
public class HomeDaoImpl implements HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> selectBmtListEvent(String userid) {
		// TODO Auto-generated method stub
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("userid", "user01");
		
		return sqlSession.selectList("mapper.bmtListEvent", param);
		
	}

}
