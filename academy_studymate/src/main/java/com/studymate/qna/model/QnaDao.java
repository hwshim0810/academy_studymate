package com.studymate.qna.model;

import java.util.Map;

import com.studymate.common.Dao;

public interface QnaDao extends Dao{
	public void updateSeq(Map<String, Object> map);

	public int maxSequence();

}
