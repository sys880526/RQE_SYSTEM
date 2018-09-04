package com.wavem.first.detailsData.service;

import java.util.List;
import java.util.Map;

public interface PathDistanceService {
	List<Map<String, Object>> getPathDistanceData(Map<String, Object> input);
	List<Map<String, Object>> getPathDistanceChartData(Map<String, Object> input);
}
