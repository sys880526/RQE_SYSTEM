package com.wavem.first.bmtListRegistration.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.bmtListRegistration.dao.BmtListRegistrationDao;

@Transactional
@Repository
public class BmtListRegistrationDaoImpl implements BmtListRegistrationDao{
	private static final Logger logger = LoggerFactory.getLogger(BmtListRegistrationDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getBmtHistoryList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("bmtList.getBmtHistoryList", map);
	}

	@Override
	public Map<String, Object> checkBmtId(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("bmtList.checkBmtId", map);
	}

	@Override
	@Transactional
	public void saveNewBmtList(List<Map<String, Object>> saveData) {
		for(int i = 0; i < saveData.size(); i++) {
			sqlSessionTemplate.insert("bmtList.saveNewBmtList", saveData.get(i));
		}
	}

}
