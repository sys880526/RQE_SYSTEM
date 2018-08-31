package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.ArrivalAndArrivalDelayTimeDao;
import com.wavem.first.detailsData.service.ArrivalAndArrivalDelayTimeService;

@Service("ArrivalAndArrivalDelayTimeService")
public class ArrivalAndArrivalDelayTimeServiceImpl implements ArrivalAndArrivalDelayTimeService {

	@Autowired
	private ArrivalAndArrivalDelayTimeDao arrivalAndArrivalDelayTimeDao;
	
	@Override
	public List<Map<String, Object>> getArrivalAndArrivalDelayTimeData(Map<String, Object> input) {
		return (List<Map<String, Object>>) arrivalAndArrivalDelayTimeDao.getArrivalAndArrivalDelayTimeData(input);
	}

}
