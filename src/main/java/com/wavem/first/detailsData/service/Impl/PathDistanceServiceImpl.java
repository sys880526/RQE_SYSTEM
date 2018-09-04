package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.PathDistanceDao;
import com.wavem.first.detailsData.service.PathDistanceService;

@Service("PathDistanceService")
public class PathDistanceServiceImpl implements PathDistanceService {

	private static final Logger logger = LoggerFactory.getLogger(PathDistanceServiceImpl.class);
	
	@Autowired
	private PathDistanceDao pathDistanceDao;
	
	@Override
	public List<Map<String, Object>> getPathDistanceData(Map<String, Object> input) {
		return (List<Map<String, Object>>) pathDistanceDao.getPathDistanceData(input);
	}

	@Override
	public List<Map<String, Object>> getPathDistanceChartData(Map<String, Object> input) {
		return (List<Map<String, Object>>) pathDistanceDao.getPathDistanceChartData(input);
	}
}
