package com.wavem.first.synthesisData.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.synthesisData.dao.SumOfArrivalDelayTimesErrorsServiceDao;

@Transactional
@Repository("SumOfArrivalDelayTimesErrorsServiceDao")
public class SumOfArrivalDelayTimesErrorsServiceDaoImpl implements SumOfArrivalDelayTimesErrorsServiceDao {
	private static final Logger logger = LoggerFactory.getLogger(SumOfArrivalDelayTimesErrorsServiceDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getSumOfArrivalDelayTimesErrors(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("sumOfArrivalDelayTimesErrors.sumOfArrivalDelayTimesErrors", input);
	} 
	
	@Override
	public List<Map<String, Object>> getArrivalScheduledErrorCount(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("sumOfArrivalDelayTimesErrors.arrivalScheduledErrorCount", input);
	}

}
