package com.wavem.first.progressData.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.progressData.dao.EachEvaluationSectionCurrentSituationDao;

@Transactional
@Repository("EachEvaluationSectionCurrentSituationDao")
public class EachEvaluationSectionCurrentSituationDaoImpl implements EachEvaluationSectionCurrentSituationDao {
	private static final Logger logger = LoggerFactory.getLogger(EachEvaluationSectionCurrentSituationDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getEachEvaluationSectionCurrentSituationData(Map<String, Object> input) {
		return SqlSessionTemplate.selectList("eachEvaluationSectionCurrentSituation.getEachEvaluationSectionCurrentSituationData", input);
	}
}
