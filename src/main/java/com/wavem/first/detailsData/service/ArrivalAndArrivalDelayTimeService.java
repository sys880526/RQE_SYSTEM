package com.wavem.first.detailsData.service;

import java.util.List;
import java.util.Map;

public interface ArrivalAndArrivalDelayTimeService {

	List<Map<String, Object>> getDataScoreDelayInfo(Map<String, Object> input);

	List<Map<String, Object>> getDataScoreGraphInfo(Map<String, Object> map);

	List<Map<String, Object>> getDataDelayGraphInfo(Map<String, Object> map);

}
