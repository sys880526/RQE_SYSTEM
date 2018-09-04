package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.PathDistanceDao;

@Transactional
@Repository("PathDistanceDaoImpl")
public class PathDistanceDaoImpl implements PathDistanceDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> getPathDistanceData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("pathDistance.getPathDistance", input);
	}

	@Override
	public List<Map<String, Object>> getPathDistanceChartData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("pathDistance.getPathDistanceChartData", input);
	}
}
