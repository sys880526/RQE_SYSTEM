package com.wavem.first.progressData.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.progressData.dao.EvaluationVehiclePositionCheckDao;

@Transactional
@Repository("EvaluationVehiclePositionCheckDaoImpl")
public class EvaluationVehiclePositionCheckDaoImpl implements EvaluationVehiclePositionCheckDao {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationVehiclePositionCheckDaoImpl.class);

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getEvaluationVehiclePositionCheckData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("evaluationVehiclePositionCheck.getEvaluationVehiclePositionCheck", input);
	}
}
