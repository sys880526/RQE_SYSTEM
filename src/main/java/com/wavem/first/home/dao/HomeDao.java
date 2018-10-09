package com.wavem.first.home.dao;

import java.util.List;
import java.util.Map;

public interface HomeDao {

	List<Map<String, Object>> selectBmtListEvent(Map<String, String> param);
}
