package com.wavem.first.synthesisData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.synthesisData.dao.StatusOfAssessmentSectionForeAftereffectDao;
import com.wavem.first.synthesisData.service.StatusOfAssessmentSectionForeAftereffectService;

@Service("StatusOfAssessmentSectionForeAftereffectService")
public class StatusOfAssessmentSectionForeAftereffectServiceImpl implements StatusOfAssessmentSectionForeAftereffectService {
	
	private static final Logger logger = LoggerFactory.getLogger(StatusOfAssessmentSectionForeAftereffectServiceImpl.class);
	
	@Autowired
	private StatusOfAssessmentSectionForeAftereffectDao statusOfAssessmentSectionForeAftereffectDao;
	
	@Override
	public List<Map<String, Object>> getStatusOfAssessmentSectionData(Map<String, Object> input) {
		return (List<Map<String, Object>>) statusOfAssessmentSectionForeAftereffectDao.getStatusOfAssessmentSectionData(input);
	}

	@Override
	public List<Map<String, Object>> getForeAftereffectData(Map<String, Object> input) {
		return (List<Map<String, Object>>) statusOfAssessmentSectionForeAftereffectDao.getForeAftereffectData(input);
	}
	
}
