package com.studymate.review.model;

import java.util.Map;

import com.studymate.common.Dao;

public interface ReviewDao extends Dao{
	public int maxSequence();

	public void updateSeq(Map<String, Object> map);
}
