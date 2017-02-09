package com.studymate.reserve.model;

import java.util.List;

import com.studymate.common.Dao;

public interface ReserveDao extends Dao {

	List<ReserveDto> memResList(String memId);

}
