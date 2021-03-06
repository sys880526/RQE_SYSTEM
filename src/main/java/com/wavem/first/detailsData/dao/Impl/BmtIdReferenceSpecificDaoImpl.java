package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.BmtIdReferenceSpecificDao;
import com.wavem.first.synthesisData.dao.impl.SynthesizeDaoImpl;

@Transactional
@Repository("BmtIdReferenceSpecificDao")
public class BmtIdReferenceSpecificDaoImpl implements BmtIdReferenceSpecificDao {
	
	private static final Logger logger = LoggerFactory.getLogger(SynthesizeDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getBmtIdReferenceSpecificData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("bmtIdReferenceSpecific.getBmtIdReferenceSpecificData", input);
	}
}
