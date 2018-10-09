package com.wavem.first.system.dao;

import java.util.List;
import java.util.Map;

public interface SystemDao {

	List<Map<String, Object>> getUserManagementData(Map<String, Object> input);

	List<Map<String, Object>> getUserManagementDefaultData(Map<String, Object> input);

	void getUserManagementUpdateData(Map<String, Object> updateData);
}
