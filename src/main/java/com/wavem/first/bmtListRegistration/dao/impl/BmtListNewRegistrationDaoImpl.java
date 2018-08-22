package com.wavem.first.bmtListRegistration.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.bmtListRegistration.dao.BmtListNewRegistrationDao;

@Transactional
@Repository
public class BmtListNewRegistrationDaoImpl implements BmtListNewRegistrationDao{
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getBmtNewHistoryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("bmtListNew.getBmtNewHistoryList", map);
	}

	@Override
	public void deleteBmtNewList(Map<String, Object> map) {
		sqlSessionTemplate.delete("bmtListNew.deleteBmtNewList", map);
	}

	@Override
	public void bmtNewListsInsert(Map<String, Object> map) {
		sqlSessionTemplate.insert("bmtListNew.bmtNewListsInsert", map);		
	}

}
