package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface ArrivalAndArrivalDelayTimeDao {
	
	List<Map<String, Object>> getDataScoreDelayInfo(Map<String, Object> input);

	List<Map<String, Object>> getDataScoreGraphInfo(Map<String, Object> input);

	List<Map<String, Object>> getDataDelayGraphInfo(Map<String, Object> input);

}
