package com.wavem.first.progressData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.progressData.dao.EvaluationVehiclePositionCheckDao;
import com.wavem.first.progressData.service.EvaluationVehiclePositionCheckService;

@Service("EvaluationVehiclePositionCheckService")
public class EvaluationVehiclePositionCheckServiceImpl implements EvaluationVehiclePositionCheckService {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationVehiclePositionCheckServiceImpl.class);

	@Autowired
	private EvaluationVehiclePositionCheckDao evaluationVehiclePositionCheckDao;
	
	public List<Map<String, Object>> getEvaluationVehiclePositionCheckData(Map<String, Object> input) {
		return (List<Map<String, Object>>) evaluationVehiclePositionCheckDao.getEvaluationVehiclePositionCheckData(input);		
	}
}
