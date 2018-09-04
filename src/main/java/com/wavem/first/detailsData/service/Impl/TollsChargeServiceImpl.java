package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.TollsChargeDao;
import com.wavem.first.detailsData.service.TollsChargeService;

@Service("TollsChargeService")
public class TollsChargeServiceImpl implements TollsChargeService {

	@Autowired
	private TollsChargeDao tollsChargeDao;
	
	@Override
	public List<Map<String, Object>> getTollsChargeData(Map<String, Object> input) {
		return (List<Map<String, Object>>) tollsChargeDao.getTollsChargeData(input);
	}

	@Override
	public List<Map<String, Object>> getTollsChargeChartData(Map<String, Object> input) {
		return (List<Map<String, Object>>) tollsChargeDao.getTollsChargeChartData(input);
	}
}
