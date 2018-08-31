package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.ArrivalScheduledTimeErrorAndErrorRateDao;
import com.wavem.first.detailsData.service.ArrivalScheduledTimeErrorAndErrorRateService;

@Service("ArrivalScheduledTimeErrorAndErrorRateService")
public class ArrivalScheduledTimeErrorAndErrorRateServiceImpl implements ArrivalScheduledTimeErrorAndErrorRateService {

	@Autowired
	private ArrivalScheduledTimeErrorAndErrorRateDao arrivalScheduledTimeErrorAndErrorRateDao;

	@Override
	public List<Map<String, Object>> getArrivalScheduledTimeErrorAndErrorRateData(Map<String, Object> map) {
		return (List<Map<String, Object>>) arrivalScheduledTimeErrorAndErrorRateDao.getArrivalScheduledTimeErrorAndErrorRateData(map);
	}
	
}
