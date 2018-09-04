package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.ArrivalAndArrivalDelayTimeDao;
import com.wavem.first.detailsData.service.ArrivalAndArrivalDelayTimeService;

@Service("ArrivalAndArrivalDelayTimeService")
public class ArrivalAndArrivalDelayTimeServiceImpl implements ArrivalAndArrivalDelayTimeService {
	private static final Logger logger = LoggerFactory.getLogger(ArrivalAndArrivalDelayTimeServiceImpl.class);

	@Autowired
	private ArrivalAndArrivalDelayTimeDao arrivalAndArrivalDelayTimeDao;

	@Override
	public List<Map<String, Object>> getDataScoreDelayInfo(Map<String, Object> input) {
		return arrivalAndArrivalDelayTimeDao.getDataScoreDelayInfo(input);
	}

	@Override
	public List<Map<String, Object>> getDataScoreGraphInfo(Map<String, Object> input) {
		return arrivalAndArrivalDelayTimeDao.getDataScoreGraphInfo(input);
	}

	@Override
	public List<Map<String, Object>> getDataDelayGraphInfo(Map<String, Object> input) {
		return arrivalAndArrivalDelayTimeDao.getDataDelayGraphInfo(input);
	} 
	
}
