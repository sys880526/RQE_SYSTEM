package com.wavem.first.synthesisData.service;

import java.util.List;
import java.util.Map;

public interface StatusOfAssessmentSectionForeAftereffectService {
	
	List<Map<String, Object>> getStatusOfAssessmentSectionData(Map<String, Object> input);

	List<Map<String, Object>> getForeAftereffectData(Map<String, Object> input);
	
}
