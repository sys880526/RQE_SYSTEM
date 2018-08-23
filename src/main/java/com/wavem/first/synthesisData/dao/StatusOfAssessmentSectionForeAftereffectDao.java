package com.wavem.first.synthesisData.dao;

import java.util.List;
import java.util.Map;

public interface StatusOfAssessmentSectionForeAftereffectDao {

	List<Map<String, Object>> getStatusOfAssessmentSectionData(Map<String, Object> input);

	List<Map<String, Object>> getForeAftereffectData(Map<String, Object> input);

}
