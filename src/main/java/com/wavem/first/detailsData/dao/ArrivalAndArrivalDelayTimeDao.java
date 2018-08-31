package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface ArrivalAndArrivalDelayTimeDao {
	List<Map<String, Object>> getArrivalAndArrivalDelayTimeData(Map<String, Object> input);
}
