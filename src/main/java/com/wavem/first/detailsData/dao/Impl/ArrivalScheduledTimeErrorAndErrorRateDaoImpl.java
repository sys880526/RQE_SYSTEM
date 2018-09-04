package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.ArrivalScheduledTimeErrorAndErrorRateDao;

@Transactional
@Repository("ArrivalScheduledTimeErrorAndErrorRateDaoImpl")
public class ArrivalScheduledTimeErrorAndErrorRateDaoImpl implements ArrivalScheduledTimeErrorAndErrorRateDao {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> getArrivalScheduledTimeErrorAndErrorRateData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("arrivalScheduledTimeErrorAndErrorRate.getArrivalScheduledTimeErrorAndErrorRateData", input);
	}

	@Override
	public List<Map<String, Object>> getArrivalScheduledTimeErrorAndErrorRateGraphData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("arrivalScheduledTimeErrorAndErrorRate.getArrivalScheduledTimeErrorAndErrorRateGraphData", input);
	}
	
}
