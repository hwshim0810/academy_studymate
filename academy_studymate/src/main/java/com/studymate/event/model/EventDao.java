package com.studymate.event.model;

import java.util.HashMap;

import com.studymate.common.Dao;

public interface EventDao extends Dao {

	void updateIsEnd(int boeNum);

	int hasEvent(HashMap<String, Object> map);

	void writeEventsub(HashMap<String, Object> map);

	void updateAble(int boeNum);

}
