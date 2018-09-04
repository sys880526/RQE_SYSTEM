package com.wavem.first.detailsData.service;

import java.util.List;
import java.util.Map;

public interface BmtIdReferencePathAnalysisService {
	List<Map<String, Object>> getBmtIdList(Map<String, Object> map);

	Map<String, Object> getBmtIdListDetail(Map<String, Object> data);

}
