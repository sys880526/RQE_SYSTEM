package com.wavem.frist.home.dao;

import java.util.List;
import java.util.Map;

public interface HomeDao {

	List<Map<String, Object>> selectBmtListEvent(String userid);
}
