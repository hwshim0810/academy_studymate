package com.studymate.find.model;

import java.util.Map;

import com.studymate.common.Dao;

public interface FindStudyDao extends Dao{
	public int maxSequence();

	public void updateSeq(Map<String, Object> map);
}
