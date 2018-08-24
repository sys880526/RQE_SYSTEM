package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface PathDistanceDao {
	List<Map<String, Object>> getPathDistanceData(Map<String, Object> input);
}
