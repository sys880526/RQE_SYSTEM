package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface TollsChargeDao {
	List<Map<String, Object>> getTollsChargeData(Map<String, Object> input);
	List<Map<String, Object>> getTollsChargeChartData(Map<String, Object> input);
}
