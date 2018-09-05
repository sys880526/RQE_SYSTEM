package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.ArrivalAndArrivalDelayTimeDao;

@Transactional
@Repository("ArrivalAndArrivalDelayTimeDao")
public class ArrivalAndArrivalDelayTimeDaoImpl implements ArrivalAndArrivalDelayTimeDao{
	private static final Logger logger = LoggerFactory.getLogger(ArrivalAndArrivalDelayTimeDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getDataScoreDelayInfo(Map<String, Object> input) {
		return SqlSessionTemplate.selectList("arrivalAndArrivalDelayTime.getDataScoreDelayInfo", input);
	}

	@Override
	public List<Map<String, Object>> getDataScoreGraphInfo(Map<String, Object> input) {
		return SqlSessionTemplate.selectList("arrivalAndArrivalDelayTime.getDataScoreGraphInfo", input);
	}

	@Override
	public List<Map<String, Object>> getDataDelayGraphInfo(Map<String, Object> input) {
		return SqlSessionTemplate.selectList("arrivalAndArrivalDelayTime.getDataDelayGraphInfo", input);
	}
	
}
