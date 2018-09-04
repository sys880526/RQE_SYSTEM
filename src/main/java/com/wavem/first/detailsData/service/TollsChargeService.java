package com.wavem.first.detailsData.service;

import java.util.List;
import java.util.Map;

public interface TollsChargeService {

	List<Map<String, Object>> getTollsChargeData(Map<String, Object> input);
	List<Map<String, Object>> getTollsChargeChartData(Map<String, Object> input);
}
