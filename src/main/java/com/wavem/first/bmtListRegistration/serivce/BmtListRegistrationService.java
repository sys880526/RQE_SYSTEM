package com.wavem.first.bmtListRegistration.serivce;

import java.util.List;
import java.util.Map;

public interface BmtListRegistrationService {

	List<Map<String, Object>> getBmtHistoryList(Map<String, Object> map);

	int saveNewBmtList(List<Map<String, Object>> saveData);

}
