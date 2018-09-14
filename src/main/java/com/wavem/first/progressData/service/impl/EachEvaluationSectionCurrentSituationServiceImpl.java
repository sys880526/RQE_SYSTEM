package com.wavem.first.progressData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.progressData.dao.EachEvaluationSectionCurrentSituationDao;
import com.wavem.first.progressData.service.EachEvaluationSectionCurrentSituationService;

@Service("EachEvaluationSectionCurrentSituationService")
public class EachEvaluationSectionCurrentSituationServiceImpl implements EachEvaluationSectionCurrentSituationService {
	private static final Logger logger = LoggerFactory.getLogger(EachEvaluationSectionCurrentSituationServiceImpl.class);
	
	@Autowired
	private EachEvaluationSectionCurrentSituationDao eachEvaluationSectionCurrentSituationDao;

	@Override
	public List<Map<String, Object>> getEachEvaluationSectionCurrentSituationData(Map<String, Object> input) {
		return eachEvaluationSectionCurrentSituationDao.getEachEvaluationSectionCurrentSituationData(input);
	}
	
}
