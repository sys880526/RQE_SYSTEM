package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface BmtIdReferencePathAnalysisDao {
	List<Map<String, Object>> getBmtIdList(Map<String, Object> map);

	List<Map<String, Object>> getAnalysisList(Map<String, Object> map);

	List<Map<String, Object>> getUserList(Map<String, Object> map);

	List<Map<String, Object>> getGpsList(Map<String, Object> map);
}
