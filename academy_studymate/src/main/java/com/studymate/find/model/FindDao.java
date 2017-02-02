package com.studymate.find.model;

import java.util.Map;

import com.studymate.common.Dao;

public interface FindDao extends Dao{
	public int maxSequence();

	public void updateSeq(Map<String, Object> map);
}
