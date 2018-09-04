package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface ArrivalScheduledTimeErrorAndErrorRateDao {

	List<Map<String, Object>> getArrivalScheduledTimeErrorAndErrorRateData(Map<String, Object> input);

	List<Map<String, Object>> getArrivalScheduledTimeErrorAndErrorRateGraphData(Map<String, Object> input);

}