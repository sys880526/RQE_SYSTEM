package com.wavem.first.synthesisData.dao;

import java.util.List;
import java.util.Map;

public interface SumOfArrivalDelayTimesErrorsServiceDao {

	List<Map<String, Object>> getSumOfArrivalDelayTimesErrors(Map<String, Object> input);
	
	List<Map<String, Object>> getArrivalScheduledErrorCount(Map<String, Object> input);

}
