package com.wavem.first.synthesisData.dao;

import java.util.List;
import java.util.Map;

public interface SynthesizeDao {
	List<Map<String, Object>> getDataSheetList(Map<String, Object> input);

	Map<String, Object> getDetailDataSheet(Map<String, Object> input);
}
