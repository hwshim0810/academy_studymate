package com.studymate.reserve.model;

import java.util.List;
import java.util.Map;

import com.studymate.common.Dao;

public interface ReserveDao extends Dao {

	List<ReserveDto> memResList(Map<String, Object> map);

	int getCountMemRes(String memId);

}
