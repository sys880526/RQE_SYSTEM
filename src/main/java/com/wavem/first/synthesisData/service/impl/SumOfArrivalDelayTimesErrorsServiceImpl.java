package com.wavem.first.synthesisData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.synthesisData.dao.SumOfArrivalDelayTimesErrorsServiceDao;
import com.wavem.first.synthesisData.service.SumOfArrivalDelayTimesErrorsService;

@Service("SumOfArrivalDelayTimesErrorsService")
public class SumOfArrivalDelayTimesErrorsServiceImpl implements SumOfArrivalDelayTimesErrorsService {
	private static final Logger logger = LoggerFactory.getLogger(SumOfArrivalDelayTimesErrorsServiceImpl.class);
	
	@Autowired
	private SumOfArrivalDelayTimesErrorsServiceDao sumOfArrivalDelayTimesErrorsServiceDao;

	@Override
	public List<Map<String, Object>> getSumOfArrivalDelayTimesErrors(Map<String, Object> input) {
		return (List<Map<String, Object>>) sumOfArrivalDelayTimesErrorsServiceDao.getSumOfArrivalDelayTimesErrors(input);
	}
	
	@Override
	public List<Map<String, Object>> getArrivalScheduledErrorCount(Map<String, Object> input) {
		return (List<Map<String, Object>>) sumOfArrivalDelayTimesErrorsServiceDao.getArrivalScheduledErrorCount(input);
	}

}
