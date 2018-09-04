package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.TollsChargeDao;

@Transactional
@Repository("TollsChargeDaoImpl")
public class TollsChargeDaoImpl implements TollsChargeDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> getTollsChargeData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("tollsCharge.getTollsCharge", input);
	}

	@Override
	public List<Map<String, Object>> getTollsChargeChartData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("tollsCharge.getTollsChargeChartData", input);
	}
}
