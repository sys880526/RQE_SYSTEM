package com.wavem.first.bmtListRegistration.dao;

import java.util.List;
import java.util.Map;

public interface BmtListRegistrationDao {

	List<Map<String, Object>> getBmtHistoryList(Map<String, Object> map);

	Map<String, Object> checkBmtId(Map<String, Object> map);

	void saveNewBmtList(List<Map<String, Object>> saveData);

}
