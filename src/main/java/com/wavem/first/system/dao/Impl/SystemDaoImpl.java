package com.wavem.first.system.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.system.dao.SystemDao;

@Transactional
@Repository("SystemDaoImpl")
public class SystemDaoImpl implements SystemDao {
	private static final Logger logger = LoggerFactory.getLogger(SystemDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> getUserManagementData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("systemUserManagement.getUserManagementData", input);
	}

	@Override
	public List<Map<String, Object>> getUserManagementDefaultData(Map<String, Object> input) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("systemUserManagement.getUserManagementDefaultData", input);
	}

	@Transactional
	public void getUserManagementUpdateData(Map<String, Object> updateData) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("systemUserManagement.getUserManagementUpdateData", updateData);
	}

}
