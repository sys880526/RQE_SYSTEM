package com.wavem.first.system.service;

import java.util.List;
import java.util.Map;

public interface SystemService {

	List<Map<String, Object>> getUserManagementData(Map<String, Object> input);
	
	List<Map<String, Object>> getUserManagementDefaultData(Map<String, Object> input);

	int getUserManagementUpdateData(Map<String, Object> updateData);

}
