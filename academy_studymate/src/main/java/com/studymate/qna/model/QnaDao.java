package com.studymate.qna.model;

import java.util.Map;

import com.studymate.common.Dao;

public interface QnaDao extends Dao{
	public int maxSequence();

	public void updateSeq(Map<String, Object> map);

	public QnaDto isComment(int boqNum);

	public int hasComment(int boqGroupnum);
}
