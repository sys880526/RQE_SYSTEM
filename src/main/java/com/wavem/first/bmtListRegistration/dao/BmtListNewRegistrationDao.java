package com.wavem.first.bmtListRegistration.dao;

import java.util.List;
import java.util.Map;

public interface BmtListNewRegistrationDao {

	List<Map<String, Object>> getBmtNewHistoryList(Map<String, Object> map);

	void deleteBmtNewList(Map<String, Object> map);

	void bmtNewListsInsert(Map<String, Object> map);


}
