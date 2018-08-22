package com.wavem.first.bmtListRegistration.serivce;

import java.util.List;
import java.util.Map;

public interface BmtListNewRegistrationService {

	List<Map<String, Object>> getBmtNewHistoryList(Map<String, Object> map);

	int deleteBmtNewList(List<Map<String, Object>> deleteData);

	int bmtNewListsInsert(List<Map<String, Object>> saveData);

}
