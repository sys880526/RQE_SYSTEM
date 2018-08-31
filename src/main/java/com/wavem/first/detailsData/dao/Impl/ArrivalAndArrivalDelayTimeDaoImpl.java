package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.ArrivalAndArrivalDelayTimeDao;

@Transactional
@Repository("ArrivalAndArrivalDelayTimeDaoImpl")
public class ArrivalAndArrivalDelayTimeDaoImpl implements ArrivalAndArrivalDelayTimeDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> getArrivalAndArrivalDelayTimeData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("arrivalAndArrivalDelayTime.getArrivalAndArrivalDelayTime", input);
	}

}
